set -e
cd src
../shoc main.ort -fno_strict_dup -oshoc $@
mv shoc ../shoc
cd ..