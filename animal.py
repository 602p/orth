class Animal:
	def __init__(self, name):
		self.name=name

	def say_hi(self):
		print("%s says %s!"%(self.name, self.get_sound()))

class Dog(Animal):
	def get_sound(self):
		return "woof"

class Cat(Animal):
	def get_sound(self):
		return "meow"

class Gopher(Animal):
	def get_sound(self):
		return "lol no generics"

Cat("Foo").say_hi()