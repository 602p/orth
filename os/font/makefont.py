from font import _font as font

out=""
for i in font:
	out+="".join(i)
with open("font.ort", 'w') as fd:
	fd.write("function() get_font -> ptr does\nreturn \"")
	fd.write(out)
	fd.write("\"\nfunction() get_colors -> ptr does\nreturn \"")
	for item in [[0,0,0],
				[0,0,170],
				[0,170,0],
				[0,170,170],
				[170,0,0],
				[170,0,170],
				[170,85,0],
				[170,170,170],
				[85,85,85],
				[85,85,255],
				[85,255,85],
				[85,255,255],
				[255,85,85],
				[255,85,255],
				[255,255,85],
				[255,255,255]]:
		fd.write("".join("\\x"+hex(i)[2:]+("0"*(2-len(hex(i)[2:]))) for i in item))
	fd.write("\"\n")