import struct
from math import sin, cos

def makestr(f):
	nums=[int(i) for i in struct.pack("<d", f)]
	return "".join("\\x"+("0" if i<16 else "")+hex(i)[2:] for i in nums)


with open('rcrots.ort', 'w') as f:
	f.write("""
type RCRotState is packed
	float dirX
	float dirY
	float planeX
	float planeY
endtype

function() rcrot_get__ -> ptr does
return \"""")

	dirX = 1
	dirY = 0
	planeX=0
	planeY=0.66
	frametime=0.054
	rotSpeed=frametime*2

	for i in range(0,360):
		f.write(makestr(dirX))
		f.write(makestr(dirY))
		f.write(makestr(planeX))
		f.write(makestr(planeY))
		oldDirX = dirX
		dirX = dirX * cos(rotSpeed) - dirY * sin(rotSpeed)
		dirY = oldDirX * sin(rotSpeed) + dirY * cos(rotSpeed)
		oldPlaneX = planeX
		planeX = planeX * cos(rotSpeed) - planeY * sin(rotSpeed)
		planeY = oldPlaneX * sin(rotSpeed) + planeY * cos(rotSpeed)

	f.write("""\"|ptr
function(int state) rcrot_get_for -> RCRotState does
	state=state%360
return rcrot_get__():offset(32*state)|RCRotState""")