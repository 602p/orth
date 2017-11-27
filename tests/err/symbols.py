test_shoc("err_sym_var",
	"""
		function() main -> int does
		return missing_name
	""",
	expect_fail=True,
	expect_msg="Can't resolve name missing_name"
)

test_shoc("err_sym_func",
	"""
		function() main -> int does
		return missing_func()
	""",
	expect_fail=True,
	expect_msg="No such method missing_func"
)

test_shoc("err_sym_field",
	"""
		type SomeT is
			int a
		endtype

		function() main -> int does
		return null|SomeT.non_field
	""",
	expect_fail=True,
	expect_msg="No such field 'non_field' in type SomeT."
)

test_shoc("err_sym_type",
	"""
		function() main -> int does
			SomeT a
		return 0
	""",
	expect_fail=True,
	expect_msg="Trying to declare variable a of unknown type SomeT"
)

test_shoc("err_ret_type",
	"""
		function() main -> SomeT does
		return 0
	""",
	expect_fail=True,
	expect_msg="Declaring method main with unknown rtype SomeT"
)

test_shoc("err_sym_field_ty",
	"""
		type SomeT is
			NonT a
		endtype

		function() main -> int does
		return 0
	""",
	expect_fail=True,
	expect_msg="Trying to declare variable a of unknown type NonT"
)

test_shoc("err_sym_param",
	"""
		function(int c, NonT a) main -> int does
		return 0
	""",
	expect_fail=True,
	expect_msg="Trying to declare variable a of unknown type NonT"
)

test_shoc("err_dup_global",
	"""
		int a
		int a
	""",
	expect_fail=True,
	expect_msg="Duplicate definition of global a"
)

test_shoc("err_dup_type",
	"""
		type SomeT is
		endtype
		type SomeT is
		endtype

		function() main -> int does
		return 0
	""",
	expect_fail=True,
	expect_msg="Duplicate definition of type SomeT"
)

test_shoc("err_dup_meth",
	"""
		function() a -> void does
		return
		function() a -> void does
		return
	""",
	expect_fail=True,
	expect_msg="Duplicate definition of method a"
)

test_shoc("err_shadow",
	"""
		int a
		function() a -> void does
		return
	""",
	expect_fail=True,
	expect_msg="Ambigous name, could be function or global: a"
)
