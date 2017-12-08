set -e
#./build_self.sh
cd src
../shoc datamodel_testbed.ort "--gcc_x../../lib/unwind/unwind_shim.o -lunwind" -fshow_commandlines -wtypes && ./out
