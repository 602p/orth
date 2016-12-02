from transform import Transformer
from grammar import *
import transform
import datamodel
import intrinsics
from transform import get_type, do_var_alloc


class CastExprTransformer(Transformer):
	transforms=CastExpr

	def transform(self, out):
		name=out.get_temp_name()
		value=transform.emit(
			out,
			self.node.value,
			self
		) #From CastExpr
		out.emitl("%{} = {}".format(
			name,
			get_type(self.node.value, out).implement_cast(
				value,
				get_type(self.node.value, out),
				get_type(self.node.to, out)
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
				transform.emit(out, expr, self) #From GroupExpr

class LiteralExprTransformer(Transformer):
	transforms=LiteralExpr

	def transform(self, out):
		name=out.get_temp_name()
		out.emitl("%{} = {}".format(name, get_type(self.node.type, out).get_literal_expr(self.node.value, out))) #From Literal
		return name

	@staticmethod
	def get_type(node, out):
		return node.type

class BinOpExprTransformer(Transformer):
	transforms=BinOpExpr

	def transform(self, out):
		name=out.get_temp_name()
		lhs=transform.emit(out, self.node.lhs, self) #From BinOp
		rhs=transform.emit(out, self.node.rhs, self) #From BinOp

		lhstype=get_type(self.node.lhs, out)

		if self.node.operator=="+":
			res = lhstype.implement_add(lhs, rhs, out)

		if self.node.operator=="-":
			res = lhstype.implement_sub(lhs, rhs, out)

		if self.node.operator=="*":
			res = lhstype.implement_mul(lhs, rhs, out)

		if self.node.operator=="/":
			res = lhstype.implement_div(lhs, rhs, out)

		if self.node.operator=="%":
			res = lhstype.implement_rem(lhs, rhs, out)

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
		# print(node)
		return get_type(node.lhs, out) if node.operator in "+-*/" else datamodel.builtin_types['bool']

class UnOpTransformer(Transformer):
	transforms=UnOpExpr

	def transform(self, out):
		name=out.get_temp_name()
		value=transform.emit(out, self.node.expr, self) #From UnOp
		out.emitl("%{} = {}".format(
			name,
			get_type(self.node.expr, out).implement_neg(value, out)
		))
		return name

	@staticmethod
	def get_type(node, out):
		# print(node)
		return get_type(node.expr, out)

class AssignmentExprTransformer(Transformer):
	transforms=AssignmentExpr

	def transform(self, out):
		if self.node.init:
			do_var_alloc(out, self.node.lhs.name, get_type(self.node.lhs.type, out))

		target=transform.get_transformer(self.node.lhs, self).transform_address(out)

		rhs=transform.emit(out, self.node.rhs, self) #From Assignment

		# if self.node.
		out.emitl("store {t} %{v}, {t}* %{n}".format(
			t=get_type(self.node.lhs, out).get_llvm_representation(),
			n=target,
			v=rhs
		))

class AccessorExprTransformer(Transformer):
	transforms=AccessorExpr

	def transform_address(self, out):
		ptrname=transform.emit(out, self.node.object, self) #From Accessor
		ptrtype=get_type(self.node.object, out) #From Accessor
		name=out.get_temp_name()
		out.emitl("%{} = getelementptr {} %{}, i32 0, {}".format(
			name,
			ptrtype.get_llvm_representation(),
			ptrname,
			ptrtype.index_to(self.node.field)
		))
		return name

	def transform(self, out):
		addr = self.transform_address(out)
		name=out.get_temp_name()
		out.emitl("%{} = load {}* %{}".format(
			name,
			get_type(self.node, out).get_llvm_representation(),
			addr
		))
		return name

	@staticmethod
	def get_type(node, out):
		return get_type(node.object, out).fields[node.field]

class IndexExprTransformer(Transformer):
	transforms=IndexExpr

	def transform_address(self, out): #TODO: Improve
		base=out.get_temp_name()
		out.emitl("%{} = ptrtoint {} %{} to i32 ;IndexExpr:transform_address".format(
			base,
			transform.get_transformer(self.node.object, self).get_type(self.node.object, out).get_llvm_representation(),
			transform.emit(out, self.node.object, self)
		))
		pos=out.get_temp_name()
		out.emitl("%{} = add i32 %{}, %{} ;IndexExpr:transform_address".format(
			pos,
			base,
			transform.emit(out, self.node.index, self)
		))
		ptr=out.get_temp_name()
		out.emitl("%{} = inttoptr i32 %{} to i8* ;IndexExpr:transform_address".format(ptr, pos))
		return ptr

	def transform(self, out):
		value=out.get_temp_name()
		out.emitl("%{} = load i8* %{}".format(value, self.transform_address(out)))
		return value

	@staticmethod
	def get_type(node, out):
		return datamodel.builtin_types['byte']


class DeclExprTransformer(Transformer):
	transforms=DeclExpr

	def transform(self, out):
		# print("allocatin")
		return do_var_alloc(out, self.node.name, get_type(self.node.type, out))

	@staticmethod
	def get_type(node, out):
		return node.type

	def transform_address(self, out):
		return out.get_var_name(self.node.name)

class NameExprTransformer(Transformer):
	transforms=NameExpr

	def transform(self, out):
		name=out.get_temp_name()
		# print(out.scopes, self.parent.node if self.parent else "")
		self.type=out.get_var_type(self.node.name) #From NameExpr
		out.emitl("%{} = load {}* %{}".format(name,
			self.type.get_llvm_representation(),
			out.get_var_name(self.node.name))) #From NameExpr
		return name

	def transform_address(self, out):
		return out.get_var_name(self.node.name)

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
			get_type(self.node.type, out).get_llvm_representation(),
			self.node.name,
			",".join(get_type(arg.type, out).get_llvm_representation()+" %"+arg.name for arg in self.node.args)
		))
		with out.context(method=self.node.name):
			with out.scope():
				for arg in self.node.args:
					do_var_alloc(out, arg.name, get_type(arg.type, out))
					out.emitl("store {t} %{v}, {t}* %{n}".format(
						t=get_type(arg.type, out).get_llvm_representation(),
						v=arg.name,
						n=out.get_var_name(arg.name)
					))
				for vname, var in out.globals.items():
					localname="imp_gvar_"+out.get_name()+"__"+vname
					out.set_var_name(vname, localname, var.type)
					out.emitl("%{} = getelementptr {}* @{}, i32 0".format(
						localname, var.type.get_llvm_representation(), var.name
					))
				transform.emit(out, self.node.body, self)
		out.emitl("}")

class ReturnTransformer(Transformer):
	transforms=ReturnExpr

	def transform(self, out):
		if self.node.value:
			name=transform.emit(out, self.node.value, self)
			out.emitl("ret {} %{}".format(get_type(self.node.value, out).get_llvm_representation(), name))
		else:
			out.emitl("ret void")

class CallExprTransformer(Transformer):
	transforms=CallExpr

	@staticmethod
	def get_method_to_invoke(node, out):
		if isinstance(node.method, AccessorExpr):
			if node.method.accesses=="method":
				return get_type(node.method.object, out).name+"$"+node.method.field
		else:
			assert isinstance(node.method, NameExpr), "No computed calls yet :("
			return node.method.name

	def transform(self, out):
		# print(self.node)
		#
		implicit_first_parameter=isinstance(self.node.method, AccessorExpr)
		method_to_invoke=self.get_method_to_invoke(self.node, out)
		name=out.get_temp_name()
		args=[]
		if implicit_first_parameter:
			args.append(get_type(self.node.method.object, out).get_llvm_representation()+" %"+transform.emit(out, self.node.method.object))
		for arg in self.node.args:
			args.append(get_type(arg, out).get_llvm_representation()+" %"+transform.emit(out, arg, self))

		if out.signatures[method_to_invoke].returntype.get_llvm_representation()!="void": #From CallExpr
			out.emitl("%{} = call {}* @{}({})".format(
				name,
				out.signatures[method_to_invoke].get_llvm_representation(),
				method_to_invoke,
				",".join(args)
			))
		else:
			out.emitl("call {}* @{}({})".format(
				out.signatures[method_to_invoke].get_llvm_representation(),
				method_to_invoke,
				",".join(args)
			))
		return name

	@staticmethod
	def get_type(node, out):
		return out.signatures[CallExprTransformer.get_method_to_invoke(node, out)].returntype

class FileTransformer(Transformer):
	transforms=FileExpr

	def transform(self, out):
		for func in self.node.funcs:
			if isinstance(func, FunctionDecl):
				out.signatures[func.name]=datamodel.FunctionOType(
					func.name,
					[get_type(t.type, out) for t in func.args],
					get_type(func.type, out))
			elif isinstance(func, DeclExpr):
				name="gvar_"+out.get_name()+"__"+func.name
				out.emitl("@{} = global {} {}".format(
					name,
					get_type(func, out).get_llvm_representation(),
					"0" if isinstance(get_type(func, out), datamodel.IntegerPrimitiveOType) else "null"
				))
				out.set_global_var_name(func.name, name, get_type(func, out))
			else:
				transform.emit(out, func, self)
		# print(out.signatures)

		for func in self.node.funcs:
			if isinstance(func, FunctionDecl):
				transform.emit(out, func, self)

class IntrinsicTransformer(Transformer):
	transforms=IntrinsicExpr

	def transform(self, out):
		# print(self.node)
		return intrinsics.process_intrinsic(out, self.node.text)

	@staticmethod
	def get_type(node, out):
		return intrinsics.get_type(out, node.text)

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

class TypeTransformer(Transformer):
	transforms=TypeDecl

	def transform(self, out):
		out.types[self.node.name]=datamodel.StructOType(self.node.name, self.node.fields, out, packed=self.node.packed)
		out.types[self.node.name].setup(out)
		for method in self.node.methods:
			out.signatures[method.name]=datamodel.FunctionOType(
				method.name,
				[get_type(t.type, out) for t in method.args],
				get_type(method.type, out))
			# print("emitting "+method.name)
			transform.emit(out, method, self)
		