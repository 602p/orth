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

class ChainableMatcher:
	def __init__(self, start=None):
		self.chain=[] if start is None else start

	def __add__(self, other):
		self.chain.append(other)
		return self

	def __or__(self, other):
		self.chain=[[self, other]]
		return self

	def __str__(self):
		return "ChainableMatcher(["+",".join(str(i) for i in self.chain)+"])"

	@staticmethod
	def _match(lock, key):
		if isinstance(lock, TokenType):
			if not isinstance(key, Token):
				return False
			if key.type.name!=lock.name:
				return False
		elif isinstance(lock, ASTNodeMeta):
			if not isinstance(key, ASTNode):
				return False
			if not isinstance(key, lock):
				return False
		elif isinstance(lock, list):
			if not any(ChainableMatcher._match(ele, key) for ele in lock):
				return False
		return True

	def cm_match(self, values):
		consumed=0
		for idx, item in enumerate(self.chain):
			print(idx, item)
			if not ChainableMatcher._match(item, values[idx]):
				return False
			consumed+=1
		if consumed:print(self, "Matched!")
		return consumed

class ChainableMatcherProvider:
	def __add__(self, other):
		return ChainableMatcher([self, other])

	def __or__(self, other):
		return ChainableMatcher([[self, other]])

	def cm_match(self, values): return ChainableMatcher([self]).cm_match(values)

class TokenType(ChainableMatcherProvider):
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

ast_node_types=[]
class ASTNodeMeta(type, ChainableMatcherProvider):
	def __new__(self, name, bases, classdict):
		cls = type.__new__(self, name, bases, classdict)
		ast_node_types.append(cls)
		return cls
	# pass

class ASTNode(metaclass=ASTNodeMeta):
	pattern=ChainableMatcher()
	def __init__(self, elements):
		pass

	def _get_interesting_keys(self):
		return [k for k in self.__dict__.keys() if not k.startswith("_") or k in \
		["pattern", "get_interesting_keys", "prettypring"]]

	def __str__(self):
		interesting_keys=self._get_interesting_keys()
		r = type(self).__name__
		r+="("
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