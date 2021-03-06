import collections, transform, types, decimal

#Map of binary operation -> magic method for implementing it
# (these get automatically implemented for those types without implementations,
#  with some setattr bethod-binding black magic. In effect, it creates a
#  instancemethod implement{key} that calls the method {value} on the class
#  via the classname${value} mangling rules. For example, for a StructOType
#  name foo it gains a implement_add function that invokes the LLVM function
#  foo$__add__)
magicmethods={
	"add":"__add__",  #Addition
	"sub":"__sub__",  #Subtraction
	"mul":"__mul__",  #Multiplication
	"div":"__div__",  #Division
	"gt":"__gt__",    #Greater-than
	"ge":"__ge__",    #Greater-than-or-equal-to
	"lt":"__lt__",    #Less-than
	"le":"__le__",    #Less-than-or-equal-to
	"eq":"__eq__",    #Equal
	"ne":"__ne__",    #Not equal
	"neg":"__neg__",  #Negate (unary minus)
	"shr":"__shr__",  #Shift left
	"shl":"__shl__",  #Shift right
	"band":"__band__",#Binary and (& operator)
	"mod":"__mod__",  #Modulo (% operator)
	"xor":"__xor__"   #XOR (^ operator)
}

class OType:
	"""Base type representation
Supplies methods for subclasses that provide implementations for operations
(as described above) and provides the contract to get_llvm_representation and
get_size. Also implement the default cast (bitcast-and-pray)
"""
	def __init__(self, name):
		"""All a type is gaurenteed to have is a name, a get_llvm_representation, a get_size and a implement_cast"""
		def _make_caller(magic, fancyname):
			#Create a method bound to the instance for calling the Orth method with name `magic` on the class
			def method(self, lhs, rhs, out):
				methname=name+"$"+magic
				assert methname in out.signatures,\
					"Magic method `%s:%s` not found. Implementing operation `%s` on type `%s`"%(name, magic, fancyname, name)
				return transform.call_func(
					methname,
					[t.get_llvm_representation() for t in out.signatures[methname].type.args],
					[lhs, rhs],
					out
				)
			return types.MethodType(method, self)

		self.name=name

		#Black magic to fill out the implement_* methods for user classes/primitive ovverides 
		# (e.g. cstr:__add__ works because the builtin string class dosen't provide implement_add
		#  and so the dynamic implemenation from here is invoked when you add strings)
		for k, v in magicmethods.items():
			if not hasattr(self, "implement_"+k):
				setattr(self, "implement_"+k, _make_caller(v, k))

	def implement_neg(self, lhs, out):
		#Special case because it has only one operand
		assert self.name+"$__neg__" in out.signatures,\
					"Magic method `%s:__neg__ not found. Implementing operation `neg` on type `%s`"%(self.name, self.name)
				
		return transform.call_func(
			self.name+"$__neg__",
			[t.get_llvm_representation() for t in out.signatures[self.name+"$__neg__"].type.args],
			[lhs],
			out
		)

	def get_llvm_representation(self):
		#Unimplemented. Subclasses provide a _valid_ LLVM type signature here (e.g. i32 or struct_type*)
		pass

	def __str__(self):
		return "TY{"+self.name+"}"

	def __repr__(self):
		return str(self)

	def implement_cast(self, value, from_, to):
		#Default cast (| operator) implementation is just to bitcast to the thing we want.
		return "bitcast {} {} to {};default cast impl".format(from_.get_llvm_representation(), value, to.get_llvm_representation())

	def get_size(self):
		#Unimplemented. Subclasses provide a function here that returns the size of an instance of the type in _bytes_
		return

class PrimitiveOType(OType):
	#A type that directly wraps an LLVM type
	def __init__(self, name, llvmtype):
		OType.__init__(self, name)
		self.llvmtype=llvmtype

	def get_llvm_representation(self):
		return self.llvmtype

class IntegerPrimitiveOType(PrimitiveOType):
	"""An Integer type (e.g. i1, i8, i16, i123897123812) wrapper. Provides all the common
		mathematical operations, as well as casting logic for integer->integer casts
		(size conversions.) Signed."""
	def __init__(self, name, llvmtype):
		OType.__init__(self, name)
		self.llvmtype=llvmtype
		self.fields=None
		self.datalayout=None

	def get_bit_width(self):
		return int(self.llvmtype[1:]) #Shrewd kludge

	def get_llvm_representation(self):
		return self.llvmtype

	def get_literal_expr(self, value, out):
		#literal_formatter should be a format string that has a slot (`{}`) where the base-10 literal number value is inserted
		# for creating a literal of this type. Implemented in most if not all cases with `add i<whatever> 0,{}`
		name="%"+out.get_temp_name()
		out.emitl("{} = add {} 0, {}".format(name, self.get_llvm_representation(), value))
		return name

	def implement_add(self, lhs, rhs, out):
		#Implement addition (+ operator) with a simple addition.
		#This is the same for signed and unsigned types because of twos-complement
		return "add {} {}, {}".format(self.get_llvm_representation(), lhs, rhs)

	def implement_sub(self, lhs, rhs, out):
		#Implement subtraction (binary - operator) with a simple subtraction
		#This is the same for signed and unsigned types because of twos-complement
		return "sub {} {}, {}".format(self.get_llvm_representation(), lhs, rhs)

	def implement_neg(self, val, out):
		#Implement negatiuon (unary - operator) with subtraction from 0
		#Liable to break if you try it with a unsigned integer (actuall it'd
		# just give back the two's complement - internally a signed n-byte and
		# unsigned n-byte integer are the same, just the logic on them are
		# different, so feel free but idk what it'd get you)
		return "sub {} 0, {}".format(self.get_llvm_representation(), val)

	def implement_mul(self, lhs, rhs, out):
		#Implement multiplication (* operator) with simple multiplication
		#This is the same for signed and unsigned types because of twos-compliment
		#Returns a integer of the same size as the input operands. (If you want a
		# 'full' product (int*int->long) cast both sides to long first)
		return "mul {} {}, {}".format(self.get_llvm_representation(), lhs, rhs)

	def implement_div(self, lhs, rhs, out):
		#Implement division (/ operator) for signed numbers
		return "sdiv {} {}, {}".format(self.get_llvm_representation(), lhs, rhs)

	def implement_rem(self, lhs, rhs, out):
		#Implement remainder/modulo ( operator) for signed numbers
		return "srem {} {}, {}".format(self.get_llvm_representation(), lhs, rhs)

	def implement_lsh(self, lhs, rhs, out):
		#Implement left-shift (<< operator)
		#Same for signed/unsigned
		return "shl {} {}, {}".format(self.get_llvm_representation(), lhs, rhs)

	def implement_rsh(self, lhs, rhs, out):
		#Implement "logical" right-shift (>> operator, bitwise)
		#Same for signed/unsigned (it's logical, so no sign-extension)
		return "lshr {} {}, {}".format(self.get_llvm_representation(), lhs, rhs)

	def implement_band(self, lhs, rhs, out):
		#Implement logical (bitwise) and (& operator)
		#Same for signed/unsigned, just operates on them as bits. 
		return "and {} {}, {}".format(self.get_llvm_representation(), lhs, rhs)

	def implement_xor(self, lhs, rhs, out):
		#Implement xor (^ operator)
		#Same for signed/unsigned, just operates on them as bits. 
		return "xor {} {}, {}".format(self.get_llvm_representation(), lhs, rhs)

	#Implement all the comparison operations. The `s` prefix on the comparisons indicates signed logic
	def implement_gt(self, lhs, rhs, out):
		return "icmp sgt {} {}, {}".format(self.get_llvm_representation(), lhs, rhs)
	def implement_ge(self, lhs, rhs, out):
		return "icmp sge {} {}, {}".format(self.get_llvm_representation(), lhs, rhs)
	def implement_lt(self, lhs, rhs, out):
		return "icmp slt {} {}, {}".format(self.get_llvm_representation(), lhs, rhs)
	def implement_le(self, lhs, rhs, out):
		return "icmp sle {} {}, {}".format(self.get_llvm_representation(), lhs, rhs)
	def implement_eq(self, lhs, rhs, out):
		return "icmp eq {} {}, {}".format(self.get_llvm_representation(), lhs, rhs)
	def implement_ne(self, lhs, rhs, out):
		return "icmp ne {} {}, {}".format(self.get_llvm_representation(), lhs, rhs)

	def implement_cast(self, value, from_, to):
		#Implement casting (| operator) for integers.
		# Basically, this just checks if the target type is a integer of another size, and if so
		# truncates or zero-extends appropriatley. Then, check if target is a pointer, and if so
		# invoke the appropriate inttoptr step (idk why LLVM special-cases this).
		# Otherwise, fall back to the default OType cast
		# behavior (bitcast-and-pray)
		if isinstance(to, IntegerPrimitiveOType):
			if to.get_bit_width()>from_.get_bit_width():
				return "zext {} {} to {}".format(
					from_.get_llvm_representation(),
					value,
					to.get_llvm_representation()
				)
			elif to.get_bit_width()==from_.get_bit_width():
				return "add {} 0, {}".format(
					to.get_llvm_representation(),
					value
				)
			else:
				return "trunc {} {} to {}".format(
					from_.get_llvm_representation(),
					value,
					to.get_llvm_representation()
				)
		elif isinstance(to, PointerPrimitiveOType):
			return "inttoptr {} {} to {}".format(
				from_.get_llvm_representation(),
				value,
				to.get_llvm_representation()
			)
		elif isinstance(to, DoublePrimitiveOType):
			return "sitofp {} {} to double".format(from_.get_llvm_representation(), value)
		else:
			return PrimitiveOType.implement_cast(self, value, from_, to)

	def get_size(self):
		return max(self.get_bit_width()/8, 1) #If it's an i1 (bool) it'll take up a whole byte anyway

class UnsignedIntegerPrimitiveOType(IntegerPrimitiveOType):
	#Behaves largely the same as uints, but uses unsigned versions of division/modulo/comparison operators
	#A signed int and unsigned int of the same size have the same LLVM representation, but the logic orth
	# provides to interact with them is different (i.e. signed respects the sign and unsigned treats it
	# as another bit of the number) 
	def implement_div(self, lhs, rhs, out):
		return "udiv {} {}, {}".format(self.get_llvm_representation(), lhs, rhs)

	def implement_rem(self, lhs, rhs, out):
		return "urem {} {}, {}".format(self.get_llvm_representation(), lhs, rhs)

	def implement_gt(self, lhs, rhs, out):
		return "icmp ugt {} {}, {}".format(self.get_llvm_representation(), lhs, rhs)
	def implement_ge(self, lhs, rhs, out):
		return "icmp uge {} {}, {}".format(self.get_llvm_representation(), lhs, rhs)
	def implement_lt(self, lhs, rhs, out):
		return "icmp ult {} {}, {}".format(self.get_llvm_representation(), lhs, rhs)
	def implement_le(self, lhs, rhs, out):
		return "icmp ule {} {}, {}".format(self.get_llvm_representation(), lhs, rhs)

	def implement_cast(self, value, from_, to):
		if isinstance(to, DoublePrimitiveOType):
			return "uitofp {} {} to double".format(from_.get_llvm_representation(), value)
		else:
			return IntegerPrimitiveOType.implement_cast(self, value, from_, to)

class BooleanPrimitiveOType(UnsignedIntegerPrimitiveOType):
	def implement_neg(self, lhs, out):
		return "xor i1 {}, 1".format(lhs)

class DoublePrimitiveOType(PrimitiveOType):
	def __init__(self, name, llvmtype):
		OType.__init__(self, name)
		self.llvmtype=llvmtype
		self.fields=None
		self.datalayout=None

	def implement_add(self, lhs, rhs, out):
		return "fadd double {}, {}".format(lhs, rhs)
	def implement_sub(self, lhs, rhs, out):
		return "fsub double {}, {}".format(lhs, rhs)
	def implement_mul(self, lhs, rhs, out):
		return "fmul double {}, {}".format(lhs, rhs)
	def implement_div(self, lhs, rhs, out):
		return "fdiv double {}, {}".format(lhs, rhs)
	def implement_rem(self, lhs, rhs, out):
		return "frem double {}, {}".format(lhs, rhs)
	def implement_eq(self, lhs, rhs, out):
		return "fcmp oeq double {}, {}".format(lhs, rhs)
	def implement_ne(self, lhs, rhs, out):
		return "fcmp one double {}, {}".format(lhs, rhs)
	def implement_lt(self, lhs, rhs, out):
		return "fcmp olt double {}, {}".format(lhs, rhs)
	def implement_le(self, lhs, rhs, out):
		return "fcmp ole double {}, {}".format(lhs, rhs)
	def implement_gt(self, lhs, rhs, out):
		return "fcmp ogt double {}, {}".format(lhs, rhs)
	def implement_ge(self, lhs, rhs, out):
		return "fcmp oge double {}, {}".format(lhs, rhs)

	def implement_neg(self, lhs, out):
		return "fsub double 0.0, {}".format(lhs)

	def implement_cast(self, value, from_, to):
		if isinstance(to, UnsignedIntegerPrimitiveOType):
			return "fptoui double {} to {}".format(value, to.get_llvm_representation())
		elif isinstance(to, IntegerPrimitiveOType):
			return "fptosi double {} to {}".format(value, to.get_llvm_representation())

	def get_literal_expr(self, value, out):
		#LLVM doubles are rediculous
		zero_name="%"+out.get_temp_name()
		name="%"+out.get_temp_name()
		out.emitl("; LLLVM doubleS ARESTUPID")
		out.emitl("{} = load double* @_the_zero_double".format(zero_name))
		out.emitl("{} = fadd double {}, {}".format(name, zero_name, value))
		out.emitl("; /LLLVM doubleS ARESTUPID")
		return name

	def get_size(self): return 8

class PointerPrimitiveOType(PrimitiveOType):
	#A pointer to something. All it does is implement pointer-to-pointer bitcasts and pointer-to-int casts
	def get_size(self):
		return 8 #TODO: Detect arch compiling for and adjust appropriatley, 4 bytes on 32-bit systems

	def implement_cast(self, value, from_, to):
		if isinstance(to, IntegerPrimitiveOType):
			return "ptrtoint {} {} to {}".format(
				from_.get_llvm_representation(),
				value,
				to.get_llvm_representation()
			)
		else:
			return "bitcast {} {} to {};PPOT:IC:2".format(
				from_.get_llvm_representation(),
				value,
				to.get_llvm_representation()
			)

class FunctionOType(PointerPrimitiveOType):
	#Used for the signatures cache. Tells callers how to invoke stuff.
	def __init__(self, name, args, returntype, auto_conv=False):
		OType.__init__(self, name)
		self.llvmtype=returntype.get_llvm_representation()
		self.argsig=" ("+(",".join(typ.get_llvm_representation() for typ in args))+")"
		self.fields=None
		self.datalayout=None
		self.returntype=returntype
		self.args=args
		self.auto_conv=auto_conv

	def get_llvm_representation(self):
		return self.llvmtype+" "+self.argsig+"*"

class BlackBoxFunctionOType(FunctionOType):
	#Used for function pointers, or varargs functions (in future)
	def __init__(self, name, returntype):
		FunctionOType.__init__(self, name, [], returntype)
		self.argsig="(...)"
		self.llvmtype=returntype.get_llvm_representation()

class ManualFunctionOType(FunctionOType):
	#Used for @declare_func@ intrinsics (for calling out to external functions)
	#Basically just lets users specify the parts of the LLVM decl
	def __init__(self, name, argsig, returntype, auto_conv=False):
		FunctionOType.__init__(self, name, [], returntype)
		self.argsig=argsig
		self.llvmtype=returntype.get_llvm_representation()
		self.auto_conv=auto_conv

class PrimitiveCStrOType(PointerPrimitiveOType):
	#A cstr (C-String) is functionally equivilint to a pointer, but has a literal form (A quoted string)
	def __init__(self, name, llvmtype):
		OType.__init__(self, name)
		self.llvmtype=llvmtype

	def get_literal_expr(self, value, out):
		#Create a global name for the literal value (will eventually end up in .rodata,) cache it for writing at the end
		# then return a reference to it casting it as a i8* (instead of array of i8s)
		#Only supports ASCII
		globalname="strglobal_"+out.get_name()
		transformed="".join("\\{}".format(("0" if ord(char)<16 else "") + hex(ord(char))[2:]) for char in value)
		out.add_global_stmt("@{} = private unnamed_addr constant [{} x i8] c\"{}\" ; c={}".format(
			globalname,
			len(value)+1,
			transformed+"\\00",
			repr(value)
		))
		name=out.get_temp_name()
		out.emitl("%{} = getelementptr [{} x i8]* @{}".format(name, len(value)+1, globalname))
		i8pname="%"+out.get_temp_name()
		out.emitl("{} = bitcast [{} x i8]* %{} to i8*".format(
			i8pname,
			len(value)+1,
			name
		))
		return i8pname

class StructOType(OType):
	#Meat-n-taters of the user type system here. Implements a structure class as defined by a user
	# with a LLVM structure type. User classes can ovveride the methods for add/sub/etc by defining functions
	# (optinally within the typedecl) named name:op that become "instance" methods. These are then callable
	# by doing instance:op(foo, bar), and this then internally calls class$op(instance, foo, bar)
	#Provides aggregate size, and typedecl setup
	def __init__(self, name, fields, out, packed=False):
		OType.__init__(self, name)
		self.fields=collections.OrderedDict(fields)
		self.packed=packed
		# print(self.fields)

	def setup(self, out):
		#This is a seperate step, because classes like linkedlist nodes may refer to themselves, so
		# this needs to be run after the class is in the out.types cache
		for field in self.fields.keys():
 			self.fields[field]=transform.get_type(self.fields[field], out)

		self.datalayout=[]
		for field, type in self.fields.items():
			self.datalayout.append(type.get_llvm_representation())

		out.emitl(self.get_decl())

	def get_name(self):
		return "ty_"+self.name+"_s"

	def index_to(self, field):
		#Return the fragment of a getelementptr instruction to access the field named field
		try:
			return "i32 "+str(list(self.fields.keys()).index(field))+"; for field %s in type %s"%(field, self.get_name())
		except ValueError:
			raise KeyError("Programmer Error: Type %s has no field %s"%(self.name, field))


	def get_decl(self):
		#Return the declaration string for this type, as a LLVM aggregate structure.
		#Packed instructs the compiler to add no padding to the outgoing structure
		#NOTE: We actually pack all structs, because i was stupid and jused summed all the sizes
		#TODO: Fix this
		if self.packed:
			return "%"+self.get_name()+" = type<{"+(",".join(self.datalayout))+"}>"
		else:
			return "%"+self.get_name()+" = type<{"+(",".join(self.datalayout))+"}>"

	def get_llvm_representation(self):
		#All "instances" of a user type are pointers to it
		return "%"+self.get_name()+"*"

	def implement_rem(self, *a, **k):
		return self.implement_mod(*a, **k)

	def implement_rsh(self, *a, **k):
		return self.implement_shr(*a, **k)

	def implement_lsh(self, *a, **k):
		return self.implement_shl(*a, **k)

	def get_size(self):
		#If we have a reference to ourselves (or another StructOType that indirectly references us)
		# we would get a infininite loop here recursivley calling get_size() in in.
		#Also, that would be wrong even if it worked because we are holding a pointer to it, not 
		# embedding it
		# print([e.get_size() if not isinstance(e, StructOType) else builtin_types['ptr'].get_size() for e in self.fields.values()])
		# print(self.fields.values())
		return sum(e.get_size() if not isinstance(e, StructOType) else builtin_types['ptr'].get_size() for e in self.fields.values())


#Initilize the builtin types. Nativley we support...
builtin_types = {e.name:e for e in [
	BooleanPrimitiveOType("bool", "i1"),			#Boolean values
	IntegerPrimitiveOType("int", "i32"),			#Int's are 4-bytes
	IntegerPrimitiveOType("short", "i16"),			#Shorts are two
	IntegerPrimitiveOType("byte", "i8"),			#Bytes (char in C)
	IntegerPrimitiveOType("long", "i64"),			#Longs are 8 bytes
	IntegerPrimitiveOType("xlong", "i128"),		#Hella big
	IntegerPrimitiveOType("xxlong", "i256"),		#Hella Hella big
	DoublePrimitiveOType("float", "double"),		#A lie...
	UnsignedIntegerPrimitiveOType("uint", "i32"),		#Same as above, but unsigned
	UnsignedIntegerPrimitiveOType("ushort", "i16"),	# (note that they have the same LLVM types
	UnsignedIntegerPrimitiveOType("ubyte", "i8"),		# but the orth type metadata is different
	UnsignedIntegerPrimitiveOType("ulong", "i64"),		# resulting in the correct u* operations
	UnsignedIntegerPrimitiveOType("uxlong", "i128"),	# being applied for mul, mod and cmp stuff)
	UnsignedIntegerPrimitiveOType("uxxlong", "i256"),
	PointerPrimitiveOType("ptr", "i8*"),					#No parameterization for pointers (so no need for void*)
	PointerPrimitiveOType("void", "void"),					#Nil return value type (only valid in function decls)
	PrimitiveCStrOType("cstr", "i8*")					#Cstr is just a ptr with a literal constructor
]}
