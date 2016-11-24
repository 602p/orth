from grammar import *
from grammarutil import ASTNode
import functools, random

def emit(fd, text):
	fd.write(text+"\n")

def emit_item(fd, name, label, color=None):
	string=name
	string+=" [label=\""
	string+=label
	string+="\""
	if color:
		string+=", color=\""
		string+=color
		string+="\""
	string+="];"
	emit(fd, string)

def emit_link(fd, start, end, label=None):
	emit(fd, start+" -> "+end+("[label=\""+label+"\"]" if label else "")+";")

def emit_node(fd, node, color=None):
	nodename="n_"+str(id(node))
	desc=type(node).__name__+"\\n"
	for key in node._get_interesting_keys():
		value=getattr(node, key)
		if isinstance(value, ASTNode):
			emit_link(fd, nodename, emit_node(fd, value), key)
		elif isinstance(value, list):
			interstitial="i_"+str(random.randint(0, 999999))
			emit_item(fd, interstitial, key+("\n(empty)" if not value else ""), '#aaaaff')
			emit_link(fd, nodename, interstitial, key)
			for idx, item in enumerate(value):
				emit_link(fd, interstitial, emit_node(fd, item), key+"[%i]"%idx)
		else:
			desc+=key+" = "+str(value)+"\\n"

	if isinstance(node, IdentifierExpr):
		color="yellow"

	if isinstance(node, LiteralExpr):
		color="red"

	emit_item(fd, nodename, desc, color)

	return nodename

def emit_node_file(fd, node):
	emit(fd, "blockdiag{\n")
	emit(fd, "node_width=112\n")
	emit(fd, "node_height=48\n")
	emit_node(fd, node)
	emit(fd, "}")