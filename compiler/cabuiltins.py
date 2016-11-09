import caclass

caint=caclass.CAClass("int", primitive="i32")
cafloat=caclass.CAClass("float", primitive="float")
cabool=caclass.CAClass("bool", primitive="i8")
cachar=caclass.CAClass("char", primitive="i8")

builtins=caclass.CANamespace("builtin", {
	"int":caint,
	"float":cafloat,
	"bool":cabool,
	"char":cachar
})
