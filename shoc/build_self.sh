set -e
cd src
../shoc_good main.ort -fno_strict_dup -oshoc "--gcc_x../../lib/unwind/unwind_shim.o -lunwind" $@
mv shoc ../shoc
cd ..