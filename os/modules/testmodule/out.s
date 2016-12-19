	.text
	.file	"out.ll"
	.globl	mod_entry
	.align	16, 0x90
	.type	mod_entry,@function
mod_entry:                              # @mod_entry
	.cfi_startproc
# BB#0:
	pushl	%eax
.Ltmp0:
	.cfi_def_cfa_offset 8
	movl	$3, (%esp)
	movl	$7, (%esp)
	movl	$10, (%esp)
	movl	$10, %eax
	popl	%edx
	retl
.Ltmp1:
	.size	mod_entry, .Ltmp1-mod_entry
	.cfi_endproc

	.type	_the_zero_double,@object # @_the_zero_double
	.bss
	.globl	_the_zero_double
	.align	8
_the_zero_double:
	.quad	0                       # double 0
	.size	_the_zero_double, 8


	.section	".note.GNU-stack","",@progbits
