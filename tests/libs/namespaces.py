test_both("libs_ns2",
	"""
		function() foo::bar -> int does
		return 44

		function() main -> int does
		return foo::bar()
	""",
	code = 44
)

test_both("libs_ns3",
	"""
		function() foo::bar::baz -> int does
		return 44

		function() main -> int does
		return foo::bar::baz()
	""",
	code = 44
)

test_both("libs_ns4",
	"""
		function() foo::bar::baz::quux -> int does
		return 44

		function() main -> int does
		return foo::bar::baz::quux()
	""",
	code = 44
)