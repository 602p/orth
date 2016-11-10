import collections

class IRWriter:
	def __init__(self, fd):
		self.fd=fd #output file (should provide write(...) at least)
		self.indentation=0 #level of indentation to write with

	def pushindent(self, levels=1): self.indentation+=levels
	def popindent(self, levels=1): self.indentation-=levels

	def emiti(self):
		self.emit("\t"*self.indentation)

	def emitl(self, line):
		self.emiti()
		self.emit(line+"\n")

	def emit(self, text):
		self.fd.write(text)