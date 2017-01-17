import datamodel, transform

#Called on expressions of the form @something@. Should process it into a LLVM identifier value
def process_intrinsic(out, text):
	def sizeof(cls):
			name=out.get_temp_name()
			out.emitl("%{} = add i32 0, {}".format(name, int(cls.get_size())))
			return "%"+name

	def forcecast(name, to_):
		#Only useful before | operator worked. Now just handy to have for cases where weird crap is needed
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
		return "%"+res

	def declare_c_func(name, type, paramstring):
		#Provide a prototype for an external function (that is, will be linked at compile-time)
		#Equivilent of ASM extern or C function prototype
		if name not in out.signatures:
			rt=datamodel.builtin_types[type]
			out.emitl("declare {} @{}{}".format(rt.get_llvm_representation(), name, paramstring))
			out.set_signature(name, datamodel.ManualFunctionOType(name, paramstring, rt))

	declare_func=declare_c_func #Not all externs are C

	def declare_symbol(name, type):
		out.set_var_name(name, "@"+name, datamodel.builtin_types[type])
		out.add_global_stmt("@"+name+" = external global "+datamodel.builtin_types[type].get_llvm_representation())

	def include(filename):
		#OLD, DEPRECATED method to split projects, now use import <name> or import "<path>"
		if filename in out.included_files:
			out.emitl(";;;OMITTING INCLUDE `"+filename+"`, PREVIOUSLY INCLUDED")
			return
		out.included_files.append(filename)
		import tokenize, parse
		with out.context(file=filename.split("/")[-1].split(".")[0]):
			transform.emit(out, parse.parse(tokenize.tokenize(open(filename, 'r').read())), "imp")

	def declclass(name, fields):
		#Old method for typedecls
		out.types[name]=datamodel.StructOType(name, fields, out)
		out.types[name].setup(out)

	def storeb(from_, to):
		#Hack from before I had pointer indexing
		ptr=out.get_temp_name()
		out.emitl("%{} = load i8** %{}".format(ptr, out.get_var_name(to)))
		val=out.get_temp_name()
		out.emitl("%{} = load i8* %{}".format(val, out.get_var_name(from_)))
		out.emitl("store i8 %{}, i8* %{}".format(val, ptr))

	def llvmraw(text):
		out.emitl(text)

	def register_func(name, rt, argstring):
		out.set_signature(name, datamodel.ManualFunctionOType(name, argstring, datamodel.builtin_types[rt]))

	#Horrible hack to allow @sizeof(SomeClass)@ without quotes
	locals().update(out.types) #TODO: Change

	return eval(text[1:-1]) #Bad bad very bad shame

def get_type(out, text):
	#Hack to get the type of a intrinsic return value. Only one that actually returns a value is sizeof
	if "sizeof" in text:
		return datamodel.builtin_types['int']
