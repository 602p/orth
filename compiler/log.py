
#Shame on me, non-reentrant logger, i know

class LogLevel:
	def __init__(self, name, color="", fix=""):
		self.name=name
		self.color=color
		self.fix=fix
		self.prefix=fix+name+fix

	def fmt(self, string):
		return "  ["+self.color+self.prefix+"\033[0m]  "+string

	def __call__(self, string):
		print(self.fmt(string))

debug  = LogLevel(" DEBUG")
info   = LogLevel("INFO", fix=" ")
status = LogLevel("STATUS", "\033[1m")
warn   = LogLevel("WARN", "\033[1;33m", "?")
error = LogLevel("UERROR", "\033[41m", "!")
fail   = LogLevel("FAIL", "\033[1;41;", "*")

loglevel = info