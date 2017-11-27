test_both("intrin_sizeof",
	"""
		extern(...) printf -> int
		function() main -> int does
			printf("%i\\n", @sizeof(bool)@)
			printf("%i\\n", @sizeof(byte)@)
			printf("%i\\n", @sizeof(ubyte)@)
			printf("%i\\n", @sizeof(short)@)
			printf("%i\\n", @sizeof(ushort)@)
			printf("%i\\n", @sizeof(int)@)
			printf("%i\\n", @sizeof(uint)@)
			printf("%i\\n", @sizeof(long)@)
			printf("%i\\n", @sizeof(ulong)@)
		return 0
	""",
	stdout="1\n1\n1\n2\n2\n4\n4\n8\n8\n"
)

test_both("intrin_sizeof64",
	"""
		extern(...) printf -> int
		function() main -> int does
			printf("%i\\n", @sizeof(ptr)@)
		return 0
	""",
	stdout="8\n"
)

test_shoc("intrin_sizeof32",
	"""
		extern(...) printf -> int
		function() main -> int does
			printf("%i\\n", @sizeof(ptr)@)
		return 0
	""",
	stdout="4\n",
	flags=["-a32"]
)