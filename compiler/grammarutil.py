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

class TokenHolder(type):
	@classmethod
	def __prepare__(self, name, bases):
		return DotAccessibleTokenDict()

	def __new__(self, name, bases, classdict):
		del classdict['__module__']
		del classdict['__qualname__']
		for k, v in classdict.items():
			v.name=k
		return classdict

class ChainBuilder:
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
	def __add__(self, other):
		return ChainBuilder([self, other])

	def __radd__(self, other):
		return ChainBuilder([[other, self]])

	def __or__(self, other):
		return ChainBuilder([{self, other}])

	def cm_match(self, values, ast_type_blacklist=[]): return ChainBuilder([self]).cm_match(values, ast_type_blacklist)

class TokenType(ChainBuilderProvider):
	def __init__(self, regex, preceeding_in=None, capture=False, emit=True):
		self.regex=re.compile(regex)
		self.preceeding_in=preceeding_in
		self.capture=capture
		self.emit=emit

	def __repr__(self): return self.name

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

class TokenView:
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

ast_node_types=[]
class ASTNodeMeta(type, ChainBuilderProvider):
	def __new__(self, name, bases, classdict):
		if 'pattern' in classdict.keys():
			if not isinstance(classdict['pattern'], ChainBuilder):
				classdict['pattern']=ChainBuilder([classdict['pattern']])
		cls = type.__new__(self, name, bases, classdict)
		ast_node_types.append(cls)
		return cls
	# pass

class ASTNode(metaclass=ASTNodeMeta):
	# pattern=ChainBuilder()
	def __init__(self, elements):
		pass

	def replace(self):
		return False

	def _get_interesting_keys(self):
		return [k for k in self.__dict__.keys() if not k.startswith("_") or k in \
		["pattern", "get_interesting_keys", "prettypring"]]

	def __str__(self):
		interesting_keys=self._get_interesting_keys()
		r = type(self).__name__
		r+="("
		# print(interesting_keys)
		r+=", ".join([k+"="+str(getattr(self, k)) for k in interesting_keys])
		r+=")"
		return r

	def prettyprint(self, _depth=0):
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
						r+=(",\n\t\t"+spacing).join(ele.prettyprint(_depth+2) if isinstance(ele, ASTNode) else str(v) for ele in v)
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
	def match(self, values):
		return self.pattern.cm_match(values)

NotLoaded = object()