from transform import Transformer
from grammar import *
import transform

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
		if self.node.type=="int":
			out.emitl("%{} = add i32 0, {}".format(name, self.node.value))
		return name

class BinOpExprTransformer(Transformer):
	transforms=BinOpExpr

	def transform(self, out):
		name=out.get_temp_name()
		lhs=transform.emit(out, self.node.lhs, self)
		rhs=transform.emit(out, self.node.rhs, self)
		# if self.node.type=="int":
		if self.node.operator=="+":
			out.emitl("%{} = add i32 %{}, %{}".format(name, lhs, rhs))
		if self.node.operator=="-":
			out.emitl("%{} = sub i32 %{}, %{}".format(name, lhs, rhs))
		if self.node.operator=="*":
			out.emitl("%{} = mul i32 %{}, %{}".format(name, lhs, rhs))
		return name

def do_var_alloc(out, varname, type):
	name="var_"+out.get_name()+"___"+varname
	if type=="int":
		llvmtype="i32"
	out.emitl("%{} = alloca {}".format(name, llvmtype))
	out.set_var_name(varname, name)
	return name

class AssignmentExprTransformer(Transformer):
	transforms=AssignmentExpr

	def transform(self, out):
		if self.node.init:
			do_var_alloc(out, self.node.lhs.name, self.node.lhs.type)

		name=out.get_var_name(self.node.lhs.name)

		out.emitl("store i32 %{}, i32* %{}".format(transform.emit(out, self.node.rhs, self), name))

class DeclExprTransformer(Transformer):
	transforms=DeclExpr

	def transform(self, out):
		# print("allocatin")
		return do_var_alloc(out, self.node.name, self.node.type)

class NameExprTransformer(Transformer):
	transforms=NameExpr

	def transform(self, out):
		name=out.get_temp_name()
		out.emitl("%{} = load i32* %{}".format(name, out.get_var_name(self.node.name)))
		return name

class GroupingExprTransformer(Transformer):
	transforms=GroupingExpr

	def transform(self, out):
		return transform.emit(out, self.node.value, self.parent)

class SepExprTransformer(Transformer):
	transforms=SepExpr