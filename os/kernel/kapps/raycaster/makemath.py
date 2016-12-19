import math, struct

def makestr(f):
	nums=[int(i) for i in struct.pack("<d", f)]
	return "".join("\\x"+("0" if i<16 else "")+hex(i)[2:] for i in nums)


with open('rcmath.ort', 'w') as f:
	f.write("""
@declare_func("llvm.sqrt.f64", "float", "(double)")@
@llvmraw("define double @sqrt(double %val){%ret = call double @llvm.sqrt.f64(double %val)\\nret double %ret}")@
@register_func("sqrt", "float", "(double)")@
type RCFloatBox is packed
	float v
endtype

function(float angle) rcsin -> float does
	if angle<0. do
		angle=-angle
	done
	int lookup_idx=angle|int%360
	ptr table=\"""")
	for i in range(0, 365):
		f.write(makestr(math.sin(math.radians(i))))
	f.write("""\"|ptr
return (table:offset(lookup_idx*8)|RCFloatBox).v
""")
	f.write("""
function(float angle) rccos -> float does
	if angle<0. do
		angle=-angle
	done
	int lookup_idx=angle|int%360
	ptr table=\"""")
	for i in range(0, 365):
		f.write(makestr(math.cos(math.radians(i))))
	f.write("""\"|ptr
return (table:offset(lookup_idx*8)|RCFloatBox).v
""")