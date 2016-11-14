import re, collections

class DotAccessibleTokenDict(collections.OrderedDict):
	def __getattr__(self, a):
		if a.startswith("T_"):
			return self[a]
		return object.__getattribute__(self, a)
	def __setattr__(self, a, v):
		if a.startswith("T_"):
			self[a]=v
		object.__setattr__(self, a, v)

class TokenType:
	def __init__(self, regex, preceeding_in=None, capture=False, emit=True):
		self.regex=re.compile(regex)
		self.preceeding_in=preceeding_in
		self.capture=capture
		self.emit=emit

	def matches(self, text, prev):
		return self.regex.match(text) is not None and (self.preceeding_in is None or prev.type.name in self.preceeding_in)

	def make_token(self, text):
		return Token(self, self.regex.match(text).group() if self.capture else None) if self.emit else None

class Token:
	def __init__(self, type, value=None, line=None, file=None):
		self.type=type
		self.value=value
		self.line=line
		self.file=file

	def __str__(self):
		return self.type.name+("(%s)"%self.value if self.value else "")

	def __repr__(self): return str(self)

R_IDENTIFIER="[a-zA-Z_]\w*"

toktys=DotAccessibleTokenDict()
toktys.T_FUNCTIONDECL=TokenType("function")
toktys.T_ARGLIST_START = TokenType(r"\(", ["T_FUNCTIONDECL"])
toktys.T_ARGLIST_SEPERATOR = TokenType(",", ["T_ARGLIST_ELEMENT"])
toktys.T_ARGLIST_ELEMENT = TokenType(R_IDENTIFIER+" +"+R_IDENTIFIER, ["T_ARGLIST_START", "T_ARGLIST_SEPERATOR"], capture=True)
toktys.T_ARGLIST_END = TokenType(r"\)", ["T_ARGLIST_START", "T_ARGLIST_ELEMENT"])
toktys.T_FUNCTIONDECL_NAME = TokenType(R_IDENTIFIER, ["T_ARGLIST_END"], capture=True)
toktys.T_FUNCTIONDECL_RETURNS = TokenType("->", ["T_FUNCTIONDECL_NAME"])
toktys.T_FUNCTIONDECL_DOES = TokenType("does", ["T_FUNCTIONDECL_NAME", "T_FUNCTIONDECL_RETURN_TYPE"])
toktys.T_FUNCTIONDECL_RETURN_TYPE = TokenType(R_IDENTIFIER, ["T_FUNCTIONDECL_RETURNS"], capture=True)

toktys.T_IF_START = TokenType("if +", ["T_ENDOFSTATEMENT"])
toktys.T_IF_DONE = TokenType("done", ["T_ENDOFSTATEMENT"])
toktys.T_IF_DO = TokenType("do")
toktys.T_IF_ELSE = TokenType("else", ["T_ENDOFSTATEMENT"])
	
toktys.T_RETURN = TokenType("return +", ["T_ENDOFSTATEMENT"])

toktys.T_VAR_DECL = TokenType(R_IDENTIFIER+" ?"+R_IDENTIFIER, ["T_ENDOFSTATEMENT"], capture=True)
toktys.T_NAME = TokenType(R_IDENTIFIER, capture=True)

toktys.T_AUGASSIGN = TokenType(r"(\+=)|(-=)|(\*=)|(/=)", ["T_NAME", "T_VAR_DECL"], capture=True)
toktys.T_ASSIGNMENT = TokenType("=", ["T_NAME", "T_VAR_DECL"])
toktys.T_PAREN_OPEN = TokenType(r"\(")
toktys.T_PAREN_CLOSE = TokenType(r"\)")

toktys.T_OPERATOR = TokenType(r"(>=)|(<=)|(!=)|[/\*\-\+%&|\^><!]", capture=True)

toktys.T_INTEGER_LITERAL = TokenType(r"[0-9]+", capture=True)
toktys.T_ENDOFSTATEMENT = TokenType(";")

for k,v in toktys.items():v.name=k

def tokenize(text):
	position=0
	tokens=[]
	while position<len(text):
		# print(text[position:])
		if text[position:].startswith("\\"):
			position+=2
			continue

		if text[position] in "\r\n":
			print("(adding T_ENDOFSTATEMENT)")
			tokens.append(toktys.T_ENDOFSTATEMENT.make_token(";"))
			position+=1
			continue

		if text[position] in " \t":
			position+=1
			continue

		for token in toktys.values():
			if token.matches(text[position:], tokens[-1] if tokens else None):
				
				tok=token.make_token(text[position:])
				if tok:
					print("Adding %s"%tok)
					tokens.append(tok)
				position+=len(token.regex.match(text[position:]).group())
				break
		else:
			raise SyntaxError("No match at %i: %s" % (position, text[position:]))

	return tokens