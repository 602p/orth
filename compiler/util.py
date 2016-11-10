import collections

class CODict(collections.OrderedDict):
	def __call__(self, **kw):
		self.update(kw)
		return self