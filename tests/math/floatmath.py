test_orthc("int_simple_add",
	"""
		extern(...) printf -> int
		function() main -> int does
			printf("%.1f\\n", 0.5+0.5)
		return 0
	""",
	stdout="1.0\n"
)

test_orthc("int_simple_sub",
	"""
		extern(...) printf -> int
		function() main -> int does
			printf("%.1f\\n", 1.0-0.5)
		return 0
	""",
	stdout="0.5\n"
)

test_orthc("int_simple_mul",
	"""
		extern(...) printf -> int
		function() main -> int does
			printf("%.1f\\n", 2.0*0.5)
		return 0
	""",
	stdout="1.0\n"
)

test_orthc("int_simple_div",
	"""
		extern(...) printf -> int
		function() main -> int does
			printf("%.1f\\n", 4.0/2.0)
		return 0
	""",
	stdout="2.0\n"
)
