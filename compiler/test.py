import sys, drawblockdiag, tokenize, parse, grammarutil

string=r"""
f(a.b+2, 77)
do_a_thing(foo.bar(a.b.c.d))
"""

tokens=tokenize.tokenize(string)
print(tokens)
node=parse.parse(tokens)
print(node.prettyprint())

drawblockdiag.emit_node_file(open('out.bd', 'w'), node, one_box_per_object=False)