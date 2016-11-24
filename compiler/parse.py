from tokenize import tokenize
import grammar
from grammarutil import Token, TokenView, TokenType, ASTNodeMeta, ChainBuilder, ASTNode
from grammar import ast_node_types, NoopExpr, BunchaExpressions

import sys
# sys.setrecursionlimit(60)

def match_element(element, tokens):
	token=tokens[0]
	if isinstance(element, set):
		results=[match_element(i, tokens) for i in element]
		if any(results):
			return max(results)
	if isinstance(element, TokenType):
		if isinstance(token, Token):
			if token.type==element:
				return 1
	if isinstance(element, ASTNodeMeta):
		if issubclass(type(token), element):
			return 1
	if isinstance(element, list):
		return chain_matches(element, tokens)
	if isinstance(element, ChainBuilder):
		if len(element.chain)==1:
			return match_element(element.chain[0], tokens)
		return match_element(element.chain, tokens)
	return False

def chain_matches(pattern, tokens):
	consumed=0
	print(pattern, tokens)
	for element_idx, element in enumerate(pattern):
		try:
			match = match_element(element, tokens[consumed:])
		except IndexError:
			return 0
		if not match and not isinstance(element, list):
			return 0
		consumed+=match
	return consumed

def parse(tokens):
	progress=True
	statements=[]
	view=TokenView(tokens)
	real_types=[ntype for ntype in ast_node_types if 'pattern' in dir(ntype)]
	
	while view.has_any:
		progress=True
		while progress:
			
			progress=False
			for atype in real_types:
				if view.get_lookahead() and view.get_lookahead().type in atype.bad_lookahead_tokens:
					continue
				print("#####",view.get_forward_slice())
				match = chain_matches(atype.pattern.chain, view.get_forward_slice())

				# if match>len(view.get_forward_slice()) and \
				#    view.get_forward_slice()[match].type in atype.bad_following_tokens:
				# 	continue
				
				# print(atype, match, view.idx, str(atype.pattern), view.get_forward_slice())
				if match:
					print(atype)
					node=atype(view.get_forward_slice()[0:match])
					print("Emitting", str(node))
					rep=node.replace()
					if rep:
						node=rep
					# print("***", node)
					view.replace(match, node)
					print(view.tokens, view.idx)
					progress=True
					break
		view.next()

	return BunchaExpressions([item for item in view.tokens if not isinstance(item, NoopExpr)])