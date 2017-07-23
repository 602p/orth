# orth
Orth is a looosley statically typed, Object Oriented, C and Python inspired systems programming language. It allows much of the same functionality as C, with a focus on elegance and cleanliness of syntax.
It's easy to learn, if you know C you know the fundamentals of orth:

```
import std

function() main -> int does
  printf("Hello, world!\n")
return 0
```

And if you know C and Python you'll understand the OOP scheme:

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
  return year - self.age
endtype

function() main -> int does
  Person bob = Person::new("Bob", "Spuser", 1942)
  printf("%s %s is %i years old\n", bob.first_name, bob.last_name, bob:get_age(2016))
return 0
```

Check out some larger, low-level usage examples from the kernel in this repo (with syntax highlighting!) [here](http://louis.goessling.com/orth/os/kernel.ort.html) (import statements are links)

Orth is still a low-level language, meaning you still need to watch your memory managment and whatnot, but abstractions provided with the OOP ideas work with that simplicity, not against it.

### Compiling Orth
1. Write a program, feel free to crib the hello world example
2. Install python 3 if not already done (should provide a `/usr/bin/python3`)
3. Install LLVM 3.5 (should provide a `llc`)
4. Install GCC (basically any modern version, should provide a `gcc`)
5. Run `orthc <your_file_name>`
6. Observe and run your new ELF executable with `./out`

### Running the Self-Hosting compiler
1. Once you have orthc up and running, head into the shoc directory and run `./py_build` This will probably take ~30 seconds
2. This should produce a `shoc` executable with a similar-but-not-the-same command line interface (flags - documented in `args.txt` - are different)
3. Run `./experimental_build.sh` and shoc will rebuild itself
4. If this worked, copy `shoc` to `shoc_good` to use `./build_self.sh` for further development without breaking the working compiler
5. Now you got a bona-fide orth-in-orth compiler in shoc. Should be compatible with samples stuff - e.g. `./shoc ../samples/http.ort && ./out 5001` to serve a demo web server on localhost:5001

### Running the OS
 * If you want to run the OS, you'll need a i386 cross-compiler GCC toolchain (gcc/as/ld,) and my build scripts will probably need some PATH tweaking, but with that set up in the path you should be able to run the `build.sh` script in the os folder
 
 The OS should run on QEMU/VirtualBox/etc _and_ on REAL x86 HARDWARE! Should run just fine on modern computers too (but may misbehave at high resolutions with computers with dGPUs.) If you wanna play around with it, `snake` and `rc` are cool toys on the kernel shell.
 Some cool screenshots of the OS in action:
 ![Image of VESA framebuffer terminal](https://raw.githubusercontent.com/602p/orth/master/docs/image/emu2.png)
 ![Image of Raycaster](https://raw.githubusercontent.com/602p/orth/master/docs/image/raycast.png)
