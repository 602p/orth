import datamodel, transform

def process_intrinsic(out, text):
	def sizeof(cls):
			name=out.get_temp_name()
			out.emitl("%{} = add i32 0, {}".format(name, int(cls.get_size())))
			return name

	def forcecast(name, to_):
		val=out.get_temp_name()
		out.emitl("%{} = load {}* %{}".format(
			val,
			out.get_var_type(name).get_llvm_representation(),
			out.get_var_name(name)
		))
		res=out.get_temp_name()
		out.emitl("%{} = bitcast {} %{} to {}".format(
			res,
			out.get_var_type(name).get_llvm_representation(),
			val,
			to_
		))
		return res

	def declare_c_func(name, type, paramstring):
		rt=datamodel.builtin_types[type]
		out.emitl("declare {} @{}{}".format(rt.get_llvm_representation(), name, paramstring))
		out.signatures[name]=datamodel.ManualFunctionOType(name, paramstring, rt)

	def expose_symbol(name, type):
		out.set_var_name(name, name, datamodel.builtin_types[type])

	def include(filename):
		import tokenize, parse
		with out.context(file=filename.split("/")[-1].split(".")[0]):
			transform.emit(out, parse.parse(tokenize.tokenize(open(filename, 'r').read())), "imp")

	def declclass(name, fields):
		out.types[name]=datamodel.StructOType(name, fields, out)
		out.types[name].setup(out)

	locals().update(out.types) #TODO: Change

	return eval(text[1:-1])

def get_type(out, text):
	if "sizeof" in text:
		return datamodel.builtin_types['int']