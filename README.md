# orth
Orth is a looosley statically typed, Object Oriented, C and Python inspired systems programming language. It allows much of the same functionality as C, with a focus on elegance and cleanliness of syntax.
It's easy to learn, if you know C you know the fundamentals of orth:

```
import std

function() main -> int does
  printf("Hello, world!\n")
return 0
```

And if you know C and Python you understand the OOP scheme:

```
import std

type Person is
  cstr first_name
  cstr last_name
  int age
  
  function(cstr first, cstr last, int age) Person::new -> Person does
    Person new = malloc(@sizeof(Person)@)|Person
    new.first_name=first
    new.last_name=last
    new.age=age
  return new
  
  function(Person self, int year) Person:get_age -> int does
  retrun year - self.age
endtype

function() main -> int does
  Person bob = Person::new("Bob", "Spuser", 1942)
  printf("%s %s is %i years old\n", bob.first_name, bob.last_name, bob:get_age(2016))
return 0
```

Orth is still a low-level language, meaning you still need to watch your memory managment and whatnot, but abstractions provided with the OOP ideas work with that simplicity, not against it.

##Compiling Orth
1. Write a program, feel free to crib the hello world example
2. Install python 3 if not already done (should provide a `/usr/bin/python3`)
3. Install LLVM 3.5 (should provide a `llc`)
4. Install GCC (basically any modern version, should provide a `gcc`)
5. Run `orthc <your_file_name>`
6. Observe and run your new ELF executable with `./out`
