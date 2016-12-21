
set -e
export PATH="$PATH:$HOME/Documents/gcc-i686/builddir/bin:$HOME/Documents/orth/compiler"

orthc module.ort _ nolink nobuild no0double
llc out.ll -march=x86
i686-elf-as out.s -o mod.o

i686-elf-gcc -o mod.bin -T linker.ld  -ffreestanding -nostdlib mod.o -lgcc -fPIE -Wl,-R ../../isodir/boot/louos.bin

cp mod.bin ../../isodir/boot/test.bin