from grammarutil import TokenType, TokenHolder, ASTNode, NotLoaded, ast_node_types

R_IDENTIFIER="[a-zA-Z_]\w*"

class Tokens(metaclass=TokenHolder):
	T_LINE_COMMENT = TokenType(r"#.*(?=\n)", emit=False)
	T_BLOCK_COMMENT = TokenType(r"<#[\s\S]*#>", emit=False)

	T_FUNCTIONDECL=TokenType("function")
	T_ARGLIST_START = TokenType(r"\(", ["T_FUNCTIONDECL"])
	T_ARGLIST_SEPERATOR = TokenType(",", ["T_ARGLIST_ELEMENT"])
	T_ARGLIST_ELEMENT = TokenType(R_IDENTIFIER+" +"+R_IDENTIFIER, ["T_ARGLIST_START", "T_ARGLIST_SEPERATOR"], capture=True)
	T_ARGLIST_END = TokenType(r"\)", ["T_ARGLIST_START", "T_ARGLIST_ELEMENT"])
	T_FUNCTIONDECL_NAME = TokenType(R_IDENTIFIER, ["T_ARGLIST_END"], capture=True)
	T_FUNCTIONDECL_RETURNS = TokenType("->", ["T_FUNCTIONDECL_NAME"])
	T_FUNCTIONDECL_DOES = TokenType("does", ["T_FUNCTIONDECL_NAME", "T_FUNCTIONDECL_RETURN_TYPE"])
	T_FUNCTIONDECL_RETURN_TYPE = TokenType(R_IDENTIFIER, ["T_FUNCTIONDECL_RETURNS"], capture=True)

	T_IF_START = TokenType("if", ["T_ENDOFSTATEMENT"], keyword=True)
	T_BLOCK_DONE = TokenType("done", ["T_ENDOFSTATEMENT"], keyword=True)
	T_BLOCK_DO = TokenType("do", keyword=True)

	T_IF_BLOCK_END_ON_ELIF = TokenType("eli(?=f\s)", ["T_ENDOFSTATEMENT"])
	T_IF_ELIF = TokenType("f", ["T_IF_BLOCK_END_ON_ELIF"])
	T_IF_BLOCK_END_ON_ELSE = TokenType("els(?=e\s)", ["T_ENDOFSTATEMENT"])
	T_IF_ELSE = TokenType("e", ["T_IF_BLOCK_END_ON_ELSE"])

	T_WHILE_START = TokenType("while", ["T_ENDOFSTATEMENT"], keyword=True)
		
	T_RETURN = TokenType("return", ["T_ENDOFSTATEMENT"], keyword=True)

	T_VAR_DECL = TokenType(R_IDENTIFIER+" +"+R_IDENTIFIER, ["T_ENDOFSTATEMENT"], capture=True)
	T_NAME = TokenType(R_IDENTIFIER, capture=True)

	T_AUGASSIGN = TokenType(r"(\+=)|(-=)|(\*=)|(/=)", ["T_NAME", "T_VAR_DECL"], capture=True)
	T_BINARY_OPERATOR = TokenType(r"(>=)|(<=)|(!=)|(==)|[/\*\-\+%|\^><]", capture=True)
	T_ASSIGNMENT = TokenType("=")
	T_PAREN_OPEN = TokenType(r"\(")
	T_PAREN_CLOSE = TokenType(r"\)")

	T_LIST_START = TokenType(r"\[")
	T_LIST_STOP = TokenType(r"\]")

	T_COMMA = TokenType(r",")
	T_DOT = TokenType(r"\.")


	
	T_UNARY_OPERATOR = TokenType(r"\-", capture=True)

	T_INTEGER_LITERAL = TokenType(r"[0-9]+", capture=True)
	T_STRING_LITERAL = TokenType(r"\"[(#-~)|( \!)]*\"", capture=True)
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

class NameExpr(IdentifierExpr, ValueExpression):
	pattern=T_NAME|T_VAR_DECL

	def __init__(self, elements):
		if elements[0].type == T_NAME:
			self.name=elements[0].value
			self.type="?"
		else:
			type, *_, name = elements[0].value.split(" ")
			self.name=name
			self.type=type

class BinOpExpr(ValueExpression):
	pattern=ValueExpression+T_BINARY_OPERATOR+ValueExpression
	bad_lookahead_tokens=[T_DOT]

	def __init__(self, elements):
		self.lhs=elements[0]
		self.rhs=elements[2]
		self.operator=elements[1].value

class UnOpExpr(ValueExpression):
	pattern=T_UNARY_OPERATOR+ValueExpression

	def __init__(self, elements):
		self.operator=elements[0].value
		self.expression=elements[1]

class AssignmentExpr(Expression):
	pattern=IdentifierExpr+T_ASSIGNMENT+ValueExpression
	bad_lookahead_tokens=[T_DOT]

	def __init__(self, elements, was_augassign=False):
		self.lhs=elements[0]
		self.rhs=elements[2]
		if isinstance(self.lhs, NameExpr):
			if self.lhs.type!="?":
				self.init=True
		if was_augassign:
			self.augassign=True

class LiteralExpr(ValueExpression):
	pattern=T_INTEGER_LITERAL|T_STRING_LITERAL

	def __init__(self, elements):
		self.value=elements[0].value
		if elements[0].type==T_INTEGER_LITERAL:
			self.type="int"
		else:
			self.type="str"

class SepExpr(Expression):
	pattern=T_ENDOFSTATEMENT
	bad_lookahead_tokens=[T_ENDOFSTATEMENT]

class 4SepExpr(SepExpr):
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
	bad_lookahead_tokens=[T_DOT]

	def __init__(self, elements):
		self.method=elements[0]
		if isinstance(elements[1], TupleExpr):
			self.args=elements[1].args
		else:
			self.args=[elements[1].value]

class AugmentedAssignExpression(Expression):
	pattern=IdentifierExpr+T_AUGASSIGN+ValueExpression
	bad_lookahead_tokens=[T_DOT]

	def __init__(self, elements):
		self.variable=elements[0]
		self.operation=elements[1].value[0]
		self.offset=elements[2]
	
	def replace(self):
		return AssignmentExpr([
			self.variable,
			None,
			BinOpExpr([
				self.variable,
				T_BINARY_OPERATOR.make_token(self.operation),
				self.offset
			])
		], was_augassign=True)

class AccessorExpr(ValueExpression, IdentifierExpr):
	pattern=ValueExpression+T_DOT+IdentifierExpr
	bad_lookahead_tokens=[T_DOT]

	def __init__(self, elements):
		self.object=elements[0]
		self.field=elements[2].name
		self.type="?"

class IndexExpr(AccessorExpr):
	pattern=ValueExpression+T_LIST_START+ValueExpression+T_LIST_STOP
	bad_lookahead_tokens=[T_DOT]

	def __init__(self, elements):
		self.object=elements[0]
		self.index=elements[2]

class BunchaExpressions(Expression):
	def __init__(self, elements):
		self.exprs=elements

class BlockBunchaExpressionsBase(BunchaExpressions):
	pattern=SepExpr+Expression+SepExpr+T_BLOCK_DONE

	def __init__(self, elements):
		self.exprs=[elements[1]]
		
class BlockBunchaExpressionsExt(BlockBunchaExpressionsBase):
	pattern=SepExpr+Expression+[SepExpr]+BunchaExpressions

	def __init__(self, elements):
		if len(elements)==4:
			self.exprs=[elements[1]]+elements[3].exprs
		else:
			self.exprs=[elements[1]]+elements[2].exprs

class XIfBunchaExpressionsBase(BunchaExpressions):
	pattern=SepExpr+Expression+SepExpr+(T_IF_BLOCK_END_ON_ELIF|T_IF_BLOCK_END_ON_ELSE)

	def __init__(self, elements):
		self.exprs=[elements[1]]
		self.end=elements[3]
		
class XIfBunchaExpressionsExt(BlockBunchaExpressionsBase):
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