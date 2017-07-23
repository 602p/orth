#!/usr/bin/python3

import sys, html, os.path

sys.path.insert(0, "../compiler")
sys.path.insert(0, "../../compiler")

import tokenize

def resolve_import(text):
	if "\"" in text:
		return text[text.index("\"")+1:-1]
	else:
		return text[text.index(" ")+1:]+".ort"

do_import_resolution=False
if len(sys.argv)>2:
	if sys.argv[2]=="do_import_resolution":
		do_import_resolution=True

already_created=[]

def do_file(path):
	print(path)
	already_created.append(os.path.basename(path))
	with open("docs/"+os.path.basename(path)+".html", 'w') as out:
		out.write("""<html>
		<head>
			<title>"""+os.path.basename(path)+"""</title>
			<link rel="stylesheet" type="text/css" href="syntax.css">
		</head>
		<body>
			<pre>

""")
		with open(path, 'r') as fd:
			tokens=tokenize.tokenize(fd.read(), path, emit_whitespace=True)
			# print("\n".join(str(t) for t in tokens))
			prev=None
			for token in tokens:
				if token.type.name=="T_ENDOFSTATEMENT":
					out.write("<br/>")
				elif token.type.name=="T_IMPORT" and do_import_resolution:
					path=resolve_import(token.value)
					base=os.path.basename(path)
					if base not in already_created:
						do_file(path)
					out.write("<a href=\"./"+base+".html\"><span class=\"orth-T_IMPORT\">"+html.escape(token.value)+"</span></a>")
				elif token.type.name=="T_NAME" and prev.type.name=="T_CAST":
					out.write("<span class=\"orth-T_NAME-cast-type\">"+html.escape(token.value)+"</span>")
				elif token.type.name=="T_NAME" and prev.type.name in ["T_COLON", "T_DOUBLECOLON", "T_DOT"]:
					out.write("<span class=\"orth-T_NAME-accessor\">"+html.escape(token.value)+"</span>")
				elif token.type.name in ["T_ARGLIST_ELEMENT", "T_VAR_DECL"]:
					out.write("<span class=\"orth-"+token.type.name+"-type\">"+token.value.split(" ")[0]+"</span> <span class=\"orth-"+token.type.name+"-name\">"+token.value.split(" ")[-1]+"</span>")
				else:
					out.write("<span class=\"orth-"+token.type.name+"\">"+html.escape(token.value)+"</span>")
				prev=token
		out.write("""

			</pre>
		</body>
	</html>""")

do_file(sys.argv[1])