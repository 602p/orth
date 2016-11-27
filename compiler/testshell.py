import sys, drawblockdiag, tokenize, parse, grammarutil, json

while 1:
	try:
		tokens=tokenize.tokenize(input("orth> "))
		node=parse.parse(tokens)
		print(node.prettyprint())
	except BaseException as e:
		print(e)