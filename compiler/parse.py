from tokenize import tokenize
import grammar
from grammarutil import Token, TokenView, TokenType, ASTNodeMeta, ChainBuilder, ASTNode
from grammar import ast_node_types, SepExpr, FileExpr

import sys

#Actual parsing core code here. Turns a stream of tokens into a single ASTNode.
#Internally operates on a bighuge list of 'elements', either ASTNode instances
#or Token instances. Effecivley, it steps backwards (starting at -1, going to 0)
#thru the current state of the list (which starts containing the results of tokenizing,
#a bunch of Token objects) trying all of the different subclasses of ASTNode against
#that state (no match = advance one more step and try again,) and if one matches
#take the number of elements it consumed and replace them with an instance of that
#type constructed from them. This then recursivley builts a tree as ASTNode types
#that consume other ASTNode instances match against ASTNodes and snarf them up as
#children.

def match_element(element, tokens):
	#Match a single chainmatcher element against a stream of tokens.
	#This function is called REALLY often (about 1/2 a million times
	#for one compilation of my kernel) so it's a little weird for optimizations
	#sake. I used to used isinstance uniformly here, but that is actually really
	#slow, as it implies a whole (recusive) callchain of crap. But type is fast
	#as python objects are only ever instances of one type. Use that instead where
	#applicable. (Not always applicable, e.g. ASTNodes may be matched by any
	#of the eventual parent types)
	# print("Trying match: "+str(element))
	token=tokens[0]
	if type(element)==TokenType: #isinstance is really slow, use this narrow check instead
		# print(".")
		# print(type(token))
		if type(token)==Token: #isinstance is really slow, use this narrow check instead
			# print(".")
			if token.type==element:
				return 1
	elif type(element)==set: #isinstance is really slow, use this narrow check instead
		results=[match_element(i, tokens) for i in element]
		if any(results):
			return max(results)
	elif type(element)==list: #isinstance is really slow, use this narrow check instead
		return chain_matches(element, tokens)
	elif type(element)==ASTNodeMeta: #Metaprogramming is fun!
		if element in type(token).__bases__: #Quick check for simple cases
			return 1
		else:
			return issubclass(type(token), element) #Fall back to the slow but accurate
	else:#was if isinstance(element, ChainBuilder):, but isinstance is slow, so treat as default
		if len(element.chain)==1:
			return match_element(element.chain[0], tokens)
		return match_element(element.chain, tokens)
	return False

def chain_matches(pattern, tokens):
	# print("TRYING")
	#Implementation of a ChainMatcher.
	#Check if a pattern (list) matches against a sequence of tokens
	consumed=0
	for element_idx, element in enumerate(pattern):
		try:
			match = match_element(element, tokens[consumed:])
		except IndexError:
			return 0
		if not match and not type(element)==list: #isinstance is slow
			#Exclude lists, as they denote stuff that is optional
			return 0
		consumed+=match
	return consumed

def parse(tokens):
	#Meat n' potatos
	progress=True
	statements=[]
	view=TokenView(tokens)
	#Filter out meta-types (e.g. ValueExpression) that can't actually be produced
	real_types=[ntype for ntype in ast_node_types if 'pattern' in dir(ntype)]
	
	while view.has_any:
		progress=True
		while progress:
			
			progress=False
			for atype in real_types:
				if atype.bad_lookahead_tokens: #Make sure it'll actually be used before we try
												#noticible speed impact!
					if view.get_lookahead() and view.get_lookahead().type in atype.bad_lookahead_tokens:
						#If the lookahead token precludes matching, skip to the next type
						continue
				# print("Tryna match "+str(atype))
				match = chain_matches(atype.pattern.chain, view.get_forward_slice())
				if match and atype.aux_match(view):
					# print(atype)
					node=atype(view.get_forward_slice()[0:match])
					node.line=view.get_forward_slice()[0].line
					rep=node.replace()
					if rep: #If we want to replace, do so
						node=rep

					node.line=view.get_forward_slice()[0].line #Snarf out the line
					view.replace(match, node) #replace match elements from the position on
												#with node
					progress=True
					break
		# print(view.get_forward_slice())
		view.next()

	for item in view.tokens:
		if isinstance(item, Token):
			#At least you get a more helpful error message...
			#Error detection/informing is really not optimal
			print(item)
			print("\n\n\n".join(str(n) for n in view.tokens[view.tokens.index(item)-2:view.tokens.index(item)+2]))
			raise SyntaxError("Programmer Error: Got a token in the resultant tokens")

	return FileExpr(view.tokens)