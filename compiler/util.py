import collections

class DotAccessibleDict(dict):
	def __getattr__(self, a):
		return self[a]

class CODict(collections.OrderedDict):
	def __call__(self, **kw):
		self.update(kw)
		return self