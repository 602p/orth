test_both("flow_func_ptr",
	"""
		type SomeFPtr is a function->int

		function() main -> int does
			SomeFPtr func = sub|SomeFPtr
		return func(5, 2)

		function(int a, int b) sub -> int does
		return a-b

		function(int a, int b) add -> int does
		return a+b
	""",
	code = 3
)

test_both("flow_func_ptr2",
	"""
		type SomeFPtr is a function->int

		function() main -> int does
			SomeFPtr func = add|SomeFPtr
		return func(5, 2)

		function(int a, int b) sub -> int does
		return a-b

		function(int a, int b) add -> int does
		return a+b
	""",
	code = 7
)