import sys, drawblockdiag, tokenize, parse, grammarutil, json

string=open(sys.argv[1], 'r').read()

tokens=tokenize.tokenize(string)
print(tokens)
node=parse.parse(tokens)

drawblockdiag.emit_node_file(open('out.bd', 'w'), node, portrait_mode=True)

print("===")

import transform, transformer

print(transform.transformers)

with open("out.ll", 'w') as fd:
	e=transform.Emitter(fd)
	e.emit("define i32 @main(){\n")
	with e.scope():
		with e.context(file="in"):
			transform.emit(e, node)
			e.emit("\n")
			e.emitl("%res = load i32* %"+e.get_var_name("res"))
			e.emitl("ret i32 %res")
	e.emit("}")