#!/bin/bash

mkdir isodir
mkdir isodir/boot
mkdir isodir/boot/grub
set -e
export PATH="$PATH:$HOME/opt/cross/bin:$HOME/Documents/orth/compiler"
cd kernel
nasm -f elf boot.s -o boot.o
nasm -f elf irq.s -o irq.o
nasm -f elf thunk.s -o thunk.o
orthc kernel.ort _ nolink nobuild noclean funchooks
llc out.ll -march=x86
i686-elf-as out.s -o kernel.o
i686-elf-gcc -T linker.ld -o louos.bin -ffreestanding -O2 -nostdlib boot.o irq.o kernel.o -lgcc -mno-red-zone
cd ..
cp kernel/louos.bin isodir/boot/louos.bin
cp grub.cfg isodir/boot/grub/grub.cfg
cp modules/testimage* isodir/boot/
grub-mkrescue -o louos.iso isodir
false
rm kernel/out.s
rm kernel/out.ll
rm kernel/kernel.o
rm kernel/boot.o
rm kernel/louos.bin
echo
echo
echo "###DONE###"
