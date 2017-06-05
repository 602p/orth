set -e
cd src
../shoc_good main.ort -fno_strict_dup -oshoc $@
mv shoc ../shoc
cd ..