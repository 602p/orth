
set -e
export PATH="$PATH:$HOME/Documents/gcc-i686/builddir/bin:$HOME/Documents/orth/compiler"

nasm -f elf strap.s -o strap.o
orthc module.ort _ nolink nobuild
llc out.ll -march=x86 -relocation-model=pic
i686-elf-as out.s -o mod.o

i686-elf-gcc -T link.ld -o mod.bin -ffreestanding -O2 -nostdlib strap.o mod.o -lgcc -fPIC

cp mod.bin ../../isodir/boot/test.bin