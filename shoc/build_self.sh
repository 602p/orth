set -e
cd src
LD_LIBRARY_PATH=.. ../shoc_good main.ort -fno_strict_dup -oshoc "--gcc_x-L../../lib/unwind -lunwind_shim" $@
mv shoc ../shoc
cd ..