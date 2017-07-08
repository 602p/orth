set -e
clear
../../shoc/shoc main.ort -operegrine -s../../shoc/lib -v -fno_gir -fdump_methods -ffunchooks $@
./peregrine