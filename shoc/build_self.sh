set -e
cd src
../shoc main.ort -s../lib -s../../lib -fno_strict_dup -fdo_llvm_out $@
llc-3.5 llvm_out.ir
gcc llvm_out.ir.s
mv a.out ../shoc
cd ..
echo $(expr 1 + $(cat build_count.txt)) > build_count.txt
echo "SHOC Built. Self-builds: " $(cat build_count.txt)