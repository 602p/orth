map=[
"########################",
"#                      #",
"#                      #",
"#                      #",
"#                      #",
"#                      #",
"#                      #",
"#                      #",
"#                      #",
"#                      #",
"#                      #",
"#                      #",
"#                      #",
"#                      #",
"#                      #",
"#                      #",
"#                      #",
"#                      #",
"#                      #",
"#              #       #",
"#                      #",
"#                      #",
"#                      #",
"########################"
]
with open("rcmap.ort", 'w') as f:
	f.write("function() get_map -> cstr does\nreturn \""+"".join(map)+"\"\n")
	f.write("\nfunction() get_map_w -> int does\nreturn "+str(len(map[0])))
	f.write("\nfunction() get_map_h -> int does\nreturn "+str(len(map)))