from collections import OrderedDict

class CANamespace:
	def __init__(self, name, refs=None):
		self.name=name
		self.references=refs if refs else OrderedDict()

class CAClass(CANamespace):
	def __init__(self, name, refs=None, slots=None, methods=None, primitive=False):
		super().__init__(name, refs)
		self.slots=slots if slots else OrderedDict()
		self.methods=methods if methods else OrderedDict()
		self.primitive=primitive

	def get_ir_identifier(self):
		if self.primitive: return self.primitive
		return "ca_"+self.name #TODO: Inculde namespacing

	def emit_struct_ir(self, irwriter):
		if self.primitive: return
		irwriter.emitl("%"+self.get_ir_identifier()+" = type {")
		irwriter.pushindent()
		for name, caclass in self.slots.items():
			irwriter.emitl(caclass.get_ir_identifier()+", //"+name)
		irwriter.popindent()
		irwriter.emitl("}")
