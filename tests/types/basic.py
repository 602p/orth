test_both("type_basic",
	"""
		extern(int size) malloc -> ptr
		extern(...) printf -> int

		type SomeStruct is packed
			int value1
			int value2

			function(SomeStruct self) SomeStruct:modify -> void does
				self.value2=99
			return
		endtype

		function() main -> int does
			SomeStruct ss = malloc(@sizeof(SomeStruct)@)|SomeStruct
			ss.value1=12
			ss.value2=34
			printf("%i\\n%i\\n", ss.value1, ss.value2)
			ss:modify()
			printf("%i\\n%i\\n", ss.value1, ss.value2)
		return 0
	""",
	stdout="12\n34\n12\n99\n"
)
