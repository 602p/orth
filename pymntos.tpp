--title Quickfast Crash-Course

--center Quick PyMNTos Talk on Orth
--center aka. So you want to build a language



  Louis Goessling
 -----------------
louis@goessling.com
louis.goessling.com
  github.com/602p




















--newpage
--title Quickfast Crash-Course

So: What is a programming language?
---
 * Tool
---
 * System of rules
---
 * Way of describing steps to a computer
---

Really, it's a system of rules for describing steps to a computer
---

--beginoutput
Machine,

Pls make website,
all responsive like,
w/ BIG pictures ooo,
use my fav fonts,
also fancy menus with whooosh on,
load fast pls

Thanks,
Human

PS no bugs :)
--endoutput
---

--beginoutput
  File "make_website.py", line 3
    Pls make website,
           ^
--fgcolor red
SyntaxError: invalid syntax
--fgcolor white
--endoutput
















--newpage
--title Quickfast Crash-Course

So: What do programming languages get us?
---
 * Abstraction
 * Programmer time
 * Ease-of-use
 * Safety and reliability
 * Libraries
 * Communities :)
---
Quick evolution:
---
Single-pourpose Computers (e.g. WWII Enigma breakers)
---
      ______________________________________________
     /               FORTRAN STATEMENT              \
    /                                               |
   /     oo o   o      o                 ooo        |
  /       oo    o         o      o o o     o        |
 /         o    oo  o                      o    o   |
 |       o             o   o                        |
 |                       o     o                    |
 |      o      o                o  o    o  o o      |
 |                      o   o ooo                   |
 \__________________________________________________/
---
--beginoutput
PROGRAM HELLO
	IMPLICIT NONE
	WRITE (*,*) 'Hello, World!'
END PROGRAM HELLO
--endoutput
---
--beginoutput
#include <stdio.h>

int main(void){
	printf("Hello, World!\n");
}
--endoutput
---
--beginoutput
print("Hello, World!")
--endoutput
















--newpage
--title Quickfast Crash-Course
Whoops, one too many!
---
Back up to 
--beginoutput
#include <stdio.h>

int main(void){
	printf("Hello, World!\n")
}
--endoutput

"Building a C-like compiler using Python"

---


 Python                  | C, C++, Rust & Friends
 ------------------------+-----------------------
 Interpreted             | Compiled
 Slow                    | Fast                     (in general terms)
 Easy to Write           | Harder to Write
 Harder to Crash         | Easier to Crash          (Rust excluded)
 Easier to Abstract      | Harder to Abstract
 Far from the machine    | Close to the machine
                         |
                         |
                         |






--newpage
--title Building a C-like compiler using Python
So, what's C up to?
---
          ^modern

Thanks to our friends at LLVM, we can do this a little cleaner

--newpage
--title Building a C-like compiler using Python

Sneak peek of my language: Orth

--beginoutput
import std

function() main -> int does
	int birthyear = read_int("What is your birthyear? ")
	int age = 2017-birthyear
	printf("You are %i years old now\n", age)
return 0
--endoutput

So: How do we turn this into assembly?
---

--fgcolor yellow
WARNING: I'm an amateur - there are faster and better ways to do this for more real languages
--fgcolor white
                                    (if your interested, look into flex/bison and David Beazley's PLY)
---

 ________________________                  ________________________                   ________________________
/                        \                /                        \                 /                        \
|                        |  Tokenization  |   Series of abstract   |    Parsing      |   Tree structure of    |
|    Orth Source Code    | =============> |    grammar-elements    |  ===========>   |    grammar-elements    |
|                        |                |                        |                 |                        |
\________________________/                \________________________/                 \________________________/
                                                                                                  |
                                                                                                  | IR Emission
                                                                                                  V
 ________________________                  ________________________                   ________________________
/                        \                /                        \                 /                        \
|                        |  GCC Toolchain |                        |    LLVM LLC     |                        |
|    x86 ELF Executables | <============= |  x86 Textual Assembly  |  <===========   |    LLVM Textual IR     |
|       *yay!*           |                |                        |                 |                        |
\________________________/                \________________________/                 \________________________/
           |
           | ????
           V
       +-------+
       |Profit!|
       +-------+

























--newpage
--title Building a C-like compiler using Python: Tokenization

What's a token?
---
 * "Type" - e.g. String Literal, Operator, Open Paren, Close Paren
 * Value  - e.g. "Hello, World!", +, -, *, (, )

1 + 1 ==> T_INT(1), T_OPERATOR(+), T_INT(+)

Context can be used, to differentiate e.g. the parens in a function call from the parens in a function definition

a(b)                       ==> T_NAME(a) T_OPEN_PAREN T_NAME(B) T_CLOSE_PAREN
function() foo -> bar does ==> T_FUNCTIONDECL T_ARGLIST_START T_ARGLIST_END T_FUNCTIONDECL_NAME(foo) T_FUNCTIONDECL_RETURNS T_FUNCTIONDECL_RETURN_TYPE(barT) T_DOES
---

Other stuff that happens here:
 * Comments and whitespace dissappear
 * Logical\
  	 lines\
  	 are\
  	 merged from line-continuations
 * Wholly invalid syntax is discovered (e.g. `$dollars=3`, `fnuction`)
 * Tokens are tagged with their position in the source for error-reporting

















--newpage
--title Building a C-like compiler using Python: Parsing

What's a Abstract Syntax Tree (AST)?
---

1+1 ~=   +
        / \
       1   1

1+1 => T_INT(1) T_OPERATIOR(+) T_INT(1) => T_OPERATOR(+)
                                             /      \  
                                         T_INT(1) T_INT(1)

52*3+9 ~=     +
             / \
            *   9
           / \
         52   3 

---

This quickly becomes very complicated.
--beginoutput
class AssignmentExpr(Expression):
	#Assigning to somethign emits one of these. This includes assigning to computed locations, e.g.
	#into arrays. Also is the endpoint for augmented assignments
	pattern=IdentifierExpr+T_ASSIGNMENT+ValueExpression
	bad_lookahead_tokens=[T_DOT, T_COLON, T_DOUBLECOLON]
--endoutput

Finally! Some python :)

AST Types in the Orth Compiler:
 * Expression     		= Something that can be executed
 * ValueExpression		= Something that semantically has a value
 * IdentifierExpr		= Something that semantically has a location that contains a value
 * Other funky stuff           (e.g. groups of expressions, non-expression entities (e.g. type declarations))

"An assignment is: <IdentifierExpr> T_ASSIGNMENT <ValueExpression>"

Semantically, some things (e.g. names) are both a IdentifierExpr and a ValueExpression

Additionally, we parse groups of Expressions up into chains of instructions that will always execute - "Basic Blocks"
These are connected by branches - ifs, whiles, calls





























--newpage
--title Building a C-like compiler using Python: The types and machine architecture interlude

What is a type in Python?
---
In python, a type is a dictionary and a collection of operations on that dictionary

---
What is a type in C?

 Scalar                  vs.                  Reference
 ---------------------------------------------------------------
 ints, etc                                    "pointer"
 operations create a new item                 operations can "mutate" existing item

Scalar types include:    integers, floating-point numbers
Reference types include: everything else under the sun
---






















--newpage
--title Building a C-like compiler using Python: The types and machine architecture interlude

Python's mental model:

a=0

 +---+
 | 0 |   <- a
 +---+

---

b=3

 +---+
 | 0 |   <- a
 +---+

 +---+
 | 3 |   <- b
 +---+

---

b=a

 +---+
 | 0 |   <- a, b
 +---+

---

b+=1

 +---+
 | 0 |   <- a
 +---+

 +---+
 | 1 |   <- b  *newly created*
 +---+

n.b.: it's not that simple






























--newpage
--title Building a C-like compiler using Python: The types and machine architecture interlude

C's mental model:

a=0

 a---+
 | 0 |
 +---+

---

b=3

 a---+
 | 0 |
 +---+

 b---+
 | 3 |
 +---+

---

b=a

 a---+
 | 0 |
 +---+

 b---+
 | 0 |
 +---+

---

b+=1

 a---+
 | 0 |
 +---+

 b---+
 | 1 |
 +---+

n.b.: it's not that simple




























--newpage
--title Building a C-like compiler using Python: The types and machine architecture interlude

"Stack Frames" and Scoping
Stack <==> List
Push   ==  append
Pop    ==  pop
"Top"  == [-1]

.___________________________.
|  Address of last function |
|___________________________|
|  Local a: 0               |
|  Local b: 1               |
|___________________________|

---

call foo()

.___________________________.
|  Address of last function |
|___________________________|
|  Local a: 0               |
|  Local b: 1               |
|___________________________|
|  Address of next code     |
|___________________________|
|  Locals of function foo   |
|___________________________|

---

foo() returns

.___________________________.
|  Address of last function |
|___________________________|
|  Local a: 0               |
|  Local b: 1               |
|___________________________|

       *poof*

So what if I want to create something that doesn't fit in one of these little boxes?
How about an array of 10 000 items, or a record I want to be able to edit after the function returns?














--newpage
--title Building a C-like compiler using Python: The types and machine architecture interlude


type Person is
	int age
	float height
endtype

fred = Person::create(44, 5.8)


         "Stack"                                           "Heap"
.___________________________.
|  Address of last function |
|___________________________|                      ._________________________.
|  Local fred: 0x1234       | ------------------>  | Age: 44                 |
|___________________________|                      | Height: 5.8             |
                                                   |_________________________|

---

a=fred.height
fred.height = float-at-location(fred + sizeof(int))
                                #Offset by size of "age" member
                                #You can imagine this as a list lookup

         "Stack"                                           "Heap"
.___________________________.
|  Address of last function |
|___________________________|                      ._________________________.
|  Fred.height: 0x1238      | --------------\  +4  | Age: 44                 |
|___________________________|                \---> | Height: 5.8             |
                                                   |_________________________|

n.b.: It's not that simple








--newpage
--title Building a C-like compiler using Python: Why you cared about the interlude
You'll need a type system for your language.

Primitive Types: integral types          - int, long, short, bool etc...
                 floating-point          - float
                 some kinda pointer type - ptr, you may want a parameterized solution here
                 function pointer type   - function->int, decide how you want to represent
                 aggregate types         - struct/class/type (whatever you want to call it)

Decide how much abstraction you want over LLVM (in my case)
 - LLVM Dosen't provide signedness on types
 - circularly refferential types (e.g. linkedlist)


--beginoutput
#Initilize the builtin types. Nativley we support...
builtin_types = {e.name:e for e in [
	BooleanPrimitiveOType("bool", "i1"),			#Boolean values
	IntegerPrimitiveOType("int", "i32"),			#Int's are 4-bytes
	IntegerPrimitiveOType("short", "i16"),			#Shorts are two
	IntegerPrimitiveOType("byte", "i8"),			#Bytes (char in C)
	IntegerPrimitiveOType("long", "i64"),			#Longs are 8 bytes
	IntegerPrimitiveOType("xlong", "i128"),		#Hella big
	IntegerPrimitiveOType("xxlong", "i256"),		#Hella Hella big
	DoublePrimitiveOType("float", "double"),		#A lie...
	UnsignedIntegerPrimitiveOType("uint", "i32"),		#Same as above, but unsigned
	UnsignedIntegerPrimitiveOType("ushort", "i16"),	# (note that they have the same LLVM types
	UnsignedIntegerPrimitiveOType("ubyte", "i8"),		# but the orth type metadata is different
	UnsignedIntegerPrimitiveOType("ulong", "i64"),		# resulting in the correct u* operations
	UnsignedIntegerPrimitiveOType("uxlong", "i128"),	# being applied for mul, mod and cmp stuff)
	UnsignedIntegerPrimitiveOType("uxxlong", "i256"),
	PointerPrimitiveOType("ptr", "i8*"),					#No parameterization for pointers (so no need for void*)
	PointerPrimitiveOType("void", "void"),					#Nil return value type (only valid in function decls)
	PrimitiveCStrOType("cstr", "i8*")					#Cstr is just a ptr with a literal constructor
]}
--endoutput









--newpage
--title Building a C-like compiler using Python: Why you cared about the interlude
Your AST needs type data.
Writing a+b will mean something different if a and b are ints, longs, floats, and might be invalid if they are something else

52*3+9 ~= int:+
             / \
        int:*   9
           / \
         52   3 

You can do this type-completion via building from the ground up from known types:
 * Return types of functions
 * Types of literals
 * Types of members
 * Results of casting (casting is giving new metadata to an existing value)










--newpage
--title Building a C-like compiler using Python: Almost there!

Pick your output language and format - I used LLVM IR and it's textual format for simplicity
Better-define your typing system. Will you have overloadable operators? OOP? Union types?
---

Start writing transformation rules from your AST to this output format:

--beginoutput
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
--endoutput












--newpage
--title Building a C-like compiler using Python: Does this actually work?

Yes!
Orth is a fully functional C-level languge for all sorts of cool stuff.
It's got some simple OOP concepts, and can be used to implement real software :)
And it's a big boy language - It now has a orth compiler written in orth










--newpage
--title Building a C-like compiler using Python: The End!

Things I skipped, if you want to do this yourself:
 * LLVM IR SSA Form and Typing, Flow Control
 * Strict Aliasing and type punning limitations
 * Linking and function prototypes
 * Scoping and variables
 * Optimization
 * lol no generics


louis@goessling.com
louis.goessling.com
 github.com/602p