test_shoc("type_int_index",
	r"""
		extern(...) printf -> int
		function() main -> int does
			int a = 16909060
			ptr a_addr = @addressof(a)
			int i = 0
			while i<4 do
				printf("%i\n", a_addr[i])
				i+=1
			done
		return 0
	""",
	stdout="4\n3\n2\n1\n"
)

test_both("type_int_mask",
	r"""
		extern(...) printf -> int
		function() main -> int does
			int a = 16909060
			int i = 0
			while i<4 do
				printf("%i\n", (a>>(i*8))&255)
				i+=1
			done
		return 0
	""",
	stdout="4\n3\n2\n1\n"
)