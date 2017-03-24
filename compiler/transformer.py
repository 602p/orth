from transform import Transformer
from grammar import *
import transform
import datamodel
import intrinsics
from transform import get_type, do_var_alloc, ret_local

"""
 _______  ___ ________
  )_   ( '-,) )   _(
    )_  \_//_/  _(
      )___  ___(
          ))
         ((
          ``
    Here be dragons

This is the core logic for AST->LLVM IR transformation.
Eatch class matches one or more type of ASTNode.

transform produces a (prefixed) LLVM SSA Identifier of the
 value of the node.
transform_address produces a (prefixed) LLVM SSA Identifier
 of the address of the value of the node
get_type produces a OType instance (from datamodel.py) 
 of the Orth view of the type of the SSA Var returned from
 transform (Type of SSA var returned from transform_address
 should be pointer-to-that-returned-by-get_type
"""

class CastExprTransformer(Transformer):
	transforms=CastExpr

	@ret_local #ret_local is a compatibility adapter that prefixes the function's return with a %, indicating it's a LLVM
			#SSA 'local' variable
	def transform(self, out):
		#Very simple function, just invokes implmenet_cast on the LHS and returns that. Good example
		name=out.get_temp_name() #Get the identifier for the output
		value=transform.emit( #`emit' the value we are casting, getting back the prefixed LLVM SSA Var identifier to use
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

	@ret_local
	def transform(self, out):
		assert isinstance(self.node.value, NameExpr), "Can't take address of non-var"
		name=out.get_temp_name()
		out.emitl("%{} = bitcast {}* {} to i8*".format(
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
		return get_type(self.node.type, out).get_literal_expr(self.node.value, out)

	@staticmethod
	def get_type(node, out):
		return node.type

class BinOpExprTransformer(Transformer):
	transforms=BinOpExpr

	@ret_local
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

		if self.node.operator==">>":
			res = lhstype.implement_rsh(lhs, rhs, out)

		if self.node.operator=="<<":
			res = lhstype.implement_lsh(lhs, rhs, out)

		if self.node.operator=="&":
			res = lhstype.implement_band(lhs, rhs, out)

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
		return get_type(node.lhs, out) if node.operator in ["+","-","*","/","-",">>","<<","&", "%"] else datamodel.builtin_types['bool']

class UnOpTransformer(Transformer):
	transforms=UnOpExpr

	@ret_local
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
		out.emitl("store {t} {v}, {t}* {n};AXET:t".format(
			t=get_type(self.node.lhs, out).get_llvm_representation(),
			n=target,
			v=rhs
		))

class AccessorExprTransformer(Transformer):
	transforms=AccessorExpr

	@staticmethod
	def get_method_name(node, out):
		return get_type(node.object, out).name+"$"+node.field

	@ret_local
	def transform_address(self, out):
		ptrname=transform.emit(out, self.node.object, self) #From Accessor
		ptrtype=get_type(self.node.object, out) #From Accessor
		name=out.get_temp_name()
		out.emitl("%{} = getelementptr {} {}, i32 0, {}".format(
			name,
			ptrtype.get_llvm_representation(),
			ptrname,
			ptrtype.index_to(self.node.field)
		))
		return name

	def transform(self, out):
		if self.node.accesses=="method":
			return "@"+AccessorExprTransformer.get_method_name(self.node, out)
		addr = self.transform_address(out)
		name=out.get_temp_name()
		out.emitl("%{} = load {}* {} ;AX:t".format(
			name,
			get_type(self.node, out).get_llvm_representation(),
			addr
		))
		return "%"+name

	@staticmethod
	def get_type(node, out):
		if node.accesses=="method":
			return out.signatures[AccessorExprTransformer.get_method_name(node, out)].type
		return get_type(node.object, out).fields[node.field]

class IndexExprTransformer(Transformer):
	transforms=IndexExpr

	@ret_local
	def transform_address(self, out): #TODO: Improve
		base=out.get_temp_name()
		out.emitl("%{} = ptrtoint {} {} to i32 ;IndexExpr:transform_address".format(
			base,
			transform.get_transformer(self.node.object, self).get_type(self.node.object, out).get_llvm_representation(),
			transform.emit(out, self.node.object, self)
		))
		pos=out.get_temp_name()
		out.emitl("%{} = add i32 %{}, {} ;IndexExpr:transform_address".format(
			pos,
			base,
			transform.emit(out, self.node.index, self)
		))
		ptr=out.get_temp_name()
		out.emitl("%{} = inttoptr i32 %{} to i8* ;IndexExpr:transform_address".format(ptr, pos))
		return ptr

	@ret_local
	def transform(self, out):
		value=out.get_temp_name()
		out.emitl("%{} = load i8* {}; IX:T".format(value, self.transform_address(out)))
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

	@ret_local
	def transform(self, out):
		name=out.get_temp_name()
		if self.node.name in ["true", "false"]:
			out.emitl("%{} = add i1 0, {}".format(name, "0" if self.node.name=="false" else "1"))
		elif self.node.name=="null":
			temp_0=out.get_temp_name()
			out.emitl("%{} = add i32 0, 0".format(temp_0))
			out.emitl("%{} = inttoptr i32 %{} to i8*".format(name, temp_0))
		else:
			if self.node.name in out.scopes:
				self.type=out.get_var_type(self.node.name) #From NameExpr
				out.emitl("%{} = load {}* {};NX:t".format(name,
					self.type.get_llvm_representation(),
					out.get_var_name(self.node.name))) #From NameExpr
			elif self.node.name in out.signatures:
				self.type=out.signatures[self.node.name].type
				out.emitl("%{} = bitcast {} {} to {}".format( #Noop, because I can't see another way to 
					name,										#get LLVM to just give me the goddamn address
					self.type.get_llvm_representation(),
					out.signatures[self.node.name].name,
					self.type.get_llvm_representation()
				))
		return name

	def transform_address(self, out):
		if self.node.name in ["true", "false", "null"]:
			raise SyntaxError("Programmer Error: Can't assign to constants (true, false, null)")
		return out.get_var_name(self.node.name)

	@staticmethod
	def get_type(node, out):
		if node.name in ["true", "false"]:
			return datamodel.builtin_types["bool"]
		elif node.name=="null":
			return datamodel.builtin_types["ptr"]
		elif node.name in out.scopes:
			return out.get_var_type(node.name)
		else:
			return out.signatures[node.name].type

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
		out.emitl("br i1 {}, label %{}, label %{}".format(cond, succ_label, fail_label))
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
					out.emitl("store {t} %{v}, {t}* {n};FT:t".format(
						t=get_type(arg.type, out).get_llvm_representation(),
						v=arg.name,
						n=out.get_var_name(arg.name)
					))
				transform.emit(out, self.node.body, self)
		out.emitl("}")

class ReturnTransformer(Transformer):
	transforms=ReturnExpr

	def transform(self, out):
		if self.node.value:
			name=transform.emit(out, self.node.value, self)
			out.emitl("ret {} {}".format(get_type(self.node.value, out).get_llvm_representation(), name))
		else:
			out.emitl("ret void")

class CallExprTransformer(Transformer):
	transforms=CallExpr

	@ret_local
	def transform(self, out):
		implicit_first_parameter=isinstance(self.node.method, AccessorExpr) and self.node.method.accesses=="method"
		method_to_invoke=transform.emit(out, self.node.method, self)
		method_type=get_type(self.node.method, out)
		result=out.get_temp_name()
		args=[]
		if implicit_first_parameter:
			args.append(get_type(self.node.method.object, out).get_llvm_representation()+" "+transform.emit(out, self.node.method.object))
		for arg in self.node.args:
			args.append(get_type(arg, out).get_llvm_representation()+" "+transform.emit(out, arg, self))

		if method_type.returntype.get_llvm_representation()!="void": #From CallExpr
			out.emitl("%{} = call {} {}({})".format(
				result,
				method_type.get_llvm_representation(),
				method_to_invoke,
				",".join(args)
			))
		else:
			out.emitl("call {} {}({})".format(
				method_type.get_llvm_representation(),
				method_to_invoke,
				",".join(args)
			))
		return result

	@staticmethod
	def get_type(node, out):
		return get_type(node.method, out).returntype

class FileTransformer(Transformer):
	transforms=FileExpr

	def prepare(self, out):
		print("Preparing "+out.context_map['file'])
		for func in self.node.funcs:
			if isinstance(func, FunctionDecl):
				out.set_signature(func.name, datamodel.FunctionOType(
					func.name,
					[get_type(t.type, out) for t in func.args],
					get_type(func.type, out)))
			elif isinstance(func, DeclExpr):
				name="gvar_"+out.get_name()+"__"+func.name
				out.emitl("@{} = global {} {}".format(
					name,
					get_type(func, out).get_llvm_representation(),
					"0" if isinstance(get_type(func, out), datamodel.IntegerPrimitiveOType) else "null"
				))
				out.set_global_var_name(func.name, "@"+name, get_type(func, out))
			elif isinstance(func, ImportExpr) or isinstance(func, TypeDecl):
				transform.get_transformer(func, self).prepare(out)
			else:
				transform.emit(out, func, self)

	def transform(self, out):
		print("Transforming "+out.context_map['file'])
		for func in self.node.funcs:
			if isinstance(func, FunctionDecl) or isinstance(func, ImportExpr) or isinstance(func, TypeDecl):
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
		out.emitl("br i1 {}, label %{}, label %{}".format(initial_cond, head_label, end_label))
		with out.indent(-1):
			out.emitl("{}:".format(head_label))
		with out.context():
			transform.emit(out, self.node.block, self)
		cond=transform.emit(out, self.node.cond, self)
		out.emitl("br i1 {}, label %{}, label %{}".format(cond, head_label, end_label))
		with out.indent(-1):
			out.emitl("{}:".format(end_label))

class TypeTransformer(Transformer):
	transforms=TypeDecl

	def prepare(self, out):
		out.types[self.node.name]=datamodel.StructOType(self.node.name, self.node.fields, out, packed=self.node.packed)
		out.types[self.node.name].setup(out)
		for method in self.node.methods:
			out.set_signature(method.name, datamodel.FunctionOType(
				method.name,
				[get_type(t.type, out) for t in method.args],
				get_type(method.type, out)))

	def transform(self, out):
		for method in self.node.methods:
			# print("emitting "+method.name)
			transform.emit(out, method, self)

class TypeAliasTransformer(Transformer):
	transforms=AliasTypeDecl

	def prepare(self, out):
		if self.node.aliases_fpointer:
			out.types[self.node.name]=datamodel.BlackBoxFunctionOType(
				self.node.name,
				out.types[self.node.returntype]
			)
		else:
			out.types[self.node.name]=out.types[self.node.aliasing]

class ImportTransformer(Transformer):
	transforms=ImportExpr

	def get_file_transformer(self, out):
		import tokenize, parse
		filename=transform.resolve_import(self.node, out)
		if filename not in out.ast_cache:
			out.ast_cache[filename]=parse.parse(
				tokenize.tokenize(
					open(filename, 'r').read()
				)
			)
		return transform.get_transformer(
			out.ast_cache[filename],
			self
		)

	def prepare(self, out):
		path=transform.resolve_import(self.node, out)
		filename=transform.sanitize_fn(path)
		if filename in out.prepared_files:
			out.emitl(";;;OMITTING INCLUDE `"+filename+"`, PREVIOUSLY INCLUDED")
			return
		out.prepared_files.append(filename)
		
		with out.context(file=filename, path=path):
			self.get_file_transformer(out).prepare(out)

	def transform(self, out):
		path=transform.resolve_import(self.node, out)
		filename=transform.sanitize_fn(path)
		self.prepare(out)
		if filename not in out.included_files:
			out.included_files.append(filename)
			with out.context(file=filename, path=path):
				self.node.contents=self.get_file_transformer(out).node
				self.get_file_transformer(out).transform(out)
			
