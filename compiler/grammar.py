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

	T_VAR_DECL = TokenType(R_IDENTIFIER+" ?"+R_IDENTIFIER, ["T_ENDOFSTATEMENT"], capture=True)
	T_NAME = TokenType(R_IDENTIFIER, capture=True)

	T_AUGASSIGN = TokenType(r"(\+=)|(-=)|(\*=)|(/=)", ["T_NAME", "T_VAR_DECL"], capture=True)
	T_ASSIGNMENT = TokenType("=", ["T_NAME", "T_VAR_DECL"])
	T_PAREN_OPEN = TokenType(r"\(")
	T_PAREN_CLOSE = TokenType(r"\)")

	T_OPERATOR = TokenType(r"(>=)|(<=)|(!=)|[/\*\-\+%&|\^><!]", capture=True)

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
	pattern=ValueExpression+T_OPERATOR+ValueExpression

	def __init__(self, elements):
		self.lhs=elements[0]
		self.rhs=elements[2]
		self.operator=elements[1].value

class UnOpExpr(ValueExpression):
	pattern=T_OPERATOR+ValueExpression

	def __init__(self, elements):
		self.operator=elements[0].value
		self.expression=elements[1]

class AssignmentExpr(Expression):
	pattern=VariableIdentifierExpr+T_ASSIGNMENT+ValueExpression+T_ENDOFSTATEMENT

	def __init__(self, elements):
		self.lhs=elements[0]
		self.rhs=elements[2]

class LiteralExpr(ValueExpression):
	pattern=T_INTEGER_LITERAL

	def __init__(self, elements):
		self.value=elements[0].value

class GroupingExpression(ValueExpression):
	pattern=T_PAREN_OPEN+ValueExpression+T_PAREN_CLOSE

	def __init__(self, elements):
		self.value=elements[1]