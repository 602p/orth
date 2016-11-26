import sys, drawblockdiag, tokenize, parse, grammarutil

string=open(sys.argv[1], 'r').read()

tokens=tokenize.tokenize(string)
print(tokens)
node=parse.parse(tokens)
print(node.prettyprint())

drawblockdiag.emit_node_file(open('out.bd', 'w'), node, portrait_mode=True)