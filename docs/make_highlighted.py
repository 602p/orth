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
		for token in tokens:
			if token.type.name=="T_ENDOFSTATEMENT":
				out.write("<br/>")
			else:
				out.write("<span class=\"orth-"+token.type.name+"\">"+html.escape(token.value)+"</span>")
	out.write("""

		</pre>
	</body>
</html>""")