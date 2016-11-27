import sys, drawblockdiag, tokenize, parse, grammarutil, json

string=open(sys.argv[1], 'r').read()

tokens=tokenize.tokenize(string)
print(tokens)
with open('tokens.txt', 'w') as fd:
	fd.write("\n".join(str(t) for t in tokens))
node=parse.parse(tokens)

drawblockdiag.emit_node_file(open('out.bd', 'w'), node, portrait_mode=True)

print("===")

import transform, transformer

print(transform.transformers)

with open("out.ll", 'w') as fd:
	e=transform.Emitter(fd)
	with e.scope():
		with e.context(file="in"):
			transform.emit(e, node)

print("\n\n\n")