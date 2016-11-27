import grammar
import contextlib
import collections
import util

class Variable:
	def __init__(self, var, type):
		self.name=var
		self.type=type

	def __str__(self):
		return "Var({} {})".format(self.type, self.name)

	def __repr__(self):
		return str(self)

class Emitter:
	class _IndentContext:
		def __init__(self, emitter):
			self.emitter=emitter

		def __enter__(self):
			pass

		def __exit__(self, type, value, traceback):
			del self.emitter.context_map.maps[0]

	class _ScopeContext:
		def __init__(self, emitter):
			self.emitter=emitter

		def __enter__(self):
			pass

		def __exit__(self, type, value, traceback):
			del self.emitter.scopes.maps[0]

	def __init__(self, fd):
		self.fd=fd
		self.indent_context_manager=Emitter._IndentContext(self)
		self.scope_context_manager=Emitter._ScopeContext(self)
		self.context_map=collections.ChainMap({
			"indent":0,
			"line":-1,
			"file":"u",
			"ns":"u",
			"class":"u",
			"method":"u",
			"astblock":"u"
		})
		self.temp_count=0

		self.scopes=collections.ChainMap({})
		self.signatures={}

	def emit(self, text):
		self.fd.write(text)

	def emitindent(self):
		self.emit("\t"*self.context_map['indent'])

	def emitl(self, line):
		self.emitindent()
		self.emit(line)
		self.emit("\t\t;from line "+str(self.context_map['line']))
		self.emit("\n")

	def context(self, indent_by=1, **kwargs):
		# self.emitl(";////////////////////////////////")
		if 'indent' not in kwargs:
			kwargs['indent']=self.context_map['indent']+indent_by
		self.context_map.maps.insert(0, kwargs)
		return self.indent_context_manager

	def indent(self, by=1):
		return self.context(indent_by=by)

	def get_name(self):
		self.temp_count+=1
		return "f{}_m{}_l{}_n{}".format(
			self.context_map['file'],
			self.context_map['method'],
			self.context_map['line'],
			self.temp_count
		)

	def get_temp_name(self):
		return "temp_"+self.get_name()

	def scope(self):
		self.scopes.maps.insert(0, {})
		return self.scope_context_manager

	def set_var_name(self, vname, aname, type):
		self.scopes.maps[0][vname]=Variable(aname, type)

	def get_var_name(self, vname):
		return self.scopes[vname].name

	def get_var_type(self, vname):
		return self.scopes[vname].type

	def get_var(self, vname):
		return self.scopes[vname]

transformers={}
class TransformerMeta(type):
	def __new__(self, name, bases, classdict):
		cls = type.__new__(self, name, bases, classdict)
		if cls.transforms is not None:
			if isinstance(cls.transforms, list):
				for nodetype in cls.transforms:
					transformers[nodetype]=cls
			else:
				transformers[cls.transforms]=cls
		return cls

class Transformer(metaclass=TransformerMeta):
	transforms=None
	def __init__(self, node, parent):
		self.node=node
		self.parent=parent

	def transform(self, out):
		pass

def get_transformer_cls(node):
	match=None
	for item in transformers.keys():
		if isinstance(node, item) and (match is None or issubclass(item, match)):
			match=item

	if match is None:
		raise IndexError("No transformer for %s"%str(type(node)))

	return transformers[match]

def get_transformer(node, parent):
	return get_transformer_cls(node)(node, parent)

def emit(out, node, parent=None):
	# print("Transforming "+str(node)+" with "+str(get_transformer(node)))
	print("Running "+str(get_transformer(node, parent)))
	# print(out.scopes)
	return get_transformer(node, parent).transform(out)