import math

with open('rcmath.ort', 'w') as f:
	f.write("""
type RCFloatBox is packed
	float v
endtype

function(float angle) rcsin -> float does
	
""")