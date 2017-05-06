import re, collections

#Here be metaprogramming dragons, and other scary internals.

class DotAccessibleTokenDict(collections.OrderedDict):
	#Dictionary accessible via dot-accessor
	def __getattr__(self, a):
		if a.startswith("T_"):
			return self[a]
		return object.__getattribute__(self, a)
	def __setattr__(self, a, v):
		if a.startswith("T_"):
			self[a]=v
		object.__setattr__(self, a, v)

class TokenHolder(type):
	#Magic metaclass for the Tokens object in grammar.
	#Just syntactic sugar around a ordereddict
	@classmethod
	def __prepare__(self, name, bases):
		return DotAccessibleTokenDict()

	def __new__(self, name, bases, classdict):
		del classdict['__module__'] #Strip out stuff we don't actually want in out dict
		del classdict['__qualname__']
		for k, v in classdict.items():
			v.name=k
		return classdict

class ChainBuilder:
	#Spicy! Core of the token->AST transformation matching here.
	#I went a little nuts with the metaprogramming.
	#Basically, a ChainBuilder is a chain of patterns (including
	#other chainbuilders) that describes a sequence of elements
	#(can be tokens or AST Nodes) that matches that pattern for a
	#AST Node (e.g. Value + Value -> BinOp, or in our terms
	# ValueExpression T_OPERATOR(+) ValueExpression -> BinOpExpr)
	def __init__(self, start=None):
		self.chain=[] if start is None else start

	def __add__(self, other):
		self.chain.append(other)
		return self

	def __or__(self, other):
		return ChainBuilder([{self, other}])

	def __str__(self):
		return "ChainBuilder("+", ".join(str(i) for i in self.chain)+")"

	def __repr__(self): return str(self)

	@property
	def min_chain_size(self):
		return len(self.chain)

	@property
	def tokens_only(self):
		for item in self.chain:
			if isinstance(item, ASTNodeMeta):
				return False
			if isinstance(item, list):
				if any(not ChainBuilder([ele]).tokens_only for ele in item):
					return False
		return True

class ChainBuilderProvider:
	#Mixin type of something that can be composed like a chainbuilder
	#They support addition (+) for sequence, or (|) for multiple types, and also
	#brackets ([]) for optional
	def __add__(self, other):
		return ChainBuilder([self, other])

	def __radd__(self, other):
		return ChainBuilder([[other, self]])

	def __or__(self, other):
		return ChainBuilder([{self, other}])

	def cm_match(self, values, ast_type_blacklist=[]):
		#Fall thru to the chainbuilder for the single-element pattern
		#(e.g. the pattern for ImportExpr is just T_IMPORT(...))
		return ChainBuilder([self]).cm_match(values, ast_type_blacklist)

class TokenType(ChainBuilderProvider):
	#Class that holds a regex and some parameters for parsing text into a stream of tokens.
	#Provides the ability to match against a regex, and specify the type of the preceeding
	#token. Also allows capturing of the value matched, wether or not to actually emit it
	#into the tokenstream (false for e.g. comments) and wether it's a "keyword" and shouldn't
	#match stuff in the middle of other fragments
	def __init__(self, regex, preceeding_in=None, capture=True, emit=True, keyword=False):
		if regex is not None:
			if keyword:
				regex=regex+r"(?=\s)" #look-ahead for whitespace, that is it's not part of another
										#word (e.g. int functionname isn't a T_FUNCTIONDECL)
			self.regex=re.compile(regex)
		else:
			self.regex=None
		self.preceeding_in=preceeding_in
		self.capture=capture
		self.emit=emit

	def __repr__(self): return self.name

	def matches(self, text, prev):
		if self.regex is None:
			return False
		return self.regex.match(text) is not None and (self.preceeding_in is None or prev.type.name in self.preceeding_in)

	def make_token(self, text, line=None, file=None, force_create=False):
		try:
			return Token(self, self.regex.match(text).group() if (self.capture or force_create) else None, line=line, file=file) if (self.emit or force_create) else None
		except AttributeError:
			return Token(self, text, line=line, file=file) if self.emit else None

class Token:
	#Holder
	def __init__(self, type, value=None, line=None, file=None):
		self.type=type
		self.value=value
		self.line=line
		self.file=file

	def __str__(self):
		return self.type.name+("(%s)"%self.value if self.value else "")

	def __repr__(self): return str(self)

class TokenView:
	#Holding class for a tokenstream. Supports snarfing a forward slice and the next item
	#Origionally had more of a job, with a stack-machine matching system when I used
	#LALR parsing (which didn't work out)
	def __init__(self, tokens):
		self.tokens=self.orig=tokens[:]
		self.idx=len(self.tokens)-1

	def next(self):
		if self.has_any:
			self.idx-=1
			return self.tokens[self.idx+1]
		else:
			raise StopIteration

	@property
	def has_any(self):
		return self.idx>=0

	def replace(self, count, with_):
		del self.tokens[self.idx:self.idx+count]
		self.tokens.insert(self.idx, with_)
		# self.idx+=1

	def get_forward_slice(self):
		return self.tokens[self.idx:]

	def get_lookahead(self):
		return self.tokens[self.idx-1] if self.idx>0 else None

ast_node_types=[] #Collects AST Node types
class ASTNodeMeta(type, ChainBuilderProvider):
	#Just caches 
	def __new__(self, name, bases, classdict):
		if 'pattern' in classdict.keys():
			if not isinstance(classdict['pattern'], ChainBuilder):
				#Patches classes that match just a single element
				classdict['pattern']=ChainBuilder([classdict['pattern']])
		cls = type.__new__(self, name, bases, classdict)
		ast_node_types.append(cls)
		return cls
	# pass

class ASTNode(metaclass=ASTNodeMeta):
	bad_lookahead_tokens=[] #Blacklist of _tokens_ that if they are the next item in
							#the tokenstream we won't match against (e.g. don't match
							# `foo.bar' into a access of field `bar' on type `foo' if
							#the next token is a T_DOT, where the expression fully is
							# `quux.foo.bar', instead wait for the last terminal
							#to not be a T_DOT and match recursivley forward from that)
							#Makes this a Bottom-up RL(1) parser
	#subclasses _should_ implement a pattern classvar holding something recognizable
	#(eventually) as a ChainBuilderProvider (Incl. ChainBuilders)
	def __init__(self, elements):
		#Subclasses should implement stuff here.
		#Called with elements=list of stuff (ASTNode instances, or Token instances)
		#that is gaurenteed to match the pattern
		pass

	def replace(self):
		#Can also return a truthy (indirect) instance of ASTNode that the parser
		#will emit into the buffer instead of this object (used for e.g. replacing
		#a AugmentedAssignment with an equivilent Assignment)
		return False

	def _get_interesting_keys(self):
		return sorted([k for k in self.__dict__.keys() if not k.startswith("_") or k in \
		["pattern", "get_interesting_keys", "prettyprint"]])

	def __str__(self):
		interesting_keys=self._get_interesting_keys()
		r = type(self).__name__
		r+="("
		r+=", ".join([k+"="+str(getattr(self, k)) for k in interesting_keys])
		r+=")"
		return r

	def prettyprint(self, _depth=0):
		#Pretty (read:indented) print a ASTNode and children.
		#Basically a holdover from before I wrote drawblockdiag
		interesting_keys=self._get_interesting_keys()
		spacing="\t"*_depth
		r = type(self).__name__+"("
		if interesting_keys:
			if len(interesting_keys)>0:
				for k in interesting_keys:
					r+="\n"+spacing+"\t"+k+" = "
					v=getattr(self, k)
					if isinstance(v, ASTNode):
						r+=v.prettyprint(_depth+1)
					elif isinstance(v, list) and len(v)>0:
						r+="[\n\t\t"+spacing
						r+=(",\n\t\t"+spacing).join(ele.prettyprint(_depth+2) if isinstance(ele, ASTNode) else str(ele) for ele in v)
						r+="\n\t"+spacing+"]"
					else:
						r+=str(v)
					if not interesting_keys.index(k)==len(interesting_keys)-1:
						r+=","
				r+="\n"+spacing
			else:
				r+=interesting_keys[0]+" = "+str(getattr(self, interesting_keys[0]))
		r+=")"
		return r

	def __repr__(self): return str(self)

	@classmethod
	def aux_match(self, values):
		return True

	@classmethod
	def match(self, values):
		return self.pattern.cm_match(values)

	def get_line(self):
		#recursivley get the line this ASTNode belongs to. Buggy
		for k in self._get_interesting_keys():
			v=getattr(self, k)
			if isinstance(v, list):
				for item in v:
					if isinstance(item, ASTNode):
						return item.line
			elif isinstance(v, ASTNode):
				return v.line
		return self.line

	def get_file(self):
		#recursivley get the file this ASTNode belongs to. Buggy
		for k in self._get_interesting_keys():
			v=getattr(self, k)
			if isinstance(v, list):
				for item in v:
					if isinstance(item, ASTNode):
						return item.file
			elif isinstance(v, ASTNode):
				return v.file
		return self.file