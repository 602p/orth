test_both("precedence_1",
	"""
		function() main -> int does
		return 2*2+1
	""",
	code = 5
)

test_both("precedence_2",
	"""
		function() main -> int does
		return 4/2+1
	""",
	code = 3
)

test_both("precedence_3",
	"""
		function() main -> int does
		return 2*2+4/2
	""",
	code = 6
)

test_both("precedence_4",
	"""
		function() main -> int does
		return 2*(2+1)
	""",
	code = 6
)

import random

NUM_GEN_TESTS=10
PROBLEM_PARTS=5
INT_BOTTOM_BOUND=1
INT_TOP_BOUND=100
OPERATORS=["+", "-", "*", "/"]
for i in range(NUM_GEN_TESTS):
	problem = ""
	for _ in range(PROBLEM_PARTS):
		problem+=str(random.randint(INT_BOTTOM_BOUND, INT_TOP_BOUND))
		problem+=random.choice(OPERATORS)
	problem+=str(random.randint(INT_BOTTOM_BOUND, INT_TOP_BOUND))
	test_both("prec_auto_"+str(i),
		"""
			extern(...) printf -> int
			function() main -> int does
				printf("%i\\n", {})
			return 0
		""".format(problem),
		stdout=str(eval(problem.replace("/","//")))+"\n"
	)