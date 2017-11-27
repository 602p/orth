test_both("flow_simple_if",
	"""
		function() main -> int does
			int a = 42
			if a==42 do
				return 3
			done
		return 0
	""",
	code = 3
)

test_both("flow_simple_if2",
	"""
		function() main -> int does
			int a = 43
			if a==42 do
				return 3
			done
		return 0
	""",
	code = 0
)

test_both("flow_simple_if3",
	"""
		function() main -> int does
			int a = 47
			if a==42 do
				return 3
			elif a==47 do
				return 99
			done
		return 0
	""",
	code = 99
)

test_both("flow_simple_if4",
	"""
		function() main -> int does
			int a = 42
			if a==42 do
				a+=1
			done

			if a==43 do
				return a-2
			done
		return 0
	""",
	code = 41
)

test_both("flow_while",
	"""
		function() main -> int does
			int a = 3
			int r = 0
			while a>0 do
				r+=a
				a-=1
			done
		return r
	""",
	code = 6
)

test_both("flow_while2",
	"""
		function() main -> int does
			int a = 1
			while a<100 do
				a*=2
			done
		return a
	""",
	code = 128
)