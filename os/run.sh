#!/bin/bash

qemu-system-i386 -cdrom louos.iso -monitor stdio -no-shutdown -no-reboot -d cpu_reset -serial file:serial.log