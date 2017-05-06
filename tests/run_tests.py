#!/usr/bin/python3
import os, colorama, subprocess

class SubprocessReturnValue:
	def __init__(self, code, value):
		self.code=code
		self.value=value.decode('ascii', 'ignore')

	def __str__(self): return self.value
	def __eq__(self, other): return other==self.value
	def __contains__(self, k): return k in self.value

def call(*args):
	try:
		return SubprocessReturnValue(0, subprocess.check_output(args))
	except subprocess.CalledProcessError as e:
		return SubprocessReturnValue(e.returncode, e.output)

failures=0
total=0

for fname in os.listdir("."):
	if fname.endswith(".ort"):
		total+=1
		print("Running test %s..."%fname, end="")
		if call("../compiler/orthc", "./%s"%fname, "o:test").code!=0:
			failures+=1
			print(colorama.Fore.RED+"[FAILED: Failed to build]"+colorama.Style.RESET_ALL)
		else:
			res=call("./test")
			if res.code!=0:
				failures+=1
				print(colorama.Fore.RED+"[FAILED: Exit code nonzero]"+colorama.Style.RESET_ALL)
			else:
				with open("./%s"%fname, 'r') as fd:
					if fd.readline().strip().rstrip().replace("#","",1)!=res.value.strip().rstrip():
						failures+=1
						print(colorama.Fore.RED+"[FAILED: Mismatching print]"+colorama.Style.RESET_ALL)
					else:
						print(colorama.Fore.GREEN+"[SUCCESS]"+colorama.Style.RESET_ALL)

if failures==0:
	print(colorama.Fore.GREEN+("Success! Ran %i tests with no failures"%total)+colorama.Style.RESET_ALL)
else:
	print(colorama.Fore.RED+("Failure! Ran %i tests with %i failures"%(total, failures))+colorama.Style.RESET_ALL)