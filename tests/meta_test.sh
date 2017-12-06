cd ../shoc

cp shoc shoc_selfhost_test
./experimental_build.sh -fno_bc_increase
cat shoc_selfhost_test | xxd > shoc_selfhost_test.xxd
cat shoc | xxd > shoc.xxd
diff shoc_selfhost_test.xxd shoc.xxd

cp shoc shoc_selfhost_test
./experimental_build.sh -fno_bc_increase
cat shoc_selfhost_test | xxd > shoc_selfhost_test.xxd
cat shoc | xxd > shoc.xxd
diff shoc_selfhost_test.xxd shoc.xxd

rm shoc_selfhost_test*
rm *.xxd