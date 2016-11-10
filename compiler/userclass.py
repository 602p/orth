import cabuiltins
import caclass
import emit, sys
import os
from util import CODict

foo=caclass.CAClass("foo", slots=CODict
	(age=cabuiltins.caint)
	(height=cabuiltins.cafloat)
)

bar=caclass.CAClass("bar", slots=CODict
	(count=cabuiltins.caint)
	(foo=caclass.pointerto(foo))
)

writer=emit.IRWriter(sys.stdout)
foo.emit_struct_ir(writer)
bar.emit_struct_ir(writer)