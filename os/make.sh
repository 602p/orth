#!/bin/bash

mkdir isodir
mkdir isodir/boot
mkdir isodir/boot/grub
export PATH="$PATH:$HOME/Documents/louos/crosscc/out_bin/bin:$HOME/Documents/caste/compiler"
nasm -f elf boot.s -o boot.o
orthc kernel.ort _ nolink nobuild
llc out.ll -march=x86
i686-elf-as out.s -o kernel.o
i686-elf-gcc -T linker.ld -o louos.bin -ffreestanding -O2 -nostdlib boot.o kernel.o -lgcc
cp louos.bin isodir/boot/louos.bin
cp grub.cfg isodir/boot/grub/grub.cfg
grub-mkrescue -o louos.iso isodir
rm out.s
rm out.ll
rm kernel.o
rm boot.o
rm louos.bin
echo
echo
echo "###DONE###"