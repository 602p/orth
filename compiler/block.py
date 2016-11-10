from collections import OrderedDict as ODict

varargs=object()

class Function:
	def __init__(self, name, params=None, ast=None):
		self.name=name
		self.ast=ast
		self.params=ODict() if params is None else params

	def do_call()