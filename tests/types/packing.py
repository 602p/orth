test_both("type_packing",
	"""
		extern(int size) malloc -> ptr
		extern(...) printf -> int

		type SomeStruct is packed
			int value1
			int value2
		endtype

		type IntBox is packed
			int value
		endtype

		function() main -> int does
			SomeStruct ss = malloc(@sizeof(SomeStruct)@)|SomeStruct
			ss.value1=12
			ss.value2=34
		return (ss|ptr|int+4)|ptr|IntBox.value
	""",
	code=34
)

test_both("type_packing2",
	"""
		extern(int size) malloc -> ptr
		extern(...) printf -> int

		type SomeStruct is packed
			int value1
			byte pad
			int value2
		endtype

		type IntBox is packed
			int value
		endtype

		function() main -> int does
			SomeStruct ss = malloc(@sizeof(SomeStruct)@)|SomeStruct
			ss.value1=12
			ss.value2=34
		return (ss|ptr|int+5)|ptr|IntBox.value
	""",
	code=34
)