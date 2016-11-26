import sys, drawblockdiag, tokenize, parse, grammarutil, json

string=open(sys.argv[1], 'r').read()

tokens=tokenize.tokenize(string)
print(tokens)
with open("tokens.json", 'w') as fd:
	fd.write("\n".join(str(t) for t in tokens))
node=parse.parse(tokens)
print(node.prettyprint())

drawblockdiag.emit_node_file(open('out.bd', 'w'), node, portrait_mode=True)