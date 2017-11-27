base="""
extern(int size) malloc -> ptr
extern(...) printf -> int

type SomeStruct is packed
	int a
	int b

	function(int a, int b) SomeStruct::new -> SomeStruct does
		SomeStruct self = malloc(@sizeof(SomeStruct)@)|SomeStruct
		self.a=a
		self.b=b
	return self

	function(SomeStruct self) SomeStruct:print -> void does
		printf("(%i,%i)", self.a, self.b)
	return
endtype
"""

test_both("op_overload_add",
	base+"""
		function(SomeStruct self, SomeStruct other) SomeStruct:__add__ -> SomeStruct does
		return SomeStruct::new(self.a+other.a, self.b+other.b)
		
		function() main -> int does
			(SomeStruct::new(0,3)+SomeStruct::new(2,1)):print()
		return 0
	""",
	stdout="(2,4)"
)

test_both("op_overload_sub",
	base+"""
		function(SomeStruct self, SomeStruct other) SomeStruct:__sub__ -> SomeStruct does
		return SomeStruct::new(self.a-other.a, self.b-other.b)
		
		function() main -> int does
			(SomeStruct::new(5, 5)-SomeStruct::new(1, 2)):print()
		return 0
	""",
	stdout="(4,3)"
)

test_both("op_overload_mul",
	base+"""
		function(SomeStruct self, SomeStruct other) SomeStruct:__mul__ -> SomeStruct does
		return SomeStruct::new(self.a*other.a, self.b*other.b)
		
		function() main -> int does
			(SomeStruct::new(1,2)*SomeStruct::new(2,2)):print()
		return 0
	""",
	stdout="(2,4)"
)

test_both("op_overload_div",
	base+"""
		function(SomeStruct self, SomeStruct other) SomeStruct:__div__ -> SomeStruct does
		return SomeStruct::new(self.a/other.a, self.b/other.b)
		
		function() main -> int does
			(SomeStruct::new(2,8)/SomeStruct::new(2,4)):print()
		return 0
	""",
	stdout="(1,2)"
)

test_both("op_overload_mod",
	base+"""
		function(SomeStruct self, SomeStruct other) SomeStruct:__mod__ -> SomeStruct does
		return SomeStruct::new(self.a%other.a, self.b%other.b)
		
		function() main -> int does
			(SomeStruct::new(3,6)%SomeStruct::new(2,4)):print()
		return 0
	""",
	stdout="(1,2)"
)

test_both("op_overload_band",
	base+"""
		function(SomeStruct self, SomeStruct other) SomeStruct:__band__ -> SomeStruct does
		return SomeStruct::new(self.a&other.a, self.b&other.b)
		
		function() main -> int does
			(SomeStruct::new(5,3)&SomeStruct::new(6,5)):print()
		return 0
	""",
	stdout="(4,1)"
)

test_both("op_overload_xor",
	base+"""
		function(SomeStruct self, SomeStruct other) SomeStruct:__xor__ -> SomeStruct does
		return SomeStruct::new(self.a^other.a, self.b^other.b)
		
		function() main -> int does
			(SomeStruct::new(0,3)^SomeStruct::new(2,1)):print()
		return 0
	""",
	stdout="(2,2)"
)

test_both("op_overload_eq",
	base+"""
		function(SomeStruct self, SomeStruct other) SomeStruct:__eq__ -> bool does
		return (self.a==other.a)&(self.b==other.b)
		
		function() main -> int does
			printf("%i\\n", (SomeStruct::new(1,3)==SomeStruct::new(1,3))|int)
			printf("%i\\n", (SomeStruct::new(1,4)==SomeStruct::new(1,3))|int)
			printf("%i\\n", (SomeStruct::new(2,3)==SomeStruct::new(1,3))|int)
			printf("%i\\n", (SomeStruct::new(1,3)==SomeStruct::new(1,4))|int)
			printf("%i\\n", (SomeStruct::new(1,3)==SomeStruct::new(2,3))|int)
		return 0
	""",
	stdout="1\n0\n0\n0\n0\n"
)

test_both("op_overload_ne",
	base+"""
		function(SomeStruct self, SomeStruct other) SomeStruct:__ne__ -> bool does
			if (self.a!=other.a) do
				return true
			done
		return (self.b!=other.b)
		
		function() main -> int does
			printf("%i\\n", (SomeStruct::new(1,3)!=SomeStruct::new(1,3))|int)
			printf("%i\\n", (SomeStruct::new(1,4)!=SomeStruct::new(1,3))|int)
			printf("%i\\n", (SomeStruct::new(2,3)!=SomeStruct::new(1,3))|int)
			printf("%i\\n", (SomeStruct::new(1,3)!=SomeStruct::new(1,4))|int)
			printf("%i\\n", (SomeStruct::new(1,3)!=SomeStruct::new(2,3))|int)
			printf("%i\\n", (SomeStruct::new(1,4)!=SomeStruct::new(2,3))|int)
		return 0
	""",
	stdout="0\n1\n1\n1\n1\n1\n"
)

test_shoc("op_overload_gt",
	base+"""
		function(SomeStruct self, SomeStruct other) SomeStruct:__gt__ -> int does
		return 77
		
		function() main -> int does
		return SomeStruct::new(0,0)>SomeStruct::new(1,1)
	""",
	code=77
)

test_shoc("op_overload_lt",
	base+"""
		function(SomeStruct self, SomeStruct other) SomeStruct:__lt__ -> int does
		return 77
		
		function() main -> int does
		return SomeStruct::new(0,0)<SomeStruct::new(1,1)
	""",
	code=77
)

test_shoc("op_overload_ge",
	base+"""
		function(SomeStruct self, SomeStruct other) SomeStruct:__ge__ -> int does
		return 77
		
		function() main -> int does
		return SomeStruct::new(0,0)>=SomeStruct::new(1,1)
	""",
	code=77
)

test_shoc("op_overload_le",
	base+"""
		function(SomeStruct self, SomeStruct other) SomeStruct:__le__ -> int does
		return 77
		
		function() main -> int does
		return SomeStruct::new(0,0)<=SomeStruct::new(1,1)
	""",
	code=77
)

test_shoc("op_overload_shl",
	base+"""
		function(SomeStruct self, SomeStruct other) SomeStruct:__shl__ -> int does
		return 77
		
		function() main -> int does
		return SomeStruct::new(0,0)<<SomeStruct::new(1,1)
	""",
	code=77
)

test_shoc("op_overload_shr",
	base+"""
		function(SomeStruct self, SomeStruct other) SomeStruct:__shr__ -> int does
		return 77
		
		function() main -> int does
		return SomeStruct::new(0,0)>>SomeStruct::new(1,1)
	""",
	code=77
)
