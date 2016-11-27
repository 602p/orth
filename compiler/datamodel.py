import collections

class OType:
	def __init__(self, name, fields=None):
		self.name=name
		self.fields=collections.OrderedDict() if fields is None else fields
		self.datalayout=collections.OrderedDict()

		for field in self.fields.keys():
			self.datalayout[field]=typ=self.fields[field].get_llvm_representation()

	def get_llvm_structdef(self):
		return "type {"+(", ".join(self.datalayout.values()))+"}"

	def get_llvm_representation(self):
		return self.get_llvm_structdef()+"*"

	def __str__(self):
		return "{"+self.name+"}"

	def __repr__(self):
		return str(self)

class PrimitiveOType(OType):
	def __init__(self, name, llvmtype, literal_formatter):
		OType.__init__(self, name, {})
		self.llvmtype=llvmtype
		self.fields=None
		self.datalayout=None
		self.literal_formatter=literal_formatter

	def get_bit_width(self):
		return int(self.llvmtype[1:])

	def get_llvm_representation(self):
		return self.llvmtype

	def get_literal_expr(self, value):
		return self.literal_formatter.format(value)

	def implement_add(self, lhs, rhs):
		return "add {} %{}, %{}".format(self.get_llvm_representation(), lhs, rhs)

	def implement_sub(self, lhs, rhs):
		return "sub {} %{}, %{}".format(self.get_llvm_representation(), lhs, rhs)

	def implement_neg(self, val):
		return "sub {} %{}, 0".format(self.get_llvm_representation(), val)

	def implement_mul(self, lhs, rhs):
		return "mul {} %{}, %{}".format(self.get_llvm_representation(), lhs, rhs)

	def implement_div(self, lhs, rhs):
		return "sdiv {} %{}, %{}".format(self.get_llvm_representation(), lhs, rhs)

	def implement_gt(self, lhs, rhs):
		return "icmp sgt {} %{}, %{}".format(self.get_llvm_representation(), lhs, rhs)
	def implement_ge(self, lhs, rhs):
		return "icmp sge {} %{}, %{}".format(self.get_llvm_representation(), lhs, rhs)
	def implement_lt(self, lhs, rhs):
		return "icmp slt {} %{}, %{}".format(self.get_llvm_representation(), lhs, rhs)
	def implement_le(self, lhs, rhs):
		return "icmp sle {} %{}, %{}".format(self.get_llvm_representation(), lhs, rhs)
	def implement_eq(self, lhs, rhs):
		return "icmp eq {} %{}, %{}".format(self.get_llvm_representation(), lhs, rhs)
	def implement_ne(self, lhs, rhs):
		return "icmp ne {} %{}, %{}".format(self.get_llvm_representation(), lhs, rhs)

	def implement_cast(self, value, from_, to):
		if to.get_bit_width()>from_.get_bit_width():
			return "zext {} %{} to {}".format(
				from_.get_llvm_representation(),
				value,
				to.get_llvm_representation()
			)
		elif to.get_bit_width()==from_.get_bit_width():
			return "%"+value
		else:
			return "trunc {} %{} to {}".format(
				from_.get_llvm_representation(),
				value,
				to.get_llvm_representation()
			)

class FunctionOType(OType):
	def __init__(self, name, args, returntype):
		OType.__init__(self, name, {})
		self.llvmtype=returntype.get_llvm_representation()+\
		              " ("+(",".join(typ.type.get_llvm_representation() for typ in args))+")"
		self.fields=None
		self.datalayout=None
		self.returntype=returntype
		self.args=args

	def get_llvm_representation(self):
		return self.llvmtype

	# def get_invocation

builtin_types = {e.name:e for e in [
	PrimitiveOType("bool", "i1", "add i1 0, {}"),
	PrimitiveOType("int", "i32", "add i32 0, {}"),
	PrimitiveOType("short", "i16", "add i16 0, {}"),
	PrimitiveOType("byte", "i8", "add i8 0, {}"),
	PrimitiveOType("long", "i64", "add i64 0, {}"),
	PrimitiveOType("xlong", "i128", "add i128 0, {}"),
	PrimitiveOType("xxlong", "i256", "add i256 0, {}"),
	PrimitiveOType("ptr", "void*", "<notimplemented>")
]}