alias cfm="mv shoc shoc_good"
alias rbt="./build_self.sh && t"
alias t="./shoc test.ort -fno_fold -fdump_gir -fdo_asm_out && cat assembly_out.s"
alias fab="as assembly_out.s -o obj.o && gcc obj.o && ./a.out"
