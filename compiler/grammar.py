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

class VariableIdentifierExpr(ValueExpression):
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
	pattern=VariableIdentifierExpr+T_ASSIGNMENT+ValueExpression

	def __init__(self, elements):
		self.lhs=elements[0]
		self.rhs=elements[2]

class LiteralExpr(ValueExpression):
	pattern=T_INTEGER_LITERAL

	def __init__(self, elements):
		self.value=elements[0].value

class NoopExpr(Expression):
	pattern=T_ENDOFSTATEMENT

class GroupingExpr(ValueExpression):
	pattern=T_PAREN_OPEN+ValueExpression+T_PAREN_CLOSE

	def __init__(self, elements):
		self.value=elements[1]

class CSEBase(ASTNode):
	pattern=ValueExpression+T_COMMA+ValueExpression

	def __init__(self, elements):
		self.args=[elements[0], elements[2]]

class CSE(CSEBase):
	pattern=ValueExpression+T_COMMA+CSEBase

	def __init__(self, elements):
		self.args=[elements[0]]+elements[2].args

class ListExpr(ASTNode):
	pattern=T_LIST_START+(CSEBase|ValueExpression)+T_LIST_STOP

	def __init__(self, elements):
		if isinstance(elements[1], CSEBase):
			self.args=elements[1].args
		else:
			self.args=[elements[1]]

class CallExpr(ValueExpression):
	pattern=ValueExpression+T_INVOKE+[ListExpr]

	def __init__(self, elements):
		self.method=elements[0]
		if len(elements)==2:
			self.args=[]
		else:
			self.args=elements[2]



# class AugmentedAssignExpression(Expression):
# 	pattern=VariableIdentifierExpr+T_AUGASSIGN+ValueExpression

# 	def replace(self, elements):
# 		return AssignmentExpr([elements[0], None,
# 			BinOpExpr([
# 				elements[0],
# 				Tokens.T_OPERATOR.make_token(elements[1].value[:-1]),
# 				elements[2]
# 			]), None])