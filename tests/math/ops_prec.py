test_both("precedence_ops",
	"""
		function() main -> int does
		return (2*2==1+1+1+1)|int
	""",
	code = 1
)

test_both("precedence_ops2",
	"""
		function() main -> int does
		return (0==1*0)|int
	""",
	code = 1
)

test_both("precedence_ops3",
	"""
		function() main -> int does
		return ((1==1)*0|bool)|int
	""",
	code = 0
)