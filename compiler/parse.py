
class ASTNode:
	def __init__(self, **kwargs):
		self.__dict__.update(kwargs)
		self.attrs=list(kwargs.keys())

	def __str__(self):
		r = type(self).__name__
		if self.attrs:
			r+="("
			r+=", ".join(k+"="+str(self.__dict__[v]) for k in self.attrs)
			r+=")"
		return r

	def __repr__(self): return str(self)