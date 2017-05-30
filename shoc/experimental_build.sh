set -e
cd src
../shoc main.ort -fno_strict_dup -oshoc $@
mv shoc ../shoc
cd ..
echo $(expr 1 + $(cat build_count.txt)) > build_count.txt
echo
echo "SHOC Built. Self-builds: " $(cat build_count.txt)