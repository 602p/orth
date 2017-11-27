test_shoc("err_imp_rel",
	"""
		import non_existant_module
	""",
	expect_fail=True,
	expect_msg="Can't resolve bare-name import of: non_existant_module"
)

test_shoc("err_imp_abs",
	"""
		import "abs_module.ort"
	""",
	expect_fail=True,
	expect_msg="Can't resolve quoted-path import of: abs_module.ort"
)