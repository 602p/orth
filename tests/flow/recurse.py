test_both("flow_recurse_fib",
	"""
		function() main -> int does
		return fib(13)

		function(int i) fib -> int does
			if i<2 do
				return i
			done
		return fib(i-1) + fib(i-2)
	""",
	code = 233
)