test_both("global_simple",
	"""
		int a

		function() main -> int does
			modify_a()
		return a

		function() modify_a -> void does
			a=7
		return
	""",
	code=7
)