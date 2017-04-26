#!/usr/bin/python3

import sys, html, os.path

sys.path.insert(0, "../compiler")

import tokenize

with open(os.path.basename(sys.argv[1])+".html", 'w') as out:
	out.write("""<html>
	<head>
		<title>"""+sys.argv[1]+"""</title>
		<link rel="stylesheet" type="text/css" href="syntax.css">
	</head>
	<body>
		<pre>

""")
	with open(sys.argv[1], 'r') as fd:
		tokens=tokenize.tokenize(fd.read(), sys.argv[1], emit_whitespace=True)
		print("\n".join(str(t) for t in tokens))
		prev=None
		for token in tokens:
			if token.type.name=="T_ENDOFSTATEMENT":
				out.write("<br/>")
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