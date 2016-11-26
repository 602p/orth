from grammar import *
from grammarutil import ASTNode
import functools, random

def emit(fd, text):
	fd.write(text+"\n")

def emit_item(fd, name, label, color=None):
	string=name
	string+=" [label=\""
	string+=label.replace('"', r'\"')
	string+="\""
	if color:
		string+=", color=\""
		string+=color
		string+="\""
	string+="];"
	emit(fd, string)

def emit_link(fd, start, end, label=None):
	emit(fd, start+" -> "+end+("[label=\""+label+"\"]" if label else "")+";")

def emit_node(fd, node, color=None, one_box_per_object=False):
	nodeid=id(node) if one_box_per_object else random.randint(0, 99999999999999)
	nodename="n_"+str(nodeid)
	
	if isinstance(node, ASTNode):
		desc=type(node).__name__+"\\n"
		for key in node._get_interesting_keys():
			value=getattr(node, key)
			if isinstance(value, ASTNode):
				emit_link(fd, nodename, emit_node(fd, value, one_box_per_object=one_box_per_object), key)
			elif isinstance(value, list):
				interstitial="i_"+str(random.randint(0, 999999))
				emit_item(fd, interstitial, key+("\n(empty)" if not value else ""), '#aaaaff')
				emit_link(fd, nodename, interstitial, key)
				for idx, item in enumerate(value):
					emit_link(fd, interstitial, emit_node(fd, item,
						one_box_per_object=one_box_per_object), "[%i]"%idx)
			else:
				desc+=key+" = "+str(value)+"\\n"
	else:
		desc=str(node)

	if isinstance(node, IdentifierExpr):
		color="yellow"

	if isinstance(node, AccessorExpr):
		color="orange"

	if isinstance(node, LiteralExpr):
		color="red"

	if isinstance(node, BlockExpression):
		color="green"

	if isinstance(node, BunchaExpressions):
		color="grey"

	emit_item(fd, nodename, desc, color)

	return nodename

def emit_node_file(fd, node, one_box_per_object=False, portrait_mode=False):
	emit(fd, "blockdiag{\n")
	emit(fd, "node_width=112\n")
	emit(fd, "node_height=48\n")
	if portrait_mode: emit(fd, "orientation = portrait\n")
	emit_node(fd, node, "pink", one_box_per_object)
	emit(fd, "}")