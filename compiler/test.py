import sys, drawblockdiag, tokenize, parse, grammarutil

string=r"""
int a = 1
"""

tokens=tokenize.tokenize(string)
node=parse.parse(tokens)
print(node.prettyprint())

drawblockdiag.emit_node_file(open('out.bd', 'w'), node, one_box_per_object=False)