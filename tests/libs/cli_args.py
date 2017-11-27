test_both("libs_cli_args",
	"""
		import args
		import std

		function(int nargs, ArgList args) main -> int does
		return args:get(1):int() + args:get(2):int()
	""",
	args = ["2", "3"],
	code = 5
)

test_both("libs_cli_nargs",
	"""
		import args
		import std

		function(int nargs, ArgList args) main -> int does
		return nargs
	""",
	args = ["1"],
	code = 2
)

test_both("libs_cli_nargs2",
	"""
		import args
		import std

		function(int nargs, ArgList args) main -> int does
		return nargs
	""",
	args = ["1", "2"],
	code = 3
)

test_both("libs_cli_nargs0",
	"""
		import args
		import std

		function(int nargs, ArgList args) main -> int does
		return nargs
	""",
	args = [],
	code = 1
)

test_both("libs_cli_arg0",
	"""
		import args
		import std

		function(int nargs, ArgList args) main -> int does
			printf("%s\\n", args:get(0))
		return 0
	""",
	args = [],
	stdout="./current_test.a\n"
)