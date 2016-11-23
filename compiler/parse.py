from tokenize import tokenize
import grammar
from grammarutil import Token, TokenView, TokenType, ASTNodeMeta, ChainBuilder, ASTNode
from grammar import ast_node_types

import sys
# sys.setrecursionlimit(60)

def match_element(element, tokens):
	print("%match_element", element)
	token=tokens[0]
	if isinstance(element, set):
		print("set")
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
		print("recursing from ", element, "with toekns", tokens)
		return chain_matches(element, tokens)
	if isinstance(element, ChainBuilder):
		if len(element.chain)==1:
			return match_element(element.chain[0], tokens)
		return match_element(element.chain, tokens)
	return False

def chain_matches(pattern, tokens):
	print('trying chain_match', pattern, '\n', tokens)
	consumed=0
	for element_idx, element in enumerate(pattern):
		try:
			print("-->checking", element)
			match = match_element(element, tokens[consumed:])
		except IndexError:
			print("\t(failed on IndexError)")
			return 0
		if not match and not isinstance(element, list):
			print("\t(failed on no match)", tokens[consumed:])
			print("\t tried to match", pattern)
			return 0
		print("Accepted element, match=", match, "consumed=", consumed)
		consumed+=match
	print("\tConsuming", consumed)
	return consumed

def parse(tokens):
	progress=True
	statements=[]
	view=TokenView(tokens)
	real_types=[ntype for ntype in ast_node_types if 'pattern' in dir(ntype)]
	
	while view.has_any:
		progress=True
		while progress:
			print("#####",view.get_forward_slice())
			progress=False
			for atype in real_types:
				print()
				print("trying", atype)
				match = chain_matches(atype.pattern.chain, view.get_forward_slice())
				
				print(atype, match, view.idx, str(atype.pattern), view.get_forward_slice())
				if match:
					node=atype(view.get_forward_slice()[0:match])
					print("***", node)
					view.replace(match, node)
					progress=True
					break
		view.next()

	return view.tokens

tokens=tokenize(r"""
a(1, b, c(z,x+2)*5)
""")

# print(ast_node_types)
print(tokens)
print()
result=parse(tokens)
print()
print(result)
print("\n"*3)
print("\n\n".join(item.prettyprint() if isinstance(item, ASTNode) else str(item) for item in result))