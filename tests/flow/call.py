test_both("flow_call1",
	"""
		function() main -> int does
		return foo()

		function() foo -> int does
		return 3
	""",
	code = 3
)

test_both("flow_call2",
	"""
		function() main -> int does
		return foo()+foo()+bar()

		function() foo -> int does
		return 3

		function() bar -> int does
		return 1
	""",
	code = 7
)