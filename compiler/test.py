import sys, drawblockdiag, tokenize, parse, grammarutil

string=r"""
int a=2*2
a/=get_size()
"""

tokens=tokenize.tokenize(string)
node=parse.parse(tokens)
print(node.prettyprint())

drawblockdiag.emit_node_file(open('out.bd', 'w'), node)