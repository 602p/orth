from grammarutil import TokenType, TokenHolder, ASTNode, NotLoaded, ast_node_types, Token
import datamodel
import collections

R_IDENTIFIER="[a-zA-Z_]\w*"

class Tokens(metaclass=TokenHolder):
	T_LINE_COMMENT = TokenType(r"#.*(?=\n)", emit=False)
	T_BLOCK_COMMENT = TokenType(r"<#[\s\S]*#>", emit=False)

	T_IMPORT = TokenType("import +([a-zA-Z]\w*|\".+\")", keyword=True, capture=True)

	T_FUNCTIONDECL=TokenType("function")
	T_ARGLIST_START = TokenType(r"\(", ["T_FUNCTIONDECL"])
	T_ARGLIST_SEPERATOR = TokenType(",", ["T_ARGLIST_ELEMENT"])
	T_ARGLIST_ELEMENT = TokenType(R_IDENTIFIER+" +"+R_IDENTIFIER, ["T_ARGLIST_START", "T_ARGLIST_SEPERATOR"], capture=True)
	T_ARGLIST_END = TokenType(r"\)", ["T_ARGLIST_START", "T_ARGLIST_ELEMENT"])
	T_FUNCTIONDECL_NAME = TokenType("[a-zA-Z_][\w:]*", ["T_ARGLIST_END"], capture=True)
	T_FUNCTIONDECL_RETURNS = TokenType("->", ["T_FUNCTIONDECL_NAME"])
	T_FUNCTIONDECL_DOES = TokenType("does", ["T_FUNCTIONDECL_NAME", "T_FUNCTIONDECL_RETURN_TYPE"])
	T_FUNCTIONDECL_RETURN_TYPE = TokenType(R_IDENTIFIER, ["T_FUNCTIONDECL_RETURNS"], capture=True)

	T_TYPEDECL=TokenType("type", keyword=True)
	T_TYPEDECL_NAME=TokenType(R_IDENTIFIER, ["T_TYPEDECL"], capture=True)
	T_TYPEDECL_IS=TokenType("is", keyword=True)
	T_TYPEDECL_END=TokenType("endtype", keyword=True)
	T_TYPEDECL_PACKED=TokenType("packed", ["T_TYPEDECL_IS"], keyword=True)

	T_IF_START = TokenType("if", ["T_ENDOFSTATEMENT"], keyword=True)
	T_BLOCK_DONE = TokenType("done", ["T_ENDOFSTATEMENT"], keyword=True)
	T_BLOCK_DO = TokenType("do", keyword=True)

	T_IF_BLOCK_END_ON_ELIF = TokenType("eli(?=f\s)", ["T_ENDOFSTATEMENT"])
	T_IF_ELIF = TokenType("f", ["T_IF_BLOCK_END_ON_ELIF"])
	T_IF_BLOCK_END_ON_ELSE = TokenType("els(?=e\s)", ["T_ENDOFSTATEMENT"])
	T_IF_ELSE = TokenType("e", ["T_IF_BLOCK_END_ON_ELSE"])

	T_WHILE_START = TokenType("while", ["T_ENDOFSTATEMENT"], keyword=True)
		
	T_RETURN = TokenType("return", ["T_ENDOFSTATEMENT"], keyword=True)

	T_AUGASSIGN = TokenType(r"(\+=)|(-=)|(\*=)|(/=)", ["T_NAME", "T_VAR_DECL", "T_LIST_STOP"], capture=True)
	T_BINARY_OPERATOR = TokenType(r"(>>)|(<<)|(>=)|(<=)|(!=)|(==)|[&/\*\-\+%\^><]", [
			"T_NAME", "T_LIST_STOP", "T_PAREN_CLOSE", "T_INTEGER_LITERAL", "T_STRING_LITERAL"
		], capture=True)

	T_VAR_DECL = TokenType(R_IDENTIFIER+" +"+R_IDENTIFIER, ["T_ENDOFSTATEMENT"], capture=True)
	T_NAME = TokenType(R_IDENTIFIER, capture=True)

	
	T_ASSIGNMENT = TokenType(r"(=)|(<-)", capture=True)
	T_PAREN_OPEN = TokenType(r"\(")
	T_PAREN_CLOSE = TokenType(r"\)")

	T_LIST_START = TokenType(r"\[")
	T_LIST_STOP = TokenType(r"\]")

	T_PTRCAST = TokenType(r"\|\|")
	T_CAST = TokenType(r"\|")

	T_COMMA = TokenType(r",")
	T_DOT = TokenType(r"\.")
	T_DOUBLECOLON = TokenType("::")
	T_COLON= TokenType(":")

	T_INTRINSIC = TokenType(r"@\w*\(.*\)@", capture=True)

	T_HEAP_ALLOCATION = TokenType("!", ["T_VAR_DECL"])
	
	T_UNARY_OPERATOR = TokenType(r"[\-~!]", capture=True)

	T_INTEGER_LITERAL = TokenType(r"[0-9xbBXa-fA-F]+L?", capture=True)
	T_STRING_LITERAL = TokenType(r"r?\"[(#-~)|( \!)]*\"", capture=True)
	T_ENDOFSTATEMENT = TokenType(";")

globals().update(Tokens)

class Expression(ASTNode):
	pass

class ValueExpression(Expression):
	pass

class IdentifierExpr(Expression):
	pass

class BlockExpression(Expression):
	pass

class IntrinsicExpr(ValueExpression):
	pattern=T_INTRINSIC

	def __init__(self, elements):
		self.text=elements[0].value

class NameExpr(IdentifierExpr, ValueExpression):
	pattern=T_NAME

	def __init__(self, elements):
		self.name=elements[0].value
		self.type="?"

class DeclExpr(NameExpr):
	pattern=T_VAR_DECL+[T_HEAP_ALLOCATION]

	def __init__(self, elements):
		# print(elements)
		type, *_, name = elements[0].value.split(" ")
		self.name=name
		self.type=type
		self.heap=len(elements)==2

class CastExpr(ValueExpression):
	pattern=ValueExpression+T_CAST+NameExpr
	bad_lookahead_tokens=[T_DOT, T_COLON, T_DOUBLECOLON]

	def __init__(self, elements):
		self.value=elements[0]
		self.to=elements[2].name

class PtrCastExpr(ValueExpression):
	pattern=ValueExpression+T_PTRCAST+NameExpr
	bad_lookahead_tokens=[T_DOT, T_COLON, T_DOUBLECOLON]

	def __init__(self, elements):
		self.value=elements[0]
		self.to=elements[2].name

class BinOpExpr(ValueExpression):
	pattern=ValueExpression+T_BINARY_OPERATOR+ValueExpression
	bad_lookahead_tokens=[T_DOT, T_CAST]

	def __init__(self, elements):
		self.lhs=elements[0]
		self.rhs=elements[2]
		self.operator=elements[1].value

class UnOpExpr(ValueExpression):
	pattern=T_UNARY_OPERATOR+ValueExpression

	def __init__(self, elements):
		self.operator=elements[0].value
		self.expr=elements[1]

class AssignmentExpr(Expression):
	pattern=IdentifierExpr+T_ASSIGNMENT+ValueExpression
	bad_lookahead_tokens=[T_DOT, T_COLON, T_DOUBLECOLON]

	def __init__(self, elements, was_augassign=False):
		self.lhs=elements[0]
		self.rhs=elements[2]
		self.init=False
		if isinstance(self.lhs, NameExpr):
			if self.lhs.type!="?":
				self.init=True
		if was_augassign:
			self.augassign=True
		self.construct=elements[1].value=="<-"

class LiteralExpr(ValueExpression):
	pattern=T_INTEGER_LITERAL|T_STRING_LITERAL

	def __init__(self, elements):
		if elements[0].type==T_INTEGER_LITERAL:
			if "X" in elements[0].value.upper():
				self.value=int(elements[0].value.replace("L",""), 16)
				self.type='int'
			elif "B" in elements[0].value.upper():
				self.value=int(elements[0].value.replace("L",""), 2)
				self.type='int'
			else:
				self.value=int(elements[0].value.replace("L",""))
				self.type='int'
		else:
			self.value=eval(elements[0].value) #Hack to allow escapes
			self.type='cstr'

class SepExpr(Expression):
	pattern=T_ENDOFSTATEMENT
	bad_lookahead_tokens=[T_ENDOFSTATEMENT]

class JSepExpr(SepExpr):
	pattern=SepExpr+T_ENDOFSTATEMENT

class GroupingExpr(ValueExpression):
	pattern=T_PAREN_OPEN+ValueExpression+T_PAREN_CLOSE
	bad_lookahead_tokens=[T_NAME, T_PAREN_CLOSE]

	def __init__(self, elements):
		self.value=elements[1]

class TupleFragment(ASTNode):
	pattern=T_COMMA+ValueExpression+T_PAREN_CLOSE

	def __init__(self, elements):
		self.args=[elements[1]]

class TupleFragmentContinuation(TupleFragment):
	pattern=T_COMMA+ValueExpression+TupleFragment

	def __init__(self, elements):
		self.args=[elements[1]]+elements[2].args

class TupleExpr(ASTNode):
	pattern=T_PAREN_OPEN+ValueExpression+TupleFragment

	def __init__(self, elements):
		self.args=[elements[1]]
		self.args.extend(elements[2].args)

class OneTupleExpr(TupleExpr):
	pattern=T_PAREN_OPEN+ValueExpression+T_PAREN_CLOSE

	def __init__(self, elements):
		self.args=[elements[1]]

class ZeroTupleExpr(TupleExpr):
	pattern=T_PAREN_OPEN+T_PAREN_CLOSE

	def __init__(self, elements):
		self.args=[]

class CallExpr(ValueExpression):
	pattern=ValueExpression+(TupleExpr|GroupingExpr)
	bad_lookahead_tokens=[T_DOT, T_COLON, T_DOUBLECOLON]

	def __init__(self, elements):
		self.method=elements[0]
		if isinstance(elements[1], TupleExpr):
			self.args=elements[1].args
		else:
			self.args=[elements[1].value]

class AugmentedAssignExpression(Expression):
	pattern=IdentifierExpr+T_AUGASSIGN+ValueExpression
	bad_lookahead_tokens=[T_DOT, T_COLON, T_DOUBLECOLON]

	def __init__(self, elements):
		self.variable=elements[0]
		self.operation=elements[1].value[0]
		self.offset=elements[2]
	
	def replace(self):
		binop=BinOpExpr([
				self.variable,
				T_BINARY_OPERATOR.make_token(self.operation),
				self.offset
			])
		binop.line=self.line
		return AssignmentExpr([
			self.variable,
			T_ASSIGNMENT.make_token("="),
			binop
		], was_augassign=True)

class AccessorExpr(ValueExpression, IdentifierExpr):
	pattern=ValueExpression+(T_DOT|T_COLON|T_DOUBLECOLON)+IdentifierExpr
	bad_lookahead_tokens=[T_DOT, T_COLON, T_DOUBLECOLON]

	def __init__(self, elements):
		self.object=elements[0]
		self.field=elements[2].name
		self.type="?"
		if elements[1].type==T_DOT:
			self.accesses="var"
		elif elements[1].type==T_COLON:
			self.accesses="method"
		else:
			self.accesses="classmethod"

	def replace(self):
		if self.accesses=="classmethod":
			return NameExpr([Token(T_NAME, self.object.name+"$$"+self.field, self.object.line, None)])
		# elif self.accesses=="classmethod":
		# 	return NameExpr([Token(T_NAME, self.object.name+"$$"+self.field, self.object.line, None)])

class IndexExpr(IdentifierExpr, ValueExpression):
	pattern=ValueExpression+T_LIST_START+ValueExpression+T_LIST_STOP
	bad_lookahead_tokens=[T_DOT, T_COLON, T_DOUBLECOLON]

	def __init__(self, elements):
		self.object=elements[0]
		self.index=elements[2]

class ReturnExpr(Expression):
	pattern=T_RETURN+[ValueExpression]

	def __init__(self, elements):
		self.value=elements[1] if len(elements)==2 else None

class BunchaExpressions(Expression):
	def __init__(self, elements):
		self.exprs=elements

class BlockBunchaExpressionsBase(BunchaExpressions):
	pattern=SepExpr+Expression+SepExpr+T_BLOCK_DONE

	def __init__(self, elements):
		self.exprs=[elements[1]]
		
class BlockBunchaExpressionsExt(BlockBunchaExpressionsBase):
	pattern=SepExpr+Expression+[SepExpr]+BlockBunchaExpressionsBase

	def __init__(self, elements):
		# print("***", elements)
		if len(elements)==4:
			self.exprs=[elements[1]]+elements[3].exprs
			# print(elements[3])
		else:
			self.exprs=[elements[1]]+elements[2].exprs
			# print(elements[2])

class XIfBunchaExpressionsBase(BunchaExpressions):
	pattern=SepExpr+Expression+SepExpr+(T_IF_BLOCK_END_ON_ELIF|T_IF_BLOCK_END_ON_ELSE)

	def __init__(self, elements):
		self.exprs=[elements[1]]
		self.end=elements[3]
		
class XIfBunchaExpressionsExt(XIfBunchaExpressionsBase):
	pattern=SepExpr+Expression+[SepExpr]+XIfBunchaExpressionsBase

	def __init__(self, elements):
		if len(elements)==4:
			self.exprs=[elements[1]]+elements[3].exprs
			self.end=elements[3].end
		else:
			self.exprs=[elements[1]]+elements[2].exprs
			self.end=elements[2].end

class IfContinuation(ASTNode):
	pass

class IfExpr(BlockExpression):
	pattern=T_IF_START+ValueExpression+T_BLOCK_DO+\
	        (BlockBunchaExpressionsBase|(XIfBunchaExpressionsBase+IfContinuation))

	def __init__(self, elements):
		self.cond=elements[1]
		self.block=elements[3]
		self.else_=None if len(elements)==4 else elements[4]

class ElIfExpr(BlockExpression, IfContinuation):
	pattern=T_IF_ELIF+ValueExpression+T_BLOCK_DO+\
	        (BlockBunchaExpressionsBase|(XIfBunchaExpressionsBase+IfContinuation))

	def __init__(self, elements):
		self.cond=elements[1]
		self.block=elements[3]
		self.else_=None if len(elements)==4 else elements[4]

class ElseExpr(IfExpr, IfContinuation):
	pattern=T_IF_ELSE+T_BLOCK_DO+BlockBunchaExpressionsBase

	def __init__(self, elements):
		self.cond=True
		self.block=elements[2]
		self.else_=None

class WhileExpr(BlockExpression):
	pattern=T_WHILE_START+ValueExpression+T_BLOCK_DO+BlockBunchaExpressionsBase

	def __init__(self, elements):
		self.cond=elements[1]
		self.block=elements[3]

class FunctionDeclStart(ASTNode):
	pattern=T_FUNCTIONDECL_NAME+T_FUNCTIONDECL_RETURNS+T_FUNCTIONDECL_RETURN_TYPE+T_FUNCTIONDECL_DOES

	def __init__(self, elements):
		self.name=elements[0].value.replace(":","$")
		self.type=elements[2].value

class ArgListEle(ASTNode):
	pattern=T_ARGLIST_ELEMENT

	def __init__(self, elements):
		self.name=elements[0].value.split(" ")[-1]
		self.type=elements[0].value.split(" ")[0]

class ArgList(ASTNode):
	pattern=T_ARGLIST_START+T_ARGLIST_END

	def __init__(self, elements):
		self.args=[]

class OneArgList(ArgList):
	pattern=T_ARGLIST_START+ArgListEle+T_ARGLIST_END

	def __init__(self, elements):
		self.args=[elements[1]]

class MultiArgListStart(ArgList):
	pattern=T_ARGLIST_SEPERATOR+ArgListEle+T_ARGLIST_END

	def __init__(self, elements):
		self.args=[elements[1]]

class MultiArgListExt(MultiArgListStart):
	pattern=T_ARGLIST_SEPERATOR+ArgListEle+MultiArgListStart

	def __init__(self, elements):
		self.args=[elements[1]]+elements[2].args

class CompletedMultiArgList(ArgList):
	pattern=T_ARGLIST_START+ArgListEle+MultiArgListStart

	def __init__(self, elements):
		self.args=[elements[1]]+elements[2].args

class FunctionBody(BunchaExpressions):
	pattern=Expression+ReturnExpr
	bad_lookahead_tokens=[T_BLOCK_DO]

	def __init__(self, elements):
		self.exprs=[elements[0], elements[1]]

class FunctionBodyExt(FunctionBody):
	pattern=SepExpr+Expression+[SepExpr]+FunctionBody

	def __init__(self, elements):
		if len(elements)==4:
			self.exprs=[elements[1]]+elements[3].exprs
		else:
			self.exprs=[elements[1]]+elements[2].exprs

class FunctionDecl(ASTNode):
	pattern=T_FUNCTIONDECL+ArgList+FunctionDeclStart+FunctionBody

	def __init__(self, elements):
		self.name=elements[2].name
		self.type=elements[2].type
		self.args=elements[1].args
		self.body=elements[3]

class FileExpr(ASTNode):
	def __init__(self, elements):
		self.funcs=[e for e in elements if not isinstance(e, SepExpr)]

class TypeDeclStart(ASTNode):
	pattern=T_TYPEDECL+T_TYPEDECL_NAME+T_TYPEDECL_IS+[T_TYPEDECL_PACKED]
	def __init__(self, elements):
		self.name=elements[1].value
		self.elements=elements
		self.packed=len(elements)==4

class TypeDeclExt(TypeDeclStart):
	pattern=TypeDeclStart+ASTNode
	def __init__(self, elements):
		self.elements=elements[0].elements+[elements[1]]
		self.name=elements[0].name
		self.packed=elements[0].packed

class TypeDecl(ASTNode):
	pattern=TypeDeclStart+T_TYPEDECL_END

	def __init__(self, elements):
		self.name=elements[0].name
		self.fields=collections.OrderedDict()
		self.methods=[]
		self.packed=elements[0].packed
		for ele in elements[0].elements:
			if isinstance(ele, DeclExpr):
				self.fields[ele.name]=ele.type
			elif isinstance(ele, FunctionDecl):
				self.methods.append(ele)
			elif isinstance(ele, SepExpr):pass
			elif isinstance(ele, Token):
				if ele.type not in [T_TYPEDECL_IS, T_TYPEDECL_NAME, T_TYPEDECL, T_TYPEDECL_PACKED]:
					raise SyntaxError("Token "+str(ele)+" found in class")
			else:
				raise SyntaxError("IDK how to handle a "+str(type(ele))+" in a type")

class ImportExpr(ASTNode):
	pattern=T_IMPORT

	def __init__(self, elements):
		if '"' in elements[0].value:
			self.absolute=True
			self.identifier=elements[0].value.split('"')[1].strip()
		else:
			self.absolute=False
			self.identifier=elements[0].value.split("import ")[1].strip()