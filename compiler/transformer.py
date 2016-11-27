from transform import Transformer
from grammar import *
import transform
import datamodel
from transform import get_type, do_var_alloc


class CastExprTransformer(Transformer):
	transforms=CastExpr

	def transform(self, out):
		name=out.get_temp_name()
		value=transform.emit(
			out,
			self.node.value,
			self
		)
		out.emitl("%{} = {}".format(
			name,
			get_type(self.node.value, out).implement_cast(
				value,
				get_type(self.node.value, out),
				self.node.to
			)
		))
		return name

	@staticmethod
	def get_type(node, out):
		return node.to

class PtrCastExprTransformer(Transformer):
	transforms=PtrCastExpr

	def transform(self, out):
		assert isinstance(self.node.value, NameExpr), "Can't take address of non-var"
		name=out.get_temp_name()
		out.emitl("%{} = bitcast {}* %{} to i8*".format(
			name,
			get_type(self.node.value, out).get_llvm_representation(),
			out.get_var_name(self.node.value.name)
		))
		return name

	@staticmethod
	def get_type(node, out):
		return node.to

class GroupExprTransformer(Transformer):
	transforms=BunchaExpressions

	def transform(self, out):
		for expr in self.node.exprs:
			with out.context(line=expr.line):
				transform.emit(out, expr, self)

class LiteralExprTransformer(Transformer):
	transforms=LiteralExpr

	def transform(self, out):
		name=out.get_temp_name()
		out.emitl("%{} = {}".format(name, self.node.type.get_literal_expr(self.node.value, out)))
		return name

	@staticmethod
	def get_type(node, out):
		return node.type

class BinOpExprTransformer(Transformer):
	transforms=BinOpExpr

	def transform(self, out):
		name=out.get_temp_name()
		lhs=transform.emit(out, self.node.lhs, self)
		rhs=transform.emit(out, self.node.rhs, self)

		lhstype=get_type(self.node.lhs, out)

		if self.node.operator=="+":
			res = lhstype.implement_add(lhs, rhs, out)

		if self.node.operator=="-":
			res = lhstype.implement_sub(lhs, rhs, out)

		if self.node.operator=="*":
			res = lhstype.implement_mul(lhs, rhs, out)

		if self.node.operator=="/":
			res = lhstype.implement_div(lhs, rhs, out)

		if self.node.operator==">":
			res = lhstype.implement_gt(lhs, rhs, out)

		if self.node.operator==">=":
			res = lhstype.implement_ge(lhs, rhs, out)

		if self.node.operator=="<":
			res = lhstype.implement_lt(lhs, rhs, out)

		if self.node.operator=="<=":
			res = lhstype.implement_le(lhs, rhs, out)

		if self.node.operator=="==":
			res = lhstype.implement_eq(lhs, rhs, out)

		if self.node.operator=="!=":
			res = lhstype.implement_ne(lhs, rhs, out)

		out.emitl("%{} = {}".format(name, res))
		return name

	@staticmethod
	def get_type(node, out):
		return get_type(node.lhs, out) if node.operator in "+-*/" else datamodel.builtin_types['bool']

class UnOpTransformer(Transformer):
	transforms=UnOpExpr

	def transform(self, out):
		name=out.get_temp_name()
		value=transform.emit(out, self.node.expr, self)
		out.emitl("%{} = {}".format(
			name,
			get_type(self.node.expr, out).implement_neg(value, out)
		))
		return name

class AssignmentExprTransformer(Transformer):
	transforms=AssignmentExpr

	def transform(self, out):
		if self.node.init:
			do_var_alloc(out, self.node.lhs.name, self.node.lhs.type)

		name=out.get_var_name(self.node.lhs.name)

		rhs=transform.emit(out, self.node.rhs, self)

		if isinstance(self.node.lhs, NameExpr):
			out.emitl("store {t} %{v}, {t}* %{n}".format(
				t=get_type(self.node.lhs, out).get_llvm_representation(),
				n=name,
				v=rhs
			))

class DeclExprTransformer(Transformer):
	transforms=DeclExpr

	def transform(self, out):
		# print("allocatin")
		return do_var_alloc(out, self.node.name, self.node.type)

	@staticmethod
	def get_type(node, out):
		return node.type

class NameExprTransformer(Transformer):
	transforms=NameExpr

	def transform(self, out):
		name=out.get_temp_name()
		self.type=out.get_var_type(self.node.name)
		out.emitl("%{} = load {}* %{}".format(name,
			self.type.get_llvm_representation(),
			out.get_var_name(self.node.name)))
		return name

	@staticmethod
	def get_type(node, out):
		return out.get_var_type(node.name)

class GroupingExprTransformer(Transformer):
	transforms=GroupingExpr

	def transform(self, out):
		return transform.emit(out, self.node.value, self.parent)

	@staticmethod
	def get_type(node, out):
		return get_type(node.value, out)

class IfExprTransformer(Transformer):
	transforms=[IfExpr, ElIfExpr]

	def transform(self, out):
		assert get_type(self.node.cond, out).get_llvm_representation()=="i1", \
		 get_type(self.node.cond, out).get_llvm_representation()+"!=i1"
		cond=transform.emit(out, self.node.cond, self)
		if_name="if_"+out.get_name()
		succ_label=if_name+"___SUCC"
		fail_label=if_name+"___FAIL"
		done_label=if_name+"___DONE"
		out.emitl("br i1 %{}, label %{}, label %{}".format(cond, succ_label, fail_label))
		with out.indent(-1):
			out.emitl("{}:".format(succ_label))
		with out.context():
			transform.emit(out, self.node.block, self)
		out.emitl("br label %{}".format(done_label))
		with out.indent(-1):
			out.emitl("{}:".format(fail_label))
		if self.node.else_ is not None:
			with out.context():
				transform.emit(out, self.node.else_, self)
		out.emitl("br label %{}".format(done_label))
		with out.indent(-1):
			out.emitl("{}:".format(done_label))

class ElseExprTransformer(Transformer):
	transforms=ElseExpr

	def transform(self, out):
		transform.emit(out, self.node.block, self)

class SepExprTransformer(Transformer):
	transforms=SepExpr

class FunctionTransformer(Transformer):
	transforms=FunctionDecl

	def transform(self, out):
		out.emitl("define {} @{}({}){{".format(
			self.node.type.get_llvm_representation(),
			self.node.name,
			",".join(arg.type.get_llvm_representation()+" %"+arg.name for arg in self.node.args)
		))
		with out.context(method=self.node.name):
			for arg in self.node.args:
				do_var_alloc(out, arg.name, arg.type)
				out.emitl("store {t} %{v}, {t}* %{n}".format(
					t=arg.type.get_llvm_representation(),
					v=arg.name,
					n=out.get_var_name(arg.name)
				))
			transform.emit(out, self.node.body, self)
		out.emitl("}")

class ReturnTransformer(Transformer):
	transforms=ReturnExpr

	def transform(self, out):
		name=transform.emit(out, self.node.value, self)
		out.emitl("ret {} %{}".format(get_type(self.node.value, out).get_llvm_representation(), name))

class CallExprTransformer(Transformer):
	transforms=CallExpr

	def transform(self, out):
		assert isinstance(self.node.method, NameExpr), "No computed calls yet :("
		name=out.get_temp_name()
		args=[]
		for arg in self.node.args:
			args.append(get_type(arg, out).get_llvm_representation()+" %"+transform.emit(out, arg, self))

		out.emitl("%{} = call {}* @{}({})".format(
			name,
			out.signatures[self.node.method.name].get_llvm_representation(),
			self.node.method.name,
			",".join(args)
		))
		return name

	@staticmethod
	def get_type(node, out):
		return out.signatures[node.method.name].returntype

class FileTransformer(Transformer):
	transforms=FileExpr

	def transform(self, out):
		for func in self.node.funcs:
			if isinstance(func, FunctionDecl):
				out.signatures[func.name]=datamodel.FunctionOType(func.name, func.args, func.type)
		# print(out.signatures)

		for func in self.node.funcs:
			transform.emit(out, func, self)

class IntrinsicTransformer(Transformer):
	transforms=IntrinsicExpr

	def transform(self, out):
		def declare_c_func(name, type, paramstring):
			rt=datamodel.builtin_types[type]
			out.emitl("declare {} @{}{}".format(rt.get_llvm_representation(), name, paramstring))
			out.signatures[name]=datamodel.ManualFunctionOType(name, paramstring, rt)

		def expose_symbol(name, type):
			out.set_var_name(name, name, datamodel.builtin_types[type])

		def include(filename):
			import tokenize, parse
			with out.context(file=filename.split("/")[-1].split(".")[0]):
				transform.emit(out, parse.parse(tokenize.tokenize(open(filename, 'r').read())), self)

		return eval(self.node.text[1:])

class WhileExprTransformer(Transformer):
	transforms=WhileExpr

	def transform(self, out):
		assert get_type(self.node.cond, out).get_llvm_representation()=="i1", \
		 get_type(self.node.cond, out).get_llvm_representation()+"!=i1"

		loop_name=out.get_name()+"___LOOP"
		head_label=loop_name+"___HEAD"
		end_label=loop_name+"___END"

		initial_cond=transform.emit(out, self.node.cond, self)
		out.emitl("br i1 %{}, label %{}, label %{}".format(initial_cond, head_label, end_label))
		with out.indent(-1):
			out.emitl("{}:".format(head_label))
		with out.context():
			transform.emit(out, self.node.block, self)
		cond=transform.emit(out, self.node.cond, self)
		out.emitl("br i1 %{}, label %{}, label %{}".format(cond, head_label, end_label))
		with out.indent(-1):
			out.emitl("{}:".format(end_label))