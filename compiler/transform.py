import grammar
import contextlib
import collections
import util
import datamodel
import copy
import os
import functools

#Underlying machinery for tracking TU state and emitting LLVM code.

class Variable:
	#Holds a LLVM identifier, OType pair
	def __init__(self, var, type):
		self.name=var
		self.type=type

	def __str__(self):
		return "Var({} {})".format(self.type, self.name)

	def __repr__(self):
		return str(self)

class Emitter:
	#Workhorse of the actual emitting process. Passed around as out so as to be theoretically reentrant.
	#Tracks variables, globals, function prototypes, included files, contexts (indent etc), scopes
	class _IndentContext:
		#Helper so that one can write
		#with out.context():
		#	#Do something
		#Just pops the last context off the context map chain when it returns (if no error)
		def __init__(self, emitter):
			self.emitter=emitter

		def __enter__(self):
			pass

		def __exit__(self, type, value, traceback):
			if traceback: return
			del self.emitter.context_map.maps[0]

	class _ScopeContext:
		#Same as above, but for scope
		def __init__(self, emitter):
			self.emitter=emitter

		def __enter__(self):
			pass

		def __exit__(self, type, value, traceback):
			if traceback: return
			del self.emitter.scopes.maps[0]

	def __init__(self, fd, options):
		#Construct an emitter, outputting to the file fd
		self.fd=fd
		self.indent_context_manager=Emitter._IndentContext(self)
		self.scope_context_manager=Emitter._ScopeContext(self)
		#The context chainmap is a series of maps, where the current state
		# (file, line, class, method, etc) is readable by indexing into the
		# chain. This allows nested contexts, for example a method in a class
		# in a included file in an included file in an included file, and for
		# it all to be sorted out at the end of those scopes.
		#Create a scope by doing
		#with emitter.scope(line=foo, file=bar, method=baz):
		#	#Do stuff that will call emitter.emit*
		# and then the emitted lines will have the correct context/debugging
		# info attached
		self.context_map=collections.ChainMap({
			"indent":0,
			"line":"u",
			"file":"u",
			"ns":"u",
			"class":"u",
			"method":"u",
			"astblock":"u"
		})
		self.temp_count=0 #Number of temporary (for SSA) variables we've allocated
		self.last_line=-1 #Debug helper
		self.last_file=-1 #Debug helper
		self.last_method=-1 #Debug helper
		self.options=options

		#Same idea as the context maps. Provides a stack of orth_var_name:Variable
		# mappings that (as a virtue of being a stack) respects local declarations over
		# global names)
		#Contains global variables in the last element in the chain (scopes.maps[-1])
		self.scopes=collections.ChainMap({})
		self.signatures={} #Map of name->Variable for functions
		self.global_statments=[] #Stuff to stick at the end of the file (e.g. string literals)
		self.included_files=[] #Files whose contents have actually been emitted
		self.prepared_files=[] #Files whose prototypes/globals have been emitted, and signatures loaded
					#(all files will have that preparation transformation applied before _any_ are actually
					# "included")
		self.ast_cache={} #Cache of filename (non-mangled)->ASTNode for files
		self.path_cache={} #Cache of include_name->File path for imports
		self.types=copy.copy(datamodel.builtin_types) #Dictionary of orth_type_name:OTypes of the types availible (globally)
								#in the program
		self.searchpath=["."] #Search path for imported modules (using import name, as opposed to import "relative_path")
		if not options.get("no0double", False):
			self.emitl("@_the_zero_double = global double 0.0")
		if "path" in options:
			self.searchpath=options["path"]

	def emit(self, text):
		self.fd.write(text)

	def emitindent(self):
		self.emit("\t"*self.context_map['indent'])

	def emitl(self, line):
		self.emitindent()
		self.emit(line)
		self.emit("\t\t;from "+self.context_map['file']+":"+str(self.context_map['line']))
		self.emit("\n")

	def context(self, indent_by=1, **kwargs):
		#Create and push a context on to the context map chain stack. Automatically indents +1 if not otherwise specified
		if 'indent' not in kwargs:
			kwargs['indent']=self.context_map['indent']+indent_by
		self.context_map.maps.insert(0, kwargs)
		self.last_line=self.context_map["line"]
		self.last_file=self.context_map["file"]
		self.last_method=self.context_map["method"]
		return self.indent_context_manager #This function returns a context manager that automatically pops the context when the block ends

	def indent(self, by=1):
		return self.context(indent_by=by)

	def get_name(self):
		#Get a non-conficting SSA name
		self.temp_count+=1
		return "f{}_m{}_l{}_n{}".format(
			self.context_map['file'],
			self.context_map['method'],
			self.context_map['line'],
			self.temp_count
		)

	def get_temp_name(self):
		#Get a non-conflicting SSA name for an intermidiate variable
		return "temp_"+self.get_name()

	def scope(self):
		#Create a scope and push it onto the scope chain map stack
		self.scopes.maps.insert(0, {})
		return self.scope_context_manager

	def set_var_name(self, vname, aname, type):
		#Create a variable (in the topmost scope) and register it's type
		self.scopes.maps[0][vname]=Variable(aname, type)

	def set_signature(self, fname, type):
		self.signatures[fname]=Variable("@"+fname, type)

	def set_global_var_name(self, vname, aname, type):
		#Create a global and register it's type
		self.scopes.maps[-1][vname]=Variable(aname, type)

	def get_var_name(self, vname):
		#Get the llvm identifer for a variable (returns the identifier (which never
		# shadow each other) of the variable in the topmost scope containing one named
		# `vname`)
		return self.scopes[vname].name

	def get_var_type(self, vname):
		#Same behavior as get_var_name, but returns the OType of the variable
		return self.scopes[vname].type

	def get_var(self, vname):
		#Same behavior as get_var_name, but returns the whole Variable object
		return self.scopes[vname]

	def add_global_stmt(self, text):
		#Stick a glbal statment for emitting at the end onto the list (e.g. string literals)
		self.global_statments.append(text)

	def emit_global_statments(self):
		#Emit all the cached global statments
		for stmt in self.global_statments:
			self.emitl(stmt)

#Mapping of ASTNode type -> Transformer type
#Is a one-to-one mapping, but in some cases a transformer may match a more specific subclass of a ASTNode than another
# (in that case we always want the more specific match)
transformers={}
class TransformerMeta(type):
	#Metaclass for transformers that registers it
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
	transforms=None #This is either a single ASTNode subclass or a list of them that this Transofmrer is capable of matching
	def __init__(self, node, parent):
		self.node=node
		self.parent=parent

	def transform(self, out):
		#Returns a LLVM identifier string for the value of this ASTNode (assuming it has one) otherwise None
		pass

	def transform_address(self, out):
		#Required for stuff that can be the LHS of an AssignmentExpr. Should return a LLVM identifier string
		# for a local variable of type <get_type()>*, reffering to the memory address of the location it's value
		# is stored at
		pass

	def prepare(self, out):
		#Not required. For functiondecls and global decls, and file this will be called at import-resolution time
		# (as opposed to include-time) and should be used to declare types and variables etc
		pass 
	
	@staticmethod
	def get_type(node, out):
		#Returns a OType that is the type of the variable returned by transform()
		pass


def get_transformer_cls(node):
	match=None
	for item in transformers.keys():
		if isinstance(node, item) and (match is None or issubclass(item, match)):
			match=item

	if match is None:
		raise IndexError("No transformer for %s of type %s"%(str(node), str(type(node))))

	return transformers[match]

def get_transformer(node, parent):
	return get_transformer_cls(node)(node, parent)

def emit(out, node, parent=None):
	return get_transformer(node, parent).transform(out)

def emit_project(out, node, parent=None):
	get_transformer(node, parent).prepare(out)
	return get_transformer(node, parent).transform(out)

def get_type(node, out):
	if isinstance(node, str):
		return out.types[node]
	if isinstance(node, datamodel.OType):
		return node
	res = get_transformer_cls(node).get_type(node, out)
	if isinstance(res, datamodel.OType):
		return res
	return out.types[res]

def do_var_alloc(out, varname, type):
	name="var_"+out.get_name()+"___"+varname
	out.emitl("%{} = alloca {}".format(name, type.get_llvm_representation()))
	out.set_var_name(varname, "%"+name, type)
	return "%"+name

def call_func(name, argtypes, args, out):
	arg_values=[]
	for idx, arg in enumerate(args):
		arg_values.append(argtypes[idx]+" "+arg)
	return "call {} @{}({}) ;call_func".format(
		out.signatures[name].type.get_llvm_representation(),
		name,
		",".join(arg_values)
	)

def resolve_import(import_node, out):
	if import_node.absolute:
		return import_node.identifier
	else:
		if import_node.identifier in out.path_cache:
			return out.path_cache[import_node.identifier]

		for dir in out.searchpath:
			if os.path.isdir(dir):
				if import_node.identifier+".ort" in os.listdir(dir):
					result=os.path.join(dir, import_node.identifier+".ort")
					out.path_cache[import_node.identifier]=result
					return result
				elif import_node.identifier in os.listdir(dir):
					result=os.path.join(os.path.join(dir, import_node.identifier), "__init__.ort")
					out.path_cache[import_node.identifier]=result
					return result
		raise ImportError("No module `%s' found on search path"%import_node.identifier)

def sanitize_fn(fn):
	return fn.strip().replace(".ort","").replace("/","").replace(".","").replace("\\","").replace(" ","")

def ret_local(fn):
	#Wrap a transform or transform_addres function that returns the name of a local SSA ariable
	# sans-% and adds one.
	@functools.wraps(fn)
	def _wrapped(*a, **k):
		return "%"+fn(*a, **k)
	return _wrapped