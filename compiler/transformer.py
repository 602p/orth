from transform import Transformer
from grammar import *
import transform
import datamodel

def get_type(node, out):
	return transform.get_transformer_cls(node).get_type(node, out)

def do_var_alloc(out, varname, type):
	name="var_"+out.get_name()+"___"+varname
	out.emitl("%{} = alloca {}".format(name, type.get_llvm_representation()))
	out.set_var_name(varname, name, type)
	return name

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
		out.emitl("%{} = {}".format(name, self.node.type.get_literal_expr(self.node.value)))
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
			res = lhstype.implement_add(lhs, rhs)

		if self.node.operator=="-":
			res = lhstype.implement_sub(lhs, rhs)

		if self.node.operator=="*":
			res = lhstype.implement_mul(lhs, rhs)

		if self.node.operator=="/":
			res = lhstype.implement_div(lhs, rhs)

		if self.node.operator==">":
			res = lhstype.implement_gt(lhs, rhs)

		if self.node.operator==">=":
			res = lhstype.implement_ge(lhs, rhs)

		if self.node.operator=="<":
			res = lhstype.implement_lt(lhs, rhs)

		if self.node.operator=="<=":
			res = lhstype.implement_le(lhs, rhs)

		if self.node.operator=="==":
			res = lhstype.implement_eq(lhs, rhs)

		if self.node.operator=="!=":
			res = lhstype.implement_ne(lhs, rhs)

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
			get_type(self.node.expr, out).implement_neg(value)
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