#!/usr/bin/python3
import os, colorama, subprocess, collections, enum, time, glob, sys

do_verbose="--verbose" in sys.argv
do_all_o="--all-opts" in sys.argv

CallResult = collections.namedtuple("CallResult", ["code", "text"])
Result = collections.namedtuple("Result", ["code", "text", "compile_time", "exec_time"])

class TestResult(enum.Enum):
	OK = 1
	COMPILE_FAILED = 2
	OUTPUT_MISMATCH = 3
	COMPILE_FAILED_CONSTRAINT = 4

def call(*args):
	try:
		return CallResult(0, subprocess.check_output(args, stderr=subprocess.STDOUT).decode("ascii", "ignore"))
	except subprocess.CalledProcessError as e:
		return CallResult(e.returncode, e.output.decode("ascii", "ignore"))
	except FileNotFoundError as e:
		return CallResult("FILENOTFOUND", "File not found")

failures=[]
total=0

def compile_orthc(path, executable_name="current_test.a", flags=[]):
	start = time.time()
	compiler_result = call("../compiler/orthc", path, "o:"+executable_name, *flags)
	elapsed = time.time() - start
	if compiler_result.code!=0:
		return Result(TestResult.COMPILE_FAILED, "Compile Failed:" + compiler_result.text, elapsed, 0)
	else:
		return Result(TestResult.OK, compiler_result.text, elapsed, 0)

def compile_shoc(path, executable_name="current_test.a", flags=[]):
	start = time.time()
	compiler_result = call("../shoc/shoc", path, "-o"+executable_name, *flags)
	elapsed = time.time() - start
	if compiler_result.code!=0:
		return Result(TestResult.COMPILE_FAILED, "Compile Failed:" + compiler_result.text, elapsed, 0)
	else:
		return Result(TestResult.OK, compiler_result.text, elapsed, 0)

def test_generic(source, compiler, args=[], stdout=None, code=0, expect_msg=None, expect_fail=False, **compiler_args):
	with open("current_test.ort", 'w') as fd:
		fd.write(source)
	compile_result = compiler("current_test.ort", **compiler_args)
	if expect_msg:
		if not expect_msg in compile_result.text:
			return Result(TestResult.COMPILE_FAILED_CONSTRAINT, repr(expect_msg)+" missing in "+repr(compile_result.text), compile_result.compile_time, 0)
	if not expect_fail and compile_result.code!=TestResult.OK:
		return compile_result
	if expect_fail and compile_result.code==TestResult.OK:
		return Result(TestResult.COMPILE_FAILED_CONSTRAINT, "Should not have compiled", compile_result.compile_time, 0)
	start = time.time()
	call_result = call("./current_test.a", *args)
	elapsed = time.time() - start
	if call_result.code!=code:
		return Result(TestResult.OUTPUT_MISMATCH, "Return code: "+str(call_result.code)+"!="+str(code), compile_result.compile_time, elapsed)
	if stdout is not None and call_result.text!=stdout:
		return Result(TestResult.OUTPUT_MISMATCH, "Stdout mismatch: "+repr(call_result.text)+"!="+repr(stdout), compile_result.compile_time, elapsed)
	return Result(TestResult.OK, "", compile_result.compile_time, elapsed)

def process_result(name, result, verbose=False):
	global total
	global failures
	total+=1
	s="c(%fs) r(%fs) "%(result.compile_time, result.exec_time)
	s+="["
	if result.code==TestResult.OK:
		s+=colorama.Fore.GREEN+" OK "
	elif result.code==TestResult.COMPILE_FAILED:
		s+=colorama.Fore.MAGENTA+"FAIL"
		failures.append(name)
	elif result.code==TestResult.OUTPUT_MISMATCH:
		s+=colorama.Fore.RED+"FAIL"
		failures.append(name)
	elif result.code==TestResult.COMPILE_FAILED_CONSTRAINT:
		s+=colorama.Fore.YELLOW+"FAIL"
		failures.append(name)
	s+=colorama.Style.RESET_ALL+"]: "
	s+=name+"\t"
	if result.code==TestResult.OK:
		s+="passed"
	elif result.code==TestResult.COMPILE_FAILED:
		s+="failed (compile failed)"
	elif result.code==TestResult.OUTPUT_MISMATCH:
		s+="failed (output mismatch)"
	elif result.code==TestResult.COMPILE_FAILED_CONSTRAINT:
		s+="failed (constraint failed)"
	if result.text and verbose:
		s+="- "+result.text
	print(s)

def test_shoc(name, source, stdout=None, code=0, disable_all_o=False, **k):
	if not "--no-shoc" in sys.argv:
		if do_all_o and not disable_all_o:
			k.setdefault("flags", [])
			k["flags"].append("-O1")
			process_result(name+"-S-O1", test_generic(source, compile_shoc, code=code, stdout=stdout, **k), verbose=do_verbose)
			k["flags"][-1]="-O2"
			process_result(name+"-S-O2", test_generic(source, compile_shoc, code=code, stdout=stdout, **k), verbose=do_verbose)
			k["flags"][-1]="-O3"
			process_result(name+"-S-O3", test_generic(source, compile_shoc, code=code, stdout=stdout, **k), verbose=do_verbose)
			k["flags"][-1]="-O0"
			process_result(name+"-S-O0", test_generic(source, compile_shoc, code=code, stdout=stdout, **k), verbose=do_verbose)
		else:
			process_result(name+"-SHOC", test_generic(source, compile_shoc, code=code, stdout=stdout, **k), verbose=do_verbose)


def test_orthc(name, source, stdout=None, code=0, **k):
	if not "--no-orthc" in sys.argv: process_result(name+"-GEN1", test_generic(source, compile_orthc, code=code, stdout=stdout, **k), verbose=do_verbose)

def test_both(*a, **k):
	test_orthc(*a, **k)
	test_shoc(*a, **k)

def print_bar(name):
	total_len=80
	wo_name=total_len-len(name)
	half_bar=wo_name//2
	print()
	print((half_bar*"=")+name+(half_bar*"=")+("=" if half_bar*2+len(name)!=total_len else ""))

prefix=""
for i in sys.argv:
	if i.startswith("--run="):
		prefix=i.replace("--run=", "", 1)+"/"

start = time.time()
for fn in glob.iglob(prefix+"**", recursive=True):
	if "run_tests" not in fn and fn.endswith(".py"):
		print_bar(fn)
		exec(open(fn, 'r').read())
total_time = time.time() - start

print_bar("OVERALL")
if len(failures)==0:
	print(colorama.Back.GREEN+colorama.Fore.BLACK+("Success! Ran %i tests in %f seconds with no failures"%(total, total_time))+colorama.Style.RESET_ALL)
else:
	print(colorama.Back.RED+colorama.Fore.BLACK+("Failure! Ran %i tests in %f seconds with %i failures"%(total, total_time, len(failures)))+colorama.Style.RESET_ALL)
	for i in failures:
		print(" - "+i)

os.system("rm current_test.ort current_test.a")