test_shoc("intrin_addrof",
	"""
		type IntBox is packed
			int value
		endtype

		function() main -> int does
			int z = 72
			ptr address = @addressof(z)@
			IntBox box = address|IntBox
		return box.value
	""",
	code=72
)

test_shoc("intrin_addrof2",
	"""
		type IntBox is packed
			int value
		endtype

		function() main -> int does
			int z = 72
			ptr address = @addressof(z)@
			IntBox box = address|IntBox
			box.value=3
		return z
	""",
	code=3
)
