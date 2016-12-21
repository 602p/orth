	.text
	.file	"out.ll"
	.globl	foo
	.align	16, 0x90
	.type	foo,@function
foo:                                    # @foo
	.cfi_startproc
# BB#0:
	retl
.Ltmp0:
	.size	foo, .Ltmp0-foo
	.cfi_endproc

	.globl	mod_entry
	.align	16, 0x90
	.type	mod_entry,@function
mod_entry:                              # @mod_entry
	.cfi_startproc
# BB#0:
	subl	$12, %esp
.Ltmp1:
	.cfi_def_cfa_offset 16
	movl	16(%esp), %eax
	movl	%eax, 8(%esp)
	movl	$3, (%esp)
	calll	*%eax
	calll	foo
	xorl	%eax, %eax
	addl	$12, %esp
	retl
.Ltmp2:
	.size	mod_entry, .Ltmp2-mod_entry
	.cfi_endproc


	.section	".note.GNU-stack","",@progbits
