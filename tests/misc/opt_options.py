test_shoc("misc_shoc_O0",
	"""
		function() main -> int does
		return 0
	""",
	flags=["-fshow_commandlines", "-O0"],
	expect_msg="-O0",
	disable_all_o=True
)

test_shoc("misc_shoc_O1",
	"""
		function() main -> int does
		return 0
	""",
	flags=["-fshow_commandlines", "-O1"],
	expect_msg="-O1",
	disable_all_o=True
)

test_shoc("misc_shoc_O2",
	"""
		function() main -> int does
		return 0
	""",
	flags=["-fshow_commandlines", "-O2"],
	expect_msg="-O2",
	disable_all_o=True
)

test_shoc("misc_shoc_O3",
	"""
		function() main -> int does
		return 0
	""",
	flags=["-fshow_commandlines", "-O3"],
	expect_msg="-O3",
	disable_all_o=True
)

test_shoc("misc_shocl_O0",
	"""
		function() main -> int does
		return 0
	""",
	flags=["-fshow_commandlines", "-O0"],
	expect_msg="-O=0",
	disable_all_o=True
)

test_shoc("misc_shocl_O1",
	"""
		function() main -> int does
		return 0
	""",
	flags=["-fshow_commandlines", "-O1"],
	expect_msg="-O=1",
	disable_all_o=True
)

test_shoc("misc_shocl_O2",
	"""
		function() main -> int does
		return 0
	""",
	flags=["-fshow_commandlines", "-O2"],
	expect_msg="-O=2",
	disable_all_o=True
)

test_shoc("misc_shocl_O3",
	"""
		function() main -> int does
		return 0
	""",
	flags=["-fshow_commandlines", "-O3"],
	expect_msg="-O=3",
	disable_all_o=True
)