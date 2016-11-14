from tokenize import toktys, tokenize

class ASTNode:
	def __init__(self, **kwargs):
		self.__dict__.update(kwargs)
		self.attrs=list(kwargs.keys())

	def __str__(self):
		r = type(self).__name__
		if self.attrs:
			r+="("
			r+=", ".join(k+"="+str(self.__dict__[k]) for k in self.attrs)
			r+=")"
		return r

	def __repr__(self): return str(self)

def parse(tokens):
	pass

tokens=tokenize(r"""function (int a, int b) foo ->  bool does
	int b=2
	a+=1
	if !(a>=b) do
		return 1
	done
return 0
""")

print(tokens)
print(parse(tokens))