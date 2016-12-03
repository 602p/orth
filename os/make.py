import os
def r(s):
	if os.system(s):
		raise Exception("Command `%s` failed"%s)

r("i686-elf-as boot.s -o boot.o")
r("orthc kernel.ort _ nolink nobuild")
r("llc out.ll -march=x86")
r("i686-elf-as out.s -o kernel.o")
r("i686-elf-gcc -T linker.ld -o louos.bin -ffreestanding -O2 -nostdlib boot.o kernel.o -lgcc")
r("cp louos.bin isodir/boot/louos.bin")
r("cp grub.cfg isodir/boot/grub/grub.cfg")
r("grub-mkrescue -o louos.iso isodir")