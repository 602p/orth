from grammarutil import TokenType, TokenHolder, ASTNode, NotLoaded, ast_node_types

R_IDENTIFIER="[a-zA-Z_]\w*"

class Tokens(metaclass=TokenHolder):
	T_FUNCTIONDECL=TokenType("function")
	T_ARGLIST_START = TokenType(r"\(", ["T_FUNCTIONDECL"])
	T_ARGLIST_SEPERATOR = TokenType(",", ["T_ARGLIST_ELEMENT"])
	T_ARGLIST_ELEMENT = TokenType(R_IDENTIFIER+" +"+R_IDENTIFIER, ["T_ARGLIST_START", "T_ARGLIST_SEPERATOR"], capture=True)
	T_ARGLIST_END = TokenType(r"\)", ["T_ARGLIST_START", "T_ARGLIST_ELEMENT"])
	T_FUNCTIONDECL_NAME = TokenType(R_IDENTIFIER, ["T_ARGLIST_END"], capture=True)
	T_FUNCTIONDECL_RETURNS = TokenType("->", ["T_FUNCTIONDECL_NAME"])
	T_FUNCTIONDECL_DOES = TokenType("does", ["T_FUNCTIONDECL_NAME", "T_FUNCTIONDECL_RETURN_TYPE"])
	T_FUNCTIONDECL_RETURN_TYPE = TokenType(R_IDENTIFIER, ["T_FUNCTIONDECL_RETURNS"], capture=True)

	T_IF_START = TokenType("if +", ["T_ENDOFSTATEMENT"])
	T_IF_DONE = TokenType("done", ["T_ENDOFSTATEMENT"])
	T_IF_DO = TokenType("do")
	T_IF_ELSE = TokenType("else", ["T_ENDOFSTATEMENT"])
		
	T_RETURN = TokenType("return +", ["T_ENDOFSTATEMENT"])

	T_VAR_DECL = TokenType(R_IDENTIFIER+" +"+R_IDENTIFIER, ["T_ENDOFSTATEMENT"], capture=True)
	T_NAME = TokenType(R_IDENTIFIER, capture=True)

	T_AUGASSIGN = TokenType(r"(\+=)|(-=)|(\*=)|(/=)", ["T_NAME", "T_VAR_DECL"], capture=True)
	T_ASSIGNMENT = TokenType("=", ["T_NAME", "T_VAR_DECL"])
	T_PAREN_OPEN = TokenType(r"\(")
	T_PAREN_CLOSE = TokenType(r"\)")

	T_LIST_START = TokenType(r"\[")
	T_LIST_STOP = TokenType(r"\]")
	T_INVOKE = TokenType(r"!")

	T_COMMA = TokenType(r",")

	T_BINARY_OPERATOR = TokenType(r"(>=)|(<=)|(!=)|[/\*\-\+%|\^><]", capture=True)
	T_UNARY_OPERATOR = TokenType(r"\-", capture=True)

	T_INTEGER_LITERAL = TokenType(r"[0-9]+", capture=True)
	T_ENDOFSTATEMENT = TokenType(";")

globals().update(Tokens)

class Expression(ASTNode):
	pass

class ValueExpression(Expression):
	pass

class IdentifierExpr(ValueExpression):
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

	def __init__(self, elements, was_augassign=False):
		self.lhs=elements[0]
		self.rhs=elements[2]
		if was_augassign:
			self.augassign=True

class LiteralExpr(ValueExpression):
	pattern=T_INTEGER_LITERAL

	def __init__(self, elements):
		self.value=elements[0].value

class NoopExpr(Expression):
	pattern=T_ENDOFSTATEMENT

class GroupingExpr(ValueExpression):
	pattern=T_PAREN_OPEN+ValueExpression+T_PAREN_CLOSE
	bad_lookahead_tokens=[T_NAME, T_PAREN_CLOSE]

	def __init__(self, elements):
		self.value=elements[1]

class TupleFragment(ASTNode):
	pattern=T_COMMA+ValueExpression+T_COMMA+ValueExpression+T_PAREN_CLOSE

	def __init__(self, elements):
		self.args=[elements[1], elements[3]]

class TupleFragmentContinuation(TupleFragment):
	pattern=T_COMMA+ValueExpression+TupleFragment

	def __init__(self, elements):
		self.args=[elements[1]]+elements[2].args

class TupleExpr(ASTNode):
	pattern=T_PAREN_OPEN+ValueExpression+TupleFragment

	def __init__(self, elements):
		if len(elements)==1:
			self.args=[]
		else:
			self.args=[elements[1]]
			self.args.extend(elements[2].args)

class TwoTupleExpr(TupleExpr):
	pattern=T_PAREN_OPEN+ValueExpression+T_COMMA+ValueExpression+T_PAREN_CLOSE

	def __init__(self, elements):
		self.args=[elements[1], elements[3]]

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

	def __init__(self, elements):
		self.method=elements[0]
		if isinstance(elements[1], TupleExpr):
			self.args=elements[1].args
		else:
			self.args=[elements[1].value]

class AugmentedAssignExpression(Expression):
	pattern=IdentifierExpr+T_AUGASSIGN+ValueExpression

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

class BunchaExpressions(Expression):
	def __init__(self, elements):
		self.exprs=elements