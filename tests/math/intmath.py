test_both("int_simple_add",
	"""
		function() main -> int does
		return 1+1
	""",
	code = 2
)

test_both("int_simple_mul",
	"""
		function() main -> int does
		return 2*2
	""",
	code = 4
)

test_both("int_simple_sub",
	"""
		function() main -> int does
		return 10-5
	""",
	code = 5
)

test_both("int_simple_div",
	"""
		function() main -> int does
		return 20/2
	""",
	code = 10
)

test_both("int_floor_div",
	"""
		function() main -> int does
		return 21/2
	""",
	code = 10
)

test_both("int_simple_mod",
	"""
		function() main -> int does
		return 23%4
	""",
	code = 3
)

test_both("int_simple_shr2",
	"""
		function() main -> int does
		return 55>>1
	""",
	code = 27
)

test_both("int_simple_eq",
	"""
		function() main -> int does
		return (55==55)|int
	""",
	code = 1
)


test_both("int_simple_eq2",
	"""
		function() main -> int does
		return (55==56)|int
	""",
	code = 0
)

test_both("int_simple_ne",
	"""
		function() main -> int does
		return (55!=55)|int
	""",
	code = 0
)


test_both("int_simple_ne2",
	"""
		function() main -> int does
		return (55!=56)|int
	""",
	code = 1
)

test_both("int_simple_gt",
	"""
		function() main -> int does
		return (5>4)|int
	""",
	code = 1
)


test_both("int_simple_gt2",
	"""
		function() main -> int does
		return (4>5)|int
	""",
	code = 0
)

test_both("int_simple_lt",
	"""
		function() main -> int does
		return (5<4)|int
	""",
	code = 0
)


test_both("int_simple_lt2",
	"""
		function() main -> int does
		return (4<5)|int
	""",
	code = 1
)

test_both("int_simple_ge",
	"""
		function() main -> int does
		return (5>=4)|int
	""",
	code = 1
)


test_both("int_simple_ge2",
	"""
		function() main -> int does
		return (4>=5)|int
	""",
	code = 0
)

test_both("int_simple_le",
	"""
		function() main -> int does
		return (5<=4)|int
	""",
	code = 0
)


test_both("int_simple_le2",
	"""
		function() main -> int does
		return (4<=5)|int
	""",
	code = 1
)

test_both("int_simple_le3",
	"""
		function() main -> int does
		return (5<=5)|int
	""",
	code = 1
)


test_both("int_simple_ge3",
	"""
		function() main -> int does
		return (4<=4)|int
	""",
	code = 1
)