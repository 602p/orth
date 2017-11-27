test_shoc("err_global_init",
	"""
		int a = 1+1

		function() main -> int does
		return a
	""",
	expect_fail=True,
	expect_msg="Global a must be statically initilized by a literal"
)

test_shoc("err_complex_init",
	"""
		type SomeT is
		endtype

		SomeT a = 4

		function() main -> int does
		return a|int
	""",
	expect_fail=True,
	expect_msg="Global a must be primitive if statically initilized"
)