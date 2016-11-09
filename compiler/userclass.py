import cabuiltins
import caclass

foo=caclass.CAClass("foo", slots={
	"age":cabuiltins.caint,
	"height":cabuiltins.cafloat
})

class DummyWriter:
	def emitl(self, line):print(line)
	def pushindent(self):print("<push indent>")
	def popindent(self):print("<pop indent>")

foo.emit_struct_ir(DummyWriter())
