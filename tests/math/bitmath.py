test_both("bit_simple_shl",
	"""
		function() main -> int does
		return 4<<1
	""",
	code = 8
)

test_both("bit_simple_shr",
	"""
		function() main -> int does
		return 4>>1
	""",
	code = 2
)

test_both("bit_simple_shl2",
	"""
		function() main -> int does
		return 55<<1
	""",
	code = 110
)

test_both("bit_simple_shl2",
	"""
		function() main -> int does
		return 55<<1
	""",
	code = 110
)

test_both("bit_simple_xor",
	"""
		function() main -> int does
		return 55^77
	""",
	code = 122
)

test_both("bit_simple_xor2",
	"""
		function() main -> int does
		return 8^4
	""",
	code = 12
)

test_both("bit_simple_and",
	"""
		function() main -> int does
		return 88&54
	""",
	code = 16
)

test_both("bit_simple_and2",
	"""
		function() main -> int does
		return 3&2
	""",
	code = 2
)
