test_both("string_lit_merge",
	r"""
		function() main -> int does
			cstr s = "ABC"
			cstr d = "ABC"
		return ((s|ptr|int)==(d|ptr|int))|int
	""",
	code=1
)

test_both("string_lit_segf",
	r"""
		function() main -> int does
			cstr s = "ABC"
			s[0]="Z"[0]
		return 0
	""",
	code=-11
)

test_both("string_lit_cha",
	r"""
		extern(...) printf -> int
		function() main -> int does
			cstr s = "ABC"
			int i = 0
			while i<=3 do
				printf("%c\n", s[i])
				i+=1
			done
		return 0
	""",
	stdout="A\nB\nC\n\0\n"
)
