from grammarutil import TokenType, TokenHolder, ASTNode, ast_node_types, Token
import datamodel
import collections

"""
 _______  ___ ________
  )_   ( '-,) )   _(
    )_  \_//_/  _(
      )___  ___(
          ))
         ((
          ``
    Here be dragons

This is the core logic for the entire language's grammar... yikes!

In short, the compilation process is text->tokens (using the definitions in the class
Tokens below) and then tokens->AST (using the ASTNode subclasses defined below)
and then (in transformers.py et. al.) AST->LLVM IR (using the transformers there.)
That last step may also invoke an arbitrary number of additional compilation steps
of import-ed files.
"""

R_IDENTIFIER="[a-zA-Z_]\w*" #Base pattern for var and type names

class Tokens(metaclass=TokenHolder):
	#Contains TokenTypes for tokenizing the input string.
	#Is actually resolved to (read: at runtime isinstance(Tokens, dict)==True)
	#a dot-accessible ordered dict. Members' order is retained

	T_LINE_COMMENT = TokenType(r"#.*(?=\n)", emit=False)
	#Just like python!
	T_BLOCK_COMMENT = TokenType(r"<#[\s\S]*#>", emit=False)
	#Uh, not so much like python. Starts with <# and ends with #>. wraps anything except a #>

	T_IMPORT = TokenType("import +([a-zA-Z]\w*|\".+\")", keyword=True, capture=True)
	#Imports are either `import some_module_in_search_path' or
	#`import "literal/path/to/file/including/extention.ort"'

	T_TYPEDECL_FUNCTIONPOINTER=TokenType(r"\w*function\w*->\w*"+R_IDENTIFIER, capture=True)
	#^Must match before function
	#Function pointer types for use with aliasing type declarations

	#Block of stuff for function declaration headers.
	#General format is "function(" <args of format <type> <name>, comma seperated>
	# ")" <function name> "->" <return type> "does\n"
	T_FUNCTIONDECL=TokenType("function")
	T_ARGLIST_START = TokenType(r"\(", ["T_FUNCTIONDECL"])
	T_ARGLIST_SEPERATOR = TokenType(",", ["T_ARGLIST_ELEMENT", "T_ARGLIST_TYPEELEMENT"])
	T_ARGLIST_ELEMENT = TokenType(R_IDENTIFIER+" +"+R_IDENTIFIER, ["T_ARGLIST_START", "T_ARGLIST_SEPERATOR"], capture=True)
	T_ARGLIST_TYPEELEMENT = TokenType(R_IDENTIFIER, ["T_ARGLIST_START", "T_ARGLIST_SEPERATOR"], capture=True)
	T_ARGLIST_END = TokenType(r"\)", ["T_ARGLIST_START", "T_ARGLIST_ELEMENT"])
	T_FUNCTIONDECL_NAME = TokenType("[a-zA-Z_][\w:]*", ["T_ARGLIST_END"], capture=True)
	#Function names can include colons (:) for member functions (e.g. cstr:len) and
	#class/namespace functions (e.g. MyClass::new)
	T_FUNCTIONDECL_RETURNS = TokenType("->", keyword=True)
	T_FUNCTIONDECL_DOES = TokenType("does", ["T_FUNCTIONDECL_NAME", "T_FUNCTIONDECL_RETURN_TYPE"])
	T_FUNCTIONDECL_RETURN_TYPE = TokenType(R_IDENTIFIER, ["T_FUNCTIONDECL_RETURNS"], capture=True)


	#Block of stuff for type declarations.
	#There are actually two distinct types. A proper declaration looks like
	#type <name> is [optionally "packed" if you want no padding]
	#<statments:
	# - functions act exactly as they would outside, that is, no implicit namespacing.
	#    if you want a member, prefix it with Typename:, or for classmethods, use
	#    Typename::
	# - DeclExprs become the fields of the class (ordered)
	#    These are then accessible from instances (read:pointers to)
	#    of the class with the . operator
	#> "endtype"
	T_TYPEDECL=TokenType("type", keyword=True)
	T_TYPEDECL_NAME=TokenType(R_IDENTIFIER, ["T_TYPEDECL"], capture=True)
	T_TYPEDECL_IS=TokenType("is", keyword=True)
	T_TYPEDECL_END=TokenType("endtype", keyword=True)
	T_TYPEDECL_PACKED=TokenType("packed", ["T_TYPEDECL_IS"], keyword=True)

	#The other type of typedecl is a aliasing type. This is my implementation of function
	#pointers. Effecivley they just alias a function (for now only actually specifing
	#it's return type) pointer to a not-horrible name.
	#It might be verbose, but hey, no need for a tool like cdecl
	#Format is
	#"type" <name> "is" "a" "function" "->" <return_type>
	T_TYPEDECL_ALIAS=TokenType("a", ["T_TYPEDECL_IS"], keyword=True)


	#Start of an if expression
	#Format is
	#"if" <something that resolves eventually to a bool> "do"
	#<1 or more statments. For a noop, just put a 0 or something>
	#<0 or more additional clauses (elif/else)>
	#"done"
	T_IF_START = TokenType("if", ["T_ENDOFSTATEMENT"], keyword=True)

	#End of a block (if/elif/else/while)
	T_BLOCK_DONE = TokenType("done", ["T_ENDOFSTATEMENT"], keyword=True)

	#End of the if header
	T_BLOCK_DO = TokenType("do", keyword=True)

	#Monstrosity here to parse the elif/else keywords into two distinct fragments
	#so that one can end the preceeding block and one can start the next
	#...im so sorry
	T_IF_BLOCK_END_ON_ELIF = TokenType("eli(?=f\s)", ["T_ENDOFSTATEMENT"])
	T_IF_ELIF = TokenType("f", ["T_IF_BLOCK_END_ON_ELIF"])
	T_IF_BLOCK_END_ON_ELSE = TokenType("els(?=e\s)", ["T_ENDOFSTATEMENT"])
	T_IF_ELSE = TokenType("e", ["T_IF_BLOCK_END_ON_ELSE"])

	T_WHILE_START = TokenType("while", ["T_ENDOFSTATEMENT"], keyword=True)
		
	T_RETURN = TokenType("return", ["T_ENDOFSTATEMENT"], keyword=True)

	#These denote expressions like a+=b
	#They actually (eventually) just turn into a=a+b
	#Must be preceeded by something that could conceivable produce a storage location/address
	T_AUGASSIGN = TokenType(r"(\+=)|(-=)|(\*=)|(/=)", ["T_NAME", "T_VAR_DECL", "T_LIST_STOP"], capture=True)
	
	#Must be preceeded by something that conceivably produce a value
	#(also prevents some nasty issues where greater-than would match to the > in the
	# `->' fragment of a function decl)
	T_BINARY_OPERATOR = TokenType(r"(>>)|(<<)|(>=)|(<=)|(!=)|(==)|[&/\*\-\+%\^><]", [
			"T_NAME", "T_LIST_STOP", "T_PAREN_CLOSE", "T_INTEGER_LITERAL", "T_STRING_LITERAL", "T_FLOAT_LITERAL"
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

	T_FLOAT_LITERAL = TokenType(r"[0-9]+\.[0-9]*", capture=True)

	T_COMMA = TokenType(r",")
	T_DOT = TokenType(r"\.")
	T_DOUBLECOLON = TokenType("::")
	T_COLON= TokenType(":")

	#I should get a better-looking syntax for this, the trailing @ is nasty...
	#Effectivley wrap a whole line to be parsed (read:eval'd :'() later
	T_INTRINSIC = TokenType(r"@\w*\(.*\)@", capture=True)

	#Unused
	T_HEAP_ALLOCATION = TokenType("!", ["T_VAR_DECL"])
	
	#Only - is implemented... 
	T_UNARY_OPERATOR = TokenType(r"[\-~!]", capture=True)

	#Support bs and xs in integer literals for bin and hex nums respectivley
	T_INTEGER_LITERAL = TokenType(r"[0-9xbBXa-fA-F]+L?", capture=True)
	T_STRING_LITERAL = TokenType(r"r?\"[(#-~)|( \!)]*\"", capture=True)

	T_ENDOFSTATEMENT = TokenType(";")#In case you want to write C
	T_WHITESPACE = TokenType(None)#For the mode where you want to preserve formatting

globals().update(Tokens)
#^-- Metaprogramming is fun!

#These types are basically used as flags on other types to show what they do
class Expression(ASTNode):
	#Something that does something. Most stuff is an Expression, but for example
	#Function declarations and type Declarations aren't
	pass

class ValueExpression(Expression):
	#Something that (probably) produces a value.
	#Basically means that it's transformer provides a `transform' method
	#that retuns a variable containing it's value
	pass

class IdentifierExpr(Expression):
	#Something that (probably) specifies a storage location that stuff
	#is storable to. Basically means that it's transformer provides a
	#`transform_address' method that return a variable containing the
	#address that stuff should be stored at when the expression is the
	#LHS of an AssignmentExpr.
	pass

class BlockExpression(Expression):
	#Something that contains a bunch of expressions
	pass

class IntrinsicExpr(ValueExpression):
	#An intrinsic expression (e.g. @sizeof(MyType)@ or @extern_func("printf", "void", "(...)")@
	#just gets captured and processed seperatley
	pattern=T_INTRINSIC

	def __init__(self, elements):
		self.text=elements[0].value

class NameExpr(IdentifierExpr, ValueExpression):
	#Names, yo
	pattern=T_NAME

	def __init__(self, elements):
		self.name=elements[0].value
		self.type="?"

class DeclExpr(NameExpr):
	#Variable declaration. Maps to a alloca in the IR.
	#Also used for globals when at file scope,
	#members when at type scope
	pattern=T_VAR_DECL+[T_HEAP_ALLOCATION]
	#The whole sepereate-syntax-for-heap-allocation thing is something
	#i would still like to explore, but for now it dosen't do anything

	def __init__(self, elements):
		# print(elements)
		type, *_, name = elements[0].value.split(" ")
		self.name=name
		self.type=type
		self.heap=len(elements)==2

class CastExpr(ValueExpression):
	#Cast one type to another. <some_value>|<typename> (eventually calls typeof(some_value).implement_cast(some_value, typename))
	pattern=ValueExpression+T_CAST+NameExpr
	bad_lookahead_tokens=[T_DOT, T_COLON, T_DOUBLECOLON, T_CAST, T_PTRCAST]

	def __init__(self, elements):
		self.value=elements[0]
		self.to=elements[2].name

class PtrCastExpr(ValueExpression):
	#Syntax is <some_value>||<pointer type>, effectivley equivilient to &some_value.
	#I don't really like this syntax, as it dosen't provide a scheme for dereferencing
	#Mostly a kludge to allow interfacing with some glibc stuff, probably should redo
	pattern=ValueExpression+T_PTRCAST+NameExpr
	bad_lookahead_tokens=[T_DOT, T_COLON, T_DOUBLECOLON, T_CAST, T_PTRCAST]

	def __init__(self, elements):
		self.value=elements[0]
		self.to=elements[2].name

class BinOpExpr(ValueExpression):
	#Operators like +, -, *, /, ^, &, <<, >>, ==, !=, <, >, <=, >= are all Binary operators
	pattern=ValueExpression+T_BINARY_OPERATOR+ValueExpression
	order_of_operations=[["*", "/"], ["+", "-"], "%", "==", "!=", "<", ">", "<=", ">=", "^", "&", "<<", ">>"]
	bad_lookahead_tokens=[T_DOT, T_CAST]

	@classmethod
	def get_op_idx(cls, op):
		for idx, item in enumerate(cls.order_of_operations):
			if item==op: return idx
			if isinstance(item, list):
				if op in item: return idx

	@classmethod
	def aux_match(cls, view):
		la=view.get_lookahead()
		if la is not None:
			if isinstance(la, Token):
				if la.type==T_BINARY_OPERATOR:
					other_op=la.value
					this_op=view.get_forward_slice()[1].value
					if cls.get_op_idx(this_op)>=cls.get_op_idx(other_op):
						return False
		return True

	def __init__(self, elements):
		self.lhs=elements[0]
		self.rhs=elements[2]
		self.operator=elements[1].value

class UnOpExpr(ValueExpression):
	#Stuff like unary minus
	pattern=T_UNARY_OPERATOR+ValueExpression

	def __init__(self, elements):
		self.operator=elements[0].value
		self.expr=elements[1]

class AssignmentExpr(Expression):
	#Assigning to somethign emits one of these. This includes assigning to computed locations, e.g.
	#into arrays. Also is the endpoint for augmented assignments
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
	#Literal values
	pattern=T_INTEGER_LITERAL|T_STRING_LITERAL|T_FLOAT_LITERAL

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
		elif elements[0].type==T_FLOAT_LITERAL:
			self.value=float(elements[0].value)
			self.type='float'
		else:
			self.value=eval(elements[0].value) #Hack to allow escapes, horrible, terrible, bad
			self.type='cstr'

class SepExpr(Expression):
	#Agglomerate ENDOFSTATMENTs into SepExprs. These are used in some cases by
	#e.g. ifs to understand where the blocks they contain start/end.
	pattern=T_ENDOFSTATEMENT
	bad_lookahead_tokens=[T_ENDOFSTATEMENT]

class JSepExpr(SepExpr):
	#We never want to have more than on sepexpr in a row, so join them together
	pattern=SepExpr+T_ENDOFSTATEMENT

class GroupingExpr(ValueExpression):
	#Order-of-operations changing parens. Just capture the enclosed value and that becomes the value of
	#this expression
	pattern=T_PAREN_OPEN+ValueExpression+T_PAREN_CLOSE
	bad_lookahead_tokens=[T_NAME, T_PAREN_CLOSE, T_LIST_STOP] #Cases where this could be a function invocation

	def __init__(self, elements):
		self.value=elements[1]

class TupleFragment(ASTNode):
	#This stuff's weird. Tuples are how I construct function calls, but their a little nutty
	#The start of a 2+-tuple is ,<value>)
	pattern=T_COMMA+ValueExpression+T_PAREN_CLOSE

	def __init__(self, elements):
		self.args=[elements[1]]

class TupleFragmentContinuation(TupleFragment):
	#Then for any further values, we match that to ,<value><fragment>
	#this will consume all but the last value (first arg)
	pattern=T_COMMA+ValueExpression+TupleFragment

	def __init__(self, elements):
		self.args=[elements[1]]+elements[2].args

class TupleExpr(ASTNode):
	#End case of a 2+-tuple. Consume the last element (first arg) of the tuple and the fragment
	pattern=T_PAREN_OPEN+ValueExpression+TupleFragment

	def __init__(self, elements):
		self.args=[elements[1]]
		self.args.extend(elements[2].args)

class OneTupleExpr(TupleExpr):
	#Special case for single-element tuples.
	pattern=T_PAREN_OPEN+ValueExpression+T_PAREN_CLOSE

	def __init__(self, elements):
		self.args=[elements[1]]

class ZeroTupleExpr(TupleExpr):
	#Special case for empty tuples
	pattern=T_PAREN_OPEN+T_PAREN_CLOSE

	def __init__(self, elements):
		self.args=[]

class CallExpr(ValueExpression):
	#A function call. LHS can be anything whose value eventually resolves to a fptr
	#so, functions, or arbitrary code. RHS is _either_ a tuple, or a groupingexpr
	#because that's what you get if you have just one arg (kinda hacky, i know)
	pattern=ValueExpression+(TupleExpr|GroupingExpr)
	bad_lookahead_tokens=[T_DOT, T_COLON, T_DOUBLECOLON]

	def __init__(self, elements):
		self.method=elements[0]
		if isinstance(elements[1], TupleExpr):
			self.args=elements[1].args
		else:
			self.args=[elements[1].value]

class AugmentedAssignExpression(Expression):
	#Handles cases like a+=b, by actually just turning them into
	#a=a+b, and that gets insterted into the outgoing AST instead
	pattern=IdentifierExpr+T_AUGASSIGN+ValueExpression
	bad_lookahead_tokens=[T_DOT, T_COLON, T_DOUBLECOLON]

	def __init__(self, elements):
		#Grab relevent stuff, this is gaurenteed to run before replace()
		self.variable=elements[0]
		self.operation=elements[1].value[0]
		self.offset=elements[2]
	
	def replace(self):
		#Create the ASTNodes that will replace this
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
	#Accesses can be made foo.bar style, where we are accessing the value
	#of the field bar on the type that foo is a immediate pointer to, foo:bar
	#where it's actually refferential to the name constructed from the type
	#of foo (at compile time) and the string $bar, e.g. for an int age:bar
	#actually resolves to int$bar, and foo::bar, where at parse time (here)
	#it is transparently replaced with foo$$bar. Therefore, AccessorExprs match
	#against accesses using T_DOTs, T_COLONs, and T_DOUBLECOLONs
	pattern=ValueExpression+(T_DOT|T_COLON|T_DOUBLECOLON)+IdentifierExpr
	bad_lookahead_tokens=[T_DOT, T_COLON, T_DOUBLECOLON] #Don't match the bar.baz part of
	#foo.bar.baz into it's own expression, wait until we don't have any more eventual parents,
	#and then it will recursivley match rightwards from the leftmost terminal

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
			#Replace me with a NameExpr for stuff using a :: access
			return NameExpr([Token(T_NAME, self.object.name+"$$"+self.field, self.object.line, None)])

class IndexExpr(IdentifierExpr, ValueExpression):
	#Index into something e.g. foo[bar]
	pattern=ValueExpression+T_LIST_START+ValueExpression+T_LIST_STOP
	bad_lookahead_tokens=[T_DOT, T_COLON, T_DOUBLECOLON]

	def __init__(self, elements):
		self.object=elements[0]
		self.index=elements[2]

class ReturnExpr(Expression):
	#Return a value
	pattern=T_RETURN+[ValueExpression]

	def __init__(self, elements):
		self.value=elements[1] if len(elements)==2 else None

class BunchaExpressions(Expression):
	#Parent class for expression groups
	def __init__(self, elements):
		self.exprs=elements

class BlockBunchaExpressionsBase(BunchaExpressions):
	#Start snarfing from `done` term in a block, uses SepExprs to ensure
	#it snarfs fully constructed elements
	pattern=SepExpr+Expression+SepExpr+T_BLOCK_DONE

	def __init__(self, elements):
		self.exprs=[elements[1]]
		
class BlockBunchaExpressionsExt(BlockBunchaExpressionsBase):
	#Extend a BlockBuncaExpressinosBase. This will eventually
	#recursivley consume all the expressions in a block
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
	#UGLY HACK WARNING. Same thing, but ends on a elif or else and keeps track of that
	pattern=SepExpr+Expression+SepExpr+(T_IF_BLOCK_END_ON_ELIF|T_IF_BLOCK_END_ON_ELSE)

	def __init__(self, elements):
		self.exprs=[elements[1]]
		self.end=elements[3]
		
class XIfBunchaExpressionsExt(XIfBunchaExpressionsBase):
	#UGLY HACK WARNING. Same thing, but ends on a elif or else and keeps track of that
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
	#Capture the conditional, and the stuff to run if it's true. overflow into else and elif
	#clauses is done with the .else_ member, that holds the ASTNode to run if false (so the
	#cascade chain of else_ looks like IfExpr->ElIfExpr->ElifExpr->[...]->ElseExpr->None
	#(of course you can mix and match but that's the idea)
	pattern=T_IF_START+ValueExpression+T_BLOCK_DO+\
	        (BlockBunchaExpressionsBase|(XIfBunchaExpressionsBase+IfContinuation))

	def __init__(self, elements):
		self.cond=elements[1]
		self.block=elements[3]
		self.else_=None if len(elements)==4 else elements[4]

class ElIfExpr(BlockExpression, IfContinuation):
	#Functionally identical
	pattern=T_IF_ELIF+ValueExpression+T_BLOCK_DO+\
	        (BlockBunchaExpressionsBase|(XIfBunchaExpressionsBase+IfContinuation))

	def __init__(self, elements):
		self.cond=elements[1]
		self.block=elements[3]
		self.else_=None if len(elements)==4 else elements[4]

class ElseExpr(IfExpr, IfContinuation):
	#Will run when control flow (from an .else_) member get's here nomatter what
	pattern=T_IF_ELSE+T_BLOCK_DO+BlockBunchaExpressionsBase

	def __init__(self, elements):
		self.cond=True
		self.block=elements[2]
		self.else_=None

class WhileExpr(BlockExpression):
	#Same as if, but while true loop back to start
	pattern=T_WHILE_START+ValueExpression+T_BLOCK_DO+BlockBunchaExpressionsBase

	def __init__(self, elements):
		self.cond=elements[1]
		self.block=elements[3]

class FunctionDeclStart(ASTNode):
	#Header for a function declaration, captures the `name -> rettype does` part
	pattern=T_FUNCTIONDECL_NAME+T_FUNCTIONDECL_RETURNS+T_FUNCTIONDECL_RETURN_TYPE+T_FUNCTIONDECL_DOES

	def __init__(self, elements):
		self.name=elements[0].value.replace(":","$")
		self.type=elements[2].value

class ArgListEle(ASTNode):
	#Snag an arglist element
	pattern=T_ARGLIST_ELEMENT

	def __init__(self, elements):
		self.name=elements[0].value.split(" ")[-1]
		self.type=elements[0].value.split(" ")[0]

class ArgList(ASTNode):
	#Base class for arg lists. This one also matches empty lists `function()`
	pattern=T_ARGLIST_START+T_ARGLIST_END

	def __init__(self, elements):
		self.args=[]

class OneArgList(ArgList):
	#Matches single element arg lists
	pattern=T_ARGLIST_START+ArgListEle+T_ARGLIST_END

	def __init__(self, elements):
		self.args=[elements[1]]

class MultiArgListStart(ArgList):
	#Same idea as the tuple matching code, but matches ArgListEles isntead of ValueExpressions
	pattern=T_ARGLIST_SEPERATOR+ArgListEle+T_ARGLIST_END

	def __init__(self, elements):
		self.args=[elements[1]]

class MultiArgListExt(MultiArgListStart):
	#Same Here
	pattern=T_ARGLIST_SEPERATOR+ArgListEle+MultiArgListStart

	def __init__(self, elements):
		self.args=[elements[1]]+elements[2].args

class CompletedMultiArgList(ArgList):
	#Gotta end with the T_ARGLIST_START at the beginning
	pattern=T_ARGLIST_START+ArgListEle+MultiArgListStart

	def __init__(self, elements):
		self.args=[elements[1]]+elements[2].args

class FunctionBody(BunchaExpressions):
	#Functions contain all the expressions from the `does` to the first
	#return expression that is unconditionally part of the control flow.
	#That is, not in an if/elif/else/while clause. Therefore, we can match
	#the body of functions by collecting expressions from the first ReturnExpr
	#we find (as al subsequent ones must be contained within a block)
	pattern=Expression+ReturnExpr
	bad_lookahead_tokens=[T_BLOCK_DO]

	def __init__(self, elements):
		self.exprs=[elements[0], elements[1]]

class FunctionBodyExt(FunctionBody):
	#Continue snarfing
	pattern=SepExpr+Expression+[SepExpr]+FunctionBody

	def __init__(self, elements):
		if len(elements)==4:
			self.exprs=[elements[1]]+elements[3].exprs
		else:
			self.exprs=[elements[1]]+elements[2].exprs

class FunctionDecl(ASTNode):
	#Turn the T_FUNCTIONDECL header, plus the metadata, and the body into one Node
	pattern=T_FUNCTIONDECL+ArgList+FunctionDeclStart+FunctionBody

	def __init__(self, elements):
		self.name=elements[2].name
		self.type=elements[2].type
		self.args=elements[1].args
		self.body=elements[3]

class FileExpr(ASTNode):
	#Holds stuff
	def __init__(self, elements):
		self.funcs=[e for e in elements if not isinstance(e, SepExpr)]

class TypeDeclStart(ASTNode):
	#Header part (`type name is [a|packed] ...`) of a type declaration
	pattern=T_TYPEDECL+T_TYPEDECL_NAME+T_TYPEDECL_IS+[T_TYPEDECL_PACKED|T_TYPEDECL_ALIAS]
	def __init__(self, elements):
		self.name=elements[1].value
		self.elements=elements
		self.packed=False
		self.alias=False
		if len(elements)==4:
			if elements[3].type==T_TYPEDECL_PACKED:
				self.packed=True
			else:
				self.alias=True

class TypeDeclExt(TypeDeclStart):
	#Match all the parts of the class body
	pattern=TypeDeclStart+ASTNode#(DeclExpr|FunctionDecl|T_ENDOFSTATEMENT)
	def __init__(self, elements):
		self.elements=elements[0].elements+[elements[1]]
		self.name=elements[0].name
		self.packed=elements[0].packed
		self.alias=elements[0].alias

class TypeDecl(ASTNode):
	#...until we get the endtype fragment
	pattern=TypeDeclStart+T_TYPEDECL_END

	def __init__(self, elements):
		self.name=elements[0].name
		self.fields=collections.OrderedDict()
		self.methods=[]
		self.packed=elements[0].packed
		#Parse the body contents into a useful package
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

class AliasTypeDecl(TypeDecl):
	#...or an unadormed type/T_TYPEDECL_FUNCTIONPOINTER, where this must be what the type aliases
	pattern=TypeDeclStart+(NameExpr|T_TYPEDECL_FUNCTIONPOINTER)

	def __init__(self, elements):
		self.name=elements[0].name
		assert elements[0].alias, "Got an invalid (name or functionpointertype) token inside a non-alias class. Syntax Error"
		self.aliasing=elements[1].name if isinstance(elements[1], ASTNode) else elements[1].value
		self.aliases_fpointer="->" in self.aliasing
		if self.aliases_fpointer:
			self.returntype=self.aliasing.split("->")[1].strip()

class ImportExpr(ASTNode):
	#Imports are either `import name` or `import "path.ort"`
	pattern=T_IMPORT

	def __init__(self, elements):
		if '"' in elements[0].value:
			self.absolute=True
			self.identifier=elements[0].value.split('"')[1].strip()
		else:
			self.absolute=False
			self.identifier=elements[0].value.split("import ")[1].strip()
