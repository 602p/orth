test_shoc("err_ty_mm",
	"""
		function() main -> int does
			int a = null
		return 0
	""",
	flags=["-wtypes"],
	expect_fail=True,
	expect_msg="Mismatched types for assignment. Trying to store a ptr to a int."
)

test_shoc("err_ty_mm2",
	"""
		function() main -> int does
			ptr a = 0
		return 0
	""",
	flags=["-wtypes"],
	expect_fail=True,
	expect_msg="Mismatched types for assignment. Trying to store a int to a ptr."
)

test_shoc("err_ty_mm3",
	"""
		function() main -> int does
			int a = ""
		return 0
	""",
	flags=["-wtypes"],
	expect_fail=True,
	expect_msg="Mismatched types for assignment. Trying to store a cstr to a int."
)

test_shoc("err_ty_mm4",
	"""
		function() main -> int does
			cstr a = 0
		return 0
	""",
	flags=["-wtypes"],
	expect_fail=True,
	expect_msg="Mismatched types for assignment. Trying to store a int to a cstr."
)

test_shoc("err_call_mm",
	"""
		function() main -> int does
			other("")
		return 0

		function(int a) other -> void does
		return
	""",
	flags=["-wtypes"],
	expect_fail=True,
	expect_msg="Invalid type of arg. Is: cstr, should be int."
)

test_shoc("err_call_mm2",
	"""
		function() main -> int does
			other(1)
		return 0

		function(cstr a) other -> void does
		return
	""",
	flags=["-wtypes"],
	expect_fail=True,
	expect_msg="Invalid type of arg. Is: int, should be cstr."
)

test_shoc("err_ty_strict",
	"""
		function() main -> int does
			ptr a = ""
		return 0
	""",
	flags=["-wtypes", "-wstrict_types"],
	expect_msg="Mismatched types for assignment. Trying to store a cstr to a ptr."
)

test_shoc("err_ty_strict2",
	"""
		function() main -> int does
			cstr a = null
		return 0
	""",
	flags=["-wtypes", "-wstrict_types"],
	expect_msg="Mismatched types for assignment. Trying to store a ptr to a cstr."
)

test_shoc("err_ty_call",
	"""
		function() main -> int does
			1()
		return 0
	""",
	expect_fail=True,
	expect_msg="Must call a function or function pointer."
)