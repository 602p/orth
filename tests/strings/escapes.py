test_both("string_null_term",
	r"""
		function() main -> int does
			cstr s = "abc"
		return s[3]|int
	""",
	code=0
)

for escape in ["n", "r", "t", "0", "\\"]:
	test_both("string_esc_"+escape,
		"""
			function() main -> int does
				cstr s = "\\{}"
			return s[0]|int
		""".format(escape),
		code=ord(eval("\"\\"+escape+"\""))
	)
