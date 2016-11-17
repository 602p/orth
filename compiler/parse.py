from tokenize import tokenize
import grammar
from grammarutil import Token
from grammar import ast_node_types

def parse(tokens):
	progress=True
	while progress and tokens:
		progress=False
		for index in range(len(tokens)):
			for ast_type in ast_node_types:
				print(ast_type, tokens)
				consumed=ast_type.pattern.cm_match(tokens[index:])
				if consumed:
					consumed_tokens=tokens[index:index+consumed]
					del tokens[index:index+consumed]
					tokens.insert(index, ast_type(consumed_tokens))
					index+=1
					progress=True
					break
			if progress:
				break
	
	noops=[item for item in tokens if isinstance(item, Token) and item.type == grammar.Tokens.T_ENDOFSTATEMENT]
	for item in noops:
		tokens.remove(item)
	return tokens

tokens=tokenize(r"""
	int b=(2*2)-2
""")

# print(ast_node_types)
print(tokens)
result=parse(tokens)
print("\n"*3)
print("\n\n".join(item.prettyprint() for item in result))