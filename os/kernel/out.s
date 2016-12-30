	.text
	.file	"out.ll"
	.globl	sqrt
	.align	16, 0x90
	.type	sqrt,@function
sqrt:                                   # @sqrt
	.cfi_startproc
# BB#0:
	fldl	4(%esp)
	fsqrt
	retl
.Ltmp0:
	.size	sqrt, .Ltmp0-sqrt
	.cfi_endproc

	.globl	KMM$$init
	.align	16, 0x90
	.type	KMM$$init,@function
KMM$$init:                              # @"KMM$$init"
	.cfi_startproc
# BB#0:
	pushl	%eax
.Ltmp1:
	.cfi_def_cfa_offset 8
	movl	8(%esp), %eax
	movl	%eax, (%esp)
	movl	%eax, gvar_fmm_mu_lu_n1__mm_head
	movl	%eax, gvar_fmm_mu_lu_n2__mm_pos
	movl	$-559038737, gvar_fmm_mu_lu_n3__last_alloc # imm = 0xFFFFFFFFDEADBEEF
	popl	%eax
	retl
.Ltmp2:
	.size	KMM$$init, .Ltmp2-KMM$$init
	.cfi_endproc

	.globl	malloc
	.align	16, 0x90
	.type	malloc,@function
malloc:                                 # @malloc
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp3:
	.cfi_def_cfa_offset 32
	movl	32(%esp), %eax
	movl	%eax, 24(%esp)
	movl	gvar_fmm_mu_lu_n2__mm_pos, %eax
	movl	%eax, 20(%esp)
	movl	gvar_fmm_mu_lu_n2__mm_pos, %eax
	movl	24(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	ptr$offset
	movl	%eax, gvar_fmm_mu_lu_n2__mm_pos
	movl	20(%esp), %eax
	movl	%eax, gvar_fmm_mu_lu_n3__last_alloc
	movl	20(%esp), %eax
	addl	$28, %esp
	retl
.Ltmp4:
	.size	malloc, .Ltmp4-malloc
	.cfi_endproc

	.globl	malign
	.align	16, 0x90
	.type	malign,@function
malign:                                 # @malign
	.cfi_startproc
# BB#0:
	pushl	%esi
.Ltmp5:
	.cfi_def_cfa_offset 8
	subl	$24, %esp
.Ltmp6:
	.cfi_def_cfa_offset 32
.Ltmp7:
	.cfi_offset %esi, -8
	movl	32(%esp), %esi
	movl	%esi, 20(%esp)
	movl	gvar_fmm_mu_lu_n2__mm_pos, %ecx
	movl	%ecx, %eax
	cltd
	idivl	%esi
	subl	%edx, %esi
	movl	%esi, 4(%esp)
	movl	%ecx, (%esp)
	calll	ptr$offset
	movl	%eax, gvar_fmm_mu_lu_n2__mm_pos
	addl	$24, %esp
	popl	%esi
	retl
.Ltmp8:
	.size	malign, .Ltmp8-malign
	.cfi_endproc

	.globl	free
	.align	16, 0x90
	.type	free,@function
free:                                   # @free
	.cfi_startproc
# BB#0:
	pushl	%eax
.Ltmp9:
	.cfi_def_cfa_offset 8
	movl	8(%esp), %eax
	movl	%eax, (%esp)
	cmpl	%eax, gvar_fmm_mu_lu_n3__last_alloc
	jne	.LBB4_2
# BB#1:                                 # %if_fmm_mfree_l27_n50___SUCC
	movl	gvar_fmm_mu_lu_n3__last_alloc, %eax
	movl	%eax, gvar_fmm_mu_lu_n2__mm_pos
	movl	$-559038737, gvar_fmm_mu_lu_n3__last_alloc # imm = 0xFFFFFFFFDEADBEEF
.LBB4_2:                                # %if_fmm_mfree_l27_n50___DONE
	popl	%eax
	retl
.Ltmp10:
	.size	free, .Ltmp10-free
	.cfi_endproc

	.globl	memset
	.align	16, 0x90
	.type	memset,@function
memset:                                 # @memset
	.cfi_startproc
# BB#0:
	subl	$16, %esp
.Ltmp11:
	.cfi_def_cfa_offset 20
	movb	28(%esp), %al
	movl	24(%esp), %ecx
	movl	20(%esp), %edx
	movl	%edx, 12(%esp)
	movl	%ecx, 8(%esp)
	movb	%al, 7(%esp)
	movl	$0, (%esp)
	cmpl	$0, 8(%esp)
	jle	.LBB5_2
	.align	16, 0x90
.LBB5_1:                                # %fmm_mmemset_l35_n59___LOOP___HEAD
                                        # =>This Inner Loop Header: Depth=1
	movl	12(%esp), %eax
	movl	(%esp), %ecx
	movb	7(%esp), %dl
	movb	%dl, (%eax,%ecx)
	movl	(%esp), %eax
	incl	%eax
	movl	%eax, (%esp)
	cmpl	8(%esp), %eax
	jl	.LBB5_1
.LBB5_2:                                # %fmm_mmemset_l35_n59___LOOP___END
	addl	$16, %esp
	retl
.Ltmp12:
	.size	memset, .Ltmp12-memset
	.cfi_endproc

	.globl	memcpy
	.align	16, 0x90
	.type	memcpy,@function
memcpy:                                 # @memcpy
	.cfi_startproc
# BB#0:
	subl	$16, %esp
.Ltmp13:
	.cfi_def_cfa_offset 20
	movl	28(%esp), %eax
	movl	24(%esp), %ecx
	movl	20(%esp), %edx
	movl	%edx, 12(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$0, (%esp)
	cmpl	$0, 4(%esp)
	jle	.LBB6_2
	.align	16, 0x90
.LBB6_1:                                # %fmm_mmemcpy_l43_n80___LOOP___HEAD
                                        # =>This Inner Loop Header: Depth=1
	movl	8(%esp), %eax
	movl	(%esp), %ecx
	movl	12(%esp), %edx
	movb	(%edx,%ecx), %dl
	movb	%dl, (%eax,%ecx)
	movl	(%esp), %eax
	incl	%eax
	movl	%eax, (%esp)
	cmpl	4(%esp), %eax
	jl	.LBB6_1
.LBB6_2:                                # %fmm_mmemcpy_l43_n80___LOOP___END
	addl	$16, %esp
	retl
.Ltmp14:
	.size	memcpy, .Ltmp14-memcpy
	.cfi_endproc

	.globl	ptr$offset
	.align	16, 0x90
	.type	ptr$offset,@function
ptr$offset:                             # @"ptr$offset"
	.cfi_startproc
# BB#0:
	subl	$8, %esp
.Ltmp15:
	.cfi_def_cfa_offset 12
	movl	16(%esp), %eax
	movl	12(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	addl	4(%esp), %eax
	addl	$8, %esp
	retl
.Ltmp16:
	.size	ptr$offset, .Ltmp16-ptr$offset
	.cfi_endproc

	.globl	GDTEntry$$new
	.align	16, 0x90
	.type	GDTEntry$$new,@function
GDTEntry$$new:                          # @"GDTEntry$$new"
	.cfi_startproc
# BB#0:
	pushl	%esi
.Ltmp17:
	.cfi_def_cfa_offset 8
	subl	$40, %esp
.Ltmp18:
	.cfi_def_cfa_offset 48
.Ltmp19:
	.cfi_offset %esi, -8
	movb	60(%esp), %al
	movb	56(%esp), %cl
	movl	52(%esp), %edx
	movl	48(%esp), %esi
	movl	%esi, 36(%esp)
	movl	%edx, 32(%esp)
	andb	$1, %cl
	movb	%cl, 31(%esp)
	andb	$1, %al
	movb	%al, 30(%esp)
	movl	$8, (%esp)
	calll	malloc
	movl	%eax, 24(%esp)
	movl	32(%esp), %eax
	subl	36(%esp), %eax
	movl	%eax, 20(%esp)
	movb	$0, 19(%esp)
	cmpl	$1048576, 20(%esp)      # imm = 0x100000
	jb	.LBB8_2
# BB#1:                                 # %if_fmm_mGDTEntry$$new_l68_n130___SUCC
	shrl	$12, 20(%esp)
	movb	$1, 19(%esp)
.LBB8_2:                                # %if_fmm_mGDTEntry$$new_l68_n130___DONE
	movl	24(%esp), %eax
	movw	20(%esp), %cx
	movw	%cx, (%eax)
	movl	24(%esp), %eax
	movzwl	22(%esp), %ecx
	andl	$15, %ecx
	movb	%cl, 6(%eax)
	movl	24(%esp), %eax
	movw	36(%esp), %cx
	movw	%cx, 2(%eax)
	movl	24(%esp), %eax
	movb	38(%esp), %cl
	movb	%cl, 4(%eax)
	movl	24(%esp), %eax
	movb	39(%esp), %cl
	movb	%cl, 7(%eax)
	movl	24(%esp), %eax
	addb	$64, 6(%eax)
	movl	24(%esp), %eax
	movb	$-110, 5(%eax)
	movzbl	30(%esp), %eax
	cmpl	$1, %eax
	jne	.LBB8_4
# BB#3:                                 # %if_fmm_mGDTEntry$$new_l90_n185___SUCC
	movl	24(%esp), %eax
	addb	$96, 5(%eax)
.LBB8_4:                                # %if_fmm_mGDTEntry$$new_l90_n185___DONE
	movzbl	31(%esp), %eax
	cmpl	$1, %eax
	jne	.LBB8_6
# BB#5:                                 # %if_fmm_mGDTEntry$$new_l95_n195___SUCC
	movl	24(%esp), %eax
	addb	$8, 5(%eax)
.LBB8_6:                                # %if_fmm_mGDTEntry$$new_l95_n195___DONE
	movzbl	19(%esp), %eax
	cmpl	$1, %eax
	jne	.LBB8_8
# BB#7:                                 # %if_fmm_mGDTEntry$$new_l100_n205___SUCC
	movl	24(%esp), %eax
	addb	$-128, 6(%eax)
.LBB8_8:                                # %if_fmm_mGDTEntry$$new_l100_n205___DONE
	movl	24(%esp), %eax
	addl	$40, %esp
	popl	%esi
	retl
.Ltmp20:
	.size	GDTEntry$$new, .Ltmp20-GDTEntry$$new
	.cfi_endproc

	.globl	GDTEntry$print
	.align	16, 0x90
	.type	GDTEntry$print,@function
GDTEntry$print:                         # @"GDTEntry$print"
	.cfi_startproc
# BB#0:
	subl	$12, %esp
.Ltmp21:
	.cfi_def_cfa_offset 16
	movl	16(%esp), %eax
	movl	%eax, 8(%esp)
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmm_mGDTEntry$print_l108_n218, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	8(%esp), %ecx
	movzwl	(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmm_mGDTEntry$print_l110_n229, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	8(%esp), %ecx
	movzwl	2(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmm_mGDTEntry$print_l112_n240, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	8(%esp), %ecx
	movzbl	4(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmm_mGDTEntry$print_l114_n251, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	8(%esp), %ecx
	movzbl	5(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmm_mGDTEntry$print_l116_n262, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	8(%esp), %ecx
	movzbl	6(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmm_mGDTEntry$print_l118_n273, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	8(%esp), %ecx
	movzbl	7(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmm_mGDTEntry$print_l120_n284, 4(%esp)
	calll	Terminal$printl
	addl	$12, %esp
	retl
.Ltmp22:
	.size	GDTEntry$print, .Ltmp22-GDTEntry$print
	.cfi_endproc

	.globl	GDT$$new
	.align	16, 0x90
	.type	GDT$$new,@function
GDT$$new:                               # @"GDT$$new"
	.cfi_startproc
# BB#0:
	pushl	%esi
.Ltmp23:
	.cfi_def_cfa_offset 8
	subl	$24, %esp
.Ltmp24:
	.cfi_def_cfa_offset 32
.Ltmp25:
	.cfi_offset %esi, -8
	movl	32(%esp), %eax
	movl	%eax, 20(%esp)
	movl	$256, (%esp)            # imm = 0x100
	calll	malign
	movl	$10, (%esp)
	calll	malloc
	movl	%eax, 16(%esp)
	movl	20(%esp), %ecx
	leal	8(,%ecx,8), %ecx
	movw	%cx, (%eax)
	movl	$256, (%esp)            # imm = 0x100
	calll	malign
	movl	16(%esp), %esi
	movzwl	(%esi), %eax
	movl	%eax, (%esp)
	calll	malloc
	movl	%eax, 2(%esi)
	movl	16(%esp), %eax
	movl	$1, 6(%eax)
	movl	16(%esp), %eax
	movl	2(%eax), %ecx
	movzwl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	movl	$0, 8(%esp)
	calll	memset
	movl	16(%esp), %eax
	decw	(%eax)
	movl	16(%esp), %eax
	addl	$24, %esp
	popl	%esi
	retl
.Ltmp26:
	.size	GDT$$new, .Ltmp26-GDT$$new
	.cfi_endproc

	.globl	GDT$insert
	.align	16, 0x90
	.type	GDT$insert,@function
GDT$insert:                             # @"GDT$insert"
	.cfi_startproc
# BB#0:
	subl	$44, %esp
.Ltmp27:
	.cfi_def_cfa_offset 48
	movl	56(%esp), %eax
	movl	52(%esp), %ecx
	movl	48(%esp), %edx
	movl	%edx, 40(%esp)
	movl	%ecx, 36(%esp)
	movl	%eax, 32(%esp)
	movl	$8, 28(%esp)
	movl	40(%esp), %eax
	movl	2(%eax), %eax
	movl	36(%esp), %ecx
	shll	$3, %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	ptr$offset
	movl	%eax, 24(%esp)
	movl	32(%esp), %ecx
	movl	28(%esp), %edx
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	calll	memcpy
	addl	$44, %esp
	retl
.Ltmp28:
	.size	GDT$insert, .Ltmp28-GDT$insert
	.cfi_endproc

	.globl	GDT$add
	.align	16, 0x90
	.type	GDT$add,@function
GDT$add:                                # @"GDT$add"
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp29:
	.cfi_def_cfa_offset 32
	movl	36(%esp), %eax
	movl	32(%esp), %ecx
	movl	%ecx, 24(%esp)
	movl	%eax, 20(%esp)
	movl	24(%esp), %ecx
	movl	6(%ecx), %edx
	movl	%eax, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%ecx, (%esp)
	calll	GDT$insert
	movl	24(%esp), %eax
	incl	6(%eax)
	addl	$28, %esp
	retl
.Ltmp30:
	.size	GDT$add, .Ltmp30-GDT$add
	.cfi_endproc

	.globl	install_gdt
	.align	16, 0x90
	.type	install_gdt,@function
install_gdt:                            # @install_gdt
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp31:
	.cfi_def_cfa_offset 32
	movl	$2, (%esp)
	calll	GDT$$new
	movl	%eax, 24(%esp)
	movl	$0, 12(%esp)
	movl	$1, 8(%esp)
	movl	$-1, 4(%esp)
	movl	$0, (%esp)
	calll	GDTEntry$$new
	movl	%eax, 20(%esp)
	movl	24(%esp), %ecx
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	calll	GDT$add
	movl	$0, 12(%esp)
	movl	$0, 8(%esp)
	movl	$-1, 4(%esp)
	movl	$0, (%esp)
	calll	GDTEntry$$new
	movl	%eax, 16(%esp)
	movl	24(%esp), %ecx
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	calll	GDT$add
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmm_minstall_gdt_l161_n405, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	24(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$dumphexi
	movl	24(%esp), %eax
	movl	%eax, (%esp)
	calll	__klgdt
	addl	$28, %esp
	retl
.Ltmp32:
	.size	install_gdt, .Ltmp32-install_gdt
	.cfi_endproc

	.globl	InternalIDTHandlerLookupTable$get
	.align	16, 0x90
	.type	InternalIDTHandlerLookupTable$get,@function
InternalIDTHandlerLookupTable$get:      # @"InternalIDTHandlerLookupTable$get"
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp33:
	.cfi_def_cfa_offset 32
	movl	36(%esp), %eax
	movl	32(%esp), %ecx
	movl	%ecx, 24(%esp)
	movl	%eax, 20(%esp)
	movl	24(%esp), %ecx
	leal	4(,%eax,4), %eax
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	calll	ptr$offset
	movl	(%eax), %eax
	addl	$28, %esp
	retl
.Ltmp34:
	.size	InternalIDTHandlerLookupTable$get, .Ltmp34-InternalIDTHandlerLookupTable$get
	.cfi_endproc

	.globl	write_port
	.align	16, 0x90
	.type	write_port,@function
write_port:                             # @write_port
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp35:
	.cfi_def_cfa_offset 32
	movl	36(%esp), %eax
	movl	32(%esp), %ecx
	movl	%ecx, 24(%esp)
	movl	%eax, 20(%esp)
	movl	24(%esp), %ecx
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	calll	__kwritepb
	addl	$28, %esp
	retl
.Ltmp36:
	.size	write_port, .Ltmp36-write_port
	.cfi_endproc

	.globl	read_port
	.align	16, 0x90
	.type	read_port,@function
read_port:                              # @read_port
	.cfi_startproc
# BB#0:
	subl	$12, %esp
.Ltmp37:
	.cfi_def_cfa_offset 16
	movl	16(%esp), %eax
	movl	%eax, 8(%esp)
	movl	%eax, (%esp)
	calll	__kreadpb
	movzbl	%al, %eax
	addl	$12, %esp
	retl
.Ltmp38:
	.size	read_port, .Ltmp38-read_port
	.cfi_endproc

	.globl	IRQHandlerTable$$new
	.align	16, 0x90
	.type	IRQHandlerTable$$new,@function
IRQHandlerTable$$new:                   # @"IRQHandlerTable$$new"
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp39:
	.cfi_def_cfa_offset 32
	movl	32(%esp), %eax
	movl	%eax, 24(%esp)
	shll	$2, %eax
	movl	%eax, (%esp)
	calll	malloc
	movl	%eax, 20(%esp)
	movl	24(%esp), %ecx
	shll	$2, %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$0, 8(%esp)
	calll	memset
	movl	20(%esp), %eax
	addl	$28, %esp
	retl
.Ltmp40:
	.size	IRQHandlerTable$$new, .Ltmp40-IRQHandlerTable$$new
	.cfi_endproc

	.globl	IRQHandlerTable$set
	.align	16, 0x90
	.type	IRQHandlerTable$set,@function
IRQHandlerTable$set:                    # @"IRQHandlerTable$set"
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp41:
	.cfi_def_cfa_offset 32
	movl	40(%esp), %eax
	movl	36(%esp), %ecx
	movl	32(%esp), %edx
	movl	%edx, 24(%esp)
	movl	%ecx, 20(%esp)
	movl	%eax, 16(%esp)
	movl	24(%esp), %eax
	movl	20(%esp), %ecx
	shll	$2, %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	ptr$offset
	movl	16(%esp), %ecx
	movl	%ecx, (%eax)
	addl	$28, %esp
	retl
.Ltmp42:
	.size	IRQHandlerTable$set, .Ltmp42-IRQHandlerTable$set
	.cfi_endproc

	.globl	IRQHandlerTable$get
	.align	16, 0x90
	.type	IRQHandlerTable$get,@function
IRQHandlerTable$get:                    # @"IRQHandlerTable$get"
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp43:
	.cfi_def_cfa_offset 32
	movl	36(%esp), %eax
	movl	32(%esp), %ecx
	movl	%ecx, 24(%esp)
	movl	%eax, 20(%esp)
	movl	24(%esp), %ecx
	shll	$2, %eax
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	calll	ptr$offset
	movl	(%eax), %eax
	addl	$28, %esp
	retl
.Ltmp44:
	.size	IRQHandlerTable$get, .Ltmp44-IRQHandlerTable$get
	.cfi_endproc

	.globl	IDTEntry$set
	.align	16, 0x90
	.type	IDTEntry$set,@function
IDTEntry$set:                           # @"IDTEntry$set"
	.cfi_startproc
# BB#0:
	subl	$8, %esp
.Ltmp45:
	.cfi_def_cfa_offset 12
	movl	16(%esp), %eax
	movl	12(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	4(%esp), %eax
	movw	(%esp), %cx
	movw	%cx, (%eax)
	movl	4(%esp), %eax
	movw	$8, 2(%eax)
	movl	4(%esp), %eax
	movb	$0, 4(%eax)
	movl	4(%esp), %eax
	movb	$-114, 5(%eax)
	movl	4(%esp), %eax
	movw	2(%esp), %cx
	movw	%cx, 6(%eax)
	addl	$8, %esp
	retl
.Ltmp46:
	.size	IDTEntry$set, .Ltmp46-IDTEntry$set
	.cfi_endproc

	.globl	IDT$$create
	.align	16, 0x90
	.type	IDT$$create,@function
IDT$$create:                            # @"IDT$$create"
	.cfi_startproc
# BB#0:
	pushl	%esi
.Ltmp47:
	.cfi_def_cfa_offset 8
	subl	$24, %esp
.Ltmp48:
	.cfi_def_cfa_offset 32
.Ltmp49:
	.cfi_offset %esi, -8
	movl	$14, (%esp)
	calll	malloc
	movl	%eax, 20(%esp)
	movw	$2047, (%eax)           # imm = 0x7FF
	movl	20(%esp), %esi
	movzwl	(%esi), %eax
	incl	%eax
	movl	%eax, (%esp)
	calll	malloc
	movl	%eax, 2(%esi)
	movl	20(%esp), %eax
	movl	2(%eax), %ecx
	movzwl	(%eax), %eax
	incl	%eax
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	movl	$0, 8(%esp)
	calll	memset
	movl	20(%esp), %esi
	movl	$256, (%esp)            # imm = 0x100
	calll	IRQHandlerTable$$new
	movl	%eax, 6(%esi)
	movl	20(%esp), %eax
	addl	$24, %esp
	popl	%esi
	retl
.Ltmp50:
	.size	IDT$$create, .Ltmp50-IDT$$create
	.cfi_endproc

	.globl	IDT$install_internal_entry
	.align	16, 0x90
	.type	IDT$install_internal_entry,@function
IDT$install_internal_entry:             # @"IDT$install_internal_entry"
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp51:
	.cfi_def_cfa_offset 32
	movl	40(%esp), %eax
	movl	36(%esp), %ecx
	movl	32(%esp), %edx
	movl	%edx, 24(%esp)
	movl	%ecx, 20(%esp)
	movl	%eax, 16(%esp)
	movl	$8, 12(%esp)
	movl	24(%esp), %eax
	movl	2(%eax), %eax
	movl	16(%esp), %ecx
	shll	$3, %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	ptr$offset
	movl	%eax, 8(%esp)
	movl	20(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	IDTEntry$set
	addl	$28, %esp
	retl
.Ltmp52:
	.size	IDT$install_internal_entry, .Ltmp52-IDT$install_internal_entry
	.cfi_endproc

	.globl	setup_irq
	.align	16, 0x90
	.type	setup_irq,@function
setup_irq:                              # @setup_irq
	.cfi_startproc
# BB#0:
	pushl	%esi
.Ltmp53:
	.cfi_def_cfa_offset 8
	subl	$24, %esp
.Ltmp54:
	.cfi_def_cfa_offset 32
.Ltmp55:
	.cfi_offset %esi, -8
	calll	IDT$$create
	movl	%eax, gvar_firqio_mu_lu_n4__idt
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_firqio_msetup_irq_l88_n580, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	gvar_firqio_mu_lu_n4__idt, %ecx
	movl	2(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$dumphexi
	calll	__kget_internal_irq_table
	movl	%eax, 20(%esp)
	movl	$0, 16(%esp)
	movl	20(%esp), %eax
	cmpl	$0, (%eax)
	jle	.LBB23_2
	.align	16, 0x90
.LBB23_1:                               # %firqio_msetup_irq_l93_n594___LOOP___HEAD
                                        # =>This Inner Loop Header: Depth=1
	movl	gvar_firqio_mu_lu_n4__idt, %esi
	movl	20(%esp), %eax
	movl	16(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	InternalIDTHandlerLookupTable$get
	movl	16(%esp), %ecx
	movl	%ecx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	IDT$install_internal_entry
	movl	16(%esp), %eax
	incl	%eax
	movl	%eax, 16(%esp)
	movl	20(%esp), %ecx
	cmpl	(%ecx), %eax
	jl	.LBB23_1
.LBB23_2:                               # %firqio_msetup_irq_l93_n594___LOOP___END
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_firqio_msetup_irq_l98_n616, 4(%esp)
	calll	Terminal$print
	movl	gvar_firqio_mu_lu_n4__idt, %eax
	movl	6(%eax), %eax
	movl	%eax, (%esp)
	movl	$irq_zerodivision_handler, 8(%esp)
	movl	$0, 4(%esp)
	calll	IRQHandlerTable$set
	movl	gvar_firqio_mu_lu_n4__idt, %eax
	movl	6(%eax), %eax
	movl	%eax, (%esp)
	movl	$irq_doublefault_handler, 8(%esp)
	movl	$8, 4(%esp)
	calll	IRQHandlerTable$set
	movl	gvar_firqio_mu_lu_n4__idt, %eax
	movl	6(%eax), %eax
	movl	%eax, (%esp)
	movl	$irq_protectionfault_handler, 8(%esp)
	movl	$13, 4(%esp)
	calll	IRQHandlerTable$set
	movl	gvar_firqio_mu_lu_n4__idt, %eax
	movl	6(%eax), %eax
	movl	%eax, (%esp)
	movl	$irq_pagefault_handler, 8(%esp)
	movl	$14, 4(%esp)
	calll	IRQHandlerTable$set
	movl	gvar_firqio_mu_lu_n4__idt, %eax
	movl	6(%eax), %eax
	movl	%eax, (%esp)
	movl	$irq_timer_handler, 8(%esp)
	movl	$32, 4(%esp)
	calll	IRQHandlerTable$set
	movl	gvar_firqio_mu_lu_n4__idt, %eax
	movl	6(%eax), %eax
	movl	%eax, (%esp)
	movl	$irq_keyboard_handler, 8(%esp)
	movl	$33, 4(%esp)
	calll	IRQHandlerTable$set
	calll	setup_kbd
	calll	setup_pit
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_firqio_msetup_irq_l112_n667, 4(%esp)
	calll	Terminal$print
	movl	gvar_firqio_mu_lu_n4__idt, %eax
	movl	%eax, (%esp)
	calll	__klidt
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_firqio_msetup_irq_l116_n676, 4(%esp)
	calll	Terminal$print
	calll	start_irqs
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_firqio_msetup_irq_l119_n683, 4(%esp)
	calll	Terminal$print
	movl	$96, (%esp)
	calll	read_port
	addl	$24, %esp
	popl	%esi
	retl
.Ltmp56:
	.size	setup_irq, .Ltmp56-setup_irq
	.cfi_endproc

	.globl	setup_kbd
	.align	16, 0x90
	.type	setup_kbd,@function
setup_kbd:                              # @setup_kbd
	.cfi_startproc
# BB#0:
	subl	$12, %esp
.Ltmp57:
	.cfi_def_cfa_offset 16
	movl	$17, 4(%esp)
	movl	$32, (%esp)
	calll	write_port
	movl	$17, 4(%esp)
	movl	$160, (%esp)
	calll	write_port
	movl	$32, 4(%esp)
	movl	$33, (%esp)
	calll	write_port
	movl	$40, 4(%esp)
	movl	$161, (%esp)
	calll	write_port
	movl	$0, 4(%esp)
	movl	$33, (%esp)
	calll	write_port
	movl	$0, 4(%esp)
	movl	$161, (%esp)
	calll	write_port
	movl	$1, 4(%esp)
	movl	$33, (%esp)
	calll	write_port
	movl	$1, 4(%esp)
	movl	$161, (%esp)
	calll	write_port
	movl	$255, 4(%esp)
	movl	$33, (%esp)
	calll	write_port
	movl	$255, 4(%esp)
	movl	$161, (%esp)
	calll	write_port
	addl	$12, %esp
	retl
.Ltmp58:
	.size	setup_kbd, .Ltmp58-setup_kbd
	.cfi_endproc

	.globl	setup_pit
	.align	16, 0x90
	.type	setup_pit,@function
setup_pit:                              # @setup_pit
	.cfi_startproc
# BB#0:
	subl	$12, %esp
.Ltmp59:
	.cfi_def_cfa_offset 16
	movl	$54, 4(%esp)
	movl	$67, (%esp)
	calll	write_port
	movl	$0, 4(%esp)
	movl	$64, (%esp)
	calll	write_port
	movl	$0, 4(%esp)
	movl	$64, (%esp)
	calll	write_port
	addl	$12, %esp
	retl
.Ltmp60:
	.size	setup_pit, .Ltmp60-setup_pit
	.cfi_endproc

	.globl	KeyboardEvent$$new
	.align	16, 0x90
	.type	KeyboardEvent$$new,@function
KeyboardEvent$$new:                     # @"KeyboardEvent$$new"
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp61:
	.cfi_def_cfa_offset 32
	movb	36(%esp), %al
	movl	32(%esp), %ecx
	movl	%ecx, 24(%esp)
	andb	$1, %al
	movb	%al, 23(%esp)
	movl	$5, (%esp)
	calll	malloc
	movl	%eax, 16(%esp)
	movl	24(%esp), %ecx
	movl	%ecx, (%eax)
	movl	16(%esp), %eax
	movb	23(%esp), %cl
	movb	%cl, 4(%eax)
	movl	16(%esp), %eax
	addl	$28, %esp
	retl
.Ltmp62:
	.size	KeyboardEvent$$new, .Ltmp62-KeyboardEvent$$new
	.cfi_endproc

	.globl	KeyboardState$$new
	.align	16, 0x90
	.type	KeyboardState$$new,@function
KeyboardState$$new:                     # @"KeyboardState$$new"
	.cfi_startproc
# BB#0:
	pushl	%esi
.Ltmp63:
	.cfi_def_cfa_offset 8
	subl	$24, %esp
.Ltmp64:
	.cfi_def_cfa_offset 32
.Ltmp65:
	.cfi_offset %esi, -8
	movl	$16, (%esp)
	calll	malloc
	movl	%eax, %esi
	movl	%esi, 20(%esp)
	movl	$128, (%esp)
	calll	malloc
	movl	%eax, (%esi)
	movl	20(%esp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	movl	$0, 8(%esp)
	movl	$128, 4(%esp)
	calll	memset
	movl	20(%esp), %eax
	movl	$0, 4(%eax)
	movl	20(%esp), %eax
	addl	$24, %esp
	popl	%esi
	retl
.Ltmp66:
	.size	KeyboardState$$new, .Ltmp66-KeyboardState$$new
	.cfi_endproc

	.globl	KeyboardState$getkey
	.align	16, 0x90
	.type	KeyboardState$getkey,@function
KeyboardState$getkey:                   # @"KeyboardState$getkey"
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp67:
	.cfi_def_cfa_offset 32
	movl	36(%esp), %eax
	movl	32(%esp), %ecx
	movl	%ecx, 24(%esp)
	movl	%eax, 20(%esp)
	cmpl	$128, %eax
	jb	.LBB28_2
# BB#1:                                 # %if_firqio_mKeyboardState$getkey_l167_n783___SUCC
	movl	20(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.Lstrglobal_firqio_mKeyboardState$getkey_l168_n786, (%esp)
	calll	ikpanici
.LBB28_2:                               # %if_firqio_mKeyboardState$getkey_l167_n783___DONE
	movl	24(%esp), %eax
	movl	(%eax), %eax
	movl	20(%esp), %ecx
	cmpb	$0, (%eax,%ecx)
	setne	%al
	addl	$28, %esp
	retl
.Ltmp68:
	.size	KeyboardState$getkey, .Ltmp68-KeyboardState$getkey
	.cfi_endproc

	.globl	KeyboardState$setkey
	.align	16, 0x90
	.type	KeyboardState$setkey,@function
KeyboardState$setkey:                   # @"KeyboardState$setkey"
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp69:
	.cfi_def_cfa_offset 32
	movb	40(%esp), %al
	movl	36(%esp), %ecx
	movl	32(%esp), %edx
	movl	%edx, 24(%esp)
	movl	%ecx, 20(%esp)
	andb	$1, %al
	movb	%al, 19(%esp)
	cmpl	$128, 20(%esp)
	jb	.LBB29_2
# BB#1:                                 # %if_firqio_mKeyboardState$setkey_l173_n807___SUCC
	movl	20(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.Lstrglobal_firqio_mKeyboardState$setkey_l174_n810, (%esp)
	calll	ikpanici
.LBB29_2:                               # %if_firqio_mKeyboardState$setkey_l173_n807___DONE
	movl	24(%esp), %eax
	movl	(%eax), %eax
	movl	20(%esp), %ecx
	movb	19(%esp), %dl
	movb	%dl, (%eax,%ecx)
	movl	24(%esp), %eax
	cmpl	$0, 4(%eax)
	je	.LBB29_4
# BB#3:                                 # %if_firqio_mKeyboardState$setkey_l178_n829___SUCC
	movl	24(%esp), %eax
	movl	20(%esp), %ecx
	movzbl	19(%esp), %edx
	movl	%edx, 4(%esp)
	movl	%ecx, (%esp)
	calll	*4(%eax)
.LBB29_4:                               # %if_firqio_mKeyboardState$setkey_l178_n829___DONE
	addl	$28, %esp
	retl
.Ltmp70:
	.size	KeyboardState$setkey, .Ltmp70-KeyboardState$setkey
	.cfi_endproc

	.globl	KeyboardState$set_handler
	.align	16, 0x90
	.type	KeyboardState$set_handler,@function
KeyboardState$set_handler:              # @"KeyboardState$set_handler"
	.cfi_startproc
# BB#0:
	subl	$8, %esp
.Ltmp71:
	.cfi_def_cfa_offset 12
	movl	16(%esp), %eax
	movl	12(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	4(%esp), %ecx
	movl	%eax, 4(%ecx)
	addl	$8, %esp
	retl
.Ltmp72:
	.size	KeyboardState$set_handler, .Ltmp72-KeyboardState$set_handler
	.cfi_endproc

	.globl	start_irqs
	.align	16, 0x90
	.type	start_irqs,@function
start_irqs:                             # @start_irqs
	.cfi_startproc
# BB#0:
	subl	$12, %esp
.Ltmp73:
	.cfi_def_cfa_offset 16
	calll	KeyboardState$$new
	movl	%eax, gvar_firqio_mu_lu_n5__system_kbdstate
	movl	$0, gvar_firqio_mu_lu_n6__pic_ticks+4
	movl	$0, gvar_firqio_mu_lu_n6__pic_ticks
	movl	$252, 4(%esp)
	movl	$33, (%esp)
	calll	write_port
	addl	$12, %esp
	retl
.Ltmp74:
	.size	start_irqs, .Ltmp74-start_irqs
	.cfi_endproc

	.globl	kirq_callback
	.align	16, 0x90
	.type	kirq_callback,@function
kirq_callback:                          # @kirq_callback
	.cfi_startproc
# BB#0:
	subl	$44, %esp
.Ltmp75:
	.cfi_def_cfa_offset 48
	movl	56(%esp), %eax
	movl	52(%esp), %ecx
	movl	48(%esp), %edx
	movl	%edx, 40(%esp)
	movl	%ecx, 36(%esp)
	movl	%eax, 32(%esp)
	movl	gvar_firqio_mu_lu_n4__idt, %eax
	movl	6(%eax), %eax
	movl	36(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	IRQHandlerTable$get
	movl	%eax, 28(%esp)
	testl	%eax, %eax
	jne	.LBB32_2
# BB#1:                                 # %if_firqio_mkirq_callback_l201_n863___SUCC
	movl	32(%esp), %eax
	movl	36(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$.Lstrglobal_firqio_mkirq_callback_l202_n871, 12(%esp)
	movl	$.Lstrglobal_firqio_mkirq_callback_l202_n868, 8(%esp)
	calll	kpanic
.LBB32_2:                               # %if_firqio_mkirq_callback_l201_n863___DONE
	movl	32(%esp), %eax
	movl	40(%esp), %ecx
	movl	%ecx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$0, (%esp)
	calll	*28(%esp)
	movl	$32, 4(%esp)
	movl	$32, (%esp)
	calll	write_port
	addl	$44, %esp
	retl
.Ltmp76:
	.size	kirq_callback, .Ltmp76-kirq_callback
	.cfi_endproc

	.globl	irq_keyboard_handler
	.align	16, 0x90
	.type	irq_keyboard_handler,@function
irq_keyboard_handler:                   # @irq_keyboard_handler
	.cfi_startproc
# BB#0:
	pushl	%ebp
.Ltmp77:
	.cfi_def_cfa_offset 8
.Ltmp78:
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
.Ltmp79:
	.cfi_def_cfa_register %ebp
	pushl	%esi
	subl	$20, %esp
.Ltmp80:
	.cfi_offset %esi, -12
	movl	16(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	8(%ebp), %edx
	movl	%edx, -8(%ebp)
	movl	%ecx, -12(%ebp)
	movl	%eax, -16(%ebp)
	subl	$16, %esp
	movl	$100, (%esp)
	calll	read_port
	addl	$16, %esp
	movl	%eax, -20(%ebp)
	testb	$1, %al
	jle	.LBB33_2
# BB#1:                                 # %if_firqio_mirq_keyboard_handler_l210_n897___SUCC
	movl	%esp, %esi
	leal	-16(%esi), %eax
	movl	%eax, %esp
	subl	$16, %esp
	movl	$96, (%esp)
	calll	read_port
	addl	$16, %esp
	movl	%eax, -16(%esi)
	movl	%esp, %eax
	leal	-16(%eax), %ecx
	movl	%ecx, %esp
	movl	-16(%esi), %ecx
	andl	$127, %ecx
	movl	%ecx, -16(%eax)
	movl	gvar_firqio_mu_lu_n5__system_kbdstate, %eax
	movl	-16(%esi), %edx
	testb	$-128, %dl
	sete	%dl
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movzbl	%dl, %eax
	movl	%eax, 8(%esp)
	calll	KeyboardState$setkey
	addl	$16, %esp
.LBB33_2:                               # %if_firqio_mirq_keyboard_handler_l210_n897___DONE
	leal	-4(%ebp), %esp
	popl	%esi
	popl	%ebp
	retl
.Ltmp81:
	.size	irq_keyboard_handler, .Ltmp81-irq_keyboard_handler
	.cfi_endproc

	.globl	irq_pagefault_handler
	.align	16, 0x90
	.type	irq_pagefault_handler,@function
irq_pagefault_handler:                  # @irq_pagefault_handler
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp82:
	.cfi_def_cfa_offset 32
	movl	40(%esp), %eax
	movl	36(%esp), %ecx
	movl	32(%esp), %edx
	movl	%edx, 24(%esp)
	movl	%ecx, 20(%esp)
	movl	%eax, 16(%esp)
	movl	20(%esp), %ecx
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	movl	$.Lstrglobal_firqio_mirq_pagefault_handler_l218_n924, 12(%esp)
	movl	$.Lstrglobal_firqio_mirq_pagefault_handler_l218_n921, 8(%esp)
	calll	kpanic
	addl	$28, %esp
	retl
.Ltmp83:
	.size	irq_pagefault_handler, .Ltmp83-irq_pagefault_handler
	.cfi_endproc

	.globl	irq_protectionfault_handler
	.align	16, 0x90
	.type	irq_protectionfault_handler,@function
irq_protectionfault_handler:            # @irq_protectionfault_handler
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp84:
	.cfi_def_cfa_offset 32
	movl	40(%esp), %eax
	movl	36(%esp), %ecx
	movl	32(%esp), %edx
	movl	%edx, 24(%esp)
	movl	%ecx, 20(%esp)
	movl	%eax, 16(%esp)
	movl	20(%esp), %ecx
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	movl	$.Lstrglobal_firqio_mirq_protectionfault_handler_l222_n937, 12(%esp)
	movl	$.Lstrglobal_firqio_mirq_protectionfault_handler_l222_n934, 8(%esp)
	calll	kpanic
	addl	$28, %esp
	retl
.Ltmp85:
	.size	irq_protectionfault_handler, .Ltmp85-irq_protectionfault_handler
	.cfi_endproc

	.globl	irq_doublefault_handler
	.align	16, 0x90
	.type	irq_doublefault_handler,@function
irq_doublefault_handler:                # @irq_doublefault_handler
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp86:
	.cfi_def_cfa_offset 32
	movl	40(%esp), %eax
	movl	36(%esp), %ecx
	movl	32(%esp), %edx
	movl	%edx, 24(%esp)
	movl	%ecx, 20(%esp)
	movl	%eax, 16(%esp)
	movl	20(%esp), %ecx
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	movl	$.Lstrglobal_firqio_mirq_doublefault_handler_l226_n950, 12(%esp)
	movl	$.Lstrglobal_firqio_mirq_doublefault_handler_l226_n947, 8(%esp)
	calll	kpanic
	addl	$28, %esp
	retl
.Ltmp87:
	.size	irq_doublefault_handler, .Ltmp87-irq_doublefault_handler
	.cfi_endproc

	.globl	irq_zerodivision_handler
	.align	16, 0x90
	.type	irq_zerodivision_handler,@function
irq_zerodivision_handler:               # @irq_zerodivision_handler
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp88:
	.cfi_def_cfa_offset 32
	movl	40(%esp), %eax
	movl	36(%esp), %ecx
	movl	32(%esp), %edx
	movl	%edx, 24(%esp)
	movl	%ecx, 20(%esp)
	movl	%eax, 16(%esp)
	movl	20(%esp), %ecx
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	movl	$.Lstrglobal_firqio_mirq_zerodivision_handler_l230_n963, 12(%esp)
	movl	$.Lstrglobal_firqio_mirq_zerodivision_handler_l230_n960, 8(%esp)
	calll	kpanic
	addl	$28, %esp
	retl
.Ltmp89:
	.size	irq_zerodivision_handler, .Ltmp89-irq_zerodivision_handler
	.cfi_endproc

	.globl	irq_timer_handler
	.align	16, 0x90
	.type	irq_timer_handler,@function
irq_timer_handler:                      # @irq_timer_handler
	.cfi_startproc
# BB#0:
	subl	$12, %esp
.Ltmp90:
	.cfi_def_cfa_offset 16
	movl	24(%esp), %eax
	movl	20(%esp), %ecx
	movl	16(%esp), %edx
	movl	%edx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	gvar_firqio_mu_lu_n6__pic_ticks+4, %eax
	movl	gvar_firqio_mu_lu_n6__pic_ticks, %ecx
	addl	$1, %ecx
	adcl	$0, %eax
	movl	%ecx, gvar_firqio_mu_lu_n6__pic_ticks
	movl	%eax, gvar_firqio_mu_lu_n6__pic_ticks+4
	addl	$12, %esp
	retl
.Ltmp91:
	.size	irq_timer_handler, .Ltmp91-irq_timer_handler
	.cfi_endproc

	.globl	kswritebyte
	.align	16, 0x90
	.type	kswritebyte,@function
kswritebyte:                            # @kswritebyte
	.cfi_startproc
# BB#0:
	subl	$12, %esp
.Ltmp92:
	.cfi_def_cfa_offset 16
	movb	16(%esp), %al
	movb	%al, 11(%esp)
	movl	gvar_fserialdbg_mu_lu_n7__serial_base, %eax
	movzbl	11(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	write_port
	addl	$12, %esp
	retl
.Ltmp93:
	.size	kswritebyte, .Ltmp93-kswritebyte
	.cfi_endproc

	.globl	kswritecstr
	.align	16, 0x90
	.type	kswritecstr,@function
kswritecstr:                            # @kswritecstr
	.cfi_startproc
# BB#0:
	pushl	%esi
.Ltmp94:
	.cfi_def_cfa_offset 8
	subl	$24, %esp
.Ltmp95:
	.cfi_def_cfa_offset 32
.Ltmp96:
	.cfi_offset %esi, -8
	movl	32(%esp), %eax
	movl	%eax, 20(%esp)
	movl	$0, 16(%esp)
	movl	20(%esp), %eax
	movl	%eax, (%esp)
	calll	cstr$len
	testl	%eax, %eax
	jle	.LBB40_2
	.align	16, 0x90
.LBB40_1:                               # %fserialdbg_mkswritecstr_l10_n982___LOOP___HEAD
                                        # =>This Inner Loop Header: Depth=1
	movl	20(%esp), %eax
	movl	16(%esp), %ecx
	movzbl	(%eax,%ecx), %eax
	movl	%eax, (%esp)
	calll	kswritebyte
	movl	16(%esp), %esi
	incl	%esi
	movl	%esi, 16(%esp)
	movl	20(%esp), %eax
	movl	%eax, (%esp)
	calll	cstr$len
	cmpl	%eax, %esi
	jl	.LBB40_1
.LBB40_2:                               # %fserialdbg_mkswritecstr_l10_n982___LOOP___END
	addl	$24, %esp
	popl	%esi
	retl
.Ltmp97:
	.size	kswritecstr, .Ltmp97-kswritecstr
	.cfi_endproc

	.globl	init_serial
	.align	16, 0x90
	.type	init_serial,@function
init_serial:                            # @init_serial
	.cfi_startproc
# BB#0:
	subl	$12, %esp
.Ltmp98:
	.cfi_def_cfa_offset 16
	movl	$1016, gvar_fserialdbg_mu_lu_n7__serial_base # imm = 0x3F8
	movl	$0, 4(%esp)
	movl	$1017, (%esp)           # imm = 0x3F9
	calll	write_port
	movl	gvar_fserialdbg_mu_lu_n7__serial_base, %eax
	addl	$3, %eax
	movl	%eax, (%esp)
	movl	$128, 4(%esp)
	calll	write_port
	movl	gvar_fserialdbg_mu_lu_n7__serial_base, %eax
	movl	%eax, (%esp)
	movl	$3, 4(%esp)
	calll	write_port
	movl	gvar_fserialdbg_mu_lu_n7__serial_base, %eax
	incl	%eax
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	calll	write_port
	movl	gvar_fserialdbg_mu_lu_n7__serial_base, %eax
	addl	$3, %eax
	movl	%eax, (%esp)
	movl	$3, 4(%esp)
	calll	write_port
	movl	gvar_fserialdbg_mu_lu_n7__serial_base, %eax
	addl	$2, %eax
	movl	%eax, (%esp)
	movl	$199, 4(%esp)
	calll	write_port
	movl	$.Lstrglobal_fserialdbg_minit_serial_l26_n1042, (%esp)
	calll	kswritecstr
	addl	$12, %esp
	retl
.Ltmp99:
	.size	init_serial, .Ltmp99-init_serial
	.cfi_endproc

	.globl	Terminal$$new
	.align	16, 0x90
	.type	Terminal$$new,@function
Terminal$$new:                          # @"Terminal$$new"
	.cfi_startproc
# BB#0:
	pushl	%esi
.Ltmp100:
	.cfi_def_cfa_offset 8
	subl	$24, %esp
.Ltmp101:
	.cfi_def_cfa_offset 32
.Ltmp102:
	.cfi_offset %esi, -8
	movl	44(%esp), %eax
	movl	40(%esp), %ecx
	movl	36(%esp), %edx
	movl	32(%esp), %esi
	movl	%esi, 20(%esp)
	movl	%edx, 16(%esp)
	movl	%ecx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$34, (%esp)
	calll	malloc
	movl	%eax, 4(%esp)
	movl	20(%esp), %ecx
	movl	%ecx, (%eax)
	movl	4(%esp), %eax
	movl	16(%esp), %ecx
	movl	%ecx, 4(%eax)
	movl	4(%esp), %eax
	movl	12(%esp), %ecx
	movl	%ecx, 8(%eax)
	movl	4(%esp), %eax
	movl	$0, 12(%eax)
	movl	4(%esp), %eax
	movl	$0, 16(%eax)
	movl	4(%esp), %eax
	movb	$15, 20(%eax)
	movl	4(%esp), %eax
	movb	$1, 21(%eax)
	movl	4(%esp), %eax
	movl	8(%esp), %ecx
	movl	%ecx, 24(%eax)
	movl	4(%esp), %eax
	addl	$24, %esp
	popl	%esi
	retl
.Ltmp103:
	.size	Terminal$$new, .Ltmp103-Terminal$$new
	.cfi_endproc

	.globl	Terminal$setchar
	.align	16, 0x90
	.type	Terminal$setchar,@function
Terminal$setchar:                       # @"Terminal$setchar"
	.cfi_startproc
# BB#0:
	pushl	%esi
.Ltmp104:
	.cfi_def_cfa_offset 8
	subl	$24, %esp
.Ltmp105:
	.cfi_def_cfa_offset 32
.Ltmp106:
	.cfi_offset %esi, -8
	movb	44(%esp), %al
	movl	40(%esp), %ecx
	movl	36(%esp), %edx
	movl	32(%esp), %esi
	movl	%esi, 20(%esp)
	movl	%edx, 16(%esp)
	movl	%ecx, 12(%esp)
	movb	%al, 11(%esp)
	movl	20(%esp), %ecx
	movl	(%ecx), %edx
	movl	12(%esp), %esi
	imull	4(%ecx), %esi
	movl	16(%esp), %ecx
	addl	%ecx, %ecx
	leal	(%ecx,%esi,2), %ecx
	movb	%al, (%edx,%ecx)
	movl	20(%esp), %eax
	movl	(%eax), %ecx
	movl	12(%esp), %edx
	imull	4(%eax), %edx
	addl	%edx, %edx
	movl	16(%esp), %esi
	leal	(%edx,%esi,2), %edx
	movb	20(%eax), %al
	movb	%al, 1(%ecx,%edx)
	movl	20(%esp), %eax
	calll	*24(%eax)
	addl	$24, %esp
	popl	%esi
	retl
.Ltmp107:
	.size	Terminal$setchar, .Ltmp107-Terminal$setchar
	.cfi_endproc

	.globl	Terminal$setattrs
	.align	16, 0x90
	.type	Terminal$setattrs,@function
Terminal$setattrs:                      # @"Terminal$setattrs"
	.cfi_startproc
# BB#0:
	subl	$8, %esp
.Ltmp108:
	.cfi_def_cfa_offset 12
	movl	16(%esp), %eax
	movl	12(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	4(%esp), %eax
	movb	(%esp), %cl
	movb	%cl, 20(%eax)
	addl	$8, %esp
	retl
.Ltmp109:
	.size	Terminal$setattrs, .Ltmp109-Terminal$setattrs
	.cfi_endproc

	.globl	Terminal$putchar
	.align	16, 0x90
	.type	Terminal$putchar,@function
Terminal$putchar:                       # @"Terminal$putchar"
	.cfi_startproc
# BB#0:
	pushl	%esi
.Ltmp110:
	.cfi_def_cfa_offset 8
	subl	$24, %esp
.Ltmp111:
	.cfi_def_cfa_offset 32
.Ltmp112:
	.cfi_offset %esi, -8
	movb	36(%esp), %al
	movl	32(%esp), %ecx
	movl	%ecx, 20(%esp)
	movb	%al, 19(%esp)
	movl	20(%esp), %eax
	movzbl	21(%eax), %eax
	cmpl	$1, %eax
	jne	.LBB45_2
# BB#1:                                 # %if_fterm_mTerminal$putchar_l38_n1141___SUCC
	movzbl	19(%esp), %eax
	movl	%eax, (%esp)
	calll	kswritebyte
.LBB45_2:                               # %if_fterm_mTerminal$putchar_l38_n1141___DONE
	movl	20(%esp), %eax
	movl	12(%eax), %ecx
	movl	16(%eax), %edx
	movzbl	19(%esp), %esi
	movl	%esi, 12(%esp)
	movl	%edx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$setchar
	movl	20(%esp), %eax
	incl	12(%eax)
	movl	20(%esp), %eax
	movl	12(%eax), %ecx
	cmpl	4(%eax), %ecx
	jl	.LBB45_4
# BB#3:                                 # %if_fterm_mTerminal$putchar_l44_n1168___SUCC
	movl	20(%esp), %eax
	movl	$0, 12(%eax)
	movl	20(%esp), %eax
	incl	16(%eax)
.LBB45_4:                               # %if_fterm_mTerminal$putchar_l44_n1168___DONE
	movl	20(%esp), %eax
	movl	%eax, (%esp)
	calll	Terminal$scroll
	addl	$24, %esp
	popl	%esi
	retl
.Ltmp113:
	.size	Terminal$putchar, .Ltmp113-Terminal$putchar
	.cfi_endproc

	.globl	Terminal$print
	.align	16, 0x90
	.type	Terminal$print,@function
Terminal$print:                         # @"Terminal$print"
	.cfi_startproc
# BB#0:
	pushl	%edi
.Ltmp114:
	.cfi_def_cfa_offset 8
	pushl	%esi
.Ltmp115:
	.cfi_def_cfa_offset 12
	subl	$36, %esp
.Ltmp116:
	.cfi_def_cfa_offset 48
.Ltmp117:
	.cfi_offset %esi, -12
.Ltmp118:
	.cfi_offset %edi, -8
	movl	52(%esp), %eax
	movl	48(%esp), %ecx
	movl	%ecx, 32(%esp)
	movl	%eax, 28(%esp)
	movl	$0, 24(%esp)
	movl	32(%esp), %eax
	movzbl	21(%eax), %eax
	cmpl	$1, %eax
	jne	.LBB46_2
# BB#1:                                 # %if_fterm_mTerminal$print_l54_n1188___SUCC
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	calll	kswritecstr
.LBB46_2:                               # %if_fterm_mTerminal$print_l54_n1188___DONE
	movl	28(%esp), %eax
	movl	24(%esp), %ecx
	cmpb	$0, (%eax,%ecx)
	je	.LBB46_9
	.align	16, 0x90
.LBB46_3:                               # %fterm_mTerminal$print_l58_n1192___LOOP___HEAD
                                        # =>This Inner Loop Header: Depth=1
	movl	28(%esp), %eax
	movl	24(%esp), %ecx
	movzbl	(%eax,%ecx), %eax
	cmpl	$10, %eax
	je	.LBB46_5
# BB#4:                                 # %if_fterm_mTerminal$print_l59_n1211___SUCC
                                        #   in Loop: Header=BB46_3 Depth=1
	movl	32(%esp), %eax
	movl	12(%eax), %ecx
	movl	16(%eax), %edx
	movl	28(%esp), %esi
	movl	24(%esp), %edi
	movzbl	(%esi,%edi), %esi
	movl	%esi, 12(%esp)
	movl	%edx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$setchar
	movl	32(%esp), %eax
	incl	12(%eax)
	jmp	.LBB46_6
	.align	16, 0x90
.LBB46_5:                               # %if_fterm_mTerminal$print_l59_n1211___FAIL
                                        #   in Loop: Header=BB46_3 Depth=1
	movl	32(%esp), %eax
	movl	$0, 12(%eax)
	movl	32(%esp), %eax
	incl	16(%eax)
.LBB46_6:                               # %if_fterm_mTerminal$print_l59_n1211___DONE
                                        #   in Loop: Header=BB46_3 Depth=1
	movl	32(%esp), %eax
	movl	12(%eax), %ecx
	cmpl	4(%eax), %ecx
	jl	.LBB46_8
# BB#7:                                 # %if_fterm_mTerminal$print_l66_n1250___SUCC
                                        #   in Loop: Header=BB46_3 Depth=1
	movl	32(%esp), %eax
	movl	$0, 12(%eax)
	movl	32(%esp), %eax
	incl	16(%eax)
.LBB46_8:                               # %if_fterm_mTerminal$print_l66_n1250___DONE
                                        #   in Loop: Header=BB46_3 Depth=1
	movl	24(%esp), %eax
	leal	1(%eax), %ecx
	movl	%ecx, 24(%esp)
	movl	28(%esp), %ecx
	cmpb	$0, 1(%ecx,%eax)
	jne	.LBB46_3
.LBB46_9:                               # %fterm_mTerminal$print_l58_n1192___LOOP___END
	movl	32(%esp), %eax
	movl	%eax, (%esp)
	calll	Terminal$scroll
	addl	$36, %esp
	popl	%esi
	popl	%edi
	retl
.Ltmp119:
	.size	Terminal$print, .Ltmp119-Terminal$print
	.cfi_endproc

	.globl	Terminal$printl
	.align	16, 0x90
	.type	Terminal$printl,@function
Terminal$printl:                        # @"Terminal$printl"
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp120:
	.cfi_def_cfa_offset 32
	movl	36(%esp), %eax
	movl	32(%esp), %ecx
	movl	%ecx, 24(%esp)
	movl	%eax, 20(%esp)
	movl	24(%esp), %ecx
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	calll	Terminal$print
	movl	24(%esp), %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fterm_mTerminal$printl_l77_n1282, 4(%esp)
	calll	Terminal$print
	movl	24(%esp), %eax
	movl	%eax, (%esp)
	calll	Terminal$scroll
	addl	$28, %esp
	retl
.Ltmp121:
	.size	Terminal$printl, .Ltmp121-Terminal$printl
	.cfi_endproc

	.globl	Terminal$scroll
	.align	16, 0x90
	.type	Terminal$scroll,@function
Terminal$scroll:                        # @"Terminal$scroll"
	.cfi_startproc
# BB#0:
	pushl	%ebp
.Ltmp122:
	.cfi_def_cfa_offset 8
.Ltmp123:
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
.Ltmp124:
	.cfi_def_cfa_register %ebp
	pushl	%edi
	pushl	%esi
	subl	$16, %esp
.Ltmp125:
	.cfi_offset %esi, -16
.Ltmp126:
	.cfi_offset %edi, -12
	movl	8(%ebp), %eax
	movl	%eax, -12(%ebp)
	jmp	.LBB48_1
	.align	16, 0x90
.LBB48_4:                               # %fterm_mTerminal$scroll_l84_n1298___LOOP___END
                                        #   in Loop: Header=BB48_1 Depth=1
	movl	-12(%ebp), %eax
	movl	(%eax), %ecx
	movl	4(%eax), %edx
	imull	8(%eax), %edx
	addl	%edx, %edx
	subl	$16, %esp
	movl	%edx, 4(%esp)
	movl	%ecx, (%esp)
	calll	ptr$offset
	addl	$16, %esp
	movl	-12(%ebp), %ecx
	movl	4(%ecx), %ecx
	addl	%ecx, %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$0, 8(%esp)
	calll	memset
	addl	$16, %esp
	movl	-12(%ebp), %eax
	decl	16(%eax)
	movl	-12(%ebp), %eax
.LBB48_1:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB48_3 Depth 2
	movl	16(%eax), %ecx
	cmpl	8(%eax), %ecx
	jl	.LBB48_5
# BB#2:                                 # %fterm_mTerminal$scroll_l82_n1288___LOOP___HEAD
                                        #   in Loop: Header=BB48_1 Depth=1
	movl	%esp, %eax
	leal	-16(%eax), %edi
	movl	%edi, %esp
	movl	$0, -16(%eax)
	movl	-12(%ebp), %eax
	cmpl	$0, 8(%eax)
	jle	.LBB48_4
	.align	16, 0x90
.LBB48_3:                               # %fterm_mTerminal$scroll_l84_n1298___LOOP___HEAD
                                        #   Parent Loop BB48_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-12(%ebp), %eax
	movl	(%eax), %ecx
	movl	(%edi), %edx
	incl	%edx
	imull	4(%eax), %edx
	addl	%edx, %edx
	subl	$16, %esp
	movl	%edx, 4(%esp)
	movl	%ecx, (%esp)
	calll	ptr$offset
	addl	$16, %esp
	movl	%eax, %esi
	movl	-12(%ebp), %eax
	movl	(%eax), %ecx
	movl	(%edi), %edx
	imull	4(%eax), %edx
	addl	%edx, %edx
	subl	$16, %esp
	movl	%edx, 4(%esp)
	movl	%ecx, (%esp)
	calll	ptr$offset
	addl	$16, %esp
	movl	-12(%ebp), %ecx
	movl	4(%ecx), %ecx
	addl	%ecx, %ecx
	subl	$16, %esp
	movl	%ecx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	memcpy
	addl	$16, %esp
	movl	(%edi), %eax
	incl	%eax
	movl	%eax, (%edi)
	movl	-12(%ebp), %ecx
	cmpl	8(%ecx), %eax
	jl	.LBB48_3
	jmp	.LBB48_4
.LBB48_5:                               # %fterm_mTerminal$scroll_l82_n1288___LOOP___END
	movl	-12(%ebp), %eax
	calll	*24(%eax)
	leal	-8(%ebp), %esp
	popl	%esi
	popl	%edi
	popl	%ebp
	retl
.Ltmp127:
	.size	Terminal$scroll, .Ltmp127-Terminal$scroll
	.cfi_endproc

	.globl	Terminal$movecursor
	.align	16, 0x90
	.type	Terminal$movecursor,@function
Terminal$movecursor:                    # @"Terminal$movecursor"
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp128:
	.cfi_def_cfa_offset 32
	movl	40(%esp), %eax
	movl	36(%esp), %ecx
	movl	32(%esp), %edx
	movl	%edx, 24(%esp)
	movl	%ecx, 20(%esp)
	movl	%eax, 16(%esp)
	movl	24(%esp), %eax
	movl	20(%esp), %ecx
	addl	%ecx, 12(%eax)
	movl	24(%esp), %eax
	cmpl	$0, 12(%eax)
	jns	.LBB49_2
# BB#1:                                 # %if_fterm_mTerminal$movecursor_l96_n1398___SUCC
	movl	24(%esp), %eax
	movl	$0, 12(%eax)
	jmp	.LBB49_4
.LBB49_2:                               # %if_fterm_mTerminal$movecursor_l96_n1398___FAIL
	movl	24(%esp), %eax
	movl	12(%eax), %ecx
	cmpl	4(%eax), %ecx
	jle	.LBB49_4
# BB#3:                                 # %if_fterm_mTerminal$movecursor_l96_n1409___SUCC
	movl	24(%esp), %eax
	movl	4(%eax), %ecx
	subl	%ecx, 12(%eax)
	movl	24(%esp), %eax
	incl	16(%eax)
.LBB49_4:                               # %if_fterm_mTerminal$movecursor_l96_n1398___DONE
	movl	24(%esp), %eax
	movl	16(%esp), %ecx
	addl	%ecx, 16(%eax)
	movl	24(%esp), %eax
	cmpl	$0, 16(%eax)
	jns	.LBB49_6
# BB#5:                                 # %if_fterm_mTerminal$movecursor_l104_n1438___SUCC
	movl	24(%esp), %eax
	movl	$0, 16(%eax)
.LBB49_6:                               # %if_fterm_mTerminal$movecursor_l104_n1438___DONE
	movl	24(%esp), %eax
	movl	%eax, (%esp)
	calll	Terminal$scroll
	addl	$28, %esp
	retl
.Ltmp129:
	.size	Terminal$movecursor, .Ltmp129-Terminal$movecursor
	.cfi_endproc

	.globl	Terminal$printa
	.align	16, 0x90
	.type	Terminal$printa,@function
Terminal$printa:                        # @"Terminal$printa"
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp130:
	.cfi_def_cfa_offset 32
	movl	40(%esp), %eax
	movl	36(%esp), %ecx
	movl	32(%esp), %edx
	movl	%edx, 24(%esp)
	movl	%ecx, 20(%esp)
	movl	%eax, 16(%esp)
	movl	24(%esp), %eax
	movb	20(%eax), %al
	movb	%al, 15(%esp)
	movl	24(%esp), %eax
	movb	20(%esp), %cl
	movb	%cl, 20(%eax)
	movl	24(%esp), %eax
	movl	16(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$print
	movl	24(%esp), %eax
	movb	15(%esp), %cl
	movb	%cl, 20(%eax)
	addl	$28, %esp
	retl
.Ltmp131:
	.size	Terminal$printa, .Ltmp131-Terminal$printa
	.cfi_endproc

	.globl	Terminal$printlong
	.align	16, 0x90
	.type	Terminal$printlong,@function
Terminal$printlong:                     # @"Terminal$printlong"
	.cfi_startproc
# BB#0:
	pushl	%ebp
.Ltmp132:
	.cfi_def_cfa_offset 8
.Ltmp133:
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
.Ltmp134:
	.cfi_def_cfa_register %ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$28, %esp
.Ltmp135:
	.cfi_offset %esi, -20
.Ltmp136:
	.cfi_offset %edi, -16
.Ltmp137:
	.cfi_offset %ebx, -12
	movl	12(%ebp), %eax
	movl	16(%ebp), %ecx
	movl	8(%ebp), %edx
	movl	%edx, -16(%ebp)
	movl	%ecx, -20(%ebp)
	movl	%eax, -24(%ebp)
	orl	%ecx, %eax
	jne	.LBB51_3
# BB#1:                                 # %if_fterm_mTerminal$printlong_l118_n1467___SUCC
	movl	-16(%ebp), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fterm_mTerminal$printlong_l119_n1470, 4(%esp)
	calll	Terminal$print
	jmp	.LBB51_2
.LBB51_3:                               # %if_fterm_mTerminal$printlong_l118_n1467___DONE
	cmpl	$0, -20(%ebp)
	jns	.LBB51_5
# BB#4:                                 # %if_fterm_mTerminal$printlong_l123_n1477___SUCC
	movl	-16(%ebp), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fterm_mTerminal$printlong_l124_n1480, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	subl	-24(%ebp), %ecx
	sbbl	-20(%ebp), %eax
	movl	%eax, -20(%ebp)
	movl	%ecx, -24(%ebp)
.LBB51_5:                               # %if_fterm_mTerminal$printlong_l123_n1477___DONE
	movl	%esp, %eax
	addl	$-16, %eax
	movl	%eax, -32(%ebp)         # 4-byte Spill
	movl	%eax, %esp
                                        # kill: EAX<def> ESP<kill>
	leal	-16(%eax), %ecx
	movl	%ecx, -36(%ebp)         # 4-byte Spill
	movl	%ecx, %esp
	movl	$9, -16(%eax)
	movl	%esp, %esi
	leal	-16(%esi), %edi
	movl	%edi, %esp
	subl	$16, %esp
	movl	$11, (%esp)
	calll	malloc
	addl	$16, %esp
	movl	%eax, -16(%esi)
	movl	%esp, %ecx
	leal	-16(%ecx), %eax
	movl	%eax, -28(%ebp)         # 4-byte Spill
	movl	%eax, %esp
	movl	$.Lstrglobal_fterm_mTerminal$printlong_l131_n1493, -16(%ecx)
	movl	-16(%esi), %ecx
	movb	$0, 10(%ecx)
	movl	%esp, %edx
	leal	-16(%edx), %ecx
	movl	%ecx, %esp
	movl	$0, -16(%edx)
	xorl	%edx, %edx
	testb	%dl, %dl
	jne	.LBB51_7
	.align	16, 0x90
.LBB51_6:                               # %fterm_mTerminal$printlong_l134_n1505___LOOP___HEAD
                                        # =>This Inner Loop Header: Depth=1
	movl	(%edi), %edx
	movl	(%ecx), %ebx
	movl	%edi, %esi
	movl	(%eax), %edi
	movb	(%edi), %al
	movl	%esi, %edi
	movb	%al, (%edx,%ebx)
	movl	(%ecx), %eax
	incl	%eax
	movl	%eax, (%ecx)
	cmpl	$10, %eax
	movl	-28(%ebp), %eax         # 4-byte Reload
	jl	.LBB51_6
.LBB51_7:                               # %fterm_mTerminal$printlong_l134_n1505___LOOP___END
	cmpl	$0, -24(%ebp)
	sete	%al
	cmpl	$0, -20(%ebp)
	sets	%cl
	je	.LBB51_9
# BB#8:                                 # %fterm_mTerminal$printlong_l134_n1505___LOOP___END
	movb	%cl, %al
.LBB51_9:                               # %fterm_mTerminal$printlong_l134_n1505___LOOP___END
	testb	%al, %al
	movl	-32(%ebp), %esi         # 4-byte Reload
	movl	-36(%ebp), %ebx         # 4-byte Reload
	jne	.LBB51_13
	.align	16, 0x90
.LBB51_10:                              # %fterm_mTerminal$printlong_l138_n1526___LOOP___HEAD
                                        # =>This Inner Loop Header: Depth=1
	movl	-24(%ebp), %eax
	movl	-20(%ebp), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$0, 12(%esp)
	movl	$10, 8(%esp)
	calll	__moddi3
	addl	$16, %esp
	movl	%edx, 4(%esi)
	movl	%eax, (%esi)
	movl	-24(%ebp), %eax
	movl	-20(%ebp), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$0, 12(%esp)
	movl	$10, 8(%esp)
	calll	__divdi3
	addl	$16, %esp
	movl	%edx, -20(%ebp)
	movl	%eax, -24(%ebp)
	movl	(%edi), %eax
	movl	(%ebx), %ecx
	movl	(%esi), %edx
	addl	$48, %edx
	movb	%dl, (%eax,%ecx)
	decl	(%ebx)
	cmpl	$0, -24(%ebp)
	setne	%al
	cmpl	$0, -20(%ebp)
	setg	%cl
	je	.LBB51_12
# BB#11:                                # %fterm_mTerminal$printlong_l138_n1526___LOOP___HEAD
                                        #   in Loop: Header=BB51_10 Depth=1
	movb	%cl, %al
.LBB51_12:                              # %fterm_mTerminal$printlong_l138_n1526___LOOP___HEAD
                                        #   in Loop: Header=BB51_10 Depth=1
	testb	%al, %al
	jne	.LBB51_10
.LBB51_13:                              # %fterm_mTerminal$printlong_l138_n1526___LOOP___END
	movl	-16(%ebp), %eax
	movl	(%edi), %ecx
	movl	(%ebx), %edx
	leal	1(%edx,%ecx), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	(%edi), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	calll	free
.LBB51_2:                               # %if_fterm_mTerminal$printlong_l118_n1467___SUCC
	leal	-12(%ebp), %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
.Ltmp138:
	.size	Terminal$printlong, .Ltmp138-Terminal$printlong
	.cfi_endproc

	.globl	Terminal$dumpbin
	.align	16, 0x90
	.type	Terminal$dumpbin,@function
Terminal$dumpbin:                       # @"Terminal$dumpbin"
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp139:
	.cfi_def_cfa_offset 32
	movl	36(%esp), %eax
	movl	32(%esp), %ecx
	movl	%ecx, 24(%esp)
	movl	%eax, 20(%esp)
	movl	24(%esp), %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fterm_mTerminal$dumpbin_l150_n1572, 4(%esp)
	calll	Terminal$print
	movl	$32, 16(%esp)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB52_5
	.align	16, 0x90
.LBB52_1:                               # %fterm_mTerminal$dumpbin_l152_n1579___LOOP___HEAD
                                        # =>This Inner Loop Header: Depth=1
	decl	16(%esp)
	movl	20(%esp), %eax
	movl	16(%esp), %ecx
	btl	%ecx, %eax
	jae	.LBB52_3
# BB#2:                                 # %if_fterm_mTerminal$dumpbin_l154_n1593___SUCC
                                        #   in Loop: Header=BB52_1 Depth=1
	movl	24(%esp), %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fterm_mTerminal$dumpbin_l155_n1596, 4(%esp)
	jmp	.LBB52_4
	.align	16, 0x90
.LBB52_3:                               # %if_fterm_mTerminal$dumpbin_l154_n1593___FAIL
                                        #   in Loop: Header=BB52_1 Depth=1
	movl	24(%esp), %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fterm_mTerminal$dumpbin_l157_n1601, 4(%esp)
.LBB52_4:                               # %if_fterm_mTerminal$dumpbin_l154_n1593___DONE
                                        #   in Loop: Header=BB52_1 Depth=1
	calll	Terminal$print
	cmpl	$0, 16(%esp)
	jg	.LBB52_1
.LBB52_5:                               # %fterm_mTerminal$dumpbin_l152_n1579___LOOP___END
	addl	$28, %esp
	retl
.Ltmp140:
	.size	Terminal$dumpbin, .Ltmp140-Terminal$dumpbin
	.cfi_endproc

	.globl	Terminal$dumphex
	.align	16, 0x90
	.type	Terminal$dumphex,@function
Terminal$dumphex:                       # @"Terminal$dumphex"
	.cfi_startproc
# BB#0:
	pushl	%ebp
.Ltmp141:
	.cfi_def_cfa_offset 8
.Ltmp142:
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
.Ltmp143:
	.cfi_def_cfa_register %ebp
	pushl	%esi
	subl	$20, %esp
.Ltmp144:
	.cfi_offset %esi, -12
	movl	16(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	8(%ebp), %edx
	movl	%edx, -8(%ebp)
	movl	%ecx, -12(%ebp)
	movl	%eax, -16(%ebp)
	movl	-8(%ebp), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fterm_mTerminal$dumphex_l163_n1612, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	-16(%ebp), %eax
	movl	%eax, -20(%ebp)
	testl	%eax, %eax
	jle	.LBB53_5
	.align	16, 0x90
.LBB53_1:                               # %fterm_mTerminal$dumphex_l165_n1617___LOOP___HEAD
                                        # =>This Inner Loop Header: Depth=1
	decl	-20(%ebp)
	movl	%esp, %edx
	leal	-16(%edx), %eax
	movl	%eax, %esp
	movl	-12(%ebp), %esi
	movb	-20(%ebp), %cl
	shlb	$2, %cl
	shrl	%cl, %esi
	andl	$15, %esi
	movl	%esi, -16(%edx)
	cmpl	$9, %esi
	jg	.LBB53_3
# BB#2:                                 # %if_fterm_mTerminal$dumphex_l168_n1635___SUCC
                                        #   in Loop: Header=BB53_1 Depth=1
	movl	-8(%ebp), %ecx
	movl	(%eax), %eax
	addl	$48, %eax
	jmp	.LBB53_4
	.align	16, 0x90
.LBB53_3:                               # %if_fterm_mTerminal$dumphex_l168_n1635___FAIL
                                        #   in Loop: Header=BB53_1 Depth=1
	movl	-8(%ebp), %ecx
	movl	(%eax), %eax
	addl	$55, %eax
.LBB53_4:                               # %if_fterm_mTerminal$dumphex_l168_n1635___DONE
                                        #   in Loop: Header=BB53_1 Depth=1
	subl	$16, %esp
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	calll	Terminal$putchar
	addl	$16, %esp
	cmpl	$0, -20(%ebp)
	jg	.LBB53_1
.LBB53_5:                               # %fterm_mTerminal$dumphex_l165_n1617___LOOP___END
	leal	-4(%ebp), %esp
	popl	%esi
	popl	%ebp
	retl
.Ltmp145:
	.size	Terminal$dumphex, .Ltmp145-Terminal$dumphex
	.cfi_endproc

	.globl	Terminal$dumphexi
	.align	16, 0x90
	.type	Terminal$dumphexi,@function
Terminal$dumphexi:                      # @"Terminal$dumphexi"
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp146:
	.cfi_def_cfa_offset 32
	movl	36(%esp), %eax
	movl	32(%esp), %ecx
	movl	%ecx, 24(%esp)
	movl	%eax, 20(%esp)
	movl	24(%esp), %ecx
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	movl	$8, 8(%esp)
	calll	Terminal$dumphex
	addl	$28, %esp
	retl
.Ltmp147:
	.size	Terminal$dumphexi, .Ltmp147-Terminal$dumphexi
	.cfi_endproc

	.globl	Terminal$printi
	.align	16, 0x90
	.type	Terminal$printi,@function
Terminal$printi:                        # @"Terminal$printi"
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp148:
	.cfi_def_cfa_offset 32
	movl	36(%esp), %eax
	movl	32(%esp), %ecx
	movl	%ecx, 24(%esp)
	movl	%eax, 20(%esp)
	movl	24(%esp), %ecx
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	movl	$0, 8(%esp)
	calll	Terminal$printlong
	addl	$28, %esp
	retl
.Ltmp149:
	.size	Terminal$printi, .Ltmp149-Terminal$printi
	.cfi_endproc

	.globl	Terminal$blank
	.align	16, 0x90
	.type	Terminal$blank,@function
Terminal$blank:                         # @"Terminal$blank"
	.cfi_startproc
# BB#0:
	subl	$12, %esp
.Ltmp150:
	.cfi_def_cfa_offset 16
	movl	16(%esp), %eax
	movl	%eax, 8(%esp)
	movl	$0, 4(%esp)
	movl	8(%esp), %eax
	movl	8(%eax), %ecx
	imull	4(%eax), %ecx
	addl	%ecx, %ecx
	testl	%ecx, %ecx
	jle	.LBB56_2
	.align	16, 0x90
.LBB56_1:                               # %fterm_mTerminal$blank_l186_n1668___LOOP___HEAD
                                        # =>This Inner Loop Header: Depth=1
	movl	8(%esp), %eax
	movl	(%eax), %eax
	movl	4(%esp), %ecx
	movb	$32, (%eax,%ecx)
	movl	8(%esp), %eax
	movl	(%eax), %ecx
	movl	4(%esp), %edx
	movb	20(%eax), %al
	movb	%al, 1(%edx,%ecx)
	movl	4(%esp), %eax
	addl	$2, %eax
	movl	%eax, 4(%esp)
	movl	8(%esp), %ecx
	movl	8(%ecx), %edx
	imull	4(%ecx), %edx
	addl	%edx, %edx
	cmpl	%edx, %eax
	jl	.LBB56_1
.LBB56_2:                               # %fterm_mTerminal$blank_l186_n1668___LOOP___END
	movl	8(%esp), %eax
	calll	*24(%eax)
	addl	$12, %esp
	retl
.Ltmp151:
	.size	Terminal$blank, .Ltmp151-Terminal$blank
	.cfi_endproc

	.globl	Terminal$bsod
	.align	16, 0x90
	.type	Terminal$bsod,@function
Terminal$bsod:                          # @"Terminal$bsod"
	.cfi_startproc
# BB#0:
	subl	$12, %esp
.Ltmp152:
	.cfi_def_cfa_offset 16
	movl	16(%esp), %eax
	movl	%eax, 8(%esp)
	movb	$48, 20(%eax)
	movl	8(%esp), %eax
	movl	%eax, (%esp)
	calll	Terminal$blank
	movl	8(%esp), %eax
	movl	$0, 12(%eax)
	movl	8(%esp), %eax
	movl	$0, 16(%eax)
	addl	$12, %esp
	retl
.Ltmp153:
	.size	Terminal$bsod, .Ltmp153-Terminal$bsod
	.cfi_endproc

	.globl	_null_updater
	.align	16, 0x90
	.type	_null_updater,@function
_null_updater:                          # @_null_updater
	.cfi_startproc
# BB#0:
	retl
.Ltmp154:
	.size	_null_updater, .Ltmp154-_null_updater
	.cfi_endproc

	.globl	kpanic
	.align	16, 0x90
	.type	kpanic,@function
kpanic:                                 # @kpanic
	.cfi_startproc
# BB#0:
	pushl	%esi
.Ltmp155:
	.cfi_def_cfa_offset 8
	subl	$40, %esp
.Ltmp156:
	.cfi_def_cfa_offset 48
.Ltmp157:
	.cfi_offset %esi, -8
	movl	60(%esp), %eax
	movl	56(%esp), %ecx
	movl	52(%esp), %edx
	movl	48(%esp), %esi
	movl	%esi, 36(%esp)
	movl	%edx, 32(%esp)
	movl	%ecx, 28(%esp)
	movl	%eax, 24(%esp)
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	calll	Terminal$bsod
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fpanic_mkpanic_l15_n1740, 4(%esp)
	calll	Terminal$printl
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fpanic_mkpanic_l16_n1745, 4(%esp)
	calll	Terminal$printl
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	28(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printl
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	24(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printl
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fpanic_mkpanic_l19_n1756, 4(%esp)
	calll	Terminal$printl
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fpanic_mkpanic_l20_n1761, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	36(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$dumpbin
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fpanic_mkpanic_l22_n1769, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	32(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$dumphexi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fpanic_mkpanic_l24_n1777, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	calll	__kgetcs
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	movl	$2, 8(%esp)
	calll	Terminal$dumphex
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fpanic_mkpanic_l26_n1787, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	calll	__kgetds
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	movl	$2, 8(%esp)
	calll	Terminal$dumphex
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fpanic_mkpanic_l28_n1797, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	calll	__kgetss
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	movl	$2, 8(%esp)
	calll	Terminal$dumphex
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fpanic_mkpanic_l30_n1807, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	calll	__kgetes
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	movl	$2, 8(%esp)
	calll	Terminal$dumphex
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fpanic_mkpanic_l32_n1817, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	calll	__kgetfs
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	movl	$2, 8(%esp)
	calll	Terminal$dumphex
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fpanic_mkpanic_l34_n1827, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	calll	__kgetgs
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	movl	$2, 8(%esp)
	calll	Terminal$dumphex
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fpanic_mkpanic_l36_n1837, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	calll	__kgeteflags
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	Terminal$dumpbin
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fpanic_mkpanic_l38_n1846, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	calll	__kgetcr0
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	Terminal$dumpbin
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fpanic_mkpanic_l40_n1855, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	calll	__kgetcr2
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	Terminal$dumphexi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fpanic_mkpanic_l42_n1864, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	calll	__kgetcr3
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	Terminal$dumphexi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fpanic_mkpanic_l44_n1873, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	calll	__kgetcr4
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	Terminal$dumpbin
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fpanic_mkpanic_l46_n1882, 4(%esp)
	calll	Terminal$print
	calll	__khalt
	addl	$40, %esp
	popl	%esi
	retl
.Ltmp158:
	.size	kpanic, .Ltmp158-kpanic
	.cfi_endproc

	.globl	ikpanici
	.align	16, 0x90
	.type	ikpanici,@function
ikpanici:                               # @ikpanici
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp159:
	.cfi_def_cfa_offset 32
	movl	36(%esp), %eax
	movl	32(%esp), %ecx
	movl	%ecx, 24(%esp)
	movl	%eax, 20(%esp)
	movl	24(%esp), %ecx
	movl	%ecx, 8(%esp)
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fpanic_mikpanici_l51_n1894, 12(%esp)
	movl	$0, 4(%esp)
	calll	kpanic
	addl	$28, %esp
	retl
.Ltmp160:
	.size	ikpanici, .Ltmp160-ikpanici
	.cfi_endproc

	.globl	ikpanic
	.align	16, 0x90
	.type	ikpanic,@function
ikpanic:                                # @ikpanic
	.cfi_startproc
# BB#0:
	subl	$12, %esp
.Ltmp161:
	.cfi_def_cfa_offset 16
	movl	16(%esp), %eax
	movl	%eax, 8(%esp)
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	calll	ikpanici
	addl	$12, %esp
	retl
.Ltmp162:
	.size	ikpanic, .Ltmp162-ikpanic
	.cfi_endproc

	.globl	cstr$len
	.align	16, 0x90
	.type	cstr$len,@function
cstr$len:                               # @"cstr$len"
	.cfi_startproc
# BB#0:
	subl	$8, %esp
.Ltmp163:
	.cfi_def_cfa_offset 12
	movl	12(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$0, (%esp)
	movl	4(%esp), %eax
	cmpb	$0, (%eax)
	je	.LBB62_2
	.align	16, 0x90
.LBB62_1:                               # %futil_mcstr$len_l3_n1905___LOOP___HEAD
                                        # =>This Inner Loop Header: Depth=1
	movl	(%esp), %eax
	leal	1(%eax), %ecx
	movl	%ecx, (%esp)
	movl	4(%esp), %ecx
	cmpb	$0, 1(%ecx,%eax)
	jne	.LBB62_1
.LBB62_2:                               # %futil_mcstr$len_l3_n1905___LOOP___END
	movl	(%esp), %eax
	addl	$8, %esp
	retl
.Ltmp164:
	.size	cstr$len, .Ltmp164-cstr$len
	.cfi_endproc

	.globl	cstr$__eq__
	.align	16, 0x90
	.type	cstr$__eq__,@function
cstr$__eq__:                            # @"cstr$__eq__"
	.cfi_startproc
# BB#0:
	pushl	%ebp
.Ltmp165:
	.cfi_def_cfa_offset 8
.Ltmp166:
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
.Ltmp167:
	.cfi_def_cfa_register %ebp
	pushl	%edi
	pushl	%esi
	subl	$16, %esp
.Ltmp168:
	.cfi_offset %esi, -16
.Ltmp169:
	.cfi_offset %edi, -12
	movl	12(%ebp), %eax
	movl	8(%ebp), %ecx
	movl	%ecx, -12(%ebp)
	movl	%eax, -16(%ebp)
	movl	-12(%ebp), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	calll	cstr$len
	addl	$16, %esp
	movl	%eax, %esi
	movl	-16(%ebp), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	calll	cstr$len
	addl	$16, %esp
	cmpl	%eax, %esi
	jne	.LBB63_1
# BB#3:                                 # %if_futil_mcstr$__eq___l9_n1937___DONE
	movl	%esp, %eax
	leal	-16(%eax), %edi
	movl	%edi, %esp
	movl	$0, -16(%eax)
	movl	-12(%ebp), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	calll	cstr$len
	addl	$16, %esp
	testl	%eax, %eax
	jle	.LBB63_6
	.align	16, 0x90
.LBB63_4:                               # %futil_mcstr$__eq___l13_n1942___LOOP___HEAD
                                        # =>This Inner Loop Header: Depth=1
	movl	-12(%ebp), %eax
	movl	(%edi), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	cstr$idxi
	addl	$16, %esp
	movl	%eax, %esi
	movl	-16(%ebp), %eax
	movl	(%edi), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	cstr$idxi
	addl	$16, %esp
	cmpl	%eax, %esi
	jne	.LBB63_1
# BB#5:                                 # %if_futil_mcstr$__eq___l14_n1954___DONE
                                        #   in Loop: Header=BB63_4 Depth=1
	movl	(%edi), %esi
	incl	%esi
	movl	%esi, (%edi)
	movl	-12(%ebp), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	calll	cstr$len
	addl	$16, %esp
	cmpl	%eax, %esi
	jl	.LBB63_4
.LBB63_6:                               # %futil_mcstr$__eq___l13_n1942___LOOP___END
	movb	$1, %al
	jmp	.LBB63_2
.LBB63_1:                               # %if_futil_mcstr$__eq___l9_n1937___SUCC
	xorl	%eax, %eax
.LBB63_2:                               # %if_futil_mcstr$__eq___l9_n1937___SUCC
	leal	-8(%ebp), %esp
	popl	%esi
	popl	%edi
	popl	%ebp
	retl
.Ltmp170:
	.size	cstr$__eq__, .Ltmp170-cstr$__eq__
	.cfi_endproc

	.globl	cstr$index
	.align	16, 0x90
	.type	cstr$index,@function
cstr$index:                             # @"cstr$index"
	.cfi_startproc
# BB#0:
	pushl	%esi
.Ltmp171:
	.cfi_def_cfa_offset 8
	subl	$24, %esp
.Ltmp172:
	.cfi_def_cfa_offset 32
.Ltmp173:
	.cfi_offset %esi, -8
	movb	36(%esp), %al
	movl	32(%esp), %ecx
	movl	%ecx, 20(%esp)
	movb	%al, 19(%esp)
	movl	$0, 12(%esp)
	movl	20(%esp), %eax
	movl	%eax, (%esp)
	calll	cstr$len
	testl	%eax, %eax
	jle	.LBB64_4
	.align	16, 0x90
.LBB64_1:                               # %futil_mcstr$index_l23_n1970___LOOP___HEAD
                                        # =>This Inner Loop Header: Depth=1
	movl	20(%esp), %eax
	movl	12(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	cstr$idxi
	movzbl	%al, %eax
	movzbl	19(%esp), %ecx
	cmpl	%ecx, %eax
	je	.LBB64_2
# BB#3:                                 # %if_futil_mcstr$index_l24_n1981___DONE
                                        #   in Loop: Header=BB64_1 Depth=1
	movl	12(%esp), %esi
	incl	%esi
	movl	%esi, 12(%esp)
	movl	20(%esp), %eax
	movl	%eax, (%esp)
	calll	cstr$len
	cmpl	%eax, %esi
	jl	.LBB64_1
.LBB64_4:                               # %futil_mcstr$index_l23_n1970___LOOP___END
	movl	$-1, %eax
	jmp	.LBB64_5
.LBB64_2:                               # %if_futil_mcstr$index_l24_n1981___SUCC
	movl	12(%esp), %eax
.LBB64_5:                               # %futil_mcstr$index_l23_n1970___LOOP___END
	addl	$24, %esp
	popl	%esi
	retl
.Ltmp174:
	.size	cstr$index, .Ltmp174-cstr$index
	.cfi_endproc

	.globl	cstr$ord
	.align	16, 0x90
	.type	cstr$ord,@function
cstr$ord:                               # @"cstr$ord"
	.cfi_startproc
# BB#0:
	pushl	%eax
.Ltmp175:
	.cfi_def_cfa_offset 8
	movl	8(%esp), %eax
	movl	%eax, (%esp)
	movzbl	(%eax), %eax
	popl	%edx
	retl
.Ltmp176:
	.size	cstr$ord, .Ltmp176-cstr$ord
	.cfi_endproc

	.globl	char
	.align	16, 0x90
	.type	char,@function
char:                                   # @char
	.cfi_startproc
# BB#0:
	subl	$12, %esp
.Ltmp177:
	.cfi_def_cfa_offset 16
	movl	16(%esp), %eax
	movl	%eax, 8(%esp)
	movl	%eax, (%esp)
	calll	cstr$ord
                                        # kill: AL<def> AL<kill> EAX<kill>
	addl	$12, %esp
	retl
.Ltmp178:
	.size	char, .Ltmp178-char
	.cfi_endproc

	.globl	cstr$idxi
	.align	16, 0x90
	.type	cstr$idxi,@function
cstr$idxi:                              # @"cstr$idxi"
	.cfi_startproc
# BB#0:
	subl	$8, %esp
.Ltmp179:
	.cfi_def_cfa_offset 12
	movl	16(%esp), %eax
	movl	12(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	4(%esp), %ecx
	movzbl	(%ecx,%eax), %eax
	addl	$8, %esp
	retl
.Ltmp180:
	.size	cstr$idxi, .Ltmp180-cstr$idxi
	.cfi_endproc

	.globl	hex_char_to_num
	.align	16, 0x90
	.type	hex_char_to_num,@function
hex_char_to_num:                        # @hex_char_to_num
	.cfi_startproc
# BB#0:
	pushl	%eax
.Ltmp181:
	.cfi_def_cfa_offset 8
	movl	8(%esp), %eax
	movl	%eax, (%esp)
	cmpl	$48, %eax
	jl	.LBB68_3
# BB#1:                                 # %if_futil_mhex_char_to_num_l41_n2019___SUCC
	cmpl	$57, (%esp)
	jg	.LBB68_2
# BB#4:                                 # %if_futil_mhex_char_to_num_l42_n2023___SUCC
	movl	(%esp), %eax
	addl	$-48, %eax
	popl	%edx
	retl
.LBB68_3:                               # %if_futil_mhex_char_to_num_l41_n2019___DONE
	movl	$-1, %eax
	popl	%edx
	retl
.LBB68_2:                               # %if_futil_mhex_char_to_num_l42_n2023___FAIL
	movl	(%esp), %eax
	addl	$-87, %eax
	popl	%edx
	retl
.Ltmp182:
	.size	hex_char_to_num, .Ltmp182-hex_char_to_num
	.cfi_endproc

	.globl	int$bitset
	.align	16, 0x90
	.type	int$bitset,@function
int$bitset:                             # @"int$bitset"
	.cfi_startproc
# BB#0:
	subl	$8, %esp
.Ltmp183:
	.cfi_def_cfa_offset 12
	movl	16(%esp), %eax
	movl	12(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	4(%esp), %eax
	movl	(%esp), %ecx
	btl	%ecx, %eax
	setb	%al
	addl	$8, %esp
	retl
.Ltmp184:
	.size	int$bitset, .Ltmp184-int$bitset
	.cfi_endproc

	.globl	bool$or
	.align	16, 0x90
	.type	bool$or,@function
bool$or:                                # @"bool$or"
	.cfi_startproc
# BB#0:
	pushl	%eax
.Ltmp185:
	.cfi_def_cfa_offset 8
	movb	12(%esp), %al
	movb	8(%esp), %cl
	andb	$1, %cl
	movb	%cl, 3(%esp)
	andb	$1, %al
	movb	%al, 2(%esp)
	movzbl	3(%esp), %eax
	cmpl	$1, %eax
	jne	.LBB70_2
# BB#1:                                 # %if_futil_mbool$or_l54_n2046___SUCC
	movb	3(%esp), %al
	popl	%edx
	retl
.LBB70_2:                               # %if_futil_mbool$or_l54_n2046___DONE
	movb	2(%esp), %al
	popl	%edx
	retl
.Ltmp186:
	.size	bool$or, .Ltmp186-bool$or
	.cfi_endproc

	.globl	Keymap$$init
	.align	16, 0x90
	.type	Keymap$$init,@function
Keymap$$init:                           # @"Keymap$$init"
	.cfi_startproc
# BB#0:
	subl	$12, %esp
.Ltmp187:
	.cfi_def_cfa_offset 16
	movl	$4, (%esp)
	calll	malloc
	movl	%eax, 8(%esp)
	movb	$27, (%eax)
	movl	8(%esp), %eax
	movb	$17, 2(%eax)
	movl	8(%esp), %eax
	movb	$18, 3(%eax)
	movl	8(%esp), %eax
	addl	$12, %esp
	retl
.Ltmp188:
	.size	Keymap$$init, .Ltmp188-Keymap$$init
	.cfi_endproc

	.globl	Keymap$translate_keycode
	.align	16, 0x90
	.type	Keymap$translate_keycode,@function
Keymap$translate_keycode:               # @"Keymap$translate_keycode"
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp189:
	.cfi_def_cfa_offset 32
	movb	40(%esp), %al
	movl	36(%esp), %ecx
	movl	32(%esp), %edx
	movl	%edx, 24(%esp)
	movl	%ecx, 20(%esp)
	andb	$1, %al
	movb	%al, 19(%esp)
	movl	$.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l16_n2072, (%esp)
	calll	cstr$ord
	movl	%eax, 12(%esp)
	cmpl	$1, 20(%esp)
	jne	.LBB72_2
# BB#1:                                 # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2078___SUCC
	movl	$27, 12(%esp)
	jmp	.LBB72_35
.LBB72_2:                               # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2078___FAIL
	movl	20(%esp), %eax
	cmpl	$2, %eax
	jl	.LBB72_8
# BB#3:                                 # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2078___FAIL
	movl	$14, %ecx
	cmpl	%ecx, %eax
	jge	.LBB72_8
# BB#4:                                 # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2087___SUCC
	movzbl	19(%esp), %eax
	cmpl	$1, %eax
	jne	.LBB72_7
# BB#5:                                 # %if_fkeymap_us_mKeymap$translate_keycode_l20_n2089___SUCC
	movl	20(%esp), %eax
	addl	$-2, %eax
	movl	%eax, 4(%esp)
	movl	$.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l21_n2091, (%esp)
	calll	cstr$idxi
	jmp	.LBB72_34
.LBB72_8:                               # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2087___FAIL
	cmpl	$15, 20(%esp)
	jne	.LBB72_10
# BB#9:                                 # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2107___SUCC
	movl	$9, 12(%esp)
	jmp	.LBB72_35
.LBB72_7:                               # %if_fkeymap_us_mKeymap$translate_keycode_l20_n2089___FAIL
	movl	20(%esp), %eax
	addl	$-2, %eax
	movl	%eax, 4(%esp)
	movl	$.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l23_n2098, (%esp)
	calll	cstr$idxi
	jmp	.LBB72_34
.LBB72_10:                              # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2107___FAIL
	movl	20(%esp), %eax
	cmpl	$16, %eax
	jl	.LBB72_15
# BB#11:                                # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2107___FAIL
	movl	$29, %ecx
	cmpl	%ecx, %eax
	jge	.LBB72_15
# BB#12:                                # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2116___SUCC
	movzbl	19(%esp), %eax
	cmpl	$1, %eax
	jne	.LBB72_14
# BB#13:                                # %if_fkeymap_us_mKeymap$translate_keycode_l28_n2118___SUCC
	movl	20(%esp), %eax
	addl	$-16, %eax
	movl	%eax, 4(%esp)
	movl	$.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l29_n2120, (%esp)
	calll	cstr$idxi
	jmp	.LBB72_34
.LBB72_15:                              # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2116___FAIL
	movl	20(%esp), %eax
	cmpl	$30, %eax
	jl	.LBB72_20
# BB#16:                                # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2116___FAIL
	movl	$42, %ecx
	cmpl	%ecx, %eax
	jge	.LBB72_20
# BB#17:                                # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2140___SUCC
	movzbl	19(%esp), %eax
	cmpl	$1, %eax
	jne	.LBB72_19
# BB#18:                                # %if_fkeymap_us_mKeymap$translate_keycode_l35_n2142___SUCC
	movl	20(%esp), %eax
	addl	$-30, %eax
	movl	%eax, 4(%esp)
	movl	$.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l36_n2144, (%esp)
	calll	cstr$idxi
	jmp	.LBB72_34
.LBB72_14:                              # %if_fkeymap_us_mKeymap$translate_keycode_l28_n2118___FAIL
	movl	20(%esp), %eax
	addl	$-16, %eax
	movl	%eax, 4(%esp)
	movl	$.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l31_n2127, (%esp)
	calll	cstr$idxi
	jmp	.LBB72_34
.LBB72_20:                              # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2140___FAIL
	movl	20(%esp), %eax
	cmpl	$43, %eax
	jl	.LBB72_25
# BB#21:                                # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2140___FAIL
	movl	$54, %ecx
	cmpl	%ecx, %eax
	jge	.LBB72_25
# BB#22:                                # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2164___SUCC
	movzbl	19(%esp), %eax
	cmpl	$1, %eax
	jne	.LBB72_24
# BB#23:                                # %if_fkeymap_us_mKeymap$translate_keycode_l42_n2166___SUCC
	movl	20(%esp), %eax
	addl	$-43, %eax
	movl	%eax, 4(%esp)
	movl	$.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l43_n2168, (%esp)
	calll	cstr$idxi
	jmp	.LBB72_34
.LBB72_19:                              # %if_fkeymap_us_mKeymap$translate_keycode_l35_n2142___FAIL
	movl	20(%esp), %eax
	addl	$-30, %eax
	movl	%eax, 4(%esp)
	movl	$.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l38_n2151, (%esp)
	calll	cstr$idxi
	jmp	.LBB72_34
.LBB72_25:                              # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2164___FAIL
	cmpl	$55, 20(%esp)
	jne	.LBB72_28
# BB#26:                                # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2184___SUCC
	movl	$.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l49_n2186, (%esp)
	calll	cstr$ord
	jmp	.LBB72_34
.LBB72_24:                              # %if_fkeymap_us_mKeymap$translate_keycode_l42_n2166___FAIL
	movl	20(%esp), %eax
	addl	$-43, %eax
	movl	%eax, 4(%esp)
	movl	$.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l45_n2175, (%esp)
	calll	cstr$idxi
	jmp	.LBB72_34
.LBB72_28:                              # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2184___FAIL
	cmpl	$57, 20(%esp)
	jne	.LBB72_30
# BB#29:                                # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2192___SUCC
	movl	$.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l51_n2194, (%esp)
	calll	cstr$ord
	jmp	.LBB72_34
.LBB72_30:                              # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2192___FAIL
	cmpl	$59, 20(%esp)
	jne	.LBB72_32
# BB#31:                                # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2200___SUCC
	movl	24(%esp), %eax
	movzbl	2(%eax), %eax
	jmp	.LBB72_34
.LBB72_32:                              # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2200___FAIL
	cmpl	$60, 20(%esp)
	jne	.LBB72_35
# BB#33:                                # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2208___SUCC
	movl	24(%esp), %eax
	movzbl	3(%eax), %eax
.LBB72_34:                              # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2078___DONE
	movl	%eax, 12(%esp)
.LBB72_35:                              # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2078___DONE
	movb	12(%esp), %al
	addl	$28, %esp
	retl
.Ltmp190:
	.size	Keymap$translate_keycode, .Ltmp190-Keymap$translate_keycode
	.cfi_endproc

	.globl	Keymap$is_shifted
	.align	16, 0x90
	.type	Keymap$is_shifted,@function
Keymap$is_shifted:                      # @"Keymap$is_shifted"
	.cfi_startproc
# BB#0:
	subl	$8, %esp
.Ltmp191:
	.cfi_def_cfa_offset 12
	movl	16(%esp), %eax
	movl	12(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	(%eax), %eax
	movb	42(%eax), %cl
	addb	54(%eax), %cl
	setne	%al
	addl	$8, %esp
	retl
.Ltmp192:
	.size	Keymap$is_shifted, .Ltmp192-Keymap$is_shifted
	.cfi_endproc

	.globl	init_keymap
	.align	16, 0x90
	.type	init_keymap,@function
init_keymap:                            # @init_keymap
	.cfi_startproc
# BB#0:
	subl	$12, %esp
.Ltmp193:
	.cfi_def_cfa_offset 16
	calll	Keymap$$init
	movl	%eax, gvar_fkeymap_us_mu_lu_n11__keymap
	addl	$12, %esp
	retl
.Ltmp194:
	.size	init_keymap, .Ltmp194-init_keymap
	.cfi_endproc

	.globl	translate_keycode
	.align	16, 0x90
	.type	translate_keycode,@function
translate_keycode:                      # @translate_keycode
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp195:
	.cfi_def_cfa_offset 32
	movb	36(%esp), %al
	movl	32(%esp), %ecx
	movl	%ecx, 24(%esp)
	andb	$1, %al
	movb	%al, 23(%esp)
	movl	gvar_fkeymap_us_mu_lu_n11__keymap, %eax
	movl	24(%esp), %ecx
	movzbl	23(%esp), %edx
	movl	%edx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Keymap$translate_keycode
	addl	$28, %esp
	retl
.Ltmp196:
	.size	translate_keycode, .Ltmp196-translate_keycode
	.cfi_endproc

	.globl	KeyboardBuf$$new
	.align	16, 0x90
	.type	KeyboardBuf$$new,@function
KeyboardBuf$$new:                       # @"KeyboardBuf$$new"
	.cfi_startproc
# BB#0:
	pushl	%esi
.Ltmp197:
	.cfi_def_cfa_offset 8
	subl	$24, %esp
.Ltmp198:
	.cfi_def_cfa_offset 32
.Ltmp199:
	.cfi_offset %esi, -8
	movl	40(%esp), %eax
	movl	36(%esp), %ecx
	movl	32(%esp), %edx
	movl	%edx, 20(%esp)
	movl	%ecx, 16(%esp)
	movl	%eax, 12(%esp)
	movl	$40, (%esp)
	calll	malloc
	movl	%eax, 8(%esp)
	movl	$0, (%eax)
	movl	8(%esp), %eax
	movl	20(%esp), %ecx
	movl	%ecx, 4(%eax)
	movl	8(%esp), %esi
	movl	20(%esp), %eax
	movl	%eax, (%esp)
	calll	malloc
	movl	%eax, 8(%esi)
	movl	8(%esp), %eax
	movl	16(%esp), %ecx
	movl	%ecx, 16(%eax)
	movl	8(%esp), %eax
	movl	12(%esp), %ecx
	movl	%ecx, 20(%eax)
	movl	8(%esp), %eax
	addl	$24, %esp
	popl	%esi
	retl
.Ltmp200:
	.size	KeyboardBuf$$new, .Ltmp200-KeyboardBuf$$new
	.cfi_endproc

	.globl	KeyboardBuf$append
	.align	16, 0x90
	.type	KeyboardBuf$append,@function
KeyboardBuf$append:                     # @"KeyboardBuf$append"
	.cfi_startproc
# BB#0:
	subl	$8, %esp
.Ltmp201:
	.cfi_def_cfa_offset 12
	movb	16(%esp), %al
	movl	12(%esp), %ecx
	movl	%ecx, 4(%esp)
	movb	%al, 3(%esp)
	movl	4(%esp), %ecx
	movl	(%ecx), %edx
	movl	8(%ecx), %ecx
	movb	%al, (%ecx,%edx)
	movl	4(%esp), %eax
	movl	(%eax), %ecx
	movl	8(%eax), %eax
	movb	$0, 1(%ecx,%eax)
	movl	4(%esp), %eax
	incl	(%eax)
	addl	$8, %esp
	retl
.Ltmp202:
	.size	KeyboardBuf$append, .Ltmp202-KeyboardBuf$append
	.cfi_endproc

	.globl	KeyboardBuf$delete1
	.align	16, 0x90
	.type	KeyboardBuf$delete1,@function
KeyboardBuf$delete1:                    # @"KeyboardBuf$delete1"
	.cfi_startproc
# BB#0:
	pushl	%eax
.Ltmp203:
	.cfi_def_cfa_offset 8
	movl	8(%esp), %eax
	movl	%eax, (%esp)
	cmpl	$0, (%eax)
	jle	.LBB78_2
# BB#1:                                 # %if_fkappsutil_mKeyboardBuf$delete1_l27_n2309___SUCC
	movl	(%esp), %eax
	decl	(%eax)
	movl	(%esp), %eax
	movl	(%eax), %ecx
	movl	8(%eax), %eax
	movb	$0, (%eax,%ecx)
.LBB78_2:                               # %if_fkappsutil_mKeyboardBuf$delete1_l27_n2309___DONE
	popl	%eax
	retl
.Ltmp204:
	.size	KeyboardBuf$delete1, .Ltmp204-KeyboardBuf$delete1
	.cfi_endproc

	.globl	KeyboardBuf$stringview
	.align	16, 0x90
	.type	KeyboardBuf$stringview,@function
KeyboardBuf$stringview:                 # @"KeyboardBuf$stringview"
	.cfi_startproc
# BB#0:
	pushl	%eax
.Ltmp205:
	.cfi_def_cfa_offset 8
	movl	8(%esp), %eax
	movl	%eax, (%esp)
	movl	8(%eax), %eax
	popl	%edx
	retl
.Ltmp206:
	.size	KeyboardBuf$stringview, .Ltmp206-KeyboardBuf$stringview
	.cfi_endproc

	.globl	KeyboardBuf$clear
	.align	16, 0x90
	.type	KeyboardBuf$clear,@function
KeyboardBuf$clear:                      # @"KeyboardBuf$clear"
	.cfi_startproc
# BB#0:
	pushl	%eax
.Ltmp207:
	.cfi_def_cfa_offset 8
	movl	8(%esp), %eax
	movl	%eax, (%esp)
	movl	$0, (%eax)
	movl	(%esp), %eax
	movl	8(%eax), %eax
	movb	$0, (%eax)
	popl	%eax
	retl
.Ltmp208:
	.size	KeyboardBuf$clear, .Ltmp208-KeyboardBuf$clear
	.cfi_endproc

	.globl	KeyboardBuf$handleevent
	.align	16, 0x90
	.type	KeyboardBuf$handleevent,@function
KeyboardBuf$handleevent:                # @"KeyboardBuf$handleevent"
	.cfi_startproc
# BB#0:
	pushl	%ebp
.Ltmp209:
	.cfi_def_cfa_offset 8
.Ltmp210:
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
.Ltmp211:
	.cfi_def_cfa_register %ebp
	pushl	%edi
	pushl	%esi
	subl	$16, %esp
.Ltmp212:
	.cfi_offset %esi, -16
.Ltmp213:
	.cfi_offset %edi, -12
	movb	16(%ebp), %al
	andb	$1, %al
	movl	12(%ebp), %ecx
	movl	8(%ebp), %edx
	movl	%edx, -12(%ebp)
	movl	%ecx, -16(%ebp)
	movb	%al, -17(%ebp)
	je	.LBB81_10
# BB#1:                                 # %if_fkappsutil_mKeyboardBuf$handleevent_l42_n2350___SUCC
	cmpl	$14, -16(%ebp)
	jne	.LBB81_4
# BB#2:                                 # %if_fkappsutil_mKeyboardBuf$handleevent_l43_n2354___SUCC
	movl	-12(%ebp), %eax
	cmpl	$0, (%eax)
	je	.LBB81_10
# BB#3:                                 # %if_fkappsutil_mKeyboardBuf$handleevent_l44_n2360___SUCC
	movl	-12(%ebp), %eax
	movl	16(%eax), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$0, 8(%esp)
	movl	$-1, 4(%esp)
	calll	Terminal$movecursor
	addl	$16, %esp
	movl	-12(%ebp), %eax
	movl	16(%eax), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsutil_mKeyboardBuf$handleevent_l46_n2372, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	-12(%ebp), %eax
	movl	16(%eax), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$0, 8(%esp)
	movl	$-1, 4(%esp)
	calll	Terminal$movecursor
	addl	$16, %esp
	movl	-12(%ebp), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	calll	KeyboardBuf$delete1
	jmp	.LBB81_9
.LBB81_4:                               # %if_fkappsutil_mKeyboardBuf$handleevent_l43_n2354___FAIL
	cmpl	$28, -16(%ebp)
	jne	.LBB81_6
# BB#5:                                 # %if_fkappsutil_mKeyboardBuf$handleevent_l43_n2387___SUCC
	movl	-12(%ebp), %eax
	movl	16(%eax), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsutil_mKeyboardBuf$handleevent_l51_n2392, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	-12(%ebp), %eax
	movl	20(%eax), %esi
	subl	$16, %esp
	movl	%eax, (%esp)
	calll	KeyboardBuf$stringview
	addl	$16, %esp
	subl	$16, %esp
	movl	%eax, (%esp)
	calll	*%esi
	addl	$16, %esp
	movl	-12(%ebp), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	calll	KeyboardBuf$clear
	jmp	.LBB81_9
.LBB81_6:                               # %if_fkappsutil_mKeyboardBuf$handleevent_l43_n2387___FAIL
	cmpl	$42, -16(%ebp)
	je	.LBB81_10
# BB#7:                                 # %if_fkappsutil_mKeyboardBuf$handleevent_l43_n2406___FAIL
	cmpl	$54, -16(%ebp)
	je	.LBB81_10
# BB#8:                                 # %if_fkappsutil_mKeyboardBuf$handleevent_l43_n2411___FAIL
	movl	%esp, %esi
	leal	-16(%esi), %eax
	movl	%eax, %esp
	movl	-16(%ebp), %edi
	movl	gvar_fkeymap_us_mu_lu_n11__keymap, %eax
	movl	gvar_firqio_mu_lu_n5__system_kbdstate, %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Keymap$is_shifted
	addl	$16, %esp
	subl	$16, %esp
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	%edi, (%esp)
	calll	translate_keycode
	addl	$16, %esp
	movb	%al, -16(%esi)
	movl	-12(%ebp), %eax
	movl	16(%eax), %eax
	movzbl	-16(%esi), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$putchar
	addl	$16, %esp
	movl	-12(%ebp), %eax
	movzbl	-16(%esi), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	KeyboardBuf$append
.LBB81_9:                               # %if_fkappsutil_mKeyboardBuf$handleevent_l42_n2350___DONE
	addl	$16, %esp
.LBB81_10:                              # %if_fkappsutil_mKeyboardBuf$handleevent_l42_n2350___DONE
	leal	-8(%ebp), %esp
	popl	%esi
	popl	%edi
	popl	%ebp
	retl
.Ltmp214:
	.size	KeyboardBuf$handleevent, .Ltmp214-KeyboardBuf$handleevent
	.cfi_endproc

	.globl	RawMultibootInfo$get_tag
	.align	16, 0x90
	.type	RawMultibootInfo$get_tag,@function
RawMultibootInfo$get_tag:               # @"RawMultibootInfo$get_tag"
	.cfi_startproc
# BB#0:
	pushl	%esi
.Ltmp215:
	.cfi_def_cfa_offset 8
	subl	$40, %esp
.Ltmp216:
	.cfi_def_cfa_offset 48
.Ltmp217:
	.cfi_offset %esi, -8
	movl	52(%esp), %eax
	movl	48(%esp), %ecx
	movl	%ecx, 36(%esp)
	movl	%eax, 32(%esp)
	movl	$0, 28(%esp)
	movl	$8, 24(%esp)
	movl	36(%esp), %eax
	movl	%eax, 20(%esp)
	jmp	.LBB82_1
	.align	16, 0x90
.LBB82_6:                               # %if_fmbdata_mRawMultibootInfo$get_tag_l23_n2464___DONE
                                        #   in Loop: Header=BB82_1 Depth=1
	incl	28(%esp)
.LBB82_1:                               # =>This Inner Loop Header: Depth=1
	movl	24(%esp), %eax
	movl	36(%esp), %ecx
	cmpl	(%ecx), %eax
	jge	.LBB82_7
# BB#2:                                 # %fmbdata_mRawMultibootInfo$get_tag_l18_n2437___LOOP___HEAD
                                        #   in Loop: Header=BB82_1 Depth=1
	movl	28(%esp), %eax
	cmpl	32(%esp), %eax
	je	.LBB82_3
# BB#4:                                 # %if_fmbdata_mRawMultibootInfo$get_tag_l19_n2446___DONE
                                        #   in Loop: Header=BB82_1 Depth=1
	movl	24(%esp), %esi
	movl	20(%esp), %eax
	movl	%esi, 4(%esp)
	movl	%eax, (%esp)
	calll	ptr$offset
	addl	4(%eax), %esi
	movl	%esi, 24(%esp)
	movl	%esi, %eax
	sarl	$31, %eax
	shrl	$29, %eax
	addl	%esi, %eax
	andl	$-8, %eax
	cmpl	%eax, %esi
	je	.LBB82_6
# BB#5:                                 # %if_fmbdata_mRawMultibootInfo$get_tag_l23_n2464___SUCC
                                        #   in Loop: Header=BB82_1 Depth=1
	movl	24(%esp), %eax
	movl	%eax, %ecx
	sarl	$31, %ecx
	shrl	$29, %ecx
	addl	%eax, %ecx
	andl	$-8, %ecx
	movl	%eax, %edx
	subl	%ecx, %edx
	negl	%edx
	leal	8(%eax,%edx), %eax
	movl	%eax, 24(%esp)
	jmp	.LBB82_6
.LBB82_7:                               # %fmbdata_mRawMultibootInfo$get_tag_l18_n2437___LOOP___END
	xorl	%eax, %eax
.LBB82_8:                               # %fmbdata_mRawMultibootInfo$get_tag_l18_n2437___LOOP___END
	addl	$40, %esp
	popl	%esi
	retl
.LBB82_3:                               # %if_fmbdata_mRawMultibootInfo$get_tag_l19_n2446___SUCC
	movl	20(%esp), %eax
	movl	24(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	ptr$offset
	jmp	.LBB82_8
.Ltmp218:
	.size	RawMultibootInfo$get_tag, .Ltmp218-RawMultibootInfo$get_tag
	.cfi_endproc

	.globl	RawMultibootInfo$get_type
	.align	16, 0x90
	.type	RawMultibootInfo$get_type,@function
RawMultibootInfo$get_type:              # @"RawMultibootInfo$get_type"
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp219:
	.cfi_def_cfa_offset 32
	movl	36(%esp), %eax
	movl	32(%esp), %ecx
	movl	%ecx, 24(%esp)
	movl	%eax, 20(%esp)
	movl	$0, 16(%esp)
	movl	24(%esp), %eax
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	jmp	.LBB83_1
	.align	16, 0x90
.LBB83_3:                               # %if_fmbdata_mRawMultibootInfo$get_type_l34_n2502___DONE
                                        #   in Loop: Header=BB83_1 Depth=1
	movl	16(%esp), %eax
	incl	%eax
	movl	%eax, 16(%esp)
	movl	24(%esp), %ecx
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
.LBB83_1:                               # =>This Inner Loop Header: Depth=1
	calll	RawMultibootInfo$get_tag
	movl	%eax, 12(%esp)
	cmpl	$0, (%eax)
	je	.LBB83_4
# BB#2:                                 # %fmbdata_mRawMultibootInfo$get_type_l33_n2491___LOOP___HEAD
                                        #   in Loop: Header=BB83_1 Depth=1
	movl	12(%esp), %eax
	movl	(%eax), %eax
	cmpl	20(%esp), %eax
	jne	.LBB83_3
# BB#5:                                 # %if_fmbdata_mRawMultibootInfo$get_type_l34_n2502___SUCC
	movl	12(%esp), %eax
	addl	$28, %esp
	retl
.LBB83_4:                               # %fmbdata_mRawMultibootInfo$get_type_l33_n2491___LOOP___END
	xorl	%eax, %eax
	addl	$28, %esp
	retl
.Ltmp220:
	.size	RawMultibootInfo$get_type, .Ltmp220-RawMultibootInfo$get_type
	.cfi_endproc

	.globl	RawMultibootInfo$has_type
	.align	16, 0x90
	.type	RawMultibootInfo$has_type,@function
RawMultibootInfo$has_type:              # @"RawMultibootInfo$has_type"
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp221:
	.cfi_def_cfa_offset 32
	movl	36(%esp), %eax
	movl	32(%esp), %ecx
	movl	%ecx, 24(%esp)
	movl	%eax, 20(%esp)
	movl	$0, 16(%esp)
	movl	24(%esp), %eax
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	jmp	.LBB84_1
	.align	16, 0x90
.LBB84_3:                               # %if_fmbdata_mRawMultibootInfo$has_type_l47_n2537___DONE
                                        #   in Loop: Header=BB84_1 Depth=1
	movl	16(%esp), %eax
	incl	%eax
	movl	%eax, 16(%esp)
	movl	24(%esp), %ecx
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
.LBB84_1:                               # =>This Inner Loop Header: Depth=1
	calll	RawMultibootInfo$get_tag
	movl	%eax, 12(%esp)
	cmpl	$0, (%eax)
	je	.LBB84_4
# BB#2:                                 # %fmbdata_mRawMultibootInfo$has_type_l46_n2526___LOOP___HEAD
                                        #   in Loop: Header=BB84_1 Depth=1
	movl	12(%esp), %eax
	movl	(%eax), %eax
	cmpl	20(%esp), %eax
	jne	.LBB84_3
# BB#5:                                 # %if_fmbdata_mRawMultibootInfo$has_type_l47_n2537___SUCC
	movb	$1, %al
	addl	$28, %esp
	retl
.LBB84_4:                               # %fmbdata_mRawMultibootInfo$has_type_l46_n2526___LOOP___END
	xorl	%eax, %eax
	addl	$28, %esp
	retl
.Ltmp222:
	.size	RawMultibootInfo$has_type, .Ltmp222-RawMultibootInfo$has_type
	.cfi_endproc

	.globl	RawMultibootInfo$print
	.align	16, 0x90
	.type	RawMultibootInfo$print,@function
RawMultibootInfo$print:                 # @"RawMultibootInfo$print"
	.cfi_startproc
# BB#0:
	pushl	%ebp
.Ltmp223:
	.cfi_def_cfa_offset 8
.Ltmp224:
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
.Ltmp225:
	.cfi_def_cfa_register %ebp
	pushl	%esi
	subl	$20, %esp
.Ltmp226:
	.cfi_offset %esi, -12
	movl	8(%ebp), %eax
	movl	%eax, -8(%ebp)
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l56_n2556, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	-8(%ebp), %ecx
	movl	(%ecx), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l58_n2566, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	$0, -12(%ebp)
	movl	-8(%ebp), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	calll	RawMultibootInfo$get_tag
	addl	$16, %esp
	movl	%eax, -16(%ebp)
	jmp	.LBB85_1
	.align	16, 0x90
.LBB85_35:                              # %if_fmbdata_mRawMultibootInfo$print_l145_n2981___DONE
                                        #   in Loop: Header=BB85_1 Depth=1
	movl	-16(%ebp), %eax
.LBB85_1:                               # =>This Inner Loop Header: Depth=1
	cmpl	$0, (%eax)
	je	.LBB85_32
# BB#2:                                 # %fmbdata_mRawMultibootInfo$print_l62_n2575___LOOP___HEAD
                                        #   in Loop: Header=BB85_1 Depth=1
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	-12(%ebp), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l64_n2586, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	-16(%ebp), %eax
	cmpl	$1, (%eax)
	jne	.LBB85_4
# BB#3:                                 # %if_fmbdata_mRawMultibootInfo$print_l66_n2594___SUCC
                                        #   in Loop: Header=BB85_1 Depth=1
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l67_n2597, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	movl	-16(%ebp), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$8, 4(%esp)
	calll	ptr$offset
	addl	$16, %esp
	subl	$16, %esp
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l69_n2609, 4(%esp)
	jmp	.LBB85_29
	.align	16, 0x90
.LBB85_4:                               # %if_fmbdata_mRawMultibootInfo$print_l66_n2594___FAIL
                                        #   in Loop: Header=BB85_1 Depth=1
	movl	-16(%ebp), %eax
	cmpl	$2, (%eax)
	jne	.LBB85_6
# BB#5:                                 # %if_fmbdata_mRawMultibootInfo$print_l66_n2617___SUCC
                                        #   in Loop: Header=BB85_1 Depth=1
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l71_n2620, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	movl	-16(%ebp), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$8, 4(%esp)
	calll	ptr$offset
	addl	$16, %esp
	subl	$16, %esp
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l73_n2632, 4(%esp)
	jmp	.LBB85_29
.LBB85_6:                               # %if_fmbdata_mRawMultibootInfo$print_l66_n2617___FAIL
                                        #   in Loop: Header=BB85_1 Depth=1
	movl	-16(%ebp), %eax
	cmpl	$3, (%eax)
	jne	.LBB85_8
# BB#7:                                 # %if_fmbdata_mRawMultibootInfo$print_l66_n2640___SUCC
                                        #   in Loop: Header=BB85_1 Depth=1
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l75_n2643, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	movl	-16(%ebp), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	calll	MBModuleTag$get_args
	addl	$16, %esp
	subl	$16, %esp
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	.align	16, 0x90
.LBB85_29:                              # %if_fmbdata_mRawMultibootInfo$print_l66_n2594___DONE
                                        #   in Loop: Header=BB85_1 Depth=1
	calll	Terminal$print
.LBB85_30:                              # %if_fmbdata_mRawMultibootInfo$print_l66_n2594___DONE
                                        #   in Loop: Header=BB85_1 Depth=1
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l130_n2926, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	-16(%ebp), %ecx
	movl	(%ecx), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l132_n2936, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	-16(%ebp), %ecx
	movl	4(%ecx), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l134_n2946, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	-16(%ebp), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$dumphexi
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l136_n2956, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	-12(%ebp), %eax
	incl	%eax
	movl	%eax, -12(%ebp)
	movl	-8(%ebp), %ecx
	subl	$16, %esp
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	calll	RawMultibootInfo$get_tag
	addl	$16, %esp
	movl	%eax, -16(%ebp)
	testl	%eax, %eax
	je	.LBB85_31
# BB#33:                                # %if_fmbdata_mRawMultibootInfo$print_l140_n2970___DONE
                                        #   in Loop: Header=BB85_1 Depth=1
	movl	-16(%ebp), %eax
	cmpl	$0, (%eax)
	jne	.LBB85_35
# BB#34:                                # %if_fmbdata_mRawMultibootInfo$print_l145_n2981___SUCC
                                        #   in Loop: Header=BB85_1 Depth=1
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l146_n2984, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	jmp	.LBB85_35
.LBB85_8:                               # %if_fmbdata_mRawMultibootInfo$print_l66_n2640___FAIL
                                        #   in Loop: Header=BB85_1 Depth=1
	movl	-16(%ebp), %eax
	cmpl	$4, (%eax)
	jne	.LBB85_11
# BB#9:                                 # %if_fmbdata_mRawMultibootInfo$print_l66_n2656___SUCC
                                        #   in Loop: Header=BB85_1 Depth=1
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l78_n2659, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	-16(%ebp), %ecx
	movl	8(%ecx), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l80_n2670, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	-16(%ebp), %ecx
	movl	12(%ecx), %ecx
.LBB85_10:                              # %if_fmbdata_mRawMultibootInfo$print_l66_n2594___DONE
                                        #   in Loop: Header=BB85_1 Depth=1
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	jmp	.LBB85_30
.LBB85_11:                              # %if_fmbdata_mRawMultibootInfo$print_l66_n2656___FAIL
                                        #   in Loop: Header=BB85_1 Depth=1
	movl	-16(%ebp), %eax
	cmpl	$5, (%eax)
	jne	.LBB85_13
# BB#12:                                # %if_fmbdata_mRawMultibootInfo$print_l66_n2684___SUCC
                                        #   in Loop: Header=BB85_1 Depth=1
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l83_n2687, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	-16(%ebp), %ecx
	movl	8(%ecx), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$2, 8(%esp)
	calll	Terminal$dumphex
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l85_n2699, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	-16(%ebp), %ecx
	movl	12(%ecx), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$2, 8(%esp)
	calll	Terminal$dumphex
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l87_n2711, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	-16(%ebp), %ecx
	movl	16(%ecx), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$2, 8(%esp)
	calll	Terminal$dumphex
	jmp	.LBB85_30
.LBB85_13:                              # %if_fmbdata_mRawMultibootInfo$print_l66_n2684___FAIL
                                        #   in Loop: Header=BB85_1 Depth=1
	movl	-16(%ebp), %eax
	cmpl	$6, (%eax)
	jne	.LBB85_15
# BB#14:                                # %if_fmbdata_mRawMultibootInfo$print_l66_n2726___SUCC
                                        #   in Loop: Header=BB85_1 Depth=1
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l90_n2729, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	-16(%ebp), %ecx
	movl	8(%ecx), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l92_n2740, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	-16(%ebp), %ecx
	movl	12(%ecx), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l94_n2751, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %ecx
	movl	-16(%ebp), %esi
	movl	4(%esi), %eax
	cltd
	idivl	8(%esi)
	subl	$16, %esp
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	calll	Terminal$printi
	addl	$16, %esp
	movl	-16(%ebp), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	calll	MBMMAPMemTag$print
	jmp	.LBB85_30
.LBB85_15:                              # %if_fmbdata_mRawMultibootInfo$print_l66_n2726___FAIL
                                        #   in Loop: Header=BB85_1 Depth=1
	movl	-16(%ebp), %eax
	cmpl	$7, (%eax)
	jne	.LBB85_17
# BB#16:                                # %if_fmbdata_mRawMultibootInfo$print_l66_n2772___SUCC
                                        #   in Loop: Header=BB85_1 Depth=1
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l98_n2775, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	-16(%ebp), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$16, 4(%esp)
	calll	ptr$offset
	addl	$16, %esp
	subl	$16, %esp
	movl	%eax, (%esp)
	calll	RawVBEControllerInfo$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l100_n2786, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	-16(%ebp), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$528, 4(%esp)           # imm = 0x210
	calll	ptr$offset
	addl	$16, %esp
	subl	$16, %esp
	movl	%eax, (%esp)
	calll	RawVBEModeInfo$print
	jmp	.LBB85_30
.LBB85_17:                              # %if_fmbdata_mRawMultibootInfo$print_l66_n2772___FAIL
                                        #   in Loop: Header=BB85_1 Depth=1
	movl	-16(%ebp), %eax
	cmpl	$8, (%eax)
	jne	.LBB85_19
# BB#18:                                # %if_fmbdata_mRawMultibootInfo$print_l66_n2802___SUCC
                                        #   in Loop: Header=BB85_1 Depth=1
	movl	%esp, %esi
	leal	-16(%esi), %eax
	movl	%eax, %esp
	movl	-16(%ebp), %eax
	movl	%eax, -16(%esi)
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l104_n2808, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	-16(%esi), %ecx
	movl	8(%ecx), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$dumphexi
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l106_n2819, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	-16(%esi), %ecx
	movl	16(%ecx), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l108_n2829, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	-16(%esi), %ecx
	movl	20(%ecx), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l110_n2839, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	-16(%esi), %ecx
	movl	24(%ecx), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l112_n2849, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	-16(%esi), %ecx
	movzbl	28(%ecx), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l114_n2860, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	-16(%esi), %ecx
	movzbl	29(%ecx), %ecx
	jmp	.LBB85_10
.LBB85_19:                              # %if_fmbdata_mRawMultibootInfo$print_l66_n2802___FAIL
                                        #   in Loop: Header=BB85_1 Depth=1
	movl	-16(%ebp), %eax
	cmpl	$10, (%eax)
	jne	.LBB85_21
# BB#20:                                # %if_fmbdata_mRawMultibootInfo$print_l66_n2874___SUCC
                                        #   in Loop: Header=BB85_1 Depth=1
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l117_n2877, 4(%esp)
	jmp	.LBB85_29
.LBB85_21:                              # %if_fmbdata_mRawMultibootInfo$print_l66_n2874___FAIL
                                        #   in Loop: Header=BB85_1 Depth=1
	movl	-16(%ebp), %eax
	cmpl	$14, (%eax)
	jne	.LBB85_24
# BB#22:                                # %if_fmbdata_mRawMultibootInfo$print_l66_n2885___SUCC
                                        #   in Loop: Header=BB85_1 Depth=1
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l119_n2888, 4(%esp)
	jmp	.LBB85_23
.LBB85_24:                              # %if_fmbdata_mRawMultibootInfo$print_l66_n2885___FAIL
                                        #   in Loop: Header=BB85_1 Depth=1
	movl	-16(%ebp), %eax
	cmpl	$15, (%eax)
	jne	.LBB85_26
# BB#25:                                # %if_fmbdata_mRawMultibootInfo$print_l66_n2899___SUCC
                                        #   in Loop: Header=BB85_1 Depth=1
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l122_n2902, 4(%esp)
.LBB85_23:                              # %if_fmbdata_mRawMultibootInfo$print_l66_n2594___DONE
                                        #   in Loop: Header=BB85_1 Depth=1
	calll	Terminal$print
	addl	$16, %esp
	movl	-16(%ebp), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	calll	MBRSDP1Tag$printOEM
	jmp	.LBB85_30
.LBB85_26:                              # %if_fmbdata_mRawMultibootInfo$print_l66_n2899___FAIL
                                        #   in Loop: Header=BB85_1 Depth=1
	movl	-16(%ebp), %eax
	cmpl	$16, (%eax)
	jne	.LBB85_28
# BB#27:                                # %if_fmbdata_mRawMultibootInfo$print_l66_n2913___SUCC
                                        #   in Loop: Header=BB85_1 Depth=1
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l125_n2916, 4(%esp)
	jmp	.LBB85_29
.LBB85_28:                              # %if_fmbdata_mRawMultibootInfo$print_l66_n2913___FAIL
                                        #   in Loop: Header=BB85_1 Depth=1
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l127_n2921, 4(%esp)
	jmp	.LBB85_29
.LBB85_31:                              # %if_fmbdata_mRawMultibootInfo$print_l140_n2970___SUCC
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l141_n2973, 4(%esp)
	calll	Terminal$print
.LBB85_32:                              # %fmbdata_mRawMultibootInfo$print_l62_n2575___LOOP___END
	leal	-4(%ebp), %esp
	popl	%esi
	popl	%ebp
	retl
.Ltmp227:
	.size	RawMultibootInfo$print, .Ltmp227-RawMultibootInfo$print
	.cfi_endproc

	.globl	MBMMAPMemTag$print
	.align	16, 0x90
	.type	MBMMAPMemTag$print,@function
MBMMAPMemTag$print:                     # @"MBMMAPMemTag$print"
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp228:
	.cfi_def_cfa_offset 32
	movl	32(%esp), %ecx
	movl	%ecx, 24(%esp)
	movl	4(%ecx), %eax
	addl	$-8, %eax
	cltd
	idivl	8(%ecx)
	movl	%eax, 20(%esp)
	movl	$0, 16(%esp)
	cmpl	$0, 20(%esp)
	jle	.LBB86_2
	.align	16, 0x90
.LBB86_1:                               # %fmbdata_mMBMMAPMemTag$print_l176_n3006___LOOP___HEAD
                                        # =>This Inner Loop Header: Depth=1
	movl	24(%esp), %eax
	movl	8(%eax), %ecx
	imull	16(%esp), %ecx
	addl	$16, %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	ptr$offset
	movl	%eax, 12(%esp)
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mMBMMAPMemTag$print_l178_n3023, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	16(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mMBMMAPMemTag$print_l180_n3031, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	12(%esp), %ecx
	movl	16(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mMBMMAPMemTag$print_l182_n3041, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	12(%esp), %ecx
	movl	(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$dumphexi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mMBMMAPMemTag$print_l184_n3052, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	12(%esp), %ecx
	movl	8(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$dumphexi
	movl	16(%esp), %eax
	incl	%eax
	movl	%eax, 16(%esp)
	cmpl	20(%esp), %eax
	jl	.LBB86_1
.LBB86_2:                               # %fmbdata_mMBMMAPMemTag$print_l176_n3006___LOOP___END
	addl	$28, %esp
	retl
.Ltmp229:
	.size	MBMMAPMemTag$print, .Ltmp229-MBMMAPMemTag$print
	.cfi_endproc

	.globl	MBModuleTag$get_args
	.align	16, 0x90
	.type	MBModuleTag$get_args,@function
MBModuleTag$get_args:                   # @"MBModuleTag$get_args"
	.cfi_startproc
# BB#0:
	subl	$12, %esp
.Ltmp230:
	.cfi_def_cfa_offset 16
	movl	16(%esp), %eax
	movl	%eax, 8(%esp)
	movl	%eax, (%esp)
	movl	$16, 4(%esp)
	calll	ptr$offset
	addl	$12, %esp
	retl
.Ltmp231:
	.size	MBModuleTag$get_args, .Ltmp231-MBModuleTag$get_args
	.cfi_endproc

	.globl	MBModuleTag$get_addr
	.align	16, 0x90
	.type	MBModuleTag$get_addr,@function
MBModuleTag$get_addr:                   # @"MBModuleTag$get_addr"
	.cfi_startproc
# BB#0:
	pushl	%eax
.Ltmp232:
	.cfi_def_cfa_offset 8
	movl	8(%esp), %eax
	movl	%eax, (%esp)
	movl	8(%eax), %eax
	addl	gvar_fin_mu_lu_n9__base_vma, %eax
	popl	%edx
	retl
.Ltmp233:
	.size	MBModuleTag$get_addr, .Ltmp233-MBModuleTag$get_addr
	.cfi_endproc

	.globl	MBRSDP1Tag$printOEM
	.align	16, 0x90
	.type	MBRSDP1Tag$printOEM,@function
MBRSDP1Tag$printOEM:                    # @"MBRSDP1Tag$printOEM"
	.cfi_startproc
# BB#0:
	subl	$12, %esp
.Ltmp234:
	.cfi_def_cfa_offset 16
	movl	16(%esp), %eax
	movl	%eax, 8(%esp)
	movl	gvar_fin_mu_lu_n8__kterm, %ecx
	movzbl	17(%eax), %eax
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	calll	Terminal$putchar
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	8(%esp), %ecx
	movzbl	18(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$putchar
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	8(%esp), %ecx
	movzbl	19(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$putchar
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	8(%esp), %ecx
	movzbl	20(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$putchar
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	8(%esp), %ecx
	movzbl	21(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$putchar
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	8(%esp), %ecx
	movzbl	22(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$putchar
	addl	$12, %esp
	retl
.Ltmp235:
	.size	MBRSDP1Tag$printOEM, .Ltmp235-MBRSDP1Tag$printOEM
	.cfi_endproc

	.globl	MultibootModuleInfo$$new
	.align	16, 0x90
	.type	MultibootModuleInfo$$new,@function
MultibootModuleInfo$$new:               # @"MultibootModuleInfo$$new"
	.cfi_startproc
# BB#0:
	pushl	%esi
.Ltmp236:
	.cfi_def_cfa_offset 8
	subl	$24, %esp
.Ltmp237:
	.cfi_def_cfa_offset 32
.Ltmp238:
	.cfi_offset %esi, -8
	movl	32(%esp), %eax
	movl	%eax, 20(%esp)
	movl	$28, (%esp)
	calll	malloc
	movl	%eax, %esi
	movl	%esi, 16(%esp)
	movl	20(%esp), %eax
	movl	%eax, (%esp)
	calll	MBModuleTag$get_args
	movl	%eax, (%esi)
	movl	16(%esp), %esi
	movl	20(%esp), %eax
	movl	%eax, (%esp)
	calll	MBModuleTag$get_addr
	movl	%eax, 4(%esi)
	movl	16(%esp), %eax
	movl	20(%esp), %ecx
	movl	12(%ecx), %edx
	subl	8(%ecx), %edx
	movl	%edx, 8(%eax)
	movl	16(%esp), %eax
	movl	$0, 12(%eax)
	movl	16(%esp), %eax
	addl	$24, %esp
	popl	%esi
	retl
.Ltmp239:
	.size	MultibootModuleInfo$$new, .Ltmp239-MultibootModuleInfo$$new
	.cfi_endproc

	.globl	MultibootInfo$$load
	.align	16, 0x90
	.type	MultibootInfo$$load,@function
MultibootInfo$$load:                    # @"MultibootInfo$$load"
	.cfi_startproc
# BB#0:
	pushl	%ebp
.Ltmp240:
	.cfi_def_cfa_offset 8
.Ltmp241:
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
.Ltmp242:
	.cfi_def_cfa_register %ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$28, %esp
.Ltmp243:
	.cfi_offset %esi, -20
.Ltmp244:
	.cfi_offset %edi, -16
.Ltmp245:
	.cfi_offset %ebx, -12
	movl	8(%ebp), %eax
	movl	%eax, -16(%ebp)
	subl	$16, %esp
	movl	$78, (%esp)
	calll	malloc
	addl	$16, %esp
	movl	%eax, -20(%ebp)
	movl	-16(%ebp), %ecx
	movl	%ecx, (%eax)
	movl	-20(%ebp), %esi
	movl	-16(%ebp), %eax
	movl	gvar_fin_mu_lu_n9__base_vma, %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	ptr$offset
	addl	$16, %esp
	movl	%eax, 4(%esi)
	movl	-20(%ebp), %eax
	movb	$0, 8(%eax)
	cmpl	$4194304, -16(%ebp)     # imm = 0x400000
	jge	.LBB91_13
# BB#1:                                 # %if_fmbdata_mMultibootInfo$$load_l284_n3163___DONE
	movl	-20(%ebp), %eax
	movl	4(%eax), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$1, 4(%esp)
	calll	RawMultibootInfo$has_type
	addl	$16, %esp
	testb	$1, %al
	je	.LBB91_13
# BB#2:                                 # %if_fmbdata_mMultibootInfo$$load_l288_n3170___SUCC
	movl	-20(%ebp), %eax
	movl	4(%eax), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$2, 4(%esp)
	calll	RawMultibootInfo$has_type
	addl	$16, %esp
	testb	$1, %al
	je	.LBB91_13
# BB#3:                                 # %if_fmbdata_mMultibootInfo$$load_l289_n3176___SUCC
	movl	-20(%ebp), %eax
	movl	4(%eax), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$5, 4(%esp)
	calll	RawMultibootInfo$has_type
	addl	$16, %esp
	testb	$1, %al
	je	.LBB91_13
# BB#4:                                 # %if_fmbdata_mMultibootInfo$$load_l290_n3182___SUCC
	movl	-20(%ebp), %eax
	movl	4(%eax), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$8, 4(%esp)
	calll	RawMultibootInfo$has_type
	addl	$16, %esp
	testb	$1, %al
	je	.LBB91_13
# BB#5:                                 # %if_fmbdata_mMultibootInfo$$load_l291_n3188___SUCC
	movl	-20(%ebp), %eax
	movb	$1, 8(%eax)
	movl	-20(%ebp), %esi
	movl	4(%esi), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$1, 4(%esp)
	calll	RawMultibootInfo$get_type
	addl	$16, %esp
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$8, 4(%esp)
	calll	ptr$offset
	addl	$16, %esp
	movl	%eax, 16(%esi)
	movl	-20(%ebp), %esi
	movl	4(%esi), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$2, 4(%esp)
	calll	RawMultibootInfo$get_type
	addl	$16, %esp
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$8, 4(%esp)
	calll	ptr$offset
	addl	$16, %esp
	movl	%eax, 12(%esi)
	movl	-20(%ebp), %esi
	movl	4(%esi), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$5, 4(%esp)
	calll	RawMultibootInfo$get_type
	addl	$16, %esp
	movl	8(%eax), %eax
	movl	%eax, 48(%esi)
	movl	%esp, %esi
	leal	-16(%esi), %eax
	movl	%eax, %esp
	movl	-20(%ebp), %eax
	movl	4(%eax), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$8, 4(%esp)
	calll	RawMultibootInfo$get_type
	addl	$16, %esp
	movl	%eax, -16(%esi)
	movl	-20(%ebp), %ecx
	movzbl	29(%eax), %eax
	cmpl	$2, %eax
	sete	20(%ecx)
	movl	-20(%ebp), %eax
	movl	-16(%esi), %ecx
	movl	20(%ecx), %ecx
	movl	%ecx, 24(%eax)
	movl	-20(%ebp), %eax
	movl	-16(%esi), %ecx
	movl	24(%ecx), %ecx
	movl	%ecx, 28(%eax)
	movl	-20(%ebp), %eax
	movl	-16(%esi), %ecx
	movl	16(%ecx), %ecx
	movl	%ecx, 32(%eax)
	movl	-20(%ebp), %eax
	movl	-16(%esi), %ecx
	movzbl	28(%ecx), %ecx
	movl	%ecx, 36(%eax)
	movl	-20(%ebp), %eax
	movl	-16(%esi), %ecx
	movl	8(%ecx), %ecx
	movl	%ecx, 40(%eax)
	movl	-20(%ebp), %edi
	movl	-16(%esi), %eax
	movl	8(%eax), %eax
	movl	gvar_fin_mu_lu_n9__base_vma, %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	ptr$offset
	addl	$16, %esp
	movl	%eax, 44(%edi)
	movl	-20(%ebp), %eax
	movl	$0, 52(%eax)
	movl	%esp, %eax
	leal	-16(%eax), %esi
	movl	%esi, %esp
	movl	$0, -16(%eax)
	movl	%esp, %ebx
	leal	-16(%ebx), %edi
	movl	%edi, %esp
	movl	-20(%ebp), %eax
	movl	4(%eax), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	calll	RawMultibootInfo$get_tag
	addl	$16, %esp
	movl	%eax, -16(%ebx)
	movl	%esp, %eax
	addl	$-16, %eax
	movl	%eax, -24(%ebp)         # 4-byte Spill
	movl	%eax, %esp
	movl	-16(%ebx), %eax
	jmp	.LBB91_6
.LBB91_12:                              # %if_fmbdata_mMultibootInfo$$load_l313_n3299___DONE
                                        #   in Loop: Header=BB91_6 Depth=1
	movl	(%esi), %eax
	incl	%eax
	movl	%eax, (%esi)
	movl	-20(%ebp), %ecx
	movl	4(%ecx), %ecx
	subl	$16, %esp
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	calll	RawMultibootInfo$get_tag
	addl	$16, %esp
	movl	%eax, (%edi)
.LBB91_6:                               # %if_fmbdata_mMultibootInfo$$load_l291_n3188___SUCC
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, (%eax)
	je	.LBB91_13
# BB#7:                                 # %fmbdata_mMultibootInfo$$load_l312_n3288___LOOP___HEAD
                                        #   in Loop: Header=BB91_6 Depth=1
	movl	(%edi), %eax
	cmpl	$3, (%eax)
	jne	.LBB91_12
# BB#8:                                 # %if_fmbdata_mMultibootInfo$$load_l313_n3299___SUCC
                                        #   in Loop: Header=BB91_6 Depth=1
	movl	-20(%ebp), %eax
	cmpl	$0, 52(%eax)
	jne	.LBB91_10
# BB#9:                                 # %if_fmbdata_mMultibootInfo$$load_l314_n3305___SUCC
                                        #   in Loop: Header=BB91_6 Depth=1
	movl	-20(%ebp), %ebx
	movl	(%edi), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	calll	MultibootModuleInfo$$new
	addl	$16, %esp
	movl	%eax, 56(%ebx)
	movl	-20(%ebp), %eax
	movl	56(%eax), %eax
	movl	-24(%ebp), %ecx         # 4-byte Reload
	movl	%eax, (%ecx)
	jmp	.LBB91_11
.LBB91_10:                              # %if_fmbdata_mMultibootInfo$$load_l314_n3305___FAIL
                                        #   in Loop: Header=BB91_6 Depth=1
	movl	-24(%ebp), %ebx         # 4-byte Reload
	movl	(%ebx), %eax
	movl	%eax, -28(%ebp)         # 4-byte Spill
	movl	(%edi), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	calll	MultibootModuleInfo$$new
	addl	$16, %esp
	movl	-28(%ebp), %ecx         # 4-byte Reload
	movl	%eax, 12(%ecx)
	movl	(%ebx), %eax
	movl	12(%eax), %eax
	movl	%eax, (%ebx)
.LBB91_11:                              # %if_fmbdata_mMultibootInfo$$load_l314_n3305___DONE
                                        #   in Loop: Header=BB91_6 Depth=1
	movl	-20(%ebp), %eax
	incl	52(%eax)
	jmp	.LBB91_12
.LBB91_13:                              # %if_fmbdata_mMultibootInfo$$load_l284_n3163___SUCC
	movl	-20(%ebp), %eax
	leal	-12(%ebp), %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
.Ltmp246:
	.size	MultibootInfo$$load, .Ltmp246-MultibootInfo$$load
	.cfi_endproc

	.globl	MultibootInfo$get_mod_by_args
	.align	16, 0x90
	.type	MultibootInfo$get_mod_by_args,@function
MultibootInfo$get_mod_by_args:          # @"MultibootInfo$get_mod_by_args"
	.cfi_startproc
# BB#0:
	pushl	%ebp
.Ltmp247:
	.cfi_def_cfa_offset 8
.Ltmp248:
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
.Ltmp249:
	.cfi_def_cfa_register %ebp
	pushl	%edi
	pushl	%esi
	subl	$16, %esp
.Ltmp250:
	.cfi_offset %esi, -16
.Ltmp251:
	.cfi_offset %edi, -12
	movl	12(%ebp), %eax
	movl	8(%ebp), %ecx
	movl	%ecx, -12(%ebp)
	movl	%eax, -16(%ebp)
	movl	-12(%ebp), %eax
	cmpl	$0, 52(%eax)
	je	.LBB92_1
# BB#3:                                 # %if_fmbdata_mMultibootInfo$get_mod_by_args_l335_n3353___DONE
	movl	%esp, %eax
	leal	-16(%eax), %esi
	movl	%esi, %esp
	movl	-12(%ebp), %ecx
	movl	56(%ecx), %ecx
	movl	%ecx, -16(%eax)
	movl	%esp, %eax
	leal	-16(%eax), %edi
	movl	%edi, %esp
	movl	$0, -16(%eax)
	movl	-12(%ebp), %eax
	cmpl	$0, 52(%eax)
	jle	.LBB92_1
	.align	16, 0x90
.LBB92_4:                               # %fmbdata_mMultibootInfo$get_mod_by_args_l341_n3363___LOOP___HEAD
                                        # =>This Inner Loop Header: Depth=1
	movl	(%esi), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	cstr$__eq__
	addl	$16, %esp
	testb	$1, %al
	jne	.LBB92_5
# BB#6:                                 # %if_fmbdata_mMultibootInfo$get_mod_by_args_l342_n3374___DONE
                                        #   in Loop: Header=BB92_4 Depth=1
	incl	(%edi)
	movl	(%esi), %eax
	movl	12(%eax), %eax
	movl	%eax, (%esi)
	movl	(%edi), %eax
	movl	-12(%ebp), %ecx
	cmpl	52(%ecx), %eax
	jl	.LBB92_4
.LBB92_1:                               # %if_fmbdata_mMultibootInfo$get_mod_by_args_l335_n3353___SUCC
	xorl	%eax, %eax
.LBB92_2:                               # %if_fmbdata_mMultibootInfo$get_mod_by_args_l335_n3353___SUCC
	leal	-8(%ebp), %esp
	popl	%esi
	popl	%edi
	popl	%ebp
	retl
.LBB92_5:                               # %if_fmbdata_mMultibootInfo$get_mod_by_args_l342_n3374___SUCC
	movl	(%esi), %eax
	jmp	.LBB92_2
.Ltmp252:
	.size	MultibootInfo$get_mod_by_args, .Ltmp252-MultibootInfo$get_mod_by_args
	.cfi_endproc

	.globl	RawVBEControllerInfo$print
	.align	16, 0x90
	.type	RawVBEControllerInfo$print,@function
RawVBEControllerInfo$print:             # @"RawVBEControllerInfo$print"
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp253:
	.cfi_def_cfa_offset 32
	movl	32(%esp), %eax
	movl	%eax, 24(%esp)
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l374_n3393, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	24(%esp), %ecx
	movzbl	(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$putchar
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	24(%esp), %ecx
	movzbl	1(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$putchar
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	24(%esp), %ecx
	movzbl	2(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$putchar
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	24(%esp), %ecx
	movzbl	3(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$putchar
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l379_n3418, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	24(%esp), %ecx
	movzwl	4(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$4, 8(%esp)
	calll	Terminal$dumphex
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l381_n3430, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	24(%esp), %ecx
	movzwl	6(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$4, 8(%esp)
	calll	Terminal$dumphex
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l383_n3442, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	24(%esp), %ecx
	movzwl	8(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$4, 8(%esp)
	calll	Terminal$dumphex
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l385_n3454, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	24(%esp), %ecx
	movzbl	10(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$2, 8(%esp)
	calll	Terminal$dumphex
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l387_n3466, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	24(%esp), %ecx
	movzbl	11(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$2, 8(%esp)
	calll	Terminal$dumphex
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l389_n3478, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	24(%esp), %ecx
	movzbl	12(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$2, 8(%esp)
	calll	Terminal$dumphex
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l391_n3490, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	24(%esp), %ecx
	movzbl	13(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$2, 8(%esp)
	calll	Terminal$dumphex
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l393_n3502, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	24(%esp), %ecx
	movzwl	14(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$4, 8(%esp)
	calll	Terminal$dumphex
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l395_n3514, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	24(%esp), %ecx
	movzwl	16(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$4, 8(%esp)
	calll	Terminal$dumphex
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l397_n3526, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	24(%esp), %ecx
	movzwl	18(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	addl	$28, %esp
	retl
.Ltmp254:
	.size	RawVBEControllerInfo$print, .Ltmp254-RawVBEControllerInfo$print
	.cfi_endproc

	.globl	RawVBEModeInfo$print
	.align	16, 0x90
	.type	RawVBEModeInfo$print,@function
RawVBEModeInfo$print:                   # @"RawVBEModeInfo$print"
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp255:
	.cfi_def_cfa_offset 32
	movl	32(%esp), %eax
	movl	%eax, 24(%esp)
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l445_n3538, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	24(%esp), %ecx
	movzwl	(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$dumpbin
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l447_n3549, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	24(%esp), %ecx
	movzbl	2(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$2, 8(%esp)
	calll	Terminal$dumphex
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l449_n3561, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	24(%esp), %ecx
	movzbl	3(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$2, 8(%esp)
	calll	Terminal$dumphex
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l452_n3573, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	24(%esp), %ecx
	movzwl	18(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l454_n3584, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	24(%esp), %ecx
	movzwl	20(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l456_n3595, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	24(%esp), %ecx
	movzbl	25(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l459_n3606, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	24(%esp), %ecx
	movzwl	16(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$4, 8(%esp)
	calll	Terminal$dumphex
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l461_n3618, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	24(%esp), %ecx
	movl	40(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$dumphexi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l463_n3628, 4(%esp)
	calll	Terminal$print
	addl	$28, %esp
	retl
.Ltmp256:
	.size	RawVBEModeInfo$print, .Ltmp256-RawVBEModeInfo$print
	.cfi_endproc

	.globl	rcsin
	.align	16, 0x90
	.type	rcsin,@function
rcsin:                                  # @rcsin
	.cfi_startproc
# BB#0:
	pushl	%ebp
.Ltmp257:
	.cfi_def_cfa_offset 8
.Ltmp258:
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
.Ltmp259:
	.cfi_def_cfa_register %ebp
	pushl	%esi
	subl	$20, %esp
.Ltmp260:
	.cfi_offset %esi, -12
	fldl	8(%ebp)
	fstl	-16(%ebp)
	fldz
	fld	%st(0)
	faddl	_the_zero_double
	fucomp	%st(2)
	fstp	%st(1)
	fnstsw	%ax
                                        # kill: AX<def> AX<kill> EAX<def>
                                        # kill: AH<def> AH<kill> EAX<kill>
	sahf
	jbe	.LBB95_2
# BB#1:                                 # %if_fkappsraycasterrcmath_mrcsin_l9_n3636___SUCC
	fsubl	-16(%ebp)
	fstpl	-16(%ebp)
	fldz
.LBB95_2:                               # %if_fkappsraycasterrcmath_mrcsin_l9_n3636___DONE
	fstp	%st(0)
	movl	%esp, %esi
	leal	-16(%esi), %eax
	movl	%eax, %esp
	fldl	-16(%ebp)
	fnstcw	-22(%ebp)
	movw	-22(%ebp), %ax
	movw	$3199, -22(%ebp)        # imm = 0xC7F
	fldcw	-22(%ebp)
	movw	%ax, -22(%ebp)
	fistpl	-20(%ebp)
	fldcw	-22(%ebp)
	movl	-20(%ebp), %ecx
	movl	$-1240768329, %edx      # imm = 0xFFFFFFFFB60B60B7
	movl	%ecx, %eax
	imull	%edx
	addl	%ecx, %edx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$8, %edx
	addl	%eax, %edx
	imull	$360, %edx, %eax        # imm = 0x168
	subl	%eax, %ecx
	movl	%ecx, -16(%esi)
	movl	%esp, %eax
	leal	-16(%eax), %ecx
	movl	%ecx, %esp
	movl	$.Lstrglobal_fkappsraycasterrcmath_mrcsin_l13_n3646, -16(%eax)
	movl	-16(%esi), %eax
	shll	$3, %eax
	subl	$16, %esp
	movl	%eax, 4(%esp)
	movl	$.Lstrglobal_fkappsraycasterrcmath_mrcsin_l13_n3646, (%esp)
	calll	ptr$offset
	addl	$16, %esp
	fldl	(%eax)
	leal	-4(%ebp), %esp
	popl	%esi
	popl	%ebp
	retl
.Ltmp261:
	.size	rcsin, .Ltmp261-rcsin
	.cfi_endproc

	.globl	rccos
	.align	16, 0x90
	.type	rccos,@function
rccos:                                  # @rccos
	.cfi_startproc
# BB#0:
	pushl	%ebp
.Ltmp262:
	.cfi_def_cfa_offset 8
.Ltmp263:
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
.Ltmp264:
	.cfi_def_cfa_register %ebp
	pushl	%esi
	subl	$20, %esp
.Ltmp265:
	.cfi_offset %esi, -12
	fldl	8(%ebp)
	fstl	-16(%ebp)
	fldz
	fld	%st(0)
	faddl	_the_zero_double
	fucomp	%st(2)
	fstp	%st(1)
	fnstsw	%ax
                                        # kill: AX<def> AX<kill> EAX<def>
                                        # kill: AH<def> AH<kill> EAX<kill>
	sahf
	jbe	.LBB96_2
# BB#1:                                 # %if_fkappsraycasterrcmath_mrccos_l17_n3662___SUCC
	fsubl	-16(%ebp)
	fstpl	-16(%ebp)
	fldz
.LBB96_2:                               # %if_fkappsraycasterrcmath_mrccos_l17_n3662___DONE
	fstp	%st(0)
	movl	%esp, %esi
	leal	-16(%esi), %eax
	movl	%eax, %esp
	fldl	-16(%ebp)
	fnstcw	-22(%ebp)
	movw	-22(%ebp), %ax
	movw	$3199, -22(%ebp)        # imm = 0xC7F
	fldcw	-22(%ebp)
	movw	%ax, -22(%ebp)
	fistpl	-20(%ebp)
	fldcw	-22(%ebp)
	movl	-20(%ebp), %ecx
	movl	$-1240768329, %edx      # imm = 0xFFFFFFFFB60B60B7
	movl	%ecx, %eax
	imull	%edx
	addl	%ecx, %edx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$8, %edx
	addl	%eax, %edx
	imull	$360, %edx, %eax        # imm = 0x168
	subl	%eax, %ecx
	movl	%ecx, -16(%esi)
	movl	%esp, %eax
	leal	-16(%eax), %ecx
	movl	%ecx, %esp
	movl	$.Lstrglobal_fkappsraycasterrcmath_mrccos_l21_n3672, -16(%eax)
	movl	-16(%esi), %eax
	shll	$3, %eax
	subl	$16, %esp
	movl	%eax, 4(%esp)
	movl	$.Lstrglobal_fkappsraycasterrcmath_mrccos_l21_n3672, (%esp)
	calll	ptr$offset
	addl	$16, %esp
	fldl	(%eax)
	leal	-4(%ebp), %esp
	popl	%esi
	popl	%ebp
	retl
.Ltmp266:
	.size	rccos, .Ltmp266-rccos
	.cfi_endproc

	.globl	rcrot_get__
	.align	16, 0x90
	.type	rcrot_get__,@function
rcrot_get__:                            # @rcrot_get__
	.cfi_startproc
# BB#0:
	movl	$.Lstrglobal_fkappsraycasterrcrots_mrcrot_get___l9_n3684, %eax
	retl
.Ltmp267:
	.size	rcrot_get__, .Ltmp267-rcrot_get__
	.cfi_endproc

	.globl	rcrot_get_for
	.align	16, 0x90
	.type	rcrot_get_for,@function
rcrot_get_for:                          # @rcrot_get_for
	.cfi_startproc
# BB#0:
	subl	$12, %esp
.Ltmp268:
	.cfi_def_cfa_offset 16
	movl	16(%esp), %ecx
	movl	%ecx, 8(%esp)
	movl	$-1240768329, %edx      # imm = 0xFFFFFFFFB60B60B7
	movl	%ecx, %eax
	imull	%edx
	addl	%ecx, %edx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$8, %edx
	addl	%eax, %edx
	imull	$360, %edx, %eax        # imm = 0x168
	subl	%eax, %ecx
	movl	%ecx, 8(%esp)
	calll	rcrot_get__
	movl	8(%esp), %ecx
	shll	$5, %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	ptr$offset
	addl	$12, %esp
	retl
.Ltmp269:
	.size	rcrot_get_for, .Ltmp269-rcrot_get_for
	.cfi_endproc

	.globl	get_map
	.align	16, 0x90
	.type	get_map,@function
get_map:                                # @get_map
	.cfi_startproc
# BB#0:
	movl	$.Lstrglobal_fkappsraycasterrcmap_mget_map_l1_n3698, %eax
	retl
.Ltmp270:
	.size	get_map, .Ltmp270-get_map
	.cfi_endproc

	.globl	get_map_w
	.align	16, 0x90
	.type	get_map_w,@function
get_map_w:                              # @get_map_w
	.cfi_startproc
# BB#0:
	movl	$24, %eax
	retl
.Ltmp271:
	.size	get_map_w, .Ltmp271-get_map_w
	.cfi_endproc

	.globl	get_map_h
	.align	16, 0x90
	.type	get_map_h,@function
get_map_h:                              # @get_map_h
	.cfi_startproc
# BB#0:
	movl	$24, %eax
	retl
.Ltmp272:
	.size	get_map_h, .Ltmp272-get_map_h
	.cfi_endproc

	.globl	get_font
	.align	16, 0x90
	.type	get_font,@function
get_font:                               # @get_font
	.cfi_startproc
# BB#0:
	movl	$.Lstrglobal_ffontfont_mget_font_l1_n3703, %eax
	retl
.Ltmp273:
	.size	get_font, .Ltmp273-get_font
	.cfi_endproc

	.globl	get_colors
	.align	16, 0x90
	.type	get_colors,@function
get_colors:                             # @get_colors
	.cfi_startproc
# BB#0:
	movl	$.Lstrglobal_ffontfont_mget_colors_l3_n3706, %eax
	retl
.Ltmp274:
	.size	get_colors, .Ltmp274-get_colors
	.cfi_endproc

	.globl	Framebuffer$$new_hw
	.align	16, 0x90
	.type	Framebuffer$$new_hw,@function
Framebuffer$$new_hw:                    # @"Framebuffer$$new_hw"
	.cfi_startproc
# BB#0:
	pushl	%edi
.Ltmp275:
	.cfi_def_cfa_offset 8
	pushl	%esi
.Ltmp276:
	.cfi_def_cfa_offset 12
	subl	$36, %esp
.Ltmp277:
	.cfi_def_cfa_offset 48
.Ltmp278:
	.cfi_offset %esi, -12
.Ltmp279:
	.cfi_offset %edi, -8
	movl	64(%esp), %eax
	movl	60(%esp), %ecx
	movl	56(%esp), %edx
	movl	52(%esp), %esi
	movl	48(%esp), %edi
	movl	%edi, 32(%esp)
	movl	%esi, 28(%esp)
	movl	%edx, 24(%esp)
	movl	%ecx, 20(%esp)
	movl	%eax, 16(%esp)
	movl	$24, (%esp)
	calll	malloc
	movl	%eax, 12(%esp)
	movl	16(%esp), %ecx
	movl	%ecx, (%eax)
	movl	12(%esp), %eax
	movl	32(%esp), %ecx
	movl	%ecx, 4(%eax)
	movl	12(%esp), %eax
	movl	28(%esp), %ecx
	movl	%ecx, 8(%eax)
	movl	12(%esp), %eax
	movl	24(%esp), %ecx
	movl	%ecx, 12(%eax)
	movl	12(%esp), %eax
	movl	20(%esp), %ecx
	movl	%ecx, 16(%eax)
	movl	12(%esp), %eax
	addl	$36, %esp
	popl	%esi
	popl	%edi
	retl
.Ltmp280:
	.size	Framebuffer$$new_hw, .Ltmp280-Framebuffer$$new_hw
	.cfi_endproc

	.globl	Framebuffer$$new
	.align	16, 0x90
	.type	Framebuffer$$new,@function
Framebuffer$$new:                       # @"Framebuffer$$new"
	.cfi_startproc
# BB#0:
	pushl	%ebp
.Ltmp281:
	.cfi_def_cfa_offset 8
	pushl	%ebx
.Ltmp282:
	.cfi_def_cfa_offset 12
	pushl	%edi
.Ltmp283:
	.cfi_def_cfa_offset 16
	pushl	%esi
.Ltmp284:
	.cfi_def_cfa_offset 20
	subl	$44, %esp
.Ltmp285:
	.cfi_def_cfa_offset 64
.Ltmp286:
	.cfi_offset %esi, -20
.Ltmp287:
	.cfi_offset %edi, -16
.Ltmp288:
	.cfi_offset %ebx, -12
.Ltmp289:
	.cfi_offset %ebp, -8
	movl	76(%esp), %esi
	movl	72(%esp), %eax
	movl	68(%esp), %ecx
	movl	64(%esp), %edx
	movl	%edx, 40(%esp)
	movl	%ecx, 36(%esp)
	movl	%eax, 32(%esp)
	movl	%esi, 28(%esp)
	movl	40(%esp), %edi
	movl	36(%esp), %ebx
	movl	32(%esp), %ebp
	movl	%ebx, %eax
	imull	%esi, %eax
	movl	%eax, (%esp)
	calll	malloc
	movl	%eax, 16(%esp)
	movl	%esi, 12(%esp)
	movl	%ebp, 8(%esp)
	movl	%ebx, 4(%esp)
	movl	%edi, (%esp)
	calll	Framebuffer$$new_hw
	addl	$44, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
.Ltmp290:
	.size	Framebuffer$$new, .Ltmp290-Framebuffer$$new
	.cfi_endproc

	.globl	Framebuffer$$from_mbinfo
	.align	16, 0x90
	.type	Framebuffer$$from_mbinfo,@function
Framebuffer$$from_mbinfo:               # @"Framebuffer$$from_mbinfo"
	.cfi_startproc
# BB#0:
	pushl	%edi
.Ltmp291:
	.cfi_def_cfa_offset 8
	pushl	%esi
.Ltmp292:
	.cfi_def_cfa_offset 12
	subl	$36, %esp
.Ltmp293:
	.cfi_def_cfa_offset 48
.Ltmp294:
	.cfi_offset %esi, -12
.Ltmp295:
	.cfi_offset %edi, -8
	movl	48(%esp), %eax
	movl	%eax, 32(%esp)
	movl	24(%eax), %ecx
	movl	28(%eax), %edx
	movl	36(%eax), %esi
	movl	%esi, %edi
	sarl	$31, %edi
	shrl	$29, %edi
	addl	%esi, %edi
	sarl	$3, %edi
	movl	32(%eax), %esi
	movl	44(%eax), %eax
	movl	%eax, 16(%esp)
	movl	%esi, 12(%esp)
	movl	%edx, 4(%esp)
	movl	%ecx, (%esp)
	movl	%edi, 8(%esp)
	calll	Framebuffer$$new_hw
	addl	$36, %esp
	popl	%esi
	popl	%edi
	retl
.Ltmp296:
	.size	Framebuffer$$from_mbinfo, .Ltmp296-Framebuffer$$from_mbinfo
	.cfi_endproc

	.globl	Framebuffer$fill
	.align	16, 0x90
	.type	Framebuffer$fill,@function
Framebuffer$fill:                       # @"Framebuffer$fill"
	.cfi_startproc
# BB#0:
	pushl	%esi
.Ltmp297:
	.cfi_def_cfa_offset 8
	subl	$32, %esp
.Ltmp298:
	.cfi_def_cfa_offset 40
.Ltmp299:
	.cfi_offset %esi, -8
	movl	52(%esp), %eax
	movl	48(%esp), %ecx
	movl	44(%esp), %edx
	movl	40(%esp), %esi
	movl	%esi, 28(%esp)
	movl	%edx, 24(%esp)
	movl	%ecx, 20(%esp)
	movl	%eax, 16(%esp)
	movl	$0, 12(%esp)
	movl	28(%esp), %eax
	cmpl	$0, 8(%eax)
	jle	.LBB107_4
	.align	16, 0x90
.LBB107_1:                              # %fframebuffer_mFramebuffer$fill_l31_n3779___LOOP___HEAD
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB107_2 Depth 2
	movl	$0, 8(%esp)
	movl	28(%esp), %eax
	cmpl	$0, 4(%eax)
	jle	.LBB107_3
	.align	16, 0x90
.LBB107_2:                              # %fframebuffer_mFramebuffer$fill_l33_n3786___LOOP___HEAD
                                        #   Parent Loop BB107_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	28(%esp), %eax
	movl	(%eax), %ecx
	movl	12(%esp), %edx
	imull	16(%eax), %edx
	movl	8(%esp), %esi
	imull	12(%eax), %esi
	addl	%edx, %esi
	movb	16(%esp), %al
	movb	%al, (%ecx,%esi)
	movl	28(%esp), %eax
	movl	(%eax), %ecx
	movl	12(%esp), %edx
	imull	16(%eax), %edx
	movl	8(%esp), %esi
	imull	12(%eax), %esi
	addl	%edx, %esi
	movb	20(%esp), %al
	movb	%al, 1(%ecx,%esi)
	movl	28(%esp), %eax
	movl	(%eax), %ecx
	movl	12(%esp), %edx
	imull	16(%eax), %edx
	movl	8(%esp), %esi
	imull	12(%eax), %esi
	addl	%edx, %esi
	movb	24(%esp), %al
	movb	%al, 2(%ecx,%esi)
	movl	8(%esp), %eax
	incl	%eax
	movl	%eax, 8(%esp)
	movl	28(%esp), %ecx
	cmpl	4(%ecx), %eax
	jl	.LBB107_2
.LBB107_3:                              # %fframebuffer_mFramebuffer$fill_l33_n3786___LOOP___END
                                        #   in Loop: Header=BB107_1 Depth=1
	movl	12(%esp), %eax
	incl	%eax
	movl	%eax, 12(%esp)
	movl	28(%esp), %ecx
	cmpl	8(%ecx), %eax
	jl	.LBB107_1
.LBB107_4:                              # %fframebuffer_mFramebuffer$fill_l31_n3779___LOOP___END
	addl	$32, %esp
	popl	%esi
	retl
.Ltmp300:
	.size	Framebuffer$fill, .Ltmp300-Framebuffer$fill
	.cfi_endproc

	.globl	Framebuffer$setpx
	.align	16, 0x90
	.type	Framebuffer$setpx,@function
Framebuffer$setpx:                      # @"Framebuffer$setpx"
	.cfi_startproc
# BB#0:
	pushl	%ebx
.Ltmp301:
	.cfi_def_cfa_offset 8
	pushl	%edi
.Ltmp302:
	.cfi_def_cfa_offset 12
	pushl	%esi
.Ltmp303:
	.cfi_def_cfa_offset 16
	subl	$28, %esp
.Ltmp304:
	.cfi_def_cfa_offset 44
.Ltmp305:
	.cfi_offset %esi, -16
.Ltmp306:
	.cfi_offset %edi, -12
.Ltmp307:
	.cfi_offset %ebx, -8
	movl	64(%esp), %eax
	movl	60(%esp), %ecx
	movl	56(%esp), %edx
	movl	52(%esp), %esi
	movl	48(%esp), %edi
	movl	44(%esp), %ebx
	movl	%ebx, 24(%esp)
	movl	%edi, 20(%esp)
	movl	%esi, 16(%esp)
	movl	%edx, 12(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	16(%esp), %eax
	movl	24(%esp), %ecx
	imull	16(%ecx), %eax
	movl	20(%esp), %edx
	imull	12(%ecx), %edx
	addl	%eax, %edx
	movl	%edx, (%esp)
	movl	24(%esp), %eax
	movl	(%eax), %eax
	movb	4(%esp), %cl
	movb	%cl, (%eax,%edx)
	movl	24(%esp), %eax
	movl	(%eax), %eax
	movl	(%esp), %ecx
	movb	8(%esp), %dl
	movb	%dl, 1(%ecx,%eax)
	movl	24(%esp), %eax
	movl	(%eax), %eax
	movl	(%esp), %ecx
	movb	12(%esp), %dl
	movb	%dl, 2(%ecx,%eax)
	addl	$28, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
.Ltmp308:
	.size	Framebuffer$setpx, .Ltmp308-Framebuffer$setpx
	.cfi_endproc

	.globl	Framebuffer$fillrect
	.align	16, 0x90
	.type	Framebuffer$fillrect,@function
Framebuffer$fillrect:                   # @"Framebuffer$fillrect"
	.cfi_startproc
# BB#0:
	pushl	%esi
.Ltmp309:
	.cfi_def_cfa_offset 8
	subl	$44, %esp
.Ltmp310:
	.cfi_def_cfa_offset 52
.Ltmp311:
	.cfi_offset %esi, -8
	movl	80(%esp), %eax
	movl	76(%esp), %ecx
	movl	52(%esp), %edx
	movl	%edx, 40(%esp)
	movl	56(%esp), %edx
	movl	%edx, 36(%esp)
	movl	60(%esp), %edx
	movl	%edx, 32(%esp)
	movl	64(%esp), %edx
	movl	%edx, 28(%esp)
	movl	68(%esp), %edx
	movl	%edx, 24(%esp)
	movl	72(%esp), %edx
	movl	%edx, 20(%esp)
	movl	%ecx, 16(%esp)
	movl	%eax, 12(%esp)
	movl	32(%esp), %eax
	movl	40(%esp), %ecx
	imull	16(%ecx), %eax
	movl	36(%esp), %edx
	imull	12(%ecx), %edx
	addl	%eax, %edx
	movl	%edx, 8(%esp)
	movl	$0, 4(%esp)
	cmpl	$0, 24(%esp)
	jle	.LBB109_4
	.align	16, 0x90
.LBB109_1:                              # %fframebuffer_mFramebuffer$fillrect_l54_n3941___LOOP___HEAD
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB109_2 Depth 2
	movl	$0, (%esp)
	cmpl	$0, 28(%esp)
	jle	.LBB109_3
	.align	16, 0x90
.LBB109_2:                              # %fframebuffer_mFramebuffer$fillrect_l56_n3946___LOOP___HEAD
                                        #   Parent Loop BB109_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	40(%esp), %eax
	movl	(%eax), %ecx
	movl	4(%esp), %edx
	imull	16(%eax), %edx
	movl	(%esp), %esi
	imull	12(%eax), %esi
	addl	%edx, %esi
	addl	8(%esp), %esi
	movb	12(%esp), %al
	movb	%al, (%ecx,%esi)
	movl	40(%esp), %eax
	movl	(%eax), %ecx
	movl	4(%esp), %edx
	imull	16(%eax), %edx
	movl	(%esp), %esi
	imull	12(%eax), %esi
	addl	%edx, %esi
	addl	8(%esp), %esi
	movb	16(%esp), %al
	movb	%al, 1(%ecx,%esi)
	movl	40(%esp), %eax
	movl	(%eax), %ecx
	movl	4(%esp), %edx
	imull	16(%eax), %edx
	movl	(%esp), %esi
	imull	12(%eax), %esi
	addl	%edx, %esi
	addl	8(%esp), %esi
	movb	20(%esp), %al
	movb	%al, 2(%ecx,%esi)
	movl	(%esp), %eax
	incl	%eax
	movl	%eax, (%esp)
	cmpl	28(%esp), %eax
	jl	.LBB109_2
.LBB109_3:                              # %fframebuffer_mFramebuffer$fillrect_l56_n3946___LOOP___END
                                        #   in Loop: Header=BB109_1 Depth=1
	movl	4(%esp), %eax
	incl	%eax
	movl	%eax, 4(%esp)
	cmpl	24(%esp), %eax
	jl	.LBB109_1
.LBB109_4:                              # %fframebuffer_mFramebuffer$fillrect_l54_n3941___LOOP___END
	addl	$44, %esp
	popl	%esi
	retl
.Ltmp312:
	.size	Framebuffer$fillrect, .Ltmp312-Framebuffer$fillrect
	.cfi_endproc

	.globl	Framebuffer$drawchar
	.align	16, 0x90
	.type	Framebuffer$drawchar,@function
Framebuffer$drawchar:                   # @"Framebuffer$drawchar"
	.cfi_startproc
# BB#0:
	pushl	%esi
.Ltmp313:
	.cfi_def_cfa_offset 8
	subl	$72, %esp
.Ltmp314:
	.cfi_def_cfa_offset 80
.Ltmp315:
	.cfi_offset %esi, -8
	movl	108(%esp), %eax
	movl	104(%esp), %ecx
	movl	80(%esp), %edx
	movl	%edx, 68(%esp)
	movl	84(%esp), %edx
	movl	%edx, 64(%esp)
	movl	88(%esp), %edx
	movl	%edx, 60(%esp)
	movl	92(%esp), %edx
	movl	%edx, 56(%esp)
	movl	96(%esp), %edx
	movl	%edx, 52(%esp)
	movl	100(%esp), %edx
	movl	%edx, 48(%esp)
	movl	%ecx, 44(%esp)
	movl	%eax, 40(%esp)
	movl	60(%esp), %eax
	movl	68(%esp), %ecx
	imull	16(%ecx), %eax
	movl	64(%esp), %edx
	imull	12(%ecx), %edx
	addl	%eax, %edx
	movl	%edx, 36(%esp)
	calll	get_font
	movl	%eax, 32(%esp)
	movl	52(%esp), %eax
	shll	$6, %eax
	movl	%eax, 28(%esp)
	movl	$.Lstrglobal_fframebuffer_mFramebuffer$drawchar_l70_n4061, (%esp)
	calll	cstr$ord
	movb	%al, 27(%esp)
	movl	$0, 20(%esp)
	cmpl	$0, 56(%esp)
	jle	.LBB110_6
	.align	16, 0x90
.LBB110_1:                              # %fframebuffer_mFramebuffer$drawchar_l73_n4067___LOOP___HEAD
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB110_2 Depth 2
	movl	$0, 16(%esp)
	cmpl	$0, 56(%esp)
	jle	.LBB110_5
	.align	16, 0x90
.LBB110_2:                              # %fframebuffer_mFramebuffer$drawchar_l75_n4072___LOOP___HEAD
                                        #   Parent Loop BB110_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	32(%esp), %eax
	movl	20(%esp), %ecx
	shll	$3, %ecx
	addl	16(%esp), %ecx
	addl	28(%esp), %ecx
	movzbl	(%eax,%ecx), %eax
	movzbl	27(%esp), %ecx
	cmpl	%ecx, %eax
	jne	.LBB110_4
# BB#3:                                 # %if_fframebuffer_mFramebuffer$drawchar_l76_n4090___SUCC
                                        #   in Loop: Header=BB110_2 Depth=2
	movl	68(%esp), %eax
	movl	(%eax), %ecx
	movl	20(%esp), %edx
	imull	16(%eax), %edx
	movl	16(%esp), %esi
	imull	12(%eax), %esi
	addl	%edx, %esi
	addl	36(%esp), %esi
	movb	40(%esp), %al
	movb	%al, (%ecx,%esi)
	movl	68(%esp), %eax
	movl	(%eax), %ecx
	movl	20(%esp), %edx
	imull	16(%eax), %edx
	movl	16(%esp), %esi
	imull	12(%eax), %esi
	addl	%edx, %esi
	addl	36(%esp), %esi
	movb	44(%esp), %al
	movb	%al, 1(%ecx,%esi)
	movl	68(%esp), %eax
	movl	(%eax), %ecx
	movl	20(%esp), %edx
	imull	16(%eax), %edx
	movl	16(%esp), %esi
	imull	12(%eax), %esi
	addl	%edx, %esi
	addl	36(%esp), %esi
	movb	48(%esp), %al
	movb	%al, 2(%ecx,%esi)
.LBB110_4:                              # %if_fframebuffer_mFramebuffer$drawchar_l76_n4090___DONE
                                        #   in Loop: Header=BB110_2 Depth=2
	movl	16(%esp), %eax
	incl	%eax
	movl	%eax, 16(%esp)
	cmpl	56(%esp), %eax
	jl	.LBB110_2
.LBB110_5:                              # %fframebuffer_mFramebuffer$drawchar_l75_n4072___LOOP___END
                                        #   in Loop: Header=BB110_1 Depth=1
	movl	20(%esp), %eax
	incl	%eax
	movl	%eax, 20(%esp)
	cmpl	56(%esp), %eax
	jl	.LBB110_1
.LBB110_6:                              # %fframebuffer_mFramebuffer$drawchar_l73_n4067___LOOP___END
	addl	$72, %esp
	popl	%esi
	retl
.Ltmp316:
	.size	Framebuffer$drawchar, .Ltmp316-Framebuffer$drawchar
	.cfi_endproc

	.globl	Framebuffer$copyfrom
	.align	16, 0x90
	.type	Framebuffer$copyfrom,@function
Framebuffer$copyfrom:                   # @"Framebuffer$copyfrom"
	.cfi_startproc
# BB#0:
	pushl	%esi
.Ltmp317:
	.cfi_def_cfa_offset 8
	subl	$24, %esp
.Ltmp318:
	.cfi_def_cfa_offset 32
.Ltmp319:
	.cfi_offset %esi, -8
	movl	36(%esp), %eax
	movl	32(%esp), %ecx
	movl	%ecx, 20(%esp)
	movl	%eax, 16(%esp)
	movl	(%eax), %eax
	movl	20(%esp), %ecx
	movl	(%ecx), %edx
	movl	8(%ecx), %esi
	imull	16(%ecx), %esi
	movl	%esi, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	calll	memcpy
	addl	$24, %esp
	popl	%esi
	retl
.Ltmp320:
	.size	Framebuffer$copyfrom, .Ltmp320-Framebuffer$copyfrom
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI112_0:
	.quad	4608236261112822104     # double 1.234
	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI112_1:
	.long	1148846080              # float 1000
.LCPI112_2:
	.long	1092616192              # float 10
.LCPI112_3:
	.long	1101004800              # float 20
.LCPI112_4:
	.long	1106247680              # float 30
.LCPI112_5:
	.long	1119092736              # float 90
.LCPI112_6:
	.long	1082130432              # float 4
.LCPI112_7:
	.long	1120403456              # float 100
.LCPI112_8:
	.long	1108344832              # float 36
.LCPI112_9:
	.long	1084227584              # float 5
	.text
	.globl	rc_mtest
	.align	16, 0x90
	.type	rc_mtest,@function
rc_mtest:                               # @rc_mtest
	.cfi_startproc
# BB#0:
	pushl	%esi
.Ltmp321:
	.cfi_def_cfa_offset 8
	subl	$152, %esp
.Ltmp322:
	.cfi_def_cfa_offset 160
.Ltmp323:
	.cfi_offset %esi, -8
	movl	160(%esp), %eax
	movl	%eax, 148(%esp)
	fldl	_the_zero_double
	faddl	.LCPI112_0
	fstpl	136(%esp)
	leal	136(%esp), %eax
	movl	%eax, 132(%esp)
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l8_n4195, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	flds	.LCPI112_1
	fstl	40(%esp)                # 8-byte Folded Spill
	faddl	_the_zero_double
	fmull	136(%esp)
	fnstcw	74(%esp)
	movw	74(%esp), %cx
	movw	$3199, 74(%esp)         # imm = 0xC7F
	fldcw	74(%esp)
	movw	%cx, 74(%esp)
	fistpl	76(%esp)
	fldcw	74(%esp)
	movl	76(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l10_n4207, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	132(%esp), %ecx
	movzbl	(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l12_n4221, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	132(%esp), %ecx
	movzbl	1(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l14_n4235, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	132(%esp), %ecx
	movzbl	2(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l16_n4249, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	132(%esp), %ecx
	movzbl	3(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l18_n4263, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	132(%esp), %ecx
	movzbl	4(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l20_n4277, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	132(%esp), %ecx
	movzbl	5(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l22_n4291, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	132(%esp), %ecx
	movzbl	6(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l24_n4305, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	132(%esp), %ecx
	movzbl	7(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l26_n4319, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l28_n4324, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	fldl	40(%esp)                # 8-byte Folded Reload
	faddl	_the_zero_double
	fmull	136(%esp)
	fnstcw	72(%esp)
	movw	72(%esp), %cx
	movw	$3199, 72(%esp)         # imm = 0xC7F
	fldcw	72(%esp)
	movw	%cx, 72(%esp)
	fistpl	80(%esp)
	fldcw	72(%esp)
	movl	80(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l31_n4339, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	flds	.LCPI112_2
	fstl	32(%esp)                # 8-byte Folded Spill
	faddl	_the_zero_double
	fstpl	(%esp)
	calll	rcsin
	fldl	40(%esp)                # 8-byte Folded Reload
	faddl	_the_zero_double
	fmulp	%st(1)
	fnstcw	70(%esp)
	movw	70(%esp), %ax
	movw	$3199, 70(%esp)         # imm = 0xC7F
	fldcw	70(%esp)
	movw	%ax, 70(%esp)
	fistpl	84(%esp)
	fldcw	70(%esp)
	movl	84(%esp), %eax
	movl	%esi, (%esp)
	movl	%eax, 4(%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l33_n4354, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	flds	.LCPI112_3
	fstl	24(%esp)                # 8-byte Folded Spill
	faddl	_the_zero_double
	fstpl	(%esp)
	calll	rcsin
	fldl	40(%esp)                # 8-byte Folded Reload
	faddl	_the_zero_double
	fmulp	%st(1)
	fnstcw	68(%esp)
	movw	68(%esp), %ax
	movw	$3199, 68(%esp)         # imm = 0xC7F
	fldcw	68(%esp)
	movw	%ax, 68(%esp)
	fistpl	88(%esp)
	fldcw	68(%esp)
	movl	88(%esp), %eax
	movl	%esi, (%esp)
	movl	%eax, 4(%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l35_n4369, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	flds	.LCPI112_4
	fstl	16(%esp)                # 8-byte Folded Spill
	faddl	_the_zero_double
	fstpl	(%esp)
	calll	rcsin
	fldl	40(%esp)                # 8-byte Folded Reload
	faddl	_the_zero_double
	fmulp	%st(1)
	fnstcw	66(%esp)
	movw	66(%esp), %ax
	movw	$3199, 66(%esp)         # imm = 0xC7F
	fldcw	66(%esp)
	movw	%ax, 66(%esp)
	fistpl	92(%esp)
	fldcw	66(%esp)
	movl	92(%esp), %eax
	movl	%esi, (%esp)
	movl	%eax, 4(%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l37_n4384, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	flds	.LCPI112_5
	fstl	8(%esp)                 # 8-byte Folded Spill
	faddl	_the_zero_double
	fstpl	(%esp)
	calll	rcsin
	fldl	40(%esp)                # 8-byte Folded Reload
	faddl	_the_zero_double
	fmulp	%st(1)
	fnstcw	64(%esp)
	movw	64(%esp), %ax
	movw	$3199, 64(%esp)         # imm = 0xC7F
	fldcw	64(%esp)
	movw	%ax, 64(%esp)
	fistpl	96(%esp)
	fldcw	64(%esp)
	movl	96(%esp), %eax
	movl	%esi, (%esp)
	movl	%eax, 4(%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l40_n4399, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	fldl	32(%esp)                # 8-byte Folded Reload
	faddl	_the_zero_double
	fstpl	(%esp)
	calll	rccos
	fldl	40(%esp)                # 8-byte Folded Reload
	faddl	_the_zero_double
	fmulp	%st(1)
	fnstcw	62(%esp)
	movw	62(%esp), %ax
	movw	$3199, 62(%esp)         # imm = 0xC7F
	fldcw	62(%esp)
	movw	%ax, 62(%esp)
	fistpl	100(%esp)
	fldcw	62(%esp)
	movl	100(%esp), %eax
	movl	%esi, (%esp)
	movl	%eax, 4(%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l42_n4414, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	fldl	24(%esp)                # 8-byte Folded Reload
	faddl	_the_zero_double
	fstpl	(%esp)
	calll	rccos
	fldl	40(%esp)                # 8-byte Folded Reload
	faddl	_the_zero_double
	fmulp	%st(1)
	fnstcw	60(%esp)
	movw	60(%esp), %ax
	movw	$3199, 60(%esp)         # imm = 0xC7F
	fldcw	60(%esp)
	movw	%ax, 60(%esp)
	fistpl	104(%esp)
	fldcw	60(%esp)
	movl	104(%esp), %eax
	movl	%esi, (%esp)
	movl	%eax, 4(%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l44_n4429, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	fldl	16(%esp)                # 8-byte Folded Reload
	faddl	_the_zero_double
	fstpl	(%esp)
	calll	rccos
	fldl	40(%esp)                # 8-byte Folded Reload
	faddl	_the_zero_double
	fmulp	%st(1)
	fnstcw	58(%esp)
	movw	58(%esp), %ax
	movw	$3199, 58(%esp)         # imm = 0xC7F
	fldcw	58(%esp)
	movw	%ax, 58(%esp)
	fistpl	108(%esp)
	fldcw	58(%esp)
	movl	108(%esp), %eax
	movl	%esi, (%esp)
	movl	%eax, 4(%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l46_n4444, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	fldl	8(%esp)                 # 8-byte Folded Reload
	faddl	_the_zero_double
	fstpl	(%esp)
	calll	rccos
	fldl	40(%esp)                # 8-byte Folded Reload
	faddl	_the_zero_double
	fmulp	%st(1)
	fnstcw	56(%esp)
	movw	56(%esp), %ax
	movw	$3199, 56(%esp)         # imm = 0xC7F
	fldcw	56(%esp)
	movw	%ax, 56(%esp)
	fistpl	112(%esp)
	fldcw	56(%esp)
	movl	112(%esp), %eax
	movl	%esi, (%esp)
	movl	%eax, 4(%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l49_n4459, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	fldl	_the_zero_double
	fadds	.LCPI112_6
	fstpl	(%esp)
	calll	sqrt
	fnstcw	54(%esp)
	movw	54(%esp), %ax
	movw	$3199, 54(%esp)         # imm = 0xC7F
	fldcw	54(%esp)
	movw	%ax, 54(%esp)
	fistpl	116(%esp)
	fldcw	54(%esp)
	movl	116(%esp), %eax
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l51_n4471, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	fldl	_the_zero_double
	fadds	.LCPI112_7
	fstpl	(%esp)
	calll	sqrt
	fnstcw	52(%esp)
	movw	52(%esp), %ax
	movw	$3199, 52(%esp)         # imm = 0xC7F
	fldcw	52(%esp)
	movw	%ax, 52(%esp)
	fistpl	120(%esp)
	fldcw	52(%esp)
	movl	120(%esp), %eax
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l53_n4483, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	fldl	_the_zero_double
	fadds	.LCPI112_8
	fstpl	(%esp)
	calll	sqrt
	fnstcw	50(%esp)
	movw	50(%esp), %ax
	movw	$3199, 50(%esp)         # imm = 0xC7F
	fldcw	50(%esp)
	movw	%ax, 50(%esp)
	fistpl	124(%esp)
	fldcw	50(%esp)
	movl	124(%esp), %eax
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l56_n4495, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	fldl	_the_zero_double
	fadds	.LCPI112_9
	fstpl	(%esp)
	calll	sqrt
	fldl	40(%esp)                # 8-byte Folded Reload
	faddl	_the_zero_double
	fmulp	%st(1)
	fnstcw	48(%esp)
	movw	48(%esp), %ax
	movw	$3199, 48(%esp)         # imm = 0xC7F
	fldcw	48(%esp)
	movw	%ax, 48(%esp)
	fistpl	128(%esp)
	fldcw	48(%esp)
	movl	128(%esp), %eax
	movl	%esi, (%esp)
	movl	%eax, 4(%esp)
	calll	Terminal$printi
	addl	$152, %esp
	popl	%esi
	retl
.Ltmp324:
	.size	rc_mtest, .Ltmp324-rc_mtest
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI113_0:
	.quad	4633264571419040487     # double 57.324840764331206
	.text
	.globl	r2d
	.align	16, 0x90
	.type	r2d,@function
r2d:                                    # @r2d
	.cfi_startproc
# BB#0:
	subl	$12, %esp
.Ltmp325:
	.cfi_def_cfa_offset 16
	fldl	16(%esp)
	fstl	(%esp)
	fldl	_the_zero_double
	faddl	.LCPI113_0
	fmulp	%st(1)
	addl	$12, %esp
	retl
.Ltmp326:
	.size	r2d, .Ltmp326-r2d
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI114_0:
	.long	1102053376              # float 22
.LCPI114_1:
	.long	1094713344              # float 12
.LCPI114_4:
	.long	1073741824              # float 2
	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI114_2:
	.quad	4604119971053405471     # double 0.66000000000000003
.LCPI114_3:
	.quad	4608083138725491507     # double 1.2
	.text
	.globl	rc_run
	.align	16, 0x90
	.type	rc_run,@function
rc_run:                                 # @rc_run
	.cfi_startproc
# BB#0:
	pushl	%edi
.Ltmp327:
	.cfi_def_cfa_offset 8
	pushl	%esi
.Ltmp328:
	.cfi_def_cfa_offset 12
	subl	$372, %esp              # imm = 0x174
.Ltmp329:
	.cfi_def_cfa_offset 384
.Ltmp330:
	.cfi_offset %esi, -12
.Ltmp331:
	.cfi_offset %edi, -8
	movl	384(%esp), %eax
	movl	%eax, 368(%esp)
	calll	get_map
	movl	%eax, 364(%esp)
	calll	get_map_w
	movl	%eax, 360(%esp)
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_run_l68_n4524, (%esp)
	calll	cstr$ord
	movb	%al, 359(%esp)
	fldl	_the_zero_double
	fadds	.LCPI114_0
	fstpl	344(%esp)
	fldl	_the_zero_double
	fadds	.LCPI114_1
	fstpl	336(%esp)
	fld1
	faddl	_the_zero_double
	fstpl	328(%esp)
	fldz
	fld	%st(0)
	faddl	_the_zero_double
	fstpl	320(%esp)
	faddl	_the_zero_double
	fstpl	312(%esp)
	fldl	_the_zero_double
	faddl	.LCPI114_2
	fstpl	304(%esp)
	movl	$10000, 300(%esp)       # imm = 0x2710
	movl	$0, 296(%esp)
	movl	$0, 292(%esp)
	movl	gvar_fin_mu_lu_n20__mbinfo, %eax
	movl	24(%eax), %eax
	movl	%eax, 244(%esp)
	movl	gvar_fin_mu_lu_n20__mbinfo, %eax
	movl	28(%eax), %eax
	movl	%eax, 240(%esp)
	movl	gvar_fin_mu_lu_n20__mbinfo, %ecx
	incl	%eax
	imull	32(%ecx), %eax
	movl	%eax, 232(%esp)
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_run_l93_n4575, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	232(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fpaging_mu_lu_n19__page_manager, %eax
	movl	%eax, (%esp)
	movl	$4194304, 4(%esp)       # imm = 0x400000
	calll	PageManager$get_pde_slot_addr
	movl	%eax, (%esp)
	movl	$1, 8(%esp)
	movl	$83886080, 4(%esp)      # imm = 0x5000000
	calll	PageEntry$set
	movl	244(%esp), %eax
	movl	240(%esp), %ecx
	movl	gvar_fin_mu_lu_n20__mbinfo, %edx
	movl	32(%edx), %esi
	movl	36(%edx), %edx
	movl	%edx, %edi
	sarl	$31, %edi
	shrl	$29, %edi
	addl	%edx, %edi
	sarl	$3, %edi
	movl	%esi, 12(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	%edi, 8(%esp)
	movl	$4194304, 16(%esp)      # imm = 0x400000
	calll	Framebuffer$$new_hw
	movl	%eax, 228(%esp)
	movl	gvar_fin_mu_lu_n20__mbinfo, %eax
	movl	%eax, (%esp)
	calll	Framebuffer$$from_mbinfo
	movl	%eax, 224(%esp)
	fldl	_the_zero_double
	faddl	.LCPI114_3
	fstpl	136(%esp)
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	24(%eax), %eax
	movl	%eax, 108(%esp)
	movl	gvar_firqio_mu_lu_n5__system_kbdstate, %eax
	movl	%eax, (%esp)
	movl	$_rc_handler, 4(%esp)
	calll	KeyboardState$set_handler
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	$_rc_term_null_handler, 24(%eax)
	movb	$1, gvar_fkappsraycasterraycaster_mu_lu_n12__rc_running
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB114_37
	.align	16, 0x90
.LBB114_1:                              # %fkappsraycasterraycaster_mrc_run_l136_n4643___LOOP___HEAD
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB114_2 Depth 2
                                        #       Child Loop BB114_9 Depth 3
                                        #       Child Loop BB114_24 Depth 3
	movl	228(%esp), %eax
	movl	%eax, (%esp)
	movl	$0, 12(%esp)
	movl	$0, 8(%esp)
	movl	$0, 4(%esp)
	calll	Framebuffer$fill
	movl	$0, 236(%esp)
	cmpl	$0, 244(%esp)
	jle	.LBB114_26
	.align	16, 0x90
.LBB114_2:                              # %fkappsraycasterraycaster_mrc_run_l141_n4651___LOOP___HEAD
                                        #   Parent Loop BB114_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB114_9 Depth 3
                                        #       Child Loop BB114_24 Depth 3
	movl	236(%esp), %eax
	addl	%eax, %eax
	movl	%eax, 92(%esp)
	fildl	92(%esp)
	movl	244(%esp), %eax
	movl	%eax, 88(%esp)
	fidivl	88(%esp)
	fld1
	fld	%st(0)
	faddl	_the_zero_double
	fsubrp	%st(2)
	fxch	%st(1)
	fstpl	280(%esp)
	fldl	344(%esp)
	fstpl	272(%esp)
	fldl	336(%esp)
	fstpl	264(%esp)
	fldl	312(%esp)
	fmull	280(%esp)
	faddl	328(%esp)
	fstpl	256(%esp)
	fldl	304(%esp)
	fmull	280(%esp)
	faddl	320(%esp)
	fstpl	248(%esp)
	fldl	272(%esp)
	fnstcw	46(%esp)
	movw	46(%esp), %ax
	movw	$3199, 46(%esp)         # imm = 0xC7F
	fldcw	46(%esp)
	movw	%ax, 46(%esp)
	fistpl	96(%esp)
	fldcw	46(%esp)
	movl	96(%esp), %eax
	movl	%eax, 220(%esp)
	fldl	264(%esp)
	fnstcw	44(%esp)
	movw	44(%esp), %ax
	movw	$3199, 44(%esp)         # imm = 0xC7F
	fldcw	44(%esp)
	movw	%ax, 44(%esp)
	fistpl	100(%esp)
	fldcw	44(%esp)
	movl	100(%esp), %eax
	movl	%eax, 216(%esp)
	faddl	_the_zero_double
	fldl	248(%esp)
	fmul	%st(0), %st(0)
	fldl	256(%esp)
	fmul	%st(0), %st(0)
	fdivrp	%st(1)
	faddp	%st(1)
	fstpl	(%esp)
	calll	sqrt
	fstpl	208(%esp)
	fld1
	faddl	_the_zero_double
	fldl	256(%esp)
	fmul	%st(0), %st(0)
	fldl	248(%esp)
	fmul	%st(0), %st(0)
	fdivrp	%st(1)
	faddp	%st(1)
	fstpl	(%esp)
	calll	sqrt
	fstpl	200(%esp)
	movl	$0, 164(%esp)
	fldl	256(%esp)
	fldz
	faddl	_the_zero_double
	fucompp
	fnstsw	%ax
                                        # kill: AX<def> AX<kill> EAX<def>
                                        # kill: AH<def> AH<kill> EAX<kill>
	sahf
	jbe	.LBB114_4
# BB#3:                                 # %if_fkappsraycasterraycaster_mrc_run_l155_n4710___SUCC
                                        #   in Loop: Header=BB114_2 Depth=2
	movl	$-1, 172(%esp)
	fldl	272(%esp)
	movl	220(%esp), %eax
	movl	%eax, 80(%esp)
	fisubl	80(%esp)
	fmull	208(%esp)
	fstpl	192(%esp)
	fld1
	jmp	.LBB114_5
	.align	16, 0x90
.LBB114_4:                              # %if_fkappsraycasterraycaster_mrc_run_l155_n4710___FAIL
                                        #   in Loop: Header=BB114_2 Depth=2
	movl	$1, 172(%esp)
	movl	220(%esp), %eax
	movl	%eax, 84(%esp)
	fld1
	fld	%st(0)
	faddl	_the_zero_double
	fsubl	272(%esp)
	fiaddl	84(%esp)
	fmull	208(%esp)
	fstpl	192(%esp)
.LBB114_5:                              # %if_fkappsraycasterraycaster_mrc_run_l155_n4710___DONE
                                        #   in Loop: Header=BB114_2 Depth=2
	fldl	248(%esp)
	fldz
	faddl	_the_zero_double
	fucompp
	fnstsw	%ax
                                        # kill: AX<def> AX<kill> EAX<def>
                                        # kill: AH<def> AH<kill> EAX<kill>
	sahf
	jbe	.LBB114_7
# BB#6:                                 # %if_fkappsraycasterraycaster_mrc_run_l164_n4733___SUCC
                                        #   in Loop: Header=BB114_2 Depth=2
	movl	$-1, 168(%esp)
	fldl	264(%esp)
	movl	216(%esp), %eax
	movl	%eax, 72(%esp)
	fisubl	72(%esp)
	jmp	.LBB114_8
	.align	16, 0x90
.LBB114_7:                              # %if_fkappsraycasterraycaster_mrc_run_l164_n4733___FAIL
                                        #   in Loop: Header=BB114_2 Depth=2
	movl	$1, 168(%esp)
	movl	216(%esp), %eax
	movl	%eax, 76(%esp)
	fld	%st(0)
	faddl	_the_zero_double
	fsubl	264(%esp)
	fiaddl	76(%esp)
.LBB114_8:                              # %if_fkappsraycasterraycaster_mrc_run_l164_n4733___DONE
                                        #   in Loop: Header=BB114_2 Depth=2
	fmull	200(%esp)
	fstpl	184(%esp)
	jmp	.LBB114_9
	.align	16, 0x90
.LBB114_14:                             # %if_fkappsraycasterraycaster_mrc_run_l185_n4786___SUCC
                                        #   in Loop: Header=BB114_9 Depth=3
	movl	$1, 164(%esp)
.LBB114_9:                              # %if_fkappsraycasterraycaster_mrc_run_l164_n4733___DONE
                                        #   Parent Loop BB114_1 Depth=1
                                        #     Parent Loop BB114_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	$0, 164(%esp)
	jne	.LBB114_15
# BB#10:                                # %fkappsraycasterraycaster_mrc_run_l173_n4752___LOOP___HEAD
                                        #   in Loop: Header=BB114_9 Depth=3
	fldl	192(%esp)
	fldl	184(%esp)
	fucompp
	fnstsw	%ax
                                        # kill: AX<def> AX<kill> EAX<def>
                                        # kill: AH<def> AH<kill> EAX<kill>
	sahf
	jbe	.LBB114_12
# BB#11:                                # %if_fkappsraycasterraycaster_mrc_run_l174_n4759___SUCC
                                        #   in Loop: Header=BB114_9 Depth=3
	fldl	192(%esp)
	faddl	208(%esp)
	fstpl	192(%esp)
	movl	172(%esp), %eax
	addl	%eax, 220(%esp)
	movl	$0, 160(%esp)
	jmp	.LBB114_13
	.align	16, 0x90
.LBB114_12:                             # %if_fkappsraycasterraycaster_mrc_run_l174_n4759___FAIL
                                        #   in Loop: Header=BB114_9 Depth=3
	fldl	184(%esp)
	faddl	200(%esp)
	fstpl	184(%esp)
	movl	168(%esp), %eax
	addl	%eax, 216(%esp)
	movl	$1, 160(%esp)
.LBB114_13:                             # %if_fkappsraycasterraycaster_mrc_run_l174_n4759___DONE
                                        #   in Loop: Header=BB114_9 Depth=3
	movl	364(%esp), %eax
	movl	216(%esp), %ecx
	imull	360(%esp), %ecx
	addl	220(%esp), %ecx
	movzbl	(%eax,%ecx), %eax
	movzbl	359(%esp), %ecx
	cmpl	%ecx, %eax
	je	.LBB114_9
	jmp	.LBB114_14
	.align	16, 0x90
.LBB114_15:                             # %fkappsraycasterraycaster_mrc_run_l173_n4752___LOOP___END
                                        #   in Loop: Header=BB114_2 Depth=2
	cmpl	$0, 160(%esp)
	jne	.LBB114_17
# BB#16:                                # %if_fkappsraycasterraycaster_mrc_run_l190_n4794___SUCC
                                        #   in Loop: Header=BB114_2 Depth=2
	movl	220(%esp), %eax
	movl	%eax, 56(%esp)
	fildl	56(%esp)
	fldl	_the_zero_double
	fadd	%st(0), %st(2)
	movl	172(%esp), %eax
	movl	%eax, 60(%esp)
	fxch	%st(2)
	fisubl	60(%esp)
	fxch	%st(2)
	fadds	.LCPI114_4
	fdivrp	%st(2)
	fxch	%st(1)
	faddl	272(%esp)
	fsubrp	%st(1)
	fdivl	256(%esp)
	jmp	.LBB114_18
	.align	16, 0x90
.LBB114_17:                             # %if_fkappsraycasterraycaster_mrc_run_l190_n4794___FAIL
                                        #   in Loop: Header=BB114_2 Depth=2
	movl	216(%esp), %eax
	movl	%eax, 64(%esp)
	fildl	64(%esp)
	fldl	_the_zero_double
	fadd	%st(0), %st(2)
	movl	168(%esp), %eax
	movl	%eax, 68(%esp)
	fxch	%st(2)
	fisubl	68(%esp)
	fxch	%st(2)
	fadds	.LCPI114_4
	fdivrp	%st(2)
	fxch	%st(1)
	faddl	264(%esp)
	fsubrp	%st(1)
	fdivl	248(%esp)
.LBB114_18:                             # %if_fkappsraycasterraycaster_mrc_run_l190_n4794___DONE
                                        #   in Loop: Header=BB114_2 Depth=2
	fstpl	176(%esp)
	movl	240(%esp), %eax
	movl	%eax, 48(%esp)
	fildl	48(%esp)
	fdivl	176(%esp)
	fnstcw	42(%esp)
	movw	42(%esp), %ax
	movw	$3199, 42(%esp)         # imm = 0xC7F
	fldcw	42(%esp)
	movw	%ax, 42(%esp)
	fistpl	52(%esp)
	fldcw	42(%esp)
	movl	52(%esp), %eax
	movl	%eax, 156(%esp)
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%eax, %ecx
	sarl	%ecx
	movl	240(%esp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%eax, %edx
	sarl	%edx
	addl	%ecx, %edx
	movl	%edx, 152(%esp)
	movl	156(%esp), %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%eax, %ecx
	sarl	%ecx
	movl	240(%esp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%eax, %edx
	sarl	%edx
	subl	%ecx, %edx
	movl	%edx, 148(%esp)
	jns	.LBB114_20
# BB#19:                                # %if_fkappsraycasterraycaster_mrc_run_l200_n4848___SUCC
                                        #   in Loop: Header=BB114_2 Depth=2
	movl	$0, 148(%esp)
.LBB114_20:                             # %if_fkappsraycasterraycaster_mrc_run_l200_n4848___DONE
                                        #   in Loop: Header=BB114_2 Depth=2
	movl	152(%esp), %eax
	cmpl	240(%esp), %eax
	jle	.LBB114_22
# BB#21:                                # %if_fkappsraycasterraycaster_mrc_run_l204_n4853___SUCC
                                        #   in Loop: Header=BB114_2 Depth=2
	movl	240(%esp), %eax
	movl	%eax, 152(%esp)
.LBB114_22:                             # %if_fkappsraycasterraycaster_mrc_run_l204_n4853___DONE
                                        #   in Loop: Header=BB114_2 Depth=2
	movl	152(%esp), %eax
	jmp	.LBB114_24
	.align	16, 0x90
.LBB114_23:                             # %fkappsraycasterraycaster_mrc_run_l209_n4855___LOOP___HEAD
                                        #   in Loop: Header=BB114_24 Depth=3
	movl	228(%esp), %eax
	movl	236(%esp), %ecx
	movl	152(%esp), %edx
	imull	$255, 160(%esp), %esi
	movl	%esi, 16(%esp)
	movl	%edx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$0, 20(%esp)
	movl	$255, 12(%esp)
	calll	Framebuffer$setpx
	movl	152(%esp), %eax
	decl	%eax
	movl	%eax, 152(%esp)
.LBB114_24:                             # %fkappsraycasterraycaster_mrc_run_l209_n4855___LOOP___HEAD
                                        #   Parent Loop BB114_1 Depth=1
                                        #     Parent Loop BB114_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	148(%esp), %eax
	jg	.LBB114_23
# BB#25:                                # %fkappsraycasterraycaster_mrc_run_l209_n4855___LOOP___END
                                        #   in Loop: Header=BB114_2 Depth=2
	movl	236(%esp), %eax
	incl	%eax
	movl	%eax, 236(%esp)
	cmpl	244(%esp), %eax
	jl	.LBB114_2
.LBB114_26:                             # %fkappsraycasterraycaster_mrc_run_l141_n4651___LOOP___END
                                        #   in Loop: Header=BB114_1 Depth=1
	movl	gvar_firqio_mu_lu_n5__system_kbdstate, %eax
	movl	%eax, (%esp)
	movl	$72, 4(%esp)
	calll	KeyboardState$getkey
	testb	$1, %al
	je	.LBB114_28
# BB#27:                                # %if_fkappsraycasterraycaster_mrc_run_l216_n4884___SUCC
                                        #   in Loop: Header=BB114_1 Depth=1
	fldl	328(%esp)
	fmull	136(%esp)
	faddl	344(%esp)
	fstpl	344(%esp)
	fldl	320(%esp)
	fmull	136(%esp)
	faddl	336(%esp)
	jmp	.LBB114_30
	.align	16, 0x90
.LBB114_28:                             # %if_fkappsraycasterraycaster_mrc_run_l216_n4884___FAIL
                                        #   in Loop: Header=BB114_1 Depth=1
	movl	gvar_firqio_mu_lu_n5__system_kbdstate, %eax
	movl	%eax, (%esp)
	movl	$80, 4(%esp)
	calll	KeyboardState$getkey
	testb	$1, %al
	je	.LBB114_31
# BB#29:                                # %if_fkappsraycasterraycaster_mrc_run_l216_n4898___SUCC
                                        #   in Loop: Header=BB114_1 Depth=1
	fldl	344(%esp)
	fldl	328(%esp)
	fmull	136(%esp)
	fsubrp	%st(1)
	fstpl	344(%esp)
	fldl	336(%esp)
	fldl	320(%esp)
	fmull	136(%esp)
	fsubrp	%st(1)
.LBB114_30:                             # %if_fkappsraycasterraycaster_mrc_run_l216_n4884___DONE
                                        #   in Loop: Header=BB114_1 Depth=1
	fstpl	336(%esp)
.LBB114_31:                             # %if_fkappsraycasterraycaster_mrc_run_l216_n4884___DONE
                                        #   in Loop: Header=BB114_1 Depth=1
	movl	gvar_firqio_mu_lu_n5__system_kbdstate, %eax
	movl	%eax, (%esp)
	movl	$75, 4(%esp)
	calll	KeyboardState$getkey
	testb	$1, %al
	je	.LBB114_33
# BB#32:                                # %if_fkappsraycasterraycaster_mrc_run_l224_n4912___SUCC
                                        #   in Loop: Header=BB114_1 Depth=1
	movl	300(%esp), %eax
	decl	%eax
	jmp	.LBB114_35
	.align	16, 0x90
.LBB114_33:                             # %if_fkappsraycasterraycaster_mrc_run_l224_n4912___FAIL
                                        #   in Loop: Header=BB114_1 Depth=1
	movl	gvar_firqio_mu_lu_n5__system_kbdstate, %eax
	movl	%eax, (%esp)
	movl	$77, 4(%esp)
	calll	KeyboardState$getkey
	testb	$1, %al
	je	.LBB114_36
# BB#34:                                # %if_fkappsraycasterraycaster_mrc_run_l224_n4934___SUCC
                                        #   in Loop: Header=BB114_1 Depth=1
	movl	300(%esp), %eax
	incl	%eax
.LBB114_35:                             # %if_fkappsraycasterraycaster_mrc_run_l224_n4912___DONE
                                        #   in Loop: Header=BB114_1 Depth=1
	movl	%eax, 300(%esp)
	movl	%eax, (%esp)
	calll	rcrot_get_for
	movl	%eax, 104(%esp)
	fldl	(%eax)
	fstpl	328(%esp)
	movl	104(%esp), %eax
	fldl	8(%eax)
	fstpl	320(%esp)
	movl	104(%esp), %eax
	fldl	16(%eax)
	fstpl	312(%esp)
	movl	104(%esp), %eax
	fldl	24(%eax)
	fstpl	304(%esp)
.LBB114_36:                             # %if_fkappsraycasterraycaster_mrc_run_l224_n4912___DONE
                                        #   in Loop: Header=BB114_1 Depth=1
	movl	224(%esp), %eax
	movl	228(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Framebuffer$copyfrom
	movb	gvar_fkappsraycasterraycaster_mu_lu_n12__rc_running, %al
	testb	%al, %al
	jne	.LBB114_1
.LBB114_37:                             # %fkappsraycasterraycaster_mrc_run_l136_n4643___LOOP___END
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	108(%esp), %ecx
	movl	%ecx, 24(%eax)
	addl	$372, %esp              # imm = 0x174
	popl	%esi
	popl	%edi
	retl
.Ltmp332:
	.size	rc_run, .Ltmp332-rc_run
	.cfi_endproc

	.globl	_rc_handler
	.align	16, 0x90
	.type	_rc_handler,@function
_rc_handler:                            # @_rc_handler
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp333:
	.cfi_def_cfa_offset 32
	movb	36(%esp), %al
	movl	32(%esp), %ecx
	movl	%ecx, 24(%esp)
	andb	$1, %al
	movb	%al, 23(%esp)
	movl	24(%esp), %eax
	cmpl	$16, %eax
	sete	%cl
	cmpl	$27, %eax
	sete	%al
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	movzbl	%cl, %eax
	movl	%eax, (%esp)
	calll	bool$or
	testb	$1, %al
	je	.LBB115_2
# BB#1:                                 # %if_fkappsraycasterraycaster_m_rc_handler_l247_n4969___SUCC
	movb	$0, gvar_fkappsraycasterraycaster_mu_lu_n12__rc_running
.LBB115_2:                              # %if_fkappsraycasterraycaster_m_rc_handler_l247_n4969___DONE
	addl	$28, %esp
	retl
.Ltmp334:
	.size	_rc_handler, .Ltmp334-_rc_handler
	.cfi_endproc

	.globl	_rc_term_null_handler
	.align	16, 0x90
	.type	_rc_term_null_handler,@function
_rc_term_null_handler:                  # @_rc_term_null_handler
	.cfi_startproc
# BB#0:
	retl
.Ltmp335:
	.size	_rc_term_null_handler, .Ltmp335-_rc_term_null_handler
	.cfi_endproc

	.globl	BMPImage$get_data
	.align	16, 0x90
	.type	BMPImage$get_data,@function
BMPImage$get_data:                      # @"BMPImage$get_data"
	.cfi_startproc
# BB#0:
	subl	$12, %esp
.Ltmp336:
	.cfi_def_cfa_offset 16
	movl	16(%esp), %eax
	movl	%eax, 8(%esp)
	movl	10(%eax), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	ptr$offset
	addl	$12, %esp
	retl
.Ltmp337:
	.size	BMPImage$get_data, .Ltmp337-BMPImage$get_data
	.cfi_endproc

	.globl	BMPImage$get_pitch
	.align	16, 0x90
	.type	BMPImage$get_pitch,@function
BMPImage$get_pitch:                     # @"BMPImage$get_pitch"
	.cfi_startproc
# BB#0:
	subl	$8, %esp
.Ltmp338:
	.cfi_def_cfa_offset 12
	movl	12(%esp), %eax
	movl	%eax, 4(%esp)
	movzwl	28(%eax), %ecx
	shrl	$3, %ecx
	imull	18(%eax), %ecx
	movl	%ecx, (%esp)
	movl	%ecx, %eax
	sarl	$31, %eax
	shrl	$30, %eax
	addl	%ecx, %eax
	andl	$-4, %eax
	cmpl	%eax, %ecx
	je	.LBB118_2
# BB#1:                                 # %if_fkappsdrawbmp_mBMPImage$get_pitch_l32_n4996___SUCC
	movl	(%esp), %eax
	movl	%eax, %ecx
	sarl	$31, %ecx
	shrl	$30, %ecx
	addl	%eax, %ecx
	andl	$-4, %ecx
	movl	%eax, %edx
	subl	%ecx, %edx
	negl	%edx
	leal	4(%eax,%edx), %eax
	movl	%eax, (%esp)
.LBB118_2:                              # %if_fkappsdrawbmp_mBMPImage$get_pitch_l32_n4996___DONE
	movl	(%esp), %eax
	addl	$8, %esp
	retl
.Ltmp339:
	.size	BMPImage$get_pitch, .Ltmp339-BMPImage$get_pitch
	.cfi_endproc

	.globl	BMPImage$get_pixel
	.align	16, 0x90
	.type	BMPImage$get_pixel,@function
BMPImage$get_pixel:                     # @"BMPImage$get_pixel"
	.cfi_startproc
# BB#0:
	pushl	%esi
.Ltmp340:
	.cfi_def_cfa_offset 8
	subl	$24, %esp
.Ltmp341:
	.cfi_def_cfa_offset 32
.Ltmp342:
	.cfi_offset %esi, -8
	movl	40(%esp), %eax
	movl	36(%esp), %ecx
	movl	32(%esp), %edx
	movl	%edx, 20(%esp)
	movl	%ecx, 16(%esp)
	movl	%eax, 12(%esp)
	movl	20(%esp), %eax
	movl	%eax, (%esp)
	calll	BMPImage$get_data
	movl	%eax, %esi
	movl	20(%esp), %eax
	movl	%eax, (%esp)
	calll	BMPImage$get_pitch
	movl	20(%esp), %ecx
	movl	22(%ecx), %edx
	subl	12(%esp), %edx
	imull	%eax, %edx
	movzwl	28(%ecx), %eax
	shrl	$3, %eax
	imull	16(%esp), %eax
	addl	%edx, %eax
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	ptr$offset
	addl	$24, %esp
	popl	%esi
	retl
.Ltmp343:
	.size	BMPImage$get_pixel, .Ltmp343-BMPImage$get_pixel
	.cfi_endproc

	.globl	kc_draw_bmp
	.align	16, 0x90
	.type	kc_draw_bmp,@function
kc_draw_bmp:                            # @kc_draw_bmp
	.cfi_startproc
# BB#0:
	pushl	%ebp
.Ltmp344:
	.cfi_def_cfa_offset 8
.Ltmp345:
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
.Ltmp346:
	.cfi_def_cfa_register %ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$28, %esp
.Ltmp347:
	.cfi_offset %esi, -20
.Ltmp348:
	.cfi_offset %edi, -16
.Ltmp349:
	.cfi_offset %ebx, -12
	movl	8(%ebp), %eax
	movl	%eax, -16(%ebp)
	movl	gvar_fin_mu_lu_n20__mbinfo, %ecx
	subl	$16, %esp
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	calll	MultibootInfo$get_mod_by_args
	addl	$16, %esp
	movl	%eax, -20(%ebp)
	testl	%eax, %eax
	jne	.LBB120_4
# BB#1:                                 # %if_fkappsdrawbmp_mkc_draw_bmp_l44_n5039___SUCC
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l45_n5042, 4(%esp)
	jmp	.LBB120_2
.LBB120_4:                              # %if_fkappsdrawbmp_mkc_draw_bmp_l44_n5039___DONE
	movl	%esp, %eax
	leal	-16(%eax), %esi
	movl	%esi, -36(%ebp)         # 4-byte Spill
	movl	%esi, %esp
	movl	-20(%ebp), %ecx
	movl	4(%ecx), %ecx
	movl	%ecx, -16(%eax)
	movzbl	(%ecx), %edi
	subl	$16, %esp
	movl	$.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l51_n5056, (%esp)
	calll	cstr$ord
	addl	$16, %esp
	movzbl	%al, %eax
	cmpl	%eax, %edi
	je	.LBB120_6
# BB#5:                                 # %if_fkappsdrawbmp_mkc_draw_bmp_l51_n5059___SUCC
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l52_n5062, 4(%esp)
	jmp	.LBB120_2
.LBB120_6:                              # %if_fkappsdrawbmp_mkc_draw_bmp_l51_n5059___DONE
	movl	(%esi), %eax
	movzbl	1(%eax), %edi
	subl	$16, %esp
	movl	$.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l56_n5071, (%esp)
	calll	cstr$ord
	addl	$16, %esp
	movzbl	%al, %eax
	cmpl	%eax, %edi
	je	.LBB120_8
# BB#7:                                 # %if_fkappsdrawbmp_mkc_draw_bmp_l56_n5074___SUCC
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l57_n5077, 4(%esp)
	jmp	.LBB120_2
.LBB120_8:                              # %if_fkappsdrawbmp_mkc_draw_bmp_l56_n5074___DONE
	movl	(%esi), %eax
	cmpl	$0, 30(%eax)
	je	.LBB120_10
# BB#9:                                 # %if_fkappsdrawbmp_mkc_draw_bmp_l61_n5085___SUCC
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l62_n5088, 4(%esp)
	jmp	.LBB120_2
.LBB120_10:                             # %if_fkappsdrawbmp_mkc_draw_bmp_l61_n5085___DONE
	movl	(%esi), %eax
	movzwl	28(%eax), %eax
	cmpl	$24, %eax
	je	.LBB120_12
# BB#11:                                # %if_fkappsdrawbmp_mkc_draw_bmp_l66_n5097___SUCC
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l67_n5100, 4(%esp)
.LBB120_2:                              # %if_fkappsdrawbmp_mkc_draw_bmp_l44_n5039___SUCC
	calll	Terminal$printl
.LBB120_3:                              # %fkappsdrawbmp_mkc_draw_bmp_l76_n5111___LOOP___END
	leal	-12(%ebp), %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
.LBB120_12:                             # %if_fkappsdrawbmp_mkc_draw_bmp_l66_n5097___DONE
	movl	%esp, %edi
	leal	-16(%edi), %ebx
	movl	%ebx, %esp
	movl	gvar_fin_mu_lu_n20__mbinfo, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	calll	Framebuffer$$from_mbinfo
	addl	$16, %esp
	movl	%eax, -16(%edi)
	movl	%esp, %eax
	leal	-16(%eax), %edi
	movl	%edi, %esp
	movl	$0, -16(%eax)
	movl	%esp, %edx
	addl	$-16, %edx
	movl	%edx, -24(%ebp)         # 4-byte Spill
	movl	%edx, %esp
	movl	%esp, %ecx
	addl	$-16, %ecx
	movl	%ecx, -40(%ebp)         # 4-byte Spill
	movl	%ecx, %esp
	movl	-16(%eax), %eax
	jmp	.LBB120_13
.LBB120_16:                             # %fkappsdrawbmp_mkc_draw_bmp_l78_n5118___LOOP___END
                                        #   in Loop: Header=BB120_13 Depth=1
	movl	(%edi), %eax
	incl	%eax
	movl	%eax, (%edi)
.LBB120_13:                             # %if_fkappsdrawbmp_mkc_draw_bmp_l66_n5097___DONE
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB120_15 Depth 2
	movl	(%esi), %ecx
	cmpl	22(%ecx), %eax
	jge	.LBB120_3
# BB#14:                                # %fkappsdrawbmp_mkc_draw_bmp_l76_n5111___LOOP___HEAD
                                        #   in Loop: Header=BB120_13 Depth=1
	movl	$0, (%edx)
	movl	(%esi), %eax
	cmpl	$0, 18(%eax)
	jle	.LBB120_16
	.align	16, 0x90
.LBB120_15:                             # %fkappsdrawbmp_mkc_draw_bmp_l78_n5118___LOOP___HEAD
                                        #   Parent Loop BB120_13 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	(%esi), %eax
	movl	(%edx), %ecx
	movl	(%edi), %edx
	subl	$16, %esp
	movl	%edx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	BMPImage$get_pixel
	addl	$16, %esp
	movl	-40(%ebp), %ecx         # 4-byte Reload
	movl	%eax, (%ecx)
	movl	(%ebx), %ecx
	movl	%ecx, -28(%ebp)         # 4-byte Spill
	movl	-24(%ebp), %ecx         # 4-byte Reload
	movl	(%ecx), %ecx
	movl	%ecx, -32(%ebp)         # 4-byte Spill
	movl	(%edi), %esi
	movl	%ebx, %edx
	movzbl	2(%eax), %ebx
	movl	%edi, %ecx
	movzbl	1(%eax), %edi
	movzbl	(%eax), %eax
	subl	$32, %esp
	movl	%eax, 20(%esp)
	movl	%edi, 16(%esp)
	movl	%ecx, %edi
	movl	%ebx, 12(%esp)
	movl	%edx, %ebx
	movl	%esi, 8(%esp)
	movl	-36(%ebp), %esi         # 4-byte Reload
	movl	-32(%ebp), %eax         # 4-byte Reload
	movl	%eax, 4(%esp)
	movl	-28(%ebp), %eax         # 4-byte Reload
	movl	%eax, (%esp)
	calll	Framebuffer$setpx
	movl	-24(%ebp), %edx         # 4-byte Reload
	addl	$32, %esp
	movl	(%edx), %eax
	incl	%eax
	movl	%eax, (%edx)
	movl	(%esi), %ecx
	cmpl	18(%ecx), %eax
	jl	.LBB120_15
	jmp	.LBB120_16
.Ltmp350:
	.size	kc_draw_bmp, .Ltmp350-kc_draw_bmp
	.cfi_endproc

	.globl	KConsoleCommand$$new
	.align	16, 0x90
	.type	KConsoleCommand$$new,@function
KConsoleCommand$$new:                   # @"KConsoleCommand$$new"
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp351:
	.cfi_def_cfa_offset 32
	movl	40(%esp), %eax
	movl	36(%esp), %ecx
	movl	32(%esp), %edx
	movl	%edx, 24(%esp)
	movl	%ecx, 20(%esp)
	movl	%eax, 16(%esp)
	movl	$32, (%esp)
	calll	malloc
	movl	%eax, 12(%esp)
	movl	24(%esp), %ecx
	movl	%ecx, (%eax)
	movl	12(%esp), %eax
	movl	20(%esp), %ecx
	movl	%ecx, 4(%eax)
	movl	12(%esp), %eax
	movl	16(%esp), %ecx
	movl	%ecx, 8(%eax)
	movl	12(%esp), %eax
	movl	$0, 12(%eax)
	movl	12(%esp), %eax
	addl	$28, %esp
	retl
.Ltmp352:
	.size	KConsoleCommand$$new, .Ltmp352-KConsoleCommand$$new
	.cfi_endproc

	.globl	KConsoleCommand$run
	.align	16, 0x90
	.type	KConsoleCommand$run,@function
KConsoleCommand$run:                    # @"KConsoleCommand$run"
	.cfi_startproc
# BB#0:
	subl	$12, %esp
.Ltmp353:
	.cfi_def_cfa_offset 16
	movl	20(%esp), %eax
	movl	16(%esp), %ecx
	movl	%ecx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	8(%esp), %ecx
	movl	%eax, (%esp)
	calll	*8(%ecx)
	addl	$12, %esp
	retl
.Ltmp354:
	.size	KConsoleCommand$run, .Ltmp354-KConsoleCommand$run
	.cfi_endproc

	.globl	console_disp_line
	.align	16, 0x90
	.type	console_disp_line,@function
console_disp_line:                      # @console_disp_line
	.cfi_startproc
# BB#0:
	subl	$12, %esp
.Ltmp355:
	.cfi_def_cfa_offset 16
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mconsole_disp_line_l26_n5192, 4(%esp)
	calll	Terminal$print
	addl	$12, %esp
	retl
.Ltmp356:
	.size	console_disp_line, .Ltmp356-console_disp_line
	.cfi_endproc

	.globl	consolehandler
	.align	16, 0x90
	.type	consolehandler,@function
consolehandler:                         # @consolehandler
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp357:
	.cfi_def_cfa_offset 32
	movb	36(%esp), %al
	movl	32(%esp), %ecx
	movl	%ecx, 24(%esp)
	andb	$1, %al
	movb	%al, 23(%esp)
	movl	gvar_fkappsconsole_mu_lu_n13__console_buf, %eax
	movl	24(%esp), %ecx
	movzbl	23(%esp), %edx
	movl	%edx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	KeyboardBuf$handleevent
	addl	$28, %esp
	retl
.Ltmp358:
	.size	consolehandler, .Ltmp358-consolehandler
	.cfi_endproc

	.globl	console_submit
	.align	16, 0x90
	.type	console_submit,@function
console_submit:                         # @console_submit
	.cfi_startproc
# BB#0:
	pushl	%ebp
.Ltmp359:
	.cfi_def_cfa_offset 8
.Ltmp360:
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
.Ltmp361:
	.cfi_def_cfa_register %ebp
	pushl	%edi
	pushl	%esi
	subl	$16, %esp
.Ltmp362:
	.cfi_offset %esi, -16
.Ltmp363:
	.cfi_offset %edi, -12
	movl	8(%ebp), %esi
	movl	%esi, -12(%ebp)
	subl	$16, %esp
	movl	$.Lstrglobal_fkappsconsole_mconsole_submit_l36_n5209, (%esp)
	calll	char
	addl	$16, %esp
	subl	$16, %esp
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	cstr$index
	addl	$16, %esp
	cmpl	$-1, %eax
	jne	.LBB125_2
# BB#1:                                 # %if_fkappsconsole_mconsole_submit_l36_n5214___SUCC
	movl	-12(%ebp), %eax
	movl	%eax, -16(%ebp)
	movl	$.Lstrglobal_fkappsconsole_mconsole_submit_l38_n5216, -20(%ebp)
	jmp	.LBB125_3
.LBB125_2:                              # %if_fkappsconsole_mconsole_submit_l36_n5214___FAIL
	movl	%esp, %esi
	leal	-16(%esi), %eax
	movl	%eax, %esp
	movl	-12(%ebp), %edi
	subl	$16, %esp
	movl	$.Lstrglobal_fkappsconsole_mconsole_submit_l40_n5224, (%esp)
	calll	char
	addl	$16, %esp
	subl	$16, %esp
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	%edi, (%esp)
	calll	cstr$index
	addl	$16, %esp
	movl	%eax, -16(%esi)
	incl	%eax
	subl	$16, %esp
	movl	%eax, (%esp)
	calll	malloc
	addl	$16, %esp
	movl	%eax, -16(%ebp)
	movl	-12(%ebp), %ecx
	movl	-16(%esi), %edx
	subl	$16, %esp
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	calll	memcpy
	addl	$16, %esp
	movl	-16(%ebp), %eax
	movl	-16(%esi), %ecx
	movb	$0, (%eax,%ecx)
	movl	-12(%ebp), %eax
	movl	-16(%esi), %ecx
	incl	%ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	ptr$offset
	addl	$16, %esp
	movl	%eax, -20(%ebp)
.LBB125_3:                              # %if_fkappsconsole_mconsole_submit_l36_n5214___DONE
	movl	%esp, %edi
	leal	-16(%edi), %esi
	movl	%esi, %esp
	movl	gvar_fkappsconsole_mu_lu_n16__kcommand_head, %eax
	movl	-16(%ebp), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	get_command
	addl	$16, %esp
	movl	%eax, -16(%edi)
	testl	%eax, %eax
	je	.LBB125_5
# BB#4:                                 # %if_fkappsconsole_mconsole_submit_l47_n5263___SUCC
	movl	(%esi), %eax
	movl	%eax, gvar_fkappsconsole_mu_lu_n14__command_to_run
	movl	-20(%ebp), %eax
	movl	%eax, gvar_fkappsconsole_mu_lu_n15__command_args
	jmp	.LBB125_6
.LBB125_5:                              # %if_fkappsconsole_mconsole_submit_l47_n5263___FAIL
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mconsole_submit_l51_n5268, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	calll	console_disp_line
.LBB125_6:                              # %if_fkappsconsole_mconsole_submit_l47_n5263___DONE
	leal	-8(%ebp), %esp
	popl	%esi
	popl	%edi
	popl	%ebp
	retl
.Ltmp364:
	.size	console_submit, .Ltmp364-console_submit
	.cfi_endproc

	.globl	get_command
	.align	16, 0x90
	.type	get_command,@function
get_command:                            # @get_command
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp365:
	.cfi_def_cfa_offset 32
	movl	36(%esp), %eax
	movl	32(%esp), %ecx
	movl	%ecx, 24(%esp)
	movl	%eax, 20(%esp)
	movl	24(%esp), %eax
	jmp	.LBB126_1
	.align	16, 0x90
.LBB126_3:                              # %if_fkappsconsole_mget_command_l60_n5288___DONE
                                        #   in Loop: Header=BB126_1 Depth=1
	movl	16(%esp), %eax
	movl	12(%eax), %eax
.LBB126_1:                              # =>This Inner Loop Header: Depth=1
	movl	%eax, 16(%esp)
	testl	%eax, %eax
	je	.LBB126_4
# BB#2:                                 # %fkappsconsole_mget_command_l59_n5277___LOOP___HEAD
                                        #   in Loop: Header=BB126_1 Depth=1
	movl	16(%esp), %eax
	movl	(%eax), %eax
	movl	20(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	cstr$__eq__
	testb	$1, %al
	je	.LBB126_3
# BB#5:                                 # %if_fkappsconsole_mget_command_l60_n5288___SUCC
	movl	16(%esp), %eax
	addl	$28, %esp
	retl
.LBB126_4:                              # %fkappsconsole_mget_command_l59_n5277___LOOP___END
	xorl	%eax, %eax
	addl	$28, %esp
	retl
.Ltmp366:
	.size	get_command, .Ltmp366-get_command
	.cfi_endproc

	.globl	kc_help
	.align	16, 0x90
	.type	kc_help,@function
kc_help:                                # @kc_help
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp367:
	.cfi_def_cfa_offset 32
	movl	32(%esp), %eax
	movl	%eax, 24(%esp)
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_help_l68_n5304, 4(%esp)
	calll	Terminal$printl
	movl	gvar_fkappsconsole_mu_lu_n16__kcommand_head, %eax
	jmp	.LBB127_2
	.align	16, 0x90
.LBB127_1:                              # %fkappsconsole_mkc_help_l70_n5309___LOOP___HEAD
                                        #   in Loop: Header=BB127_2 Depth=1
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_help_l71_n5317, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	20(%esp), %ecx
	movl	(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_help_l73_n5327, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	20(%esp), %ecx
	movl	4(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_help_l75_n5337, 4(%esp)
	calll	Terminal$print
	movl	20(%esp), %eax
	movl	12(%eax), %eax
.LBB127_2:                              # %fkappsconsole_mkc_help_l70_n5309___LOOP___HEAD
                                        # =>This Inner Loop Header: Depth=1
	movl	%eax, 20(%esp)
	testl	%eax, %eax
	jne	.LBB127_1
# BB#3:                                 # %fkappsconsole_mkc_help_l70_n5309___LOOP___END
	addl	$28, %esp
	retl
.Ltmp368:
	.size	kc_help, .Ltmp368-kc_help
	.cfi_endproc

	.globl	kc_dumpargs
	.align	16, 0x90
	.type	kc_dumpargs,@function
kc_dumpargs:                            # @kc_dumpargs
	.cfi_startproc
# BB#0:
	subl	$12, %esp
.Ltmp369:
	.cfi_def_cfa_offset 16
	movl	16(%esp), %eax
	movl	%eax, 8(%esp)
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_dumpargs_l81_n5351, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	8(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printl
	addl	$12, %esp
	retl
.Ltmp370:
	.size	kc_dumpargs, .Ltmp370-kc_dumpargs
	.cfi_endproc

	.globl	kc_mem
	.align	16, 0x90
	.type	kc_mem,@function
kc_mem:                                 # @kc_mem
	.cfi_startproc
# BB#0:
	subl	$12, %esp
.Ltmp371:
	.cfi_def_cfa_offset 16
	movl	16(%esp), %eax
	movl	%eax, 8(%esp)
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_mem_l86_n5360, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	gvar_fmm_mu_lu_n1__mm_head, %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$dumphexi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_mem_l88_n5369, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	gvar_fmm_mu_lu_n2__mm_pos, %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$dumphexi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_mem_l90_n5378, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	gvar_fmm_mu_lu_n2__mm_pos, %ecx
	subl	gvar_fmm_mu_lu_n1__mm_head, %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_mem_l92_n5390, 4(%esp)
	calll	Terminal$print
	addl	$12, %esp
	retl
.Ltmp372:
	.size	kc_mem, .Ltmp372-kc_mem
	.cfi_endproc

	.globl	kc_dump_multiboot
	.align	16, 0x90
	.type	kc_dump_multiboot,@function
kc_dump_multiboot:                      # @kc_dump_multiboot
	.cfi_startproc
# BB#0:
	subl	$12, %esp
.Ltmp373:
	.cfi_def_cfa_offset 16
	movl	16(%esp), %eax
	movl	%eax, 8(%esp)
	movl	gvar_fin_mu_lu_n10__multiboot_data_physaddr, %eax
	movl	gvar_fin_mu_lu_n9__base_vma, %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	ptr$offset
	movl	%eax, (%esp)
	calll	RawMultibootInfo$print
	addl	$12, %esp
	retl
.Ltmp374:
	.size	kc_dump_multiboot, .Ltmp374-kc_dump_multiboot
	.cfi_endproc

	.globl	kc_dump_parseed_multiboot
	.align	16, 0x90
	.type	kc_dump_parseed_multiboot,@function
kc_dump_parseed_multiboot:              # @kc_dump_parseed_multiboot
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp375:
	.cfi_def_cfa_offset 32
	movl	32(%esp), %eax
	movl	%eax, 24(%esp)
	movl	gvar_fin_mu_lu_n20__mbinfo, %eax
	movzbl	8(%eax), %eax
	cmpl	$1, %eax
	jne	.LBB131_5
# BB#1:                                 # %if_fkappsconsole_mkc_dump_parseed_multiboot_l100_n5403___SUCC
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l101_n5406, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	gvar_fin_mu_lu_n20__mbinfo, %ecx
	movl	16(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printl
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l103_n5416, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	gvar_fin_mu_lu_n20__mbinfo, %ecx
	movl	12(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printl
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l105_n5426, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	gvar_fin_mu_lu_n20__mbinfo, %ecx
	movl	48(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$2, 8(%esp)
	calll	Terminal$dumphex
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l107_n5437, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	gvar_fin_mu_lu_n20__mbinfo, %ecx
	movl	52(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l109_n5447, 4(%esp)
	calll	Terminal$printl
	movl	gvar_fin_mu_lu_n20__mbinfo, %eax
	movzbl	20(%eax), %eax
	cmpl	$1, %eax
	jne	.LBB131_3
# BB#2:                                 # %if_fkappsconsole_mkc_dump_parseed_multiboot_l110_n5453___SUCC
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l111_n5456, 4(%esp)
	jmp	.LBB131_4
.LBB131_5:                              # %if_fkappsconsole_mkc_dump_parseed_multiboot_l100_n5403___FAIL
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l127_n5521, 4(%esp)
	jmp	.LBB131_6
.LBB131_3:                              # %if_fkappsconsole_mkc_dump_parseed_multiboot_l110_n5453___FAIL
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l113_n5461, 4(%esp)
.LBB131_4:                              # %if_fkappsconsole_mkc_dump_parseed_multiboot_l110_n5453___DONE
	calll	Terminal$printl
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l115_n5466, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	gvar_fin_mu_lu_n20__mbinfo, %ecx
	movl	40(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$dumphexi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l117_n5476, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	gvar_fin_mu_lu_n20__mbinfo, %ecx
	movl	24(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l119_n5486, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	gvar_fin_mu_lu_n20__mbinfo, %ecx
	movl	28(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l121_n5496, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	gvar_fin_mu_lu_n20__mbinfo, %ecx
	movl	36(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l123_n5506, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	gvar_fin_mu_lu_n20__mbinfo, %ecx
	movl	32(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l125_n5516, 4(%esp)
.LBB131_6:                              # %if_fkappsconsole_mkc_dump_parseed_multiboot_l100_n5403___DONE
	calll	Terminal$printl
	addl	$28, %esp
	retl
.Ltmp376:
	.size	kc_dump_parseed_multiboot, .Ltmp376-kc_dump_parseed_multiboot
	.cfi_endproc

	.globl	kc_fault
	.align	16, 0x90
	.type	kc_fault,@function
kc_fault:                               # @kc_fault
	.cfi_startproc
# BB#0:
	pushl	%ebp
.Ltmp377:
	.cfi_def_cfa_offset 8
.Ltmp378:
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
.Ltmp379:
	.cfi_def_cfa_register %ebp
	pushl	%esi
	pushl	%eax
.Ltmp380:
	.cfi_offset %esi, -12
	movl	8(%ebp), %eax
	movl	%eax, -8(%ebp)
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_fault_l132_n5527, 4(%esp)
	calll	cstr$__eq__
	addl	$16, %esp
	testb	$1, %al
	je	.LBB132_2
# BB#1:                                 # %if_fkappsconsole_mkc_fault_l132_n5530___SUCC
	movl	%esp, %ecx
	leal	-16(%ecx), %eax
	movl	%eax, %esp
	xorl	%esi, %esi
	movl	$1, %eax
	xorl	%edx, %edx
	divl	%esi
	movl	%eax, -16(%ecx)
	jmp	.LBB132_7
.LBB132_2:                              # %if_fkappsconsole_mkc_fault_l132_n5530___FAIL
	movl	-8(%ebp), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_fault_l132_n5537, 4(%esp)
	calll	cstr$__eq__
	addl	$16, %esp
	testb	$1, %al
	je	.LBB132_4
# BB#3:                                 # %if_fkappsconsole_mkc_fault_l132_n5540___SUCC
	movb	$0, -559038737
	jmp	.LBB132_7
.LBB132_4:                              # %if_fkappsconsole_mkc_fault_l132_n5540___FAIL
	movl	-8(%ebp), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_fault_l132_n5551, 4(%esp)
	calll	cstr$__eq__
	addl	$16, %esp
	testb	$1, %al
	je	.LBB132_6
# BB#5:                                 # %if_fkappsconsole_mkc_fault_l132_n5554___SUCC
	movl	%esp, %eax
	leal	-16(%eax), %ecx
	movl	%ecx, %esp
	movb	-559038737, %cl
	movb	%cl, -16(%eax)
	jmp	.LBB132_7
.LBB132_6:                              # %if_fkappsconsole_mkc_fault_l132_n5554___FAIL
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_fault_l139_n5565, 4(%esp)
	calll	Terminal$printl
	addl	$16, %esp
.LBB132_7:                              # %if_fkappsconsole_mkc_fault_l132_n5530___DONE
	leal	-4(%ebp), %esp
	popl	%esi
	popl	%ebp
	retl
.Ltmp381:
	.size	kc_fault, .Ltmp381-kc_fault
	.cfi_endproc

	.globl	kc_echo
	.align	16, 0x90
	.type	kc_echo,@function
kc_echo:                                # @kc_echo
	.cfi_startproc
# BB#0:
	subl	$12, %esp
.Ltmp382:
	.cfi_def_cfa_offset 16
	movl	16(%esp), %eax
	movl	%eax, 8(%esp)
	movl	gvar_fin_mu_lu_n8__kterm, %ecx
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	calll	Terminal$printl
	addl	$12, %esp
	retl
.Ltmp383:
	.size	kc_echo, .Ltmp383-kc_echo
	.cfi_endproc

	.globl	kc_addhex
	.align	16, 0x90
	.type	kc_addhex,@function
kc_addhex:                              # @kc_addhex
	.cfi_startproc
# BB#0:
	pushl	%edi
.Ltmp384:
	.cfi_def_cfa_offset 8
	pushl	%esi
.Ltmp385:
	.cfi_def_cfa_offset 12
	subl	$20, %esp
.Ltmp386:
	.cfi_def_cfa_offset 32
.Ltmp387:
	.cfi_offset %esi, -12
.Ltmp388:
	.cfi_offset %edi, -8
	movl	32(%esp), %eax
	movl	%eax, 16(%esp)
	movl	gvar_fin_mu_lu_n8__kterm, %edi
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	calll	cstr$idxi
	movl	%eax, (%esp)
	calll	hex_char_to_num
	movl	%eax, %esi
	movl	16(%esp), %eax
	movl	%eax, (%esp)
	movl	$2, 4(%esp)
	calll	cstr$idxi
	movl	%eax, (%esp)
	calll	hex_char_to_num
	addl	%esi, %eax
	movl	%eax, 4(%esp)
	movl	%edi, (%esp)
	movl	$2, 8(%esp)
	calll	Terminal$dumphex
	addl	$20, %esp
	popl	%esi
	popl	%edi
	retl
.Ltmp389:
	.size	kc_addhex, .Ltmp389-kc_addhex
	.cfi_endproc

	.globl	kc_clear
	.align	16, 0x90
	.type	kc_clear,@function
kc_clear:                               # @kc_clear
	.cfi_startproc
# BB#0:
	subl	$12, %esp
.Ltmp390:
	.cfi_def_cfa_offset 16
	movl	16(%esp), %eax
	movl	%eax, 8(%esp)
	movl	gvar_fin_mu_lu_n20__mbinfo, %eax
	movb	20(%eax), %al
	testb	%al, %al
	jne	.LBB135_2
# BB#1:                                 # %if_fkappsconsole_mkc_clear_l152_n5594___SUCC
	movl	gvar_fgfxterm_mu_lu_n17__console_emulator, %eax
	movl	%eax, (%esp)
	calll	VGATextModeEmulator$clear
.LBB135_2:                              # %if_fkappsconsole_mkc_clear_l152_n5594___DONE
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	calll	Terminal$blank
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	$0, 12(%eax)
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	$-1, 16(%eax)
	addl	$12, %esp
	retl
.Ltmp391:
	.size	kc_clear, .Ltmp391-kc_clear
	.cfi_endproc

	.globl	kc_hexnum
	.align	16, 0x90
	.type	kc_hexnum,@function
kc_hexnum:                              # @kc_hexnum
	.cfi_startproc
# BB#0:
	pushl	%esi
.Ltmp392:
	.cfi_def_cfa_offset 8
	subl	$24, %esp
.Ltmp393:
	.cfi_def_cfa_offset 32
.Ltmp394:
	.cfi_offset %esi, -8
	movl	32(%esp), %eax
	movl	%eax, 20(%esp)
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_hexnum_l162_n5609, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	movl	20(%esp), %eax
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	calll	cstr$idxi
	movl	%eax, (%esp)
	calll	hex_char_to_num
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	Terminal$printi
	addl	$24, %esp
	popl	%esi
	retl
.Ltmp395:
	.size	kc_hexnum, .Ltmp395-kc_hexnum
	.cfi_endproc

	.globl	kc_shutdown
	.align	16, 0x90
	.type	kc_shutdown,@function
kc_shutdown:                            # @kc_shutdown
	.cfi_startproc
# BB#0:
	subl	$12, %esp
.Ltmp396:
	.cfi_def_cfa_offset 16
	movl	16(%esp), %eax
	movl	%eax, 8(%esp)
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_shutdown_l168_n5622, 4(%esp)
	calll	Terminal$print
	movl	$8192, 4(%esp)          # imm = 0x2000
	movl	$45060, (%esp)          # imm = 0xB004
	calll	__kwritepw
	addl	$12, %esp
	retl
.Ltmp397:
	.size	kc_shutdown, .Ltmp397-kc_shutdown
	.cfi_endproc

	.globl	kc_getpicticks
	.align	16, 0x90
	.type	kc_getpicticks,@function
kc_getpicticks:                         # @kc_getpicticks
	.cfi_startproc
# BB#0:
	pushl	%esi
.Ltmp398:
	.cfi_def_cfa_offset 8
	subl	$24, %esp
.Ltmp399:
	.cfi_def_cfa_offset 32
.Ltmp400:
	.cfi_offset %esi, -8
	movl	32(%esp), %eax
	movl	%eax, 20(%esp)
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_getpicticks_l173_n5632, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	gvar_firqio_mu_lu_n6__pic_ticks, %ecx
	movl	gvar_firqio_mu_lu_n6__pic_ticks+4, %edx
	movl	%edx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printlong
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_getpicticks_l175_n5640, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	movl	gvar_firqio_mu_lu_n6__pic_ticks, %eax
	movl	gvar_firqio_mu_lu_n6__pic_ticks+4, %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$0, 12(%esp)
	movl	$18, 8(%esp)
	calll	__divdi3
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	Terminal$printlong
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_getpicticks_l177_n5651, 4(%esp)
	calll	Terminal$print
	addl	$24, %esp
	popl	%esi
	retl
.Ltmp401:
	.size	kc_getpicticks, .Ltmp401-kc_getpicticks
	.cfi_endproc

	.globl	kc_picsleep
	.align	16, 0x90
	.type	kc_picsleep,@function
kc_picsleep:                            # @kc_picsleep
	.cfi_startproc
# BB#0:
	pushl	%ebp
.Ltmp402:
	.cfi_def_cfa_offset 8
.Ltmp403:
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
.Ltmp404:
	.cfi_def_cfa_register %ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$12, %esp
.Ltmp405:
	.cfi_offset %esi, -20
.Ltmp406:
	.cfi_offset %edi, -16
.Ltmp407:
	.cfi_offset %ebx, -12
	movl	8(%ebp), %eax
	movl	%eax, -16(%ebp)
	subl	$16, %esp
	movl	%eax, (%esp)
	calll	cstr$len
	addl	$16, %esp
	cmpl	$1, %eax
	je	.LBB139_2
# BB#1:                                 # %if_fkappsconsole_mkc_picsleep_l181_n5659___SUCC
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_picsleep_l182_n5662, 4(%esp)
	calll	Terminal$printl
	jmp	.LBB139_9
.LBB139_2:                              # %if_fkappsconsole_mkc_picsleep_l181_n5659___DONE
	movl	%esp, %ebx
	leal	-16(%ebx), %esi
	movl	%esi, %esp
	movl	gvar_firqio_mu_lu_n6__pic_ticks, %eax
	movl	gvar_firqio_mu_lu_n6__pic_ticks+4, %ecx
	movl	%ecx, -12(%ebx)
	movl	%eax, -16(%ebx)
	movl	%esp, %eax
	movl	%eax, -20(%ebp)         # 4-byte Spill
	leal	-16(%eax), %edi
	movl	%edi, %esp
	movl	-16(%ebp), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	calll	cstr$idxi
	addl	$16, %esp
	subl	$16, %esp
	movl	%eax, (%esp)
	calll	hex_char_to_num
	addl	$16, %esp
	movl	-20(%ebp), %ecx         # 4-byte Reload
	movl	%eax, -16(%ecx)
	subl	$16, %esp
	movl	$.Lstrglobal_fkappsconsole_mkc_picsleep_l187_n5675, (%esp)
	calll	kc_getpicticks
	addl	$16, %esp
	movl	gvar_firqio_mu_lu_n6__pic_ticks+4, %ecx
	movl	gvar_firqio_mu_lu_n6__pic_ticks, %eax
	subl	-16(%ebx), %eax
	sbbl	-12(%ebx), %ecx
	movl	-20(%ebp), %edx         # 4-byte Reload
	imull	$19, -16(%edx), %edx
	cmpl	%edx, %eax
	setae	%al
	testl	%ecx, %ecx
	setns	%cl
	je	.LBB139_4
# BB#3:                                 # %if_fkappsconsole_mkc_picsleep_l181_n5659___DONE
	movb	%cl, %al
.LBB139_4:                              # %if_fkappsconsole_mkc_picsleep_l181_n5659___DONE
	testb	%al, %al
	jne	.LBB139_8
	.align	16, 0x90
.LBB139_5:                              # %fkappsconsole_mkc_picsleep_l188_n5678___LOOP___HEAD
                                        # =>This Inner Loop Header: Depth=1
	movl	gvar_firqio_mu_lu_n6__pic_ticks+4, %ecx
	movl	gvar_firqio_mu_lu_n6__pic_ticks, %eax
	subl	(%esi), %eax
	sbbl	4(%esi), %ecx
	imull	$19, (%edi), %edx
	cmpl	%edx, %eax
	setb	%al
	testl	%ecx, %ecx
	sets	%cl
	je	.LBB139_7
# BB#6:                                 # %fkappsconsole_mkc_picsleep_l188_n5678___LOOP___HEAD
                                        #   in Loop: Header=BB139_5 Depth=1
	movb	%cl, %al
.LBB139_7:                              # %fkappsconsole_mkc_picsleep_l188_n5678___LOOP___HEAD
                                        #   in Loop: Header=BB139_5 Depth=1
	testb	%al, %al
	jne	.LBB139_5
.LBB139_8:                              # %fkappsconsole_mkc_picsleep_l188_n5678___LOOP___END
	subl	$16, %esp
	movl	$.Lstrglobal_fkappsconsole_mkc_picsleep_l191_n5698, (%esp)
	calll	kc_getpicticks
.LBB139_9:                              # %fkappsconsole_mkc_picsleep_l188_n5678___LOOP___END
	leal	-12(%ebp), %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
.Ltmp408:
	.size	kc_picsleep, .Ltmp408-kc_picsleep
	.cfi_endproc

	.globl	kc_color
	.align	16, 0x90
	.type	kc_color,@function
kc_color:                               # @kc_color
	.cfi_startproc
# BB#0:
	pushl	%edi
.Ltmp409:
	.cfi_def_cfa_offset 8
	pushl	%esi
.Ltmp410:
	.cfi_def_cfa_offset 12
	subl	$20, %esp
.Ltmp411:
	.cfi_def_cfa_offset 32
.Ltmp412:
	.cfi_offset %esi, -12
.Ltmp413:
	.cfi_offset %edi, -8
	movl	32(%esp), %eax
	movl	%eax, 16(%esp)
	movl	%eax, (%esp)
	calll	cstr$len
	cmpl	$2, %eax
	jne	.LBB140_2
# BB#1:                                 # %if_fkappsconsole_mkc_color_l195_n5706___SUCC
	movl	gvar_fin_mu_lu_n8__kterm, %edi
	movl	16(%esp), %eax
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	calll	cstr$idxi
	movl	%eax, (%esp)
	calll	hex_char_to_num
	movl	%eax, %esi
	shll	$4, %esi
	movl	16(%esp), %eax
	movl	%eax, (%esp)
	movl	$1, 4(%esp)
	calll	cstr$idxi
	movl	%eax, (%esp)
	calll	hex_char_to_num
	addl	%esi, %eax
	movb	%al, 20(%edi)
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_color_l197_n5725, 4(%esp)
	calll	Terminal$print
	jmp	.LBB140_3
.LBB140_2:                              # %if_fkappsconsole_mkc_color_l195_n5706___FAIL
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movb	$15, 20(%eax)
.LBB140_3:                              # %if_fkappsconsole_mkc_color_l195_n5706___DONE
	addl	$20, %esp
	popl	%esi
	popl	%edi
	retl
.Ltmp414:
	.size	kc_color, .Ltmp414-kc_color
	.cfi_endproc

	.globl	kc_colorama
	.align	16, 0x90
	.type	kc_colorama,@function
kc_colorama:                            # @kc_colorama
	.cfi_startproc
# BB#0:
	pushl	%ebx
.Ltmp415:
	.cfi_def_cfa_offset 8
	subl	$24, %esp
.Ltmp416:
	.cfi_def_cfa_offset 32
.Ltmp417:
	.cfi_offset %ebx, -8
	movl	32(%esp), %eax
	movl	%eax, 20(%esp)
	movl	$0, 16(%esp)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB141_5
# BB#1:
	xorl	%ebx, %ebx
	.align	16, 0x90
.LBB141_2:                              # %fkappsconsole_mkc_colorama_l206_n5736___LOOP___HEAD
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB141_3 Depth 2
	movl	$0, 12(%esp)
	testb	%bl, %bl
	jne	.LBB141_4
	.align	16, 0x90
.LBB141_3:                              # %fkappsconsole_mkc_colorama_l208_n5741___LOOP___HEAD
                                        #   Parent Loop BB141_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	16(%esp), %ecx
	shll	$4, %ecx
	addl	12(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_colorama_l209_n5752, 8(%esp)
	calll	Terminal$printa
	movl	12(%esp), %eax
	incl	%eax
	movl	%eax, 12(%esp)
	cmpl	$16, %eax
	jl	.LBB141_3
.LBB141_4:                              # %fkappsconsole_mkc_colorama_l208_n5741___LOOP___END
                                        #   in Loop: Header=BB141_2 Depth=1
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_colorama_l212_n5763, 4(%esp)
	calll	Terminal$print
	movl	16(%esp), %eax
	incl	%eax
	movl	%eax, 16(%esp)
	cmpl	$16, %eax
	jl	.LBB141_2
.LBB141_5:                              # %fkappsconsole_mkc_colorama_l206_n5736___LOOP___END
	addl	$24, %esp
	popl	%ebx
	retl
.Ltmp418:
	.size	kc_colorama, .Ltmp418-kc_colorama
	.cfi_endproc

	.globl	kc_snowcrash_code
	.align	16, 0x90
	.type	kc_snowcrash_code,@function
kc_snowcrash_code:                      # @kc_snowcrash_code
	.cfi_startproc
# BB#0:
	pushl	%ebx
.Ltmp419:
	.cfi_def_cfa_offset 8
	pushl	%esi
.Ltmp420:
	.cfi_def_cfa_offset 12
	subl	$20, %esp
.Ltmp421:
	.cfi_def_cfa_offset 32
.Ltmp422:
	.cfi_offset %esi, -12
.Ltmp423:
	.cfi_offset %ebx, -8
	movl	32(%esp), %eax
	movl	%eax, 16(%esp)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB142_5
# BB#1:
	movb	$1, %bl
	.align	16, 0x90
.LBB142_2:                              # %fkappsconsole_mkc_snowcrash_code_l219_n5774___LOOP___HEAD
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB142_3 Depth 2
	movl	$0, 12(%esp)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB142_4
	.align	16, 0x90
.LBB142_3:                              # %fkappsconsole_mkc_snowcrash_code_l221_n5779___LOOP___HEAD
                                        #   Parent Loop BB142_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	gvar_fin_mu_lu_n9__base_vma, %eax
	addl	12(%esp), %eax
	movl	gvar_fin_mu_lu_n20__mbinfo, %ecx
	movl	28(%ecx), %edx
	movl	44(%ecx), %esi
	imull	32(%ecx), %edx
	movl	%edx, 8(%esp)
	movl	%esi, 4(%esp)
	movl	%eax, (%esp)
	calll	memcpy
	movl	12(%esp), %eax
	addl	$20, %eax
	movl	%eax, 12(%esp)
	cmpl	$3145728, %eax          # imm = 0x300000
	jl	.LBB142_3
.LBB142_4:                              # %fkappsconsole_mkc_snowcrash_code_l221_n5779___LOOP___END
                                        #   in Loop: Header=BB142_2 Depth=1
	testb	%bl, %bl
	jne	.LBB142_2
.LBB142_5:                              # %fkappsconsole_mkc_snowcrash_code_l219_n5774___LOOP___END
	addl	$20, %esp
	popl	%esi
	popl	%ebx
	retl
.Ltmp424:
	.size	kc_snowcrash_code, .Ltmp424-kc_snowcrash_code
	.cfi_endproc

	.globl	kc_drawstuff
	.align	16, 0x90
	.type	kc_drawstuff,@function
kc_drawstuff:                           # @kc_drawstuff
	.cfi_startproc
# BB#0:
	pushl	%esi
.Ltmp425:
	.cfi_def_cfa_offset 8
	subl	$56, %esp
.Ltmp426:
	.cfi_def_cfa_offset 64
.Ltmp427:
	.cfi_offset %esi, -8
	movl	64(%esp), %eax
	movl	%eax, 52(%esp)
	movl	gvar_fin_mu_lu_n20__mbinfo, %eax
	movl	%eax, (%esp)
	calll	Framebuffer$$from_mbinfo
	movl	%eax, 48(%esp)
	movl	%eax, (%esp)
	movl	$64, 12(%esp)
	movl	$64, 8(%esp)
	movl	$64, 4(%esp)
	calll	Framebuffer$fill
	movl	48(%esp), %eax
	movl	%eax, (%esp)
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	$255, 12(%esp)
	movl	$10, 8(%esp)
	movl	$10, 4(%esp)
	calll	Framebuffer$setpx
	movl	48(%esp), %eax
	movl	%eax, (%esp)
	movl	$128, 28(%esp)
	movl	$255, 24(%esp)
	movl	$0, 20(%esp)
	movl	$25, 16(%esp)
	movl	$35, 12(%esp)
	movl	$40, 8(%esp)
	movl	$20, 4(%esp)
	calll	Framebuffer$fillrect
	movl	48(%esp), %eax
	movl	%eax, (%esp)
	movl	$128, 28(%esp)
	movl	$255, 24(%esp)
	movl	$255, 20(%esp)
	movl	$25, 16(%esp)
	movl	$35, 12(%esp)
	movl	$45, 8(%esp)
	movl	$25, 4(%esp)
	calll	Framebuffer$fillrect
	movl	48(%esp), %esi
	movl	$.Lstrglobal_fkappsconsole_mkc_drawstuff_l236_n5849, (%esp)
	calll	cstr$ord
	movl	%eax, 16(%esp)
	movl	%esi, (%esp)
	movl	$255, 28(%esp)
	movl	$0, 24(%esp)
	movl	$0, 20(%esp)
	movl	$8, 12(%esp)
	movl	$20, 8(%esp)
	movl	$40, 4(%esp)
	calll	Framebuffer$drawchar
	movl	$50, 44(%esp)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB143_2
	.align	16, 0x90
.LBB143_1:                              # %fkappsconsole_mkc_drawstuff_l239_n5857___LOOP___HEAD
                                        # =>This Inner Loop Header: Depth=1
	movl	48(%esp), %eax
	movl	44(%esp), %ecx
	leal	50(%ecx), %edx
	movl	%edx, 12(%esp)
	movl	%ecx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	calll	Framebuffer$setpx
	movl	48(%esp), %eax
	movl	44(%esp), %ecx
	movl	$200, %edx
	subl	%ecx, %edx
	leal	50(%ecx), %esi
	movl	%esi, 16(%esp)
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	movl	$0, 20(%esp)
	movl	$0, 12(%esp)
	calll	Framebuffer$setpx
	movl	44(%esp), %eax
	incl	%eax
	movl	%eax, 44(%esp)
	cmpl	$200, %eax
	jl	.LBB143_1
.LBB143_2:                              # %fkappsconsole_mkc_drawstuff_l239_n5857___LOOP___END
	addl	$56, %esp
	popl	%esi
	retl
.Ltmp428:
	.size	kc_drawstuff, .Ltmp428-kc_drawstuff
	.cfi_endproc

	.globl	kc_drawcolors
	.align	16, 0x90
	.type	kc_drawcolors,@function
kc_drawcolors:                          # @kc_drawcolors
	.cfi_startproc
# BB#0:
	pushl	%ebx
.Ltmp429:
	.cfi_def_cfa_offset 8
	pushl	%esi
.Ltmp430:
	.cfi_def_cfa_offset 12
	subl	$52, %esp
.Ltmp431:
	.cfi_def_cfa_offset 64
.Ltmp432:
	.cfi_offset %esi, -12
.Ltmp433:
	.cfi_offset %ebx, -8
	movl	64(%esp), %eax
	movl	%eax, 48(%esp)
	movl	gvar_fin_mu_lu_n20__mbinfo, %eax
	movl	%eax, (%esp)
	calll	Framebuffer$$from_mbinfo
	movl	%eax, 44(%esp)
	movl	$0, 40(%esp)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB144_10
# BB#1:
	xorl	%ebx, %ebx
	.align	16, 0x90
.LBB144_2:                              # %fkappsconsole_mkc_drawcolors_l252_n5897___LOOP___HEAD
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB144_3 Depth 2
                                        #       Child Loop BB144_4 Depth 3
                                        #         Child Loop BB144_6 Depth 4
	movl	$0, 36(%esp)
	testb	%bl, %bl
	jne	.LBB144_9
	.align	16, 0x90
.LBB144_3:                              # %fkappsconsole_mkc_drawcolors_l254_n5902___LOOP___HEAD
                                        #   Parent Loop BB144_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB144_4 Depth 3
                                        #         Child Loop BB144_6 Depth 4
	movl	$0, 32(%esp)
	testb	%bl, %bl
	jne	.LBB144_8
	.align	16, 0x90
.LBB144_4:                              # %fkappsconsole_mkc_drawcolors_l256_n5907___LOOP___HEAD
                                        #   Parent Loop BB144_2 Depth=1
                                        #     Parent Loop BB144_3 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB144_6 Depth 4
	movl	44(%esp), %eax
	movl	40(%esp), %ecx
	movl	36(%esp), %edx
	movl	32(%esp), %esi
	movl	%esi, 12(%esp)
	movl	%edx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Framebuffer$fill
	movl	gvar_firqio_mu_lu_n6__pic_ticks, %eax
	movl	gvar_firqio_mu_lu_n6__pic_ticks+4, %ecx
	movl	%ecx, 28(%esp)
	movl	%eax, 24(%esp)
	xorl	gvar_firqio_mu_lu_n6__pic_ticks+4, %ecx
	xorl	gvar_firqio_mu_lu_n6__pic_ticks, %eax
	jmp	.LBB144_6
	.align	16, 0x90
.LBB144_5:                              # %fkappsconsole_mkc_drawcolors_l259_n5917___LOOP___HEAD
                                        #   in Loop: Header=BB144_6 Depth=4
	movl	gvar_firqio_mu_lu_n6__pic_ticks, %eax
	movl	gvar_firqio_mu_lu_n6__pic_ticks+4, %ecx
	xorl	28(%esp), %ecx
	xorl	24(%esp), %eax
.LBB144_6:                              # %fkappsconsole_mkc_drawcolors_l259_n5917___LOOP___HEAD
                                        #   Parent Loop BB144_2 Depth=1
                                        #     Parent Loop BB144_3 Depth=2
                                        #       Parent Loop BB144_4 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	orl	%ecx, %eax
	je	.LBB144_5
# BB#7:                                 # %fkappsconsole_mkc_drawcolors_l259_n5917___LOOP___END
                                        #   in Loop: Header=BB144_4 Depth=3
	movl	32(%esp), %eax
	addl	$64, %eax
	movl	%eax, 32(%esp)
	cmpl	$257, %eax              # imm = 0x101
	jl	.LBB144_4
.LBB144_8:                              # %fkappsconsole_mkc_drawcolors_l256_n5907___LOOP___END
                                        #   in Loop: Header=BB144_3 Depth=2
	movl	36(%esp), %eax
	addl	$64, %eax
	movl	%eax, 36(%esp)
	cmpl	$257, %eax              # imm = 0x101
	jl	.LBB144_3
.LBB144_9:                              # %fkappsconsole_mkc_drawcolors_l254_n5902___LOOP___END
                                        #   in Loop: Header=BB144_2 Depth=1
	movl	40(%esp), %eax
	addl	$64, %eax
	movl	%eax, 40(%esp)
	cmpl	$257, %eax              # imm = 0x101
	jl	.LBB144_2
.LBB144_10:                             # %fkappsconsole_mkc_drawcolors_l252_n5897___LOOP___END
	addl	$52, %esp
	popl	%esi
	popl	%ebx
	retl
.Ltmp434:
	.size	kc_drawcolors, .Ltmp434-kc_drawcolors
	.cfi_endproc

	.globl	add_cmd
	.align	16, 0x90
	.type	add_cmd,@function
add_cmd:                                # @add_cmd
	.cfi_startproc
# BB#0:
	pushl	%esi
.Ltmp435:
	.cfi_def_cfa_offset 8
	subl	$40, %esp
.Ltmp436:
	.cfi_def_cfa_offset 48
.Ltmp437:
	.cfi_offset %esi, -8
	movl	56(%esp), %eax
	movl	52(%esp), %ecx
	movl	48(%esp), %edx
	movl	%edx, 36(%esp)
	movl	%ecx, 32(%esp)
	movl	%eax, 28(%esp)
	movl	gvar_fkappsconsole_mu_lu_n16__kcommand_head, %eax
	jmp	.LBB145_2
	.align	16, 0x90
.LBB145_1:                              # %fkappsconsole_madd_cmd_l272_n5948___LOOP___HEAD
                                        #   in Loop: Header=BB145_2 Depth=1
	movl	24(%esp), %eax
	movl	12(%eax), %eax
.LBB145_2:                              # %fkappsconsole_madd_cmd_l272_n5948___LOOP___HEAD
                                        # =>This Inner Loop Header: Depth=1
	movl	%eax, 24(%esp)
	cmpl	$0, 12(%eax)
	jne	.LBB145_1
# BB#3:                                 # %fkappsconsole_madd_cmd_l272_n5948___LOOP___END
	movl	24(%esp), %esi
	movl	36(%esp), %eax
	movl	32(%esp), %ecx
	movl	28(%esp), %edx
	movl	%edx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	KConsoleCommand$$new
	movl	%eax, 12(%esi)
	addl	$40, %esp
	popl	%esi
	retl
.Ltmp438:
	.size	add_cmd, .Ltmp438-add_cmd
	.cfi_endproc

	.globl	kconsole_run
	.align	16, 0x90
	.type	kconsole_run,@function
kconsole_run:                           # @kconsole_run
	.cfi_startproc
# BB#0:
	pushl	%ebx
.Ltmp439:
	.cfi_def_cfa_offset 8
	subl	$24, %esp
.Ltmp440:
	.cfi_def_cfa_offset 32
.Ltmp441:
	.cfi_offset %ebx, -8
	movl	$kc_help, 8(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l283_n5978, 4(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l283_n5975, (%esp)
	calll	KConsoleCommand$$new
	movl	%eax, gvar_fkappsconsole_mu_lu_n16__kcommand_head
	movl	$kc_dumpargs, 8(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l284_n5988, 4(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l284_n5985, (%esp)
	calll	add_cmd
	movl	$kc_mem, 8(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l285_n5998, 4(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l285_n5995, (%esp)
	calll	add_cmd
	movl	$kc_fault, 8(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l286_n6008, 4(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l286_n6005, (%esp)
	calll	add_cmd
	movl	$kc_echo, 8(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l287_n6018, 4(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l287_n6015, (%esp)
	calll	add_cmd
	movl	$kc_addhex, 8(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l288_n6028, 4(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l288_n6025, (%esp)
	calll	add_cmd
	movl	$kc_clear, 8(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l289_n6038, 4(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l289_n6035, (%esp)
	calll	add_cmd
	movl	$kc_hexnum, 8(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l290_n6048, 4(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l290_n6045, (%esp)
	calll	add_cmd
	movl	$kc_dump_multiboot, 8(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l291_n6058, 4(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l291_n6055, (%esp)
	calll	add_cmd
	movl	$kc_dump_parseed_multiboot, 8(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l292_n6068, 4(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l292_n6065, (%esp)
	calll	add_cmd
	movl	$kc_getpicticks, 8(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l293_n6078, 4(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l293_n6075, (%esp)
	calll	add_cmd
	movl	$kc_picsleep, 8(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l294_n6088, 4(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l294_n6085, (%esp)
	calll	add_cmd
	movl	$kc_shutdown, 8(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l295_n6098, 4(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l295_n6095, (%esp)
	calll	add_cmd
	movl	$kc_color, 8(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l296_n6108, 4(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l296_n6105, (%esp)
	calll	add_cmd
	movl	$kc_colorama, 8(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l297_n6118, 4(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l297_n6115, (%esp)
	calll	add_cmd
	movl	$kc_snowcrash_code, 8(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l298_n6128, 4(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l298_n6125, (%esp)
	calll	add_cmd
	movl	$kc_drawstuff, 8(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l299_n6138, 4(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l299_n6135, (%esp)
	calll	add_cmd
	movl	$kc_drawcolors, 8(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l300_n6148, 4(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l300_n6145, (%esp)
	calll	add_cmd
	movl	$rc_mtest, 8(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l301_n6158, 4(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l301_n6155, (%esp)
	calll	add_cmd
	movl	$rc_run, 8(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l302_n6168, 4(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l302_n6165, (%esp)
	calll	add_cmd
	movl	$kc_draw_bmp, 8(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l303_n6178, 4(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l303_n6175, (%esp)
	calll	add_cmd
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, 4(%esp)
	movl	$console_submit, 8(%esp)
	movl	$1024, (%esp)           # imm = 0x400
	calll	KeyboardBuf$$new
	movl	%eax, gvar_fkappsconsole_mu_lu_n13__console_buf
	movl	$0, gvar_fkappsconsole_mu_lu_n14__command_to_run
	movl	gvar_firqio_mu_lu_n5__system_kbdstate, %eax
	movl	%eax, (%esp)
	movl	$consolehandler, 4(%esp)
	calll	KeyboardState$set_handler
	calll	console_disp_line
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB146_5
# BB#1:
	movb	$1, %bl
	.align	16, 0x90
.LBB146_2:                              # %fkappsconsole_mkconsole_run_l309_n6198___LOOP___HEAD
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, gvar_fkappsconsole_mu_lu_n14__command_to_run
	je	.LBB146_4
# BB#3:                                 # %if_fkappsconsole_mkconsole_run_l310_n6206___SUCC
                                        #   in Loop: Header=BB146_2 Depth=1
	movl	gvar_fkappsconsole_mu_lu_n14__command_to_run, %eax
	movl	gvar_fkappsconsole_mu_lu_n15__command_args, %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	KConsoleCommand$run
	movl	gvar_firqio_mu_lu_n5__system_kbdstate, %eax
	movl	%eax, (%esp)
	movl	$consolehandler, 4(%esp)
	calll	KeyboardState$set_handler
	calll	console_disp_line
	movl	$0, gvar_fkappsconsole_mu_lu_n14__command_to_run
.LBB146_4:                              # %if_fkappsconsole_mkconsole_run_l310_n6206___DONE
                                        #   in Loop: Header=BB146_2 Depth=1
	testb	%bl, %bl
	jne	.LBB146_2
.LBB146_5:                              # %fkappsconsole_mkconsole_run_l309_n6198___LOOP___END
	addl	$24, %esp
	popl	%ebx
	retl
.Ltmp442:
	.size	kconsole_run, .Ltmp442-kconsole_run
	.cfi_endproc

	.globl	test_svga
	.align	16, 0x90
	.type	test_svga,@function
test_svga:                              # @test_svga
	.cfi_startproc
# BB#0:
	pushl	%esi
.Ltmp443:
	.cfi_def_cfa_offset 8
	subl	$40, %esp
.Ltmp444:
	.cfi_def_cfa_offset 48
.Ltmp445:
	.cfi_offset %esi, -8
	movl	gvar_fin_mu_lu_n20__mbinfo, %eax
	movl	%eax, (%esp)
	calll	Framebuffer$$from_mbinfo
	movl	%eax, 36(%esp)
	movl	%eax, (%esp)
	movl	$64, 12(%esp)
	movl	$64, 8(%esp)
	movl	$64, 4(%esp)
	calll	Framebuffer$fill
	movl	36(%esp), %eax
	movl	%eax, (%esp)
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	$255, 12(%esp)
	movl	$10, 8(%esp)
	movl	$10, 4(%esp)
	calll	Framebuffer$setpx
	movl	36(%esp), %eax
	movl	%eax, (%esp)
	movl	$128, 28(%esp)
	movl	$255, 24(%esp)
	movl	$0, 20(%esp)
	movl	$25, 16(%esp)
	movl	$35, 12(%esp)
	movl	$40, 8(%esp)
	movl	$20, 4(%esp)
	calll	Framebuffer$fillrect
	movl	36(%esp), %esi
	movl	$.Lstrglobal_fvgatest_mtest_svga_l7_n6252, (%esp)
	calll	cstr$ord
	movl	%eax, 16(%esp)
	movl	%esi, (%esp)
	movl	$255, 28(%esp)
	movl	$0, 24(%esp)
	movl	$0, 20(%esp)
	movl	$8, 12(%esp)
	movl	$20, 8(%esp)
	movl	$40, 4(%esp)
	calll	Framebuffer$drawchar
	calll	__khalt
	addl	$40, %esp
	popl	%esi
	retl
.Ltmp446:
	.size	test_svga, .Ltmp446-test_svga
	.cfi_endproc

	.globl	VGABox$__eq__
	.align	16, 0x90
	.type	VGABox$__eq__,@function
VGABox$__eq__:                          # @"VGABox$__eq__"
	.cfi_startproc
# BB#0:
	subl	$8, %esp
.Ltmp447:
	.cfi_def_cfa_offset 12
	movl	16(%esp), %eax
	movl	12(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	4(%esp), %ecx
	movzbl	(%eax), %eax
	movzbl	(%ecx), %ecx
	cmpl	%eax, %ecx
	jne	.LBB148_3
# BB#1:                                 # %if_fgfxterm_mVGABox$__eq___l9_n6269___FAIL
	movl	4(%esp), %eax
	movl	(%esp), %ecx
	movzbl	1(%ecx), %ecx
	movzbl	1(%eax), %eax
	cmpl	%ecx, %eax
	je	.LBB148_2
.LBB148_3:                              # %if_fgfxterm_mVGABox$__eq___l9_n6269___SUCC
	xorl	%eax, %eax
	addl	$8, %esp
	retl
.LBB148_2:                              # %if_fgfxterm_mVGABox$__eq___l9_n6269___DONE
	movb	$1, %al
	addl	$8, %esp
	retl
.Ltmp448:
	.size	VGABox$__eq__, .Ltmp448-VGABox$__eq__
	.cfi_endproc

	.globl	VGABox$__ne__
	.align	16, 0x90
	.type	VGABox$__ne__,@function
VGABox$__ne__:                          # @"VGABox$__ne__"
	.cfi_startproc
# BB#0:
	subl	$8, %esp
.Ltmp449:
	.cfi_def_cfa_offset 12
	movl	16(%esp), %eax
	movl	12(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	4(%esp), %ecx
	movzbl	(%eax), %eax
	movzbl	(%ecx), %ecx
	cmpl	%eax, %ecx
	jne	.LBB149_3
# BB#1:                                 # %if_fgfxterm_mVGABox$__ne___l17_n6293___SUCC
	movl	4(%esp), %eax
	movl	(%esp), %ecx
	movzbl	1(%ecx), %ecx
	movzbl	1(%eax), %eax
	cmpl	%ecx, %eax
	jne	.LBB149_3
# BB#2:                                 # %if_fgfxterm_mVGABox$__ne___l18_n6301___SUCC
	xorl	%eax, %eax
	addl	$8, %esp
	retl
.LBB149_3:                              # %if_fgfxterm_mVGABox$__ne___l17_n6293___DONE
	movb	$1, %al
	addl	$8, %esp
	retl
.Ltmp450:
	.size	VGABox$__ne__, .Ltmp450-VGABox$__ne__
	.cfi_endproc

	.globl	VGATextModeEmulator$$new
	.align	16, 0x90
	.type	VGATextModeEmulator$$new,@function
VGATextModeEmulator$$new:               # @"VGATextModeEmulator$$new"
	.cfi_startproc
# BB#0:
	pushl	%esi
.Ltmp451:
	.cfi_def_cfa_offset 8
	subl	$24, %esp
.Ltmp452:
	.cfi_def_cfa_offset 32
.Ltmp453:
	.cfi_offset %esi, -8
	movl	32(%esp), %eax
	movl	%eax, 20(%esp)
	movl	$40, (%esp)
	calll	malloc
	movl	%eax, 16(%esp)
	movl	$8, 24(%eax)
	movl	16(%esp), %ecx
	movl	20(%esp), %eax
	movl	4(%eax), %eax
	cltd
	idivl	24(%ecx)
	movl	%eax, 16(%ecx)
	movl	16(%esp), %ecx
	movl	20(%esp), %eax
	movl	8(%eax), %eax
	cltd
	idivl	24(%ecx)
	movl	%eax, 20(%ecx)
	movl	16(%esp), %eax
	movl	20(%eax), %ecx
	incl	%ecx
	imull	16(%eax), %ecx
	addl	%ecx, %ecx
	movl	%ecx, 12(%esp)
	movl	16(%esp), %eax
	movl	%ecx, 8(%eax)
	movl	16(%esp), %esi
	movl	12(%esp), %eax
	movl	%eax, (%esp)
	calll	malloc
	movl	%eax, (%esi)
	movl	16(%esp), %esi
	movl	12(%esp), %eax
	movl	%eax, (%esp)
	calll	malloc
	movl	%eax, 4(%esi)
	movl	16(%esp), %eax
	movl	(%eax), %eax
	movl	12(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$0, 8(%esp)
	calll	memset
	movl	16(%esp), %eax
	movl	4(%eax), %eax
	movl	12(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$0, 8(%esp)
	calll	memset
	movl	16(%esp), %eax
	movl	20(%esp), %ecx
	movl	%ecx, 12(%eax)
	movl	16(%esp), %eax
	addl	$24, %esp
	popl	%esi
	retl
.Ltmp454:
	.size	VGATextModeEmulator$$new, .Ltmp454-VGATextModeEmulator$$new
	.cfi_endproc

	.globl	VGATextModeEmulator$clear
	.align	16, 0x90
	.type	VGATextModeEmulator$clear,@function
VGATextModeEmulator$clear:              # @"VGATextModeEmulator$clear"
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp455:
	.cfi_def_cfa_offset 32
	movl	32(%esp), %eax
	movl	%eax, 24(%esp)
	movl	12(%eax), %eax
	movl	%eax, (%esp)
	movl	$0, 12(%esp)
	movl	$0, 8(%esp)
	movl	$0, 4(%esp)
	calll	Framebuffer$fill
	addl	$28, %esp
	retl
.Ltmp456:
	.size	VGATextModeEmulator$clear, .Ltmp456-VGATextModeEmulator$clear
	.cfi_endproc

	.globl	VGATextModeEmulator$update
	.align	16, 0x90
	.type	VGATextModeEmulator$update,@function
VGATextModeEmulator$update:             # @"VGATextModeEmulator$update"
	.cfi_startproc
# BB#0:
	pushl	%ebp
.Ltmp457:
	.cfi_def_cfa_offset 8
	pushl	%ebx
.Ltmp458:
	.cfi_def_cfa_offset 12
	pushl	%edi
.Ltmp459:
	.cfi_def_cfa_offset 16
	pushl	%esi
.Ltmp460:
	.cfi_def_cfa_offset 20
	subl	$76, %esp
.Ltmp461:
	.cfi_def_cfa_offset 96
.Ltmp462:
	.cfi_offset %esi, -20
.Ltmp463:
	.cfi_offset %edi, -16
.Ltmp464:
	.cfi_offset %ebx, -12
.Ltmp465:
	.cfi_offset %ebp, -8
	movl	96(%esp), %eax
	movl	%eax, 72(%esp)
	movl	$0, 68(%esp)
	calll	get_colors
	movl	%eax, 56(%esp)
	movl	68(%esp), %eax
	jmp	.LBB152_1
	.align	16, 0x90
.LBB152_6:                              # %fgfxterm_mVGATextModeEmulator$update_l62_n6404___LOOP___END
                                        #   in Loop: Header=BB152_1 Depth=1
	movl	68(%esp), %eax
	incl	%eax
	movl	%eax, 68(%esp)
.LBB152_1:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB152_3 Depth 2
	movl	72(%esp), %ecx
	cmpl	20(%ecx), %eax
	jge	.LBB152_7
# BB#2:                                 # %fgfxterm_mVGATextModeEmulator$update_l60_n6397___LOOP___HEAD
                                        #   in Loop: Header=BB152_1 Depth=1
	movl	$0, 64(%esp)
	movl	72(%esp), %eax
	cmpl	$0, 16(%eax)
	jle	.LBB152_6
	.align	16, 0x90
.LBB152_3:                              # %fgfxterm_mVGATextModeEmulator$update_l62_n6404___LOOP___HEAD
                                        #   Parent Loop BB152_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	72(%esp), %eax
	movl	16(%eax), %eax
	imull	68(%esp), %eax
	movl	64(%esp), %ecx
	addl	%ecx, %ecx
	leal	(%ecx,%eax,2), %eax
	movl	%eax, 60(%esp)
	movl	72(%esp), %ecx
	movl	(%ecx), %ecx
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	calll	ptr$offset
	movl	%eax, %esi
	movl	72(%esp), %eax
	movl	4(%eax), %eax
	movl	60(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	ptr$offset
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	VGABox$__ne__
	testb	$1, %al
	je	.LBB152_5
# BB#4:                                 # %if_fgfxterm_mVGATextModeEmulator$update_l64_n6434___SUCC
                                        #   in Loop: Header=BB152_3 Depth=2
	movl	72(%esp), %eax
	movl	(%eax), %eax
	movl	60(%esp), %ecx
	movzbl	(%eax,%ecx), %eax
	movl	%eax, 52(%esp)
	movl	72(%esp), %eax
	movl	(%eax), %eax
	movl	60(%esp), %ecx
	movzbl	1(%ecx,%eax), %eax
	shrl	$4, %eax
	leal	(%eax,%eax,2), %eax
	movl	%eax, 48(%esp)
	movl	72(%esp), %eax
	movl	(%eax), %eax
	movl	60(%esp), %ecx
	movzbl	1(%ecx,%eax), %eax
	andl	$15, %eax
	leal	(%eax,%eax,2), %eax
	movl	%eax, 44(%esp)
	movl	72(%esp), %eax
	movl	12(%eax), %ecx
	movl	24(%eax), %eax
	movl	64(%esp), %edx
	imull	%eax, %edx
	movl	56(%esp), %esi
	movl	48(%esp), %edi
	movzbl	(%esi,%edi), %ebx
	movzbl	1(%esi,%edi), %ebp
	movzbl	2(%esi,%edi), %esi
	movl	68(%esp), %edi
	imull	%eax, %edi
	movl	%esi, 28(%esp)
	movl	%ebp, 24(%esp)
	movl	%ebx, 20(%esp)
	movl	%eax, 16(%esp)
	movl	%eax, 12(%esp)
	movl	%edi, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%ecx, (%esp)
	calll	Framebuffer$fillrect
	movl	72(%esp), %eax
	movl	12(%eax), %ecx
	movl	%ecx, 40(%esp)          # 4-byte Spill
	movl	64(%esp), %edx
	movl	56(%esp), %esi
	movl	44(%esp), %edi
	movzbl	(%esi,%edi), %ebx
	movzbl	1(%esi,%edi), %ebp
	movzbl	2(%esi,%edi), %esi
	movl	68(%esp), %edi
	movl	52(%esp), %ecx
	movl	24(%eax), %eax
	imull	%eax, %edx
	imull	%eax, %edi
	movl	%esi, 28(%esp)
	movl	%ebp, 24(%esp)
	movl	%ebx, 20(%esp)
	movl	%ecx, 16(%esp)
	movl	%eax, 12(%esp)
	movl	%edi, 8(%esp)
	movl	%edx, 4(%esp)
	movl	40(%esp), %eax          # 4-byte Reload
	movl	%eax, (%esp)
	calll	Framebuffer$drawchar
.LBB152_5:                              # %if_fgfxterm_mVGATextModeEmulator$update_l64_n6434___DONE
                                        #   in Loop: Header=BB152_3 Depth=2
	movl	64(%esp), %eax
	incl	%eax
	movl	%eax, 64(%esp)
	movl	72(%esp), %ecx
	cmpl	16(%ecx), %eax
	jl	.LBB152_3
	jmp	.LBB152_6
.LBB152_7:                              # %fgfxterm_mVGATextModeEmulator$update_l60_n6397___LOOP___END
	movl	72(%esp), %eax
	movl	(%eax), %ecx
	movl	4(%eax), %edx
	movl	8(%eax), %eax
	movl	%eax, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%ecx, (%esp)
	calll	memcpy
	addl	$76, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
.Ltmp466:
	.size	VGATextModeEmulator$update, .Ltmp466-VGATextModeEmulator$update
	.cfi_endproc

	.globl	init_emulator
	.align	16, 0x90
	.type	init_emulator,@function
init_emulator:                          # @init_emulator
	.cfi_startproc
# BB#0:
	subl	$12, %esp
.Ltmp467:
	.cfi_def_cfa_offset 16
	movl	16(%esp), %eax
	movl	%eax, 8(%esp)
	movl	%eax, (%esp)
	calll	Framebuffer$$from_mbinfo
	movl	%eax, gvar_fgfxterm_mu_lu_n18__console_fb
	movl	%eax, (%esp)
	calll	VGATextModeEmulator$$new
	movl	%eax, gvar_fgfxterm_mu_lu_n17__console_emulator
	movl	%eax, (%esp)
	calll	VGATextModeEmulator$clear
	addl	$12, %esp
	retl
.Ltmp468:
	.size	init_emulator, .Ltmp468-init_emulator
	.cfi_endproc

	.globl	_update_framebuffer
	.align	16, 0x90
	.type	_update_framebuffer,@function
_update_framebuffer:                    # @_update_framebuffer
	.cfi_startproc
# BB#0:
	subl	$12, %esp
.Ltmp469:
	.cfi_def_cfa_offset 16
	movl	gvar_fgfxterm_mu_lu_n17__console_emulator, %eax
	movl	%eax, (%esp)
	calll	VGATextModeEmulator$update
	addl	$12, %esp
	retl
.Ltmp470:
	.size	_update_framebuffer, .Ltmp470-_update_framebuffer
	.cfi_endproc

	.globl	PageEntry$set
	.align	16, 0x90
	.type	PageEntry$set,@function
PageEntry$set:                          # @"PageEntry$set"
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp471:
	.cfi_def_cfa_offset 32
	movb	40(%esp), %al
	movl	36(%esp), %ecx
	movl	32(%esp), %edx
	movl	%edx, 24(%esp)
	movl	%ecx, 20(%esp)
	andb	$1, %al
	movb	%al, 19(%esp)
	movl	20(%esp), %eax
	movl	%eax, %ecx
	andl	$-4096, %ecx            # imm = 0xFFFFFFFFFFFFF000
	cmpl	%ecx, %eax
	je	.LBB155_2
# BB#1:                                 # %if_fpaging_mPageEntry$set_l10_n6608___SUCC
	movzbl	19(%esp), %eax
	movl	20(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fpaging_mPageEntry$set_l11_n6617, 12(%esp)
	movl	$.Lstrglobal_fpaging_mPageEntry$set_l11_n6614, 8(%esp)
	calll	kpanic
.LBB155_2:                              # %if_fpaging_mPageEntry$set_l10_n6608___DONE
	movl	24(%esp), %eax
	movl	20(%esp), %ecx
	movl	%ecx, (%eax)
	movl	24(%esp), %eax
	addl	$3, (%eax)
	movzbl	19(%esp), %eax
	cmpl	$1, %eax
	jne	.LBB155_4
# BB#3:                                 # %if_fpaging_mPageEntry$set_l17_n6631___SUCC
	movl	24(%esp), %eax
	subl	$-128, (%eax)
.LBB155_4:                              # %if_fpaging_mPageEntry$set_l17_n6631___DONE
	addl	$28, %esp
	retl
.Ltmp472:
	.size	PageEntry$set, .Ltmp472-PageEntry$set
	.cfi_endproc

	.globl	PageEntry$set_nonpresent
	.align	16, 0x90
	.type	PageEntry$set_nonpresent,@function
PageEntry$set_nonpresent:               # @"PageEntry$set_nonpresent"
	.cfi_startproc
# BB#0:
	pushl	%eax
.Ltmp473:
	.cfi_def_cfa_offset 8
	movl	8(%esp), %eax
	movl	%eax, (%esp)
	movl	$0, (%eax)
	popl	%eax
	retl
.Ltmp474:
	.size	PageEntry$set_nonpresent, .Ltmp474-PageEntry$set_nonpresent
	.cfi_endproc

	.globl	PageManager$$new
	.align	16, 0x90
	.type	PageManager$$new,@function
PageManager$$new:                       # @"PageManager$$new"
	.cfi_startproc
# BB#0:
	pushl	%esi
.Ltmp475:
	.cfi_def_cfa_offset 8
	subl	$8, %esp
.Ltmp476:
	.cfi_def_cfa_offset 16
.Ltmp477:
	.cfi_offset %esi, -8
	movl	$8, (%esp)
	calll	malloc
	movl	%eax, %esi
	movl	%esi, 4(%esp)
	calll	__kget_pagedir_addr
	movl	%eax, (%esi)
	movl	4(%esp), %eax
	addl	$8, %esp
	popl	%esi
	retl
.Ltmp478:
	.size	PageManager$$new, .Ltmp478-PageManager$$new
	.cfi_endproc

	.globl	PageManager$get_pde_slot_idx
	.align	16, 0x90
	.type	PageManager$get_pde_slot_idx,@function
PageManager$get_pde_slot_idx:           # @"PageManager$get_pde_slot_idx"
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp479:
	.cfi_def_cfa_offset 32
	movl	36(%esp), %eax
	movl	32(%esp), %ecx
	movl	%ecx, 24(%esp)
	movl	%eax, 20(%esp)
	movl	24(%esp), %ecx
	movl	(%ecx), %ecx
	shll	$2, %eax
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	calll	ptr$offset
	addl	$28, %esp
	retl
.Ltmp480:
	.size	PageManager$get_pde_slot_idx, .Ltmp480-PageManager$get_pde_slot_idx
	.cfi_endproc

	.globl	PageManager$$get_slot_for_addr
	.align	16, 0x90
	.type	PageManager$$get_slot_for_addr,@function
PageManager$$get_slot_for_addr:         # @"PageManager$$get_slot_for_addr"
	.cfi_startproc
# BB#0:
	pushl	%eax
.Ltmp481:
	.cfi_def_cfa_offset 8
	movl	8(%esp), %eax
	movl	%eax, (%esp)
	shrl	$22, %eax
	popl	%edx
	retl
.Ltmp482:
	.size	PageManager$$get_slot_for_addr, .Ltmp482-PageManager$$get_slot_for_addr
	.cfi_endproc

	.globl	PageManager$get_pde_slot_addr
	.align	16, 0x90
	.type	PageManager$get_pde_slot_addr,@function
PageManager$get_pde_slot_addr:          # @"PageManager$get_pde_slot_addr"
	.cfi_startproc
# BB#0:
	pushl	%esi
.Ltmp483:
	.cfi_def_cfa_offset 8
	subl	$24, %esp
.Ltmp484:
	.cfi_def_cfa_offset 32
.Ltmp485:
	.cfi_offset %esi, -8
	movl	36(%esp), %eax
	movl	32(%esp), %ecx
	movl	%ecx, 20(%esp)
	movl	%eax, 16(%esp)
	movl	20(%esp), %esi
	movl	%eax, (%esp)
	calll	PageManager$$get_slot_for_addr
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	PageManager$get_pde_slot_idx
	addl	$24, %esp
	popl	%esi
	retl
.Ltmp486:
	.size	PageManager$get_pde_slot_addr, .Ltmp486-PageManager$get_pde_slot_addr
	.cfi_endproc

	.globl	init_pm
	.align	16, 0x90
	.type	init_pm,@function
init_pm:                                # @init_pm
	.cfi_startproc
# BB#0:
	subl	$12, %esp
.Ltmp487:
	.cfi_def_cfa_offset 16
	calll	PageManager$$new
	movl	%eax, gvar_fpaging_mu_lu_n19__page_manager
	movl	gvar_fin_mu_lu_n9__base_vma, %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	PageManager$get_pde_slot_addr
	movl	%eax, (%esp)
	movl	$1, 8(%esp)
	movl	$0, 4(%esp)
	calll	PageEntry$set
	calll	__kreload_paging
	addl	$12, %esp
	retl
.Ltmp488:
	.size	init_pm, .Ltmp488-init_pm
	.cfi_endproc

	.globl	kernel_main
	.align	16, 0x90
	.type	kernel_main,@function
kernel_main:                            # @kernel_main
	.cfi_startproc
# BB#0:
	pushl	%ebp
.Ltmp489:
	.cfi_def_cfa_offset 8
.Ltmp490:
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
.Ltmp491:
	.cfi_def_cfa_register %ebp
	pushl	%esi
	subl	$20, %esp
.Ltmp492:
	.cfi_offset %esi, -12
	movl	8(%ebp), %eax
	movl	%eax, -8(%ebp)
	movl	%eax, gvar_fin_mu_lu_n10__multiboot_data_physaddr
	movl	$-1073741824, gvar_fin_mu_lu_n9__base_vma # imm = 0xFFFFFFFFC0000000
	calll	init_serial
	subl	$16, %esp
	movl	$.Lstrglobal_fin_mkernel_main_l27_n6692, (%esp)
	calll	kswritecstr
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n9__base_vma, %eax
	addl	$3145728, %eax          # imm = 0x300000
	subl	$16, %esp
	movl	%eax, (%esp)
	calll	KMM$$init
	addl	$16, %esp
	movl	-8(%ebp), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	calll	MultibootInfo$$load
	addl	$16, %esp
	movl	%eax, gvar_fin_mu_lu_n20__mbinfo
	calll	init_pm
	movl	$4194304, -12(%ebp)     # imm = 0x400000
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB162_3
# BB#1:
	movl	$4194304, %esi          # imm = 0x400000
	.align	16, 0x90
.LBB162_2:                              # %fin_mkernel_main_l34_n6707___LOOP___HEAD
                                        # =>This Inner Loop Header: Depth=1
	movl	gvar_fpaging_mu_lu_n19__page_manager, %eax
	movl	gvar_fin_mu_lu_n9__base_vma, %ecx
	addl	-12(%ebp), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	PageManager$get_pde_slot_addr
	addl	$16, %esp
	movl	-12(%ebp), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$1, 8(%esp)
	calll	PageEntry$set
	addl	$16, %esp
	movl	-12(%ebp), %eax
	addl	%esi, %eax
	movl	%eax, -12(%ebp)
	cmpl	$41943040, %eax         # imm = 0x2800000
	jl	.LBB162_2
.LBB162_3:                              # %fin_mkernel_main_l34_n6707___LOOP___END
	movl	gvar_fin_mu_lu_n20__mbinfo, %eax
	movzbl	20(%eax), %eax
	subl	$16, %esp
	cmpl	$1, %eax
	jne	.LBB162_5
# BB#4:                                 # %if_fin_mkernel_main_l40_n6733___SUCC
	movl	$.Lstrglobal_fin_mkernel_main_l41_n6736, (%esp)
	calll	kswritecstr
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n20__mbinfo, %eax
	movl	44(%eax), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$_null_updater, 12(%esp)
	movl	$25, 8(%esp)
	movl	$80, 4(%esp)
	jmp	.LBB162_8
.LBB162_5:                              # %if_fin_mkernel_main_l40_n6733___FAIL
	movl	$.Lstrglobal_fin_mkernel_main_l44_n6751, (%esp)
	calll	kswritecstr
	addl	$16, %esp
	movl	gvar_fpaging_mu_lu_n19__page_manager, %eax
	movl	gvar_fin_mu_lu_n20__mbinfo, %ecx
	movl	44(%ecx), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	PageManager$get_pde_slot_addr
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n20__mbinfo, %ecx
	movl	40(%ecx), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$1, 8(%esp)
	calll	PageEntry$set
	addl	$16, %esp
	movl	gvar_fpaging_mu_lu_n19__page_manager, %eax
	movl	gvar_fin_mu_lu_n20__mbinfo, %ecx
	movl	$4194304, %edx          # imm = 0x400000
	addl	44(%ecx), %edx
	subl	$16, %esp
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	calll	PageManager$get_pde_slot_addr
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n20__mbinfo, %ecx
	movl	40(%ecx), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$1, 8(%esp)
	calll	PageEntry$set
	addl	$16, %esp
	subl	$16, %esp
	movl	$.Lstrglobal_fin_mkernel_main_l47_n6782, (%esp)
	calll	kswritecstr
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n20__mbinfo, %eax
	movl	16(%eax), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l49_n6789, 4(%esp)
	calll	cstr$__eq__
	addl	$16, %esp
	testb	$1, %al
	je	.LBB162_7
# BB#6:                                 # %if_fin_mkernel_main_l49_n6792___SUCC
	calll	test_svga
.LBB162_7:                              # %if_fin_mkernel_main_l49_n6792___DONE
	movl	gvar_fin_mu_lu_n20__mbinfo, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	calll	init_emulator
	addl	$16, %esp
	movl	gvar_fgfxterm_mu_lu_n17__console_emulator, %eax
	movl	(%eax), %ecx
	movl	16(%eax), %edx
	movl	20(%eax), %eax
	subl	$16, %esp
	movl	%eax, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%ecx, (%esp)
	movl	$_update_framebuffer, 12(%esp)
.LBB162_8:                              # %if_fin_mkernel_main_l40_n6733___DONE
	calll	Terminal$$new
	addl	$16, %esp
	movl	%eax, gvar_fin_mu_lu_n8__kterm
	subl	$16, %esp
	movl	$.Lstrglobal_fin_mkernel_main_l57_n6814, (%esp)
	calll	kswritecstr
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	calll	Terminal$blank
	addl	$16, %esp
	subl	$16, %esp
	movl	$.Lstrglobal_fin_mkernel_main_l59_n6821, (%esp)
	calll	kswritecstr
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l61_n6826, 4(%esp)
	calll	Terminal$printl
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l63_n6831, 4(%esp)
	calll	Terminal$printl
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l65_n6836, 4(%esp)
	calll	Terminal$printl
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l66_n6841, 4(%esp)
	calll	Terminal$printl
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l67_n6846, 4(%esp)
	calll	Terminal$printl
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l68_n6851, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l69_n6857, 8(%esp)
	movl	$14, 4(%esp)
	calll	Terminal$printa
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l70_n6862, 4(%esp)
	calll	Terminal$printl
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l71_n6867, 4(%esp)
	calll	Terminal$printl
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l72_n6872, 4(%esp)
	calll	Terminal$printl
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l73_n6877, 4(%esp)
	calll	Terminal$printl
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l74_n6882, 4(%esp)
	calll	Terminal$printl
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l75_n6887, 4(%esp)
	calll	Terminal$printl
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l76_n6892, 4(%esp)
	calll	Terminal$printl
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l78_n6897, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	gvar_fin_mu_lu_n9__base_vma, %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$dumphexi
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l80_n6905, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	(%eax), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$dumphexi
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l83_n6916, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	calll	__kgetcs
	subl	$16, %esp
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	Terminal$printi
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l85_n6925, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	calll	__kgetds
	subl	$16, %esp
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	Terminal$printi
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l87_n6934, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	calll	install_gdt
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l91_n6941, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l93_n6946, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	calll	__kgetcs
	subl	$16, %esp
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	Terminal$printi
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l95_n6955, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	calll	__kgetds
	subl	$16, %esp
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	Terminal$printi
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l98_n6964, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	%esp, %eax
	leal	-16(%eax), %ecx
	movl	%ecx, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %ecx
	movl	12(%ecx), %ecx
	movl	%ecx, -16(%eax)
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movb	$0, 21(%eax)
	movl	%esp, %eax
	leal	-16(%eax), %esi
	movl	%esi, %esp
	movl	$0, -16(%eax)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB162_10
	.align	16, 0x90
.LBB162_9:                              # %fin_mkernel_main_l104_n6977___LOOP___HEAD
                                        # =>This Inner Loop Header: Depth=1
	movl	gvar_fmm_mu_lu_n2__mm_pos, %eax
	movl	(%esi), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	ptr$offset
	addl	$16, %esp
	movb	$0, (%eax)
	movl	(%esi), %eax
	addl	$8, %eax
	movl	%eax, (%esi)
	cmpl	$1048576, %eax          # imm = 0x100000
	jl	.LBB162_9
.LBB162_10:                             # %fin_mkernel_main_l104_n6977___LOOP___END
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movb	$1, 21(%eax)
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l110_n7004, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	(%esi), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l112_n7012, 4(%esp)
	calll	Terminal$printl
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l114_n7017, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	calll	setup_irq
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l118_n7024, 4(%esp)
	calll	Terminal$printl
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l120_n7029, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	-8(%ebp), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$dumphexi
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l122_n7038, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	-8(%ebp), %ecx
	addl	gvar_fin_mu_lu_n9__base_vma, %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$dumphexi
	addl	$16, %esp
	cmpl	$4194303, -8(%ebp)      # imm = 0x3FFFFF
	jg	.LBB162_12
# BB#11:                                # %if_fin_mkernel_main_l124_n7051___SUCC
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l125_n7054, 4(%esp)
	jmp	.LBB162_13
.LBB162_12:                             # %if_fin_mkernel_main_l124_n7051___FAIL
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l127_n7059, 4(%esp)
.LBB162_13:                             # %if_fin_mkernel_main_l124_n7051___DONE
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l130_n7064, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	gvar_fmm_mu_lu_n1__mm_head, %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$dumphexi
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l132_n7073, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	gvar_fmm_mu_lu_n2__mm_pos, %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$dumphexi
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l134_n7082, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	gvar_fmm_mu_lu_n2__mm_pos, %ecx
	subl	gvar_fmm_mu_lu_n1__mm_head, %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l136_n7094, 4(%esp)
	calll	Terminal$printl
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l138_n7099, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	%esp, %eax
	leal	-16(%eax), %esi
	movl	%esi, %esp
	movl	$15, -16(%eax)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB162_15
	.align	16, 0x90
.LBB162_14:                             # %fin_mkernel_main_l142_n7104___LOOP___HEAD
                                        # =>This Inner Loop Header: Depth=1
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	(%esi), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l143_n7111, 8(%esp)
	calll	Terminal$printa
	addl	$16, %esp
	movl	(%esi), %eax
	addl	$16, %eax
	movl	%eax, (%esi)
	cmpl	$256, %eax              # imm = 0x100
	jl	.LBB162_14
.LBB162_15:                             # %fin_mkernel_main_l142_n7104___LOOP___END
	movl	%esp, %eax
	leal	-16(%eax), %esi
	movl	%esi, %esp
	movl	$0, -16(%eax)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB162_17
	.align	16, 0x90
.LBB162_16:                             # %fin_mkernel_main_l149_n7122___LOOP___HEAD
                                        # =>This Inner Loop Header: Depth=1
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	(%esi), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l150_n7129, 8(%esp)
	calll	Terminal$printa
	addl	$16, %esp
	movl	(%esi), %eax
	incl	%eax
	movl	%eax, (%esi)
	cmpl	$16, %eax
	jl	.LBB162_16
.LBB162_17:                             # %fin_mkernel_main_l149_n7122___LOOP___END
	calll	init_keymap
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l156_n7142, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	calll	kconsole_run
	leal	-4(%ebp), %esp
	popl	%esi
	popl	%ebp
	retl
.Ltmp493:
	.size	kernel_main, .Ltmp493-kernel_main
	.cfi_endproc

	.type	_the_zero_double,@object # @_the_zero_double
	.bss
	.globl	_the_zero_double
	.align	8
_the_zero_double:
	.quad	0                       # double 0
	.size	_the_zero_double, 8

	.type	gvar_fmm_mu_lu_n1__mm_head,@object # @gvar_fmm_mu_lu_n1__mm_head
	.globl	gvar_fmm_mu_lu_n1__mm_head
	.align	4
gvar_fmm_mu_lu_n1__mm_head:
	.long	0
	.size	gvar_fmm_mu_lu_n1__mm_head, 4

	.type	gvar_fmm_mu_lu_n2__mm_pos,@object # @gvar_fmm_mu_lu_n2__mm_pos
	.globl	gvar_fmm_mu_lu_n2__mm_pos
	.align	4
gvar_fmm_mu_lu_n2__mm_pos:
	.long	0
	.size	gvar_fmm_mu_lu_n2__mm_pos, 4

	.type	gvar_fmm_mu_lu_n3__last_alloc,@object # @gvar_fmm_mu_lu_n3__last_alloc
	.globl	gvar_fmm_mu_lu_n3__last_alloc
	.align	4
gvar_fmm_mu_lu_n3__last_alloc:
	.long	0
	.size	gvar_fmm_mu_lu_n3__last_alloc, 4

	.type	gvar_firqio_mu_lu_n4__idt,@object # @gvar_firqio_mu_lu_n4__idt
	.globl	gvar_firqio_mu_lu_n4__idt
	.align	4
gvar_firqio_mu_lu_n4__idt:
	.long	0
	.size	gvar_firqio_mu_lu_n4__idt, 4

	.type	gvar_firqio_mu_lu_n5__system_kbdstate,@object # @gvar_firqio_mu_lu_n5__system_kbdstate
	.globl	gvar_firqio_mu_lu_n5__system_kbdstate
	.align	4
gvar_firqio_mu_lu_n5__system_kbdstate:
	.long	0
	.size	gvar_firqio_mu_lu_n5__system_kbdstate, 4

	.type	gvar_firqio_mu_lu_n6__pic_ticks,@object # @gvar_firqio_mu_lu_n6__pic_ticks
	.globl	gvar_firqio_mu_lu_n6__pic_ticks
	.align	8
gvar_firqio_mu_lu_n6__pic_ticks:
	.quad	0                       # 0x0
	.size	gvar_firqio_mu_lu_n6__pic_ticks, 8

	.type	gvar_fserialdbg_mu_lu_n7__serial_base,@object # @gvar_fserialdbg_mu_lu_n7__serial_base
	.globl	gvar_fserialdbg_mu_lu_n7__serial_base
	.align	4
gvar_fserialdbg_mu_lu_n7__serial_base:
	.long	0                       # 0x0
	.size	gvar_fserialdbg_mu_lu_n7__serial_base, 4

	.type	gvar_fin_mu_lu_n8__kterm,@object # @gvar_fin_mu_lu_n8__kterm
	.globl	gvar_fin_mu_lu_n8__kterm
	.align	4
gvar_fin_mu_lu_n8__kterm:
	.long	0
	.size	gvar_fin_mu_lu_n8__kterm, 4

	.type	gvar_fin_mu_lu_n9__base_vma,@object # @gvar_fin_mu_lu_n9__base_vma
	.globl	gvar_fin_mu_lu_n9__base_vma
	.align	4
gvar_fin_mu_lu_n9__base_vma:
	.long	0                       # 0x0
	.size	gvar_fin_mu_lu_n9__base_vma, 4

	.type	gvar_fin_mu_lu_n10__multiboot_data_physaddr,@object # @gvar_fin_mu_lu_n10__multiboot_data_physaddr
	.globl	gvar_fin_mu_lu_n10__multiboot_data_physaddr
	.align	4
gvar_fin_mu_lu_n10__multiboot_data_physaddr:
	.long	0
	.size	gvar_fin_mu_lu_n10__multiboot_data_physaddr, 4

	.type	gvar_fkeymap_us_mu_lu_n11__keymap,@object # @gvar_fkeymap_us_mu_lu_n11__keymap
	.globl	gvar_fkeymap_us_mu_lu_n11__keymap
	.align	4
gvar_fkeymap_us_mu_lu_n11__keymap:
	.long	0
	.size	gvar_fkeymap_us_mu_lu_n11__keymap, 4

	.type	gvar_fkappsraycasterraycaster_mu_lu_n12__rc_running,@object # @gvar_fkappsraycasterraycaster_mu_lu_n12__rc_running
	.globl	gvar_fkappsraycasterraycaster_mu_lu_n12__rc_running
gvar_fkappsraycasterraycaster_mu_lu_n12__rc_running:
	.byte	0                       # 0x0
	.size	gvar_fkappsraycasterraycaster_mu_lu_n12__rc_running, 1

	.type	gvar_fkappsconsole_mu_lu_n13__console_buf,@object # @gvar_fkappsconsole_mu_lu_n13__console_buf
	.globl	gvar_fkappsconsole_mu_lu_n13__console_buf
	.align	4
gvar_fkappsconsole_mu_lu_n13__console_buf:
	.long	0
	.size	gvar_fkappsconsole_mu_lu_n13__console_buf, 4

	.type	gvar_fkappsconsole_mu_lu_n14__command_to_run,@object # @gvar_fkappsconsole_mu_lu_n14__command_to_run
	.globl	gvar_fkappsconsole_mu_lu_n14__command_to_run
	.align	4
gvar_fkappsconsole_mu_lu_n14__command_to_run:
	.long	0
	.size	gvar_fkappsconsole_mu_lu_n14__command_to_run, 4

	.type	gvar_fkappsconsole_mu_lu_n15__command_args,@object # @gvar_fkappsconsole_mu_lu_n15__command_args
	.globl	gvar_fkappsconsole_mu_lu_n15__command_args
	.align	4
gvar_fkappsconsole_mu_lu_n15__command_args:
	.long	0
	.size	gvar_fkappsconsole_mu_lu_n15__command_args, 4

	.type	gvar_fkappsconsole_mu_lu_n16__kcommand_head,@object # @gvar_fkappsconsole_mu_lu_n16__kcommand_head
	.globl	gvar_fkappsconsole_mu_lu_n16__kcommand_head
	.align	4
gvar_fkappsconsole_mu_lu_n16__kcommand_head:
	.long	0
	.size	gvar_fkappsconsole_mu_lu_n16__kcommand_head, 4

	.type	gvar_fgfxterm_mu_lu_n17__console_emulator,@object # @gvar_fgfxterm_mu_lu_n17__console_emulator
	.globl	gvar_fgfxterm_mu_lu_n17__console_emulator
	.align	4
gvar_fgfxterm_mu_lu_n17__console_emulator:
	.long	0
	.size	gvar_fgfxterm_mu_lu_n17__console_emulator, 4

	.type	gvar_fgfxterm_mu_lu_n18__console_fb,@object # @gvar_fgfxterm_mu_lu_n18__console_fb
	.globl	gvar_fgfxterm_mu_lu_n18__console_fb
	.align	4
gvar_fgfxterm_mu_lu_n18__console_fb:
	.long	0
	.size	gvar_fgfxterm_mu_lu_n18__console_fb, 4

	.type	gvar_fpaging_mu_lu_n19__page_manager,@object # @gvar_fpaging_mu_lu_n19__page_manager
	.globl	gvar_fpaging_mu_lu_n19__page_manager
	.align	4
gvar_fpaging_mu_lu_n19__page_manager:
	.long	0
	.size	gvar_fpaging_mu_lu_n19__page_manager, 4

	.type	gvar_fin_mu_lu_n20__mbinfo,@object # @gvar_fin_mu_lu_n20__mbinfo
	.globl	gvar_fin_mu_lu_n20__mbinfo
	.align	4
gvar_fin_mu_lu_n20__mbinfo:
	.long	0
	.size	gvar_fin_mu_lu_n20__mbinfo, 4

	.type	.Lstrglobal_fmm_mGDTEntry$print_l108_n218,@object # @"strglobal_fmm_mGDTEntry$print_l108_n218"
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fmm_mGDTEntry$print_l108_n218:
	.asciz	"GDTEntry<"
	.size	.Lstrglobal_fmm_mGDTEntry$print_l108_n218, 10

	.type	.Lstrglobal_fmm_mGDTEntry$print_l110_n229,@object # @"strglobal_fmm_mGDTEntry$print_l110_n229"
.Lstrglobal_fmm_mGDTEntry$print_l110_n229:
	.asciz	","
	.size	.Lstrglobal_fmm_mGDTEntry$print_l110_n229, 2

	.type	.Lstrglobal_fmm_mGDTEntry$print_l112_n240,@object # @"strglobal_fmm_mGDTEntry$print_l112_n240"
.Lstrglobal_fmm_mGDTEntry$print_l112_n240:
	.asciz	","
	.size	.Lstrglobal_fmm_mGDTEntry$print_l112_n240, 2

	.type	.Lstrglobal_fmm_mGDTEntry$print_l114_n251,@object # @"strglobal_fmm_mGDTEntry$print_l114_n251"
.Lstrglobal_fmm_mGDTEntry$print_l114_n251:
	.asciz	","
	.size	.Lstrglobal_fmm_mGDTEntry$print_l114_n251, 2

	.type	.Lstrglobal_fmm_mGDTEntry$print_l116_n262,@object # @"strglobal_fmm_mGDTEntry$print_l116_n262"
.Lstrglobal_fmm_mGDTEntry$print_l116_n262:
	.asciz	","
	.size	.Lstrglobal_fmm_mGDTEntry$print_l116_n262, 2

	.type	.Lstrglobal_fmm_mGDTEntry$print_l118_n273,@object # @"strglobal_fmm_mGDTEntry$print_l118_n273"
.Lstrglobal_fmm_mGDTEntry$print_l118_n273:
	.asciz	","
	.size	.Lstrglobal_fmm_mGDTEntry$print_l118_n273, 2

	.type	.Lstrglobal_fmm_mGDTEntry$print_l120_n284,@object # @"strglobal_fmm_mGDTEntry$print_l120_n284"
.Lstrglobal_fmm_mGDTEntry$print_l120_n284:
	.asciz	">"
	.size	.Lstrglobal_fmm_mGDTEntry$print_l120_n284, 2

	.type	.Lstrglobal_fmm_minstall_gdt_l161_n405,@object # @strglobal_fmm_minstall_gdt_l161_n405
.Lstrglobal_fmm_minstall_gdt_l161_n405:
	.asciz	"GDT@"
	.size	.Lstrglobal_fmm_minstall_gdt_l161_n405, 5

	.type	.Lstrglobal_firqio_msetup_irq_l88_n580,@object # @strglobal_firqio_msetup_irq_l88_n580
.Lstrglobal_firqio_msetup_irq_l88_n580:
	.asciz	"IDT@"
	.size	.Lstrglobal_firqio_msetup_irq_l88_n580, 5

	.type	.Lstrglobal_firqio_msetup_irq_l98_n616,@object # @strglobal_firqio_msetup_irq_l98_n616
.Lstrglobal_firqio_msetup_irq_l98_n616:
	.asciz	"!"
	.size	.Lstrglobal_firqio_msetup_irq_l98_n616, 2

	.type	.Lstrglobal_firqio_msetup_irq_l112_n667,@object # @strglobal_firqio_msetup_irq_l112_n667
.Lstrglobal_firqio_msetup_irq_l112_n667:
	.asciz	"."
	.size	.Lstrglobal_firqio_msetup_irq_l112_n667, 2

	.type	.Lstrglobal_firqio_msetup_irq_l116_n676,@object # @strglobal_firqio_msetup_irq_l116_n676
.Lstrglobal_firqio_msetup_irq_l116_n676:
	.asciz	"."
	.size	.Lstrglobal_firqio_msetup_irq_l116_n676, 2

	.type	.Lstrglobal_firqio_msetup_irq_l119_n683,@object # @strglobal_firqio_msetup_irq_l119_n683
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_firqio_msetup_irq_l119_n683:
	.asciz	" KBD, PIC started. "
	.size	.Lstrglobal_firqio_msetup_irq_l119_n683, 20

	.type	.Lstrglobal_firqio_mKeyboardState$getkey_l168_n786,@object # @"strglobal_firqio_mKeyboardState$getkey_l168_n786"
	.align	16
.Lstrglobal_firqio_mKeyboardState$getkey_l168_n786:
	.asciz	"Internal Error - Invalid Scancode in KeyboardState:getkey"
	.size	.Lstrglobal_firqio_mKeyboardState$getkey_l168_n786, 58

	.type	.Lstrglobal_firqio_mKeyboardState$setkey_l174_n810,@object # @"strglobal_firqio_mKeyboardState$setkey_l174_n810"
	.align	16
.Lstrglobal_firqio_mKeyboardState$setkey_l174_n810:
	.asciz	"Internal Error - Invalid Scancode in KeyboardState:setkey"
	.size	.Lstrglobal_firqio_mKeyboardState$setkey_l174_n810, 58

	.type	.Lstrglobal_firqio_mkirq_callback_l202_n868,@object # @strglobal_firqio_mkirq_callback_l202_n868
	.align	16
.Lstrglobal_firqio_mkirq_callback_l202_n868:
	.asciz	"No handler for IRQ"
	.size	.Lstrglobal_firqio_mkirq_callback_l202_n868, 19

	.type	.Lstrglobal_firqio_mkirq_callback_l202_n871,@object # @strglobal_firqio_mkirq_callback_l202_n871
	.align	16
.Lstrglobal_firqio_mkirq_callback_l202_n871:
	.asciz	"A unregistered IRQ was fired (unhandled IRQ)"
	.size	.Lstrglobal_firqio_mkirq_callback_l202_n871, 45

	.type	.Lstrglobal_firqio_mirq_pagefault_handler_l218_n921,@object # @strglobal_firqio_mirq_pagefault_handler_l218_n921
	.align	16
.Lstrglobal_firqio_mirq_pagefault_handler_l218_n921:
	.asciz	"Unrecoverable Page Fault Error - INT 0x0E - #PF"
	.size	.Lstrglobal_firqio_mirq_pagefault_handler_l218_n921, 48

	.type	.Lstrglobal_firqio_mirq_pagefault_handler_l218_n924,@object # @strglobal_firqio_mirq_pagefault_handler_l218_n924
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_firqio_mirq_pagefault_handler_l218_n924:
	.asciz	"???"
	.size	.Lstrglobal_firqio_mirq_pagefault_handler_l218_n924, 4

	.type	.Lstrglobal_firqio_mirq_protectionfault_handler_l222_n934,@object # @strglobal_firqio_mirq_protectionfault_handler_l222_n934
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_firqio_mirq_protectionfault_handler_l222_n934:
	.asciz	"Unrecoverable Page Fault Error - INT 0x0D - #GPF"
	.size	.Lstrglobal_firqio_mirq_protectionfault_handler_l222_n934, 49

	.type	.Lstrglobal_firqio_mirq_protectionfault_handler_l222_n937,@object # @strglobal_firqio_mirq_protectionfault_handler_l222_n937
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_firqio_mirq_protectionfault_handler_l222_n937:
	.asciz	"???"
	.size	.Lstrglobal_firqio_mirq_protectionfault_handler_l222_n937, 4

	.type	.Lstrglobal_firqio_mirq_doublefault_handler_l226_n947,@object # @strglobal_firqio_mirq_doublefault_handler_l226_n947
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_firqio_mirq_doublefault_handler_l226_n947:
	.asciz	"Unrecoverable Double Fault Error - INT 0x08 - #DF"
	.size	.Lstrglobal_firqio_mirq_doublefault_handler_l226_n947, 50

	.type	.Lstrglobal_firqio_mirq_doublefault_handler_l226_n950,@object # @strglobal_firqio_mirq_doublefault_handler_l226_n950
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_firqio_mirq_doublefault_handler_l226_n950:
	.asciz	"???"
	.size	.Lstrglobal_firqio_mirq_doublefault_handler_l226_n950, 4

	.type	.Lstrglobal_firqio_mirq_zerodivision_handler_l230_n960,@object # @strglobal_firqio_mirq_zerodivision_handler_l230_n960
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_firqio_mirq_zerodivision_handler_l230_n960:
	.asciz	"Unrecoverable Zero Division Error - INT 0x00 - #DBZ"
	.size	.Lstrglobal_firqio_mirq_zerodivision_handler_l230_n960, 52

	.type	.Lstrglobal_firqio_mirq_zerodivision_handler_l230_n963,@object # @strglobal_firqio_mirq_zerodivision_handler_l230_n963
	.align	16
.Lstrglobal_firqio_mirq_zerodivision_handler_l230_n963:
	.asciz	"Why would you do that?"
	.size	.Lstrglobal_firqio_mirq_zerodivision_handler_l230_n963, 23

	.type	.Lstrglobal_fserialdbg_minit_serial_l26_n1042,@object # @strglobal_fserialdbg_minit_serial_l26_n1042
	.align	16
.Lstrglobal_fserialdbg_minit_serial_l26_n1042:
	.asciz	"Serial Debugger started!\n"
	.size	.Lstrglobal_fserialdbg_minit_serial_l26_n1042, 26

	.type	.Lstrglobal_fterm_mTerminal$printl_l77_n1282,@object # @"strglobal_fterm_mTerminal$printl_l77_n1282"
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fterm_mTerminal$printl_l77_n1282:
	.asciz	"\n"
	.size	.Lstrglobal_fterm_mTerminal$printl_l77_n1282, 2

	.type	.Lstrglobal_fterm_mTerminal$printlong_l119_n1470,@object # @"strglobal_fterm_mTerminal$printlong_l119_n1470"
.Lstrglobal_fterm_mTerminal$printlong_l119_n1470:
	.asciz	"0"
	.size	.Lstrglobal_fterm_mTerminal$printlong_l119_n1470, 2

	.type	.Lstrglobal_fterm_mTerminal$printlong_l124_n1480,@object # @"strglobal_fterm_mTerminal$printlong_l124_n1480"
.Lstrglobal_fterm_mTerminal$printlong_l124_n1480:
	.asciz	"-"
	.size	.Lstrglobal_fterm_mTerminal$printlong_l124_n1480, 2

	.type	.Lstrglobal_fterm_mTerminal$printlong_l131_n1493,@object # @"strglobal_fterm_mTerminal$printlong_l131_n1493"
.Lstrglobal_fterm_mTerminal$printlong_l131_n1493:
	.asciz	"?"
	.size	.Lstrglobal_fterm_mTerminal$printlong_l131_n1493, 2

	.type	.Lstrglobal_fterm_mTerminal$dumpbin_l150_n1572,@object # @"strglobal_fterm_mTerminal$dumpbin_l150_n1572"
.Lstrglobal_fterm_mTerminal$dumpbin_l150_n1572:
	.asciz	"0b"
	.size	.Lstrglobal_fterm_mTerminal$dumpbin_l150_n1572, 3

	.type	.Lstrglobal_fterm_mTerminal$dumpbin_l155_n1596,@object # @"strglobal_fterm_mTerminal$dumpbin_l155_n1596"
.Lstrglobal_fterm_mTerminal$dumpbin_l155_n1596:
	.asciz	"1"
	.size	.Lstrglobal_fterm_mTerminal$dumpbin_l155_n1596, 2

	.type	.Lstrglobal_fterm_mTerminal$dumpbin_l157_n1601,@object # @"strglobal_fterm_mTerminal$dumpbin_l157_n1601"
.Lstrglobal_fterm_mTerminal$dumpbin_l157_n1601:
	.asciz	"0"
	.size	.Lstrglobal_fterm_mTerminal$dumpbin_l157_n1601, 2

	.type	.Lstrglobal_fterm_mTerminal$dumphex_l163_n1612,@object # @"strglobal_fterm_mTerminal$dumphex_l163_n1612"
.Lstrglobal_fterm_mTerminal$dumphex_l163_n1612:
	.asciz	"0x"
	.size	.Lstrglobal_fterm_mTerminal$dumphex_l163_n1612, 3

	.type	.Lstrglobal_fpanic_mkpanic_l15_n1740,@object # @strglobal_fpanic_mkpanic_l15_n1740
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fpanic_mkpanic_l15_n1740:
	.asciz	"********************************************************************************"
	.size	.Lstrglobal_fpanic_mkpanic_l15_n1740, 81

	.type	.Lstrglobal_fpanic_mkpanic_l16_n1745,@object # @strglobal_fpanic_mkpanic_l16_n1745
	.align	16
.Lstrglobal_fpanic_mkpanic_l16_n1745:
	.asciz	"                             THOUSANDER MEDITATION"
	.size	.Lstrglobal_fpanic_mkpanic_l16_n1745, 51

	.type	.Lstrglobal_fpanic_mkpanic_l19_n1756,@object # @strglobal_fpanic_mkpanic_l19_n1756
	.align	16
.Lstrglobal_fpanic_mkpanic_l19_n1756:
	.asciz	"********************************************************************************"
	.size	.Lstrglobal_fpanic_mkpanic_l19_n1756, 81

	.type	.Lstrglobal_fpanic_mkpanic_l20_n1761,@object # @strglobal_fpanic_mkpanic_l20_n1761
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fpanic_mkpanic_l20_n1761:
	.asciz	"\nError Code: "
	.size	.Lstrglobal_fpanic_mkpanic_l20_n1761, 14

	.type	.Lstrglobal_fpanic_mkpanic_l22_n1769,@object # @strglobal_fpanic_mkpanic_l22_n1769
.Lstrglobal_fpanic_mkpanic_l22_n1769:
	.asciz	"\nIdentifier: "
	.size	.Lstrglobal_fpanic_mkpanic_l22_n1769, 14

	.type	.Lstrglobal_fpanic_mkpanic_l24_n1777,@object # @strglobal_fpanic_mkpanic_l24_n1777
.Lstrglobal_fpanic_mkpanic_l24_n1777:
	.asciz	"\n\nCS:"
	.size	.Lstrglobal_fpanic_mkpanic_l24_n1777, 6

	.type	.Lstrglobal_fpanic_mkpanic_l26_n1787,@object # @strglobal_fpanic_mkpanic_l26_n1787
.Lstrglobal_fpanic_mkpanic_l26_n1787:
	.asciz	" DS:"
	.size	.Lstrglobal_fpanic_mkpanic_l26_n1787, 5

	.type	.Lstrglobal_fpanic_mkpanic_l28_n1797,@object # @strglobal_fpanic_mkpanic_l28_n1797
.Lstrglobal_fpanic_mkpanic_l28_n1797:
	.asciz	" SS:"
	.size	.Lstrglobal_fpanic_mkpanic_l28_n1797, 5

	.type	.Lstrglobal_fpanic_mkpanic_l30_n1807,@object # @strglobal_fpanic_mkpanic_l30_n1807
.Lstrglobal_fpanic_mkpanic_l30_n1807:
	.asciz	" ES:"
	.size	.Lstrglobal_fpanic_mkpanic_l30_n1807, 5

	.type	.Lstrglobal_fpanic_mkpanic_l32_n1817,@object # @strglobal_fpanic_mkpanic_l32_n1817
.Lstrglobal_fpanic_mkpanic_l32_n1817:
	.asciz	" FS:"
	.size	.Lstrglobal_fpanic_mkpanic_l32_n1817, 5

	.type	.Lstrglobal_fpanic_mkpanic_l34_n1827,@object # @strglobal_fpanic_mkpanic_l34_n1827
.Lstrglobal_fpanic_mkpanic_l34_n1827:
	.asciz	" GS:"
	.size	.Lstrglobal_fpanic_mkpanic_l34_n1827, 5

	.type	.Lstrglobal_fpanic_mkpanic_l36_n1837,@object # @strglobal_fpanic_mkpanic_l36_n1837
.Lstrglobal_fpanic_mkpanic_l36_n1837:
	.asciz	"\nEFLAGS:"
	.size	.Lstrglobal_fpanic_mkpanic_l36_n1837, 9

	.type	.Lstrglobal_fpanic_mkpanic_l38_n1846,@object # @strglobal_fpanic_mkpanic_l38_n1846
.Lstrglobal_fpanic_mkpanic_l38_n1846:
	.asciz	"\nCR0:"
	.size	.Lstrglobal_fpanic_mkpanic_l38_n1846, 6

	.type	.Lstrglobal_fpanic_mkpanic_l40_n1855,@object # @strglobal_fpanic_mkpanic_l40_n1855
.Lstrglobal_fpanic_mkpanic_l40_n1855:
	.asciz	"\nCR2:"
	.size	.Lstrglobal_fpanic_mkpanic_l40_n1855, 6

	.type	.Lstrglobal_fpanic_mkpanic_l42_n1864,@object # @strglobal_fpanic_mkpanic_l42_n1864
.Lstrglobal_fpanic_mkpanic_l42_n1864:
	.asciz	" CR3:"
	.size	.Lstrglobal_fpanic_mkpanic_l42_n1864, 6

	.type	.Lstrglobal_fpanic_mkpanic_l44_n1873,@object # @strglobal_fpanic_mkpanic_l44_n1873
.Lstrglobal_fpanic_mkpanic_l44_n1873:
	.asciz	"\nCR4:"
	.size	.Lstrglobal_fpanic_mkpanic_l44_n1873, 6

	.type	.Lstrglobal_fpanic_mkpanic_l46_n1882,@object # @strglobal_fpanic_mkpanic_l46_n1882
.Lstrglobal_fpanic_mkpanic_l46_n1882:
	.asciz	"\n\nSystem halted"
	.size	.Lstrglobal_fpanic_mkpanic_l46_n1882, 16

	.type	.Lstrglobal_fpanic_mikpanici_l51_n1894,@object # @strglobal_fpanic_mikpanici_l51_n1894
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fpanic_mikpanici_l51_n1894:
	.asciz	"Internal Kernel Error :("
	.size	.Lstrglobal_fpanic_mikpanici_l51_n1894, 25

	.type	.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l16_n2072,@object # @"strglobal_fkeymap_us_mKeymap$translate_keycode_l16_n2072"
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l16_n2072:
	.asciz	"?"
	.size	.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l16_n2072, 2

	.type	.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l21_n2091,@object # @"strglobal_fkeymap_us_mKeymap$translate_keycode_l21_n2091"
.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l21_n2091:
	.asciz	"!@#$%^&*()_+"
	.size	.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l21_n2091, 13

	.type	.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l23_n2098,@object # @"strglobal_fkeymap_us_mKeymap$translate_keycode_l23_n2098"
.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l23_n2098:
	.asciz	"1234567890-="
	.size	.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l23_n2098, 13

	.type	.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l29_n2120,@object # @"strglobal_fkeymap_us_mKeymap$translate_keycode_l29_n2120"
.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l29_n2120:
	.asciz	"QWERTYUIOP{}|\n"
	.size	.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l29_n2120, 15

	.type	.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l31_n2127,@object # @"strglobal_fkeymap_us_mKeymap$translate_keycode_l31_n2127"
.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l31_n2127:
	.asciz	"qwertyuiop[]\n"
	.size	.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l31_n2127, 14

	.type	.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l36_n2144,@object # @"strglobal_fkeymap_us_mKeymap$translate_keycode_l36_n2144"
.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l36_n2144:
	.asciz	"ASDFGHJKL:\"~"
	.size	.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l36_n2144, 13

	.type	.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l38_n2151,@object # @"strglobal_fkeymap_us_mKeymap$translate_keycode_l38_n2151"
.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l38_n2151:
	.asciz	"asdfghjkl;'`"
	.size	.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l38_n2151, 13

	.type	.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l43_n2168,@object # @"strglobal_fkeymap_us_mKeymap$translate_keycode_l43_n2168"
.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l43_n2168:
	.asciz	"|ZXCVBNM<>?"
	.size	.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l43_n2168, 12

	.type	.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l45_n2175,@object # @"strglobal_fkeymap_us_mKeymap$translate_keycode_l45_n2175"
.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l45_n2175:
	.asciz	"\\zxcvbnm,./"
	.size	.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l45_n2175, 12

	.type	.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l49_n2186,@object # @"strglobal_fkeymap_us_mKeymap$translate_keycode_l49_n2186"
.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l49_n2186:
	.asciz	"*"
	.size	.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l49_n2186, 2

	.type	.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l51_n2194,@object # @"strglobal_fkeymap_us_mKeymap$translate_keycode_l51_n2194"
.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l51_n2194:
	.asciz	" "
	.size	.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l51_n2194, 2

	.type	.Lstrglobal_fkappsutil_mKeyboardBuf$handleevent_l46_n2372,@object # @"strglobal_fkappsutil_mKeyboardBuf$handleevent_l46_n2372"
.Lstrglobal_fkappsutil_mKeyboardBuf$handleevent_l46_n2372:
	.asciz	" "
	.size	.Lstrglobal_fkappsutil_mKeyboardBuf$handleevent_l46_n2372, 2

	.type	.Lstrglobal_fkappsutil_mKeyboardBuf$handleevent_l51_n2392,@object # @"strglobal_fkappsutil_mKeyboardBuf$handleevent_l51_n2392"
.Lstrglobal_fkappsutil_mKeyboardBuf$handleevent_l51_n2392:
	.asciz	"\n"
	.size	.Lstrglobal_fkappsutil_mKeyboardBuf$handleevent_l51_n2392, 2

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l56_n2556,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l56_n2556"
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l56_n2556:
	.asciz	"Total Size: "
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l56_n2556, 13

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l58_n2566,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l58_n2566"
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l58_n2566:
	.asciz	"\n"
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l58_n2566, 2

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l64_n2586,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l64_n2586"
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l64_n2586:
	.asciz	" - "
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l64_n2586, 4

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l67_n2597,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l67_n2597"
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l67_n2597:
	.asciz	"Cmdline tag, cmdline=`"
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l67_n2597, 23

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l69_n2609,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l69_n2609"
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l69_n2609:
	.asciz	"'"
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l69_n2609, 2

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l71_n2620,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l71_n2620"
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l71_n2620:
	.asciz	"Loader tag, name=`"
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l71_n2620, 19

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l73_n2632,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l73_n2632"
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l73_n2632:
	.asciz	"'"
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l73_n2632, 2

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l75_n2643,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l75_n2643"
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l75_n2643:
	.asciz	"Module tag, args="
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l75_n2643, 18

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l78_n2659,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l78_n2659"
	.align	16
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l78_n2659:
	.asciz	"BasicMem tag, lower="
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l78_n2659, 21

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l80_n2670,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l80_n2670"
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l80_n2670:
	.asciz	", upper="
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l80_n2670, 9

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l83_n2687,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l83_n2687"
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l83_n2687:
	.asciz	"Boot Device tag, dev="
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l83_n2687, 22

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l85_n2699,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l85_n2699"
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l85_n2699:
	.asciz	", p="
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l85_n2699, 5

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l87_n2711,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l87_n2711"
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l87_n2711:
	.asciz	":"
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l87_n2711, 2

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l90_n2729,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l90_n2729"
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l90_n2729:
	.asciz	"MMAP Tag esz="
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l90_n2729, 14

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l92_n2740,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l92_n2740"
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l92_n2740:
	.asciz	", ev="
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l92_n2740, 6

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l94_n2751,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l94_n2751"
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l94_n2751:
	.asciz	", #="
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l94_n2751, 5

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l98_n2775,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l98_n2775"
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l98_n2775:
	.asciz	"VBE Info Tag:. Controller info:\n"
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l98_n2775, 33

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l100_n2786,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l100_n2786"
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l100_n2786:
	.asciz	"\nMode info:\n"
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l100_n2786, 13

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l104_n2808,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l104_n2808"
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l104_n2808:
	.asciz	"FB Tag addr="
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l104_n2808, 13

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l106_n2819,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l106_n2819"
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l106_n2819:
	.asciz	", pitch="
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l106_n2819, 9

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l108_n2829,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l108_n2829"
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l108_n2829:
	.asciz	", width="
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l108_n2829, 9

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l110_n2839,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l110_n2839"
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l110_n2839:
	.asciz	", height="
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l110_n2839, 10

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l112_n2849,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l112_n2849"
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l112_n2849:
	.asciz	", bpp="
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l112_n2849, 7

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l114_n2860,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l114_n2860"
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l114_n2860:
	.asciz	", fbtype="
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l114_n2860, 10

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l117_n2877,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l117_n2877"
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l117_n2877:
	.asciz	"APM Tag (unk.)"
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l117_n2877, 15

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l119_n2888,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l119_n2888"
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l119_n2888:
	.asciz	"RSDP1 Tag, oem="
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l119_n2888, 16

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l122_n2902,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l122_n2902"
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l122_n2902:
	.asciz	"RSDP2 Tag, oem="
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l122_n2902, 16

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l125_n2916,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l125_n2916"
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l125_n2916:
	.asciz	"NIC Tag (unk.)"
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l125_n2916, 15

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l127_n2921,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l127_n2921"
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l127_n2921:
	.asciz	"??? Tag"
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l127_n2921, 8

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l130_n2926,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l130_n2926"
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l130_n2926:
	.asciz	", type="
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l130_n2926, 8

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l132_n2936,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l132_n2936"
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l132_n2936:
	.asciz	", sz="
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l132_n2936, 6

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l134_n2946,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l134_n2946"
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l134_n2946:
	.asciz	", pos="
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l134_n2946, 7

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l136_n2956,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l136_n2956"
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l136_n2956:
	.asciz	"\n"
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l136_n2956, 2

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l141_n2973,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l141_n2973"
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l141_n2973:
	.asciz	"\nMalformed structure, no terminator tag!\n"
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l141_n2973, 42

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l146_n2984,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l146_n2984"
	.align	16
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l146_n2984:
	.asciz	"Reached End Tag\n"
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l146_n2984, 17

	.type	.Lstrglobal_fmbdata_mMBMMAPMemTag$print_l178_n3023,@object # @"strglobal_fmbdata_mMBMMAPMemTag$print_l178_n3023"
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fmbdata_mMBMMAPMemTag$print_l178_n3023:
	.asciz	"\n  MMAP Tag "
	.size	.Lstrglobal_fmbdata_mMBMMAPMemTag$print_l178_n3023, 13

	.type	.Lstrglobal_fmbdata_mMBMMAPMemTag$print_l180_n3031,@object # @"strglobal_fmbdata_mMBMMAPMemTag$print_l180_n3031"
.Lstrglobal_fmbdata_mMBMMAPMemTag$print_l180_n3031:
	.asciz	" - type="
	.size	.Lstrglobal_fmbdata_mMBMMAPMemTag$print_l180_n3031, 9

	.type	.Lstrglobal_fmbdata_mMBMMAPMemTag$print_l182_n3041,@object # @"strglobal_fmbdata_mMBMMAPMemTag$print_l182_n3041"
.Lstrglobal_fmbdata_mMBMMAPMemTag$print_l182_n3041:
	.asciz	", start="
	.size	.Lstrglobal_fmbdata_mMBMMAPMemTag$print_l182_n3041, 9

	.type	.Lstrglobal_fmbdata_mMBMMAPMemTag$print_l184_n3052,@object # @"strglobal_fmbdata_mMBMMAPMemTag$print_l184_n3052"
.Lstrglobal_fmbdata_mMBMMAPMemTag$print_l184_n3052:
	.asciz	", len="
	.size	.Lstrglobal_fmbdata_mMBMMAPMemTag$print_l184_n3052, 7

	.type	.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l374_n3393,@object # @"strglobal_fmbdata_mRawVBEControllerInfo$print_l374_n3393"
.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l374_n3393:
	.asciz	" Signature: "
	.size	.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l374_n3393, 13

	.type	.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l379_n3418,@object # @"strglobal_fmbdata_mRawVBEControllerInfo$print_l379_n3418"
.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l379_n3418:
	.asciz	"\n Version: "
	.size	.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l379_n3418, 12

	.type	.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l381_n3430,@object # @"strglobal_fmbdata_mRawVBEControllerInfo$print_l381_n3430"
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l381_n3430:
	.asciz	"\n OEM String FarPtr: "
	.size	.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l381_n3430, 22

	.type	.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l383_n3442,@object # @"strglobal_fmbdata_mRawVBEControllerInfo$print_l383_n3442"
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l383_n3442:
	.asciz	":"
	.size	.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l383_n3442, 2

	.type	.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l385_n3454,@object # @"strglobal_fmbdata_mRawVBEControllerInfo$print_l385_n3454"
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l385_n3454:
	.asciz	"\n Capabilities: "
	.size	.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l385_n3454, 17

	.type	.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l387_n3466,@object # @"strglobal_fmbdata_mRawVBEControllerInfo$print_l387_n3466"
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l387_n3466:
	.asciz	" "
	.size	.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l387_n3466, 2

	.type	.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l389_n3478,@object # @"strglobal_fmbdata_mRawVBEControllerInfo$print_l389_n3478"
.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l389_n3478:
	.asciz	" "
	.size	.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l389_n3478, 2

	.type	.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l391_n3490,@object # @"strglobal_fmbdata_mRawVBEControllerInfo$print_l391_n3490"
.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l391_n3490:
	.asciz	" "
	.size	.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l391_n3490, 2

	.type	.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l393_n3502,@object # @"strglobal_fmbdata_mRawVBEControllerInfo$print_l393_n3502"
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l393_n3502:
	.asciz	"\n VMode FarPtr: "
	.size	.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l393_n3502, 17

	.type	.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l395_n3514,@object # @"strglobal_fmbdata_mRawVBEControllerInfo$print_l395_n3514"
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l395_n3514:
	.asciz	":"
	.size	.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l395_n3514, 2

	.type	.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l397_n3526,@object # @"strglobal_fmbdata_mRawVBEControllerInfo$print_l397_n3526"
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l397_n3526:
	.asciz	"\n Availible Memory (64KB units): "
	.size	.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l397_n3526, 34

	.type	.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l445_n3538,@object # @"strglobal_fmbdata_mRawVBEModeInfo$print_l445_n3538"
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l445_n3538:
	.asciz	" Attributes:"
	.size	.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l445_n3538, 13

	.type	.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l447_n3549,@object # @"strglobal_fmbdata_mRawVBEModeInfo$print_l447_n3549"
.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l447_n3549:
	.asciz	" "
	.size	.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l447_n3549, 2

	.type	.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l449_n3561,@object # @"strglobal_fmbdata_mRawVBEModeInfo$print_l449_n3561"
.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l449_n3561:
	.asciz	":"
	.size	.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l449_n3561, 2

	.type	.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l452_n3573,@object # @"strglobal_fmbdata_mRawVBEModeInfo$print_l452_n3573"
.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l452_n3573:
	.asciz	"\n Res: "
	.size	.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l452_n3573, 8

	.type	.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l454_n3584,@object # @"strglobal_fmbdata_mRawVBEModeInfo$print_l454_n3584"
.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l454_n3584:
	.asciz	"x"
	.size	.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l454_n3584, 2

	.type	.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l456_n3595,@object # @"strglobal_fmbdata_mRawVBEModeInfo$print_l456_n3595"
.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l456_n3595:
	.asciz	"x"
	.size	.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l456_n3595, 2

	.type	.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l459_n3606,@object # @"strglobal_fmbdata_mRawVBEModeInfo$print_l459_n3606"
.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l459_n3606:
	.asciz	"\n Pitch: "
	.size	.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l459_n3606, 10

	.type	.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l461_n3618,@object # @"strglobal_fmbdata_mRawVBEModeInfo$print_l461_n3618"
.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l461_n3618:
	.asciz	" PysAddr: "
	.size	.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l461_n3618, 11

	.type	.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l463_n3628,@object # @"strglobal_fmbdata_mRawVBEModeInfo$print_l463_n3628"
.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l463_n3628:
	.asciz	"\n"
	.size	.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l463_n3628, 2

	.type	.Lstrglobal_fkappsraycasterrcmath_mrcsin_l13_n3646,@object # @strglobal_fkappsraycasterrcmath_mrcsin_l13_n3646
	.section	.rodata,"a",@progbits
	.align	16
.Lstrglobal_fkappsraycasterrcmath_mrcsin_l13_n3646:
	.asciz	"\000\000\000\000\000\000\000\000\036\335\211+\013\337\221?'\334\367\311X\336\241?\016\311\357H\307\313\252?(Qjm\217\333\261?\002\201\302\270\326O\266?lW<\233`\302\272?\323bOL\3242\277?\031\236\215\226l\320\301?uS\250g\013\006\304?\211s\013~\032:\306?Obv\335ml\310?\366XB\254\331\234\312?u\306\31562\313\314?\035\271\344\362K\367\316?\220\006\223\301}\220\320?)\2162\335\n\244\321?\310\325\203\3177\266\322?O\351/7\357\306\323?\334\315\000\320\033\326\324?\365\013\212t\250\343\325?<\323\316\037\200\357\326?\201\226\345\356\215\371\327?\253\377\230\"\275\001\331?\321\032\006!\371\007\332?S\2307w-\f\333?\310\005\276\332E\016\334?\000\336D+.\016\335?yP$t\322\013\336?\355\240\357\355\036\007\337?\377\377\377\377\377\377\337?\023\337\375 1{\340?*\335\254>\031\365\340?\035wp\327\256m\341?\023\375\021\204\350\344\341?xI|\370\274Z\342?^Zu\004#\317\342?\266\276U\224\021B\343?9\311\275\261\177\263\343?\275zH\204d#\344?\034\026<R\267\221\344?\324O8\201o\376\344?\330\013\342\226\204i\345?+\234\2149\356\322\345?\020s\3400\244:\346?\314;\177f\236\240\346?8M\245\346\324\004\347?\202i\310\340?g\347?\302\2763\250\327\307\347?7\034\241\264\224&\350?9P\317\242o\203\350?(\243\0255a\336\350?\322c\364Sb7\351?\024z\242\016l\216\351?\250\364\227\233w\343\351?G\207\025Y~6\352?\245\356\250\315y\207\352?\334/\256\250c\326\352?E\251\315\3025#\353?\336\352v\036\352m\353?\252LX\350z\266\353?\3069\323w\342\374\353?\007'mO\033A\354?l,=\035 \203\354?\3128V\273\353\302\354?g\327-0y\000\355?\225\177\377\256\303;\355?of,\230\306t\355?X\313\227y}\253\355?\005\270\377\016\344\337\355?\033-RB\366\021\356?\312\264\376+\260A\356?\377TD\023\016o\356?\037\333{n\f\232\356?\200{^\343\247\302\356?\025\277HG\335\350\356?%\272y\237\251\f\357?\017\207N!\n.\357?\177\000z2\374L\357?\302\2668i}i\357?\027\034\201\214\213\203\357?\\\344/\224$\233\357?z\2240\251F\260\357?\213>\242%\360\302\357?\306g\370\224\037\323\357?\242\025\030\264\323\340\357?\366\377pq\013\354\357?\035\346\022\355\305\364\357?g\005\277x\002\373\357?\212\257\365\227\300\376\357?\000\000\000\000\000\000\360?\212\257\365\227\300\376\357?g\005\277x\002\373\357?\035\346\022\355\305\364\357?\366\377pq\013\354\357?\242\025\030\264\323\340\357?\306g\370\224\037\323\357?\214>\242%\360\302\357?z\2240\251F\260\357?\\\344/\224$\233\357?\027\034\201\214\213\203\357?\302\2668i}i\357?\200\000z2\374L\357?\017\207N!\n.\357?%\272y\237\251\f\357?\025\277HG\335\350\356?\200{^\343\247\302\356? \333{n\f\232\356?\000UD\023\016o\356?\313\264\376+\260A\356?\034-RB\366\021\356?\005\270\377\016\344\337\355?X\313\227y}\253\355?nf,\230\306t\355?\225\177\377\256\303;\355?h\327-0y\000\355?\3118V\273\353\302\354?m,=\035 \203\354?\007'mO\033A\354?\3079\323w\342\374\353?\253LX\350z\266\353?\336\352v\036\352m\353?F\251\315\3025#\353?\333/\256\250c\326\352?\245\356\250\315y\207\352?F\207\025Y~6\352?\250\364\227\233w\343\351?\023z\242\016l\216\351?\322c\364Sb7\351?)\243\0255a\336\350?9P\317\242o\203\350?8\034\241\264\224&\350?\302\2763\250\327\307\347?\203i\310\340?g\347?8M\245\346\324\004\347?\315;\177f\236\240\346?\017s\3400\244:\346?,\234\2149\356\322\345?\331\013\342\226\204i\345?\324O8\201o\376\344?\036\026<R\267\221\344?\275zH\204d#\344?:\311\275\261\177\263\343?\265\276U\224\021B\343?_Zu\004#\317\342?wI|\370\274Z\342?\023\375\021\204\350\344\341?\037wp\327\256m\341?*\335\254>\031\365\340?\025\337\375 1{\340?\377\377\377\377\377\377\337?\357\240\357\355\036\007\337?wP$t\322\013\336?\002\336D+.\016\335?\306\005\276\332E\016\334?T\2307w-\f\333?\325\032\006!\371\007\332?\253\377\230\"\275\001\331?\205\226\345\356\215\371\327?;\323\316\037\200\357\326?\370\013\212t\250\343\325?\332\315\000\320\033\326\324?Q\351/7\357\306\323?\305\325\203\3177\266\322?*\2162\335\n\244\321?\225\006\223\301}\220\320?\035\271\344\362K\367\316?|\306\31562\313\314?\365XB\254\331\234\312?Ubv\335ml\310?\207s\013~\032:\306?yS\250g\013\006\304?\025\236\215\226l\320\301?\330bOL\3242\277?\177W<\233`\302\272?\004\201\302\270\326O\266?8Qjm\217\333\261?\n\311\357H\307\313\252?@\334\367\311X\336\241?\t\335\211+\013\337\221?\007\\\0243&\246\241<B\335\211+\013\337\221\277\035\334\367\311X\336\241\277\347\310\357H\307\313\252\277&Qjm\217\333\261\277\362\200\302\270\326O\266\277nW<\233`\302\272\277\307bOL\3242\277\277\034\236\215\226l\320\301\277pS\250g\013\006\304\277\216s\013~\032:\306\277Lbv\335ml\310\277\374XB\254\331\234\312\277t\306\31562\313\314\277\025\271\344\362K\367\316\277\221\006\223\301}\220\320\277&\2162\335\n\244\321\277\310\325\203\3177\266\322\277M\351/7\357\306\323\277\335\315\000\320\033\326\324\277\364\013\212t\250\343\325\277?\323\316\037\200\357\326\277\201\226\345\356\215\371\327\277\247\377\230\"\275\001\331\277\321\032\006!\371\007\332\277P\2307w-\f\333\277\311\005\276\332E\016\334\277\377\335D+.\016\335\277zP$t\322\013\336\277\353\240\357\355\036\007\337\277\001\000\000\000\000\000\340\277\023\337\375 1{\340\277)\335\254>\031\365\340\277\035wp\327\256m\341\277\021\375\021\204\350\344\341\277yI|\370\274Z\342\277]Zu\004#\317\342\277\267\276U\224\021B\343\2778\311\275\261\177\263\343\277\277zH\204d#\344\277\034\026<R\267\221\344\277\322O8\201o\376\344\277\330\013\342\226\204i\345\277*\234\2149\356\322\345\277\021s\3400\244:\346\277\314;\177f\236\240\346\2779M\245\346\324\004\347\277\202i\310\340?g\347\277\303\2763\250\327\307\347\2777\034\241\264\224&\350\2778P\317\242o\203\350\277%\243\0255a\336\350\277\323c\364Sb7\351\277\024z\242\016l\216\351\277\247\364\227\233w\343\351\277E\207\025Y~6\352\277\246\356\250\315y\207\352\277\334/\256\250c\326\352\277E\251\315\3025#\353\277\334\352v\036\352m\353\277\250LX\350z\266\353\277\3109\323w\342\374\353\277\b'mO\033A\354\277l,=\035 \203\354\277\3108V\273\353\302\354\277h\327-0y\000\355\277\226\177\377\256\303;\355\277nf,\230\306t\355\277W\313\227y}\253\355\277\004\270\377\016\344\337\355\277\034-RB\366\021\356\277\313\264\376+\260A\356\277\377TD\023\016o\356\277\036\333{n\f\232\356\277\201{^\343\247\302\356\277\025\277HG\335\350\356\277%\272y\237\251\f\357\277\016\207N!\n.\357\277\177\000z2\374L\357\277\302\2668i}i\357\277\027\034\201\214\213\203\357\277[\344/\224$\233\357\277y\2240\251F\260\357\277\214>\242%\360\302\357\277\307g\370\224\037\323\357\277\242\025\030\264\323\340\357\277\366\377pq\013\354\357\277\035\346\022\355\305\364\357\277g\005\277x\002\373\357\277\212\257\365\227\300\376\357\277\000\000\000\000\000\000\360\277\212\257\365\227\300\376\357\277g\005\277x\002\373\357\277\035\346\022\355\305\364\357\277\367\377pq\013\354\357\277\242\025\030\264\323\340\357\277\307g\370\224\037\323\357\277\213>\242%\360\302\357\277z\2240\251F\260\357\277\\\344/\224$\233\357\277\030\034\201\214\213\203\357\277\301\2668i}i\357\277\177\000z2\374L\357\277\017\207N!\n.\357\277&\272y\237\251\f\357\277\026\277HG\335\350\356\277\177{^\343\247\302\356\277\037\333{n\f\232\356\277\000UD\023\016o\356\277\314\264\376+\260A\356\277\033-RB\366\021\356\277\005\270\377\016\344\337\355\277X\313\227y}\253\355\277pf,\230\306t\355\277\227\177\377\256\303;\355\277g\327-0y\000\355\277\3128V\273\353\302\354\277m,=\035 \203\354\277\t'mO\033A\354\277\3059\323w\342\374\353\277\252LX\350z\266\353\277\336\352v\036\352m\353\277G\251\315\3025#\353\277\336/\256\250c\326\352\277\244\356\250\315y\207\352\277G\207\025Y~6\352\277\251\364\227\233w\343\351\277\026z\242\016l\216\351\277\320c\364Sb7\351\277'\243\0255a\336\350\277:P\317\242o\203\350\2779\034\241\264\224&\350\277\305\2763\250\327\307\347\277\201i\310\340?g\347\2779M\245\346\324\004\347\277\316;\177f\236\240\346\277\023s\3400\244:\346\277)\234\2149\356\322\345\277\327\013\342\226\204i\345\277\325O8\201o\376\344\277\037\026<R\267\221\344\277\301zH\204d#\344\2778\311\275\261\177\263\343\277\266\276U\224\021B\343\277`Zu\004#\317\342\277|I|\370\274Z\342\277\020\375\021\204\350\344\341\277\034wp\327\256m\341\277+\335\254>\031\365\340\277\026\337\375 1{\340\277\004\000\000\000\000\000\340\277\352\240\357\355\036\007\337\277yP$t\322\013\336\277\004\336D+.\016\335\277\317\005\276\332E\016\334\277O\2307w-\f\333\277\320\032\006!\371\007\332\277\255\377\230\"\275\001\331\277\207\226\345\356\215\371\327\277E\323\316\037\200\357\326\277\363\013\212t\250\343\325\277\334\315\000\320\033\326\324\277S\351/7\357\306\323\277\317\325\203\3177\266\322\277%\2162\335\n\244\321\277\217\006\223\301}\220\320\277\"\271\344\362K\367\316\277\201\306\31562\313\314\277\tYB\254\331\234\312\277Jbv\335ml\310\277\213s\013~\032:\306\277}S\250g\013\006\304\277)\236\215\226l\320\301\277\301bOL\3242\277\277hW<\233`\302\272\277\r\201\302\270\326O\266\277@Qjm\217\333\261\277[\311\357H\307\313\252\277\022\334\367\311X\336\241\277,\335\211+\013\337\221\277\007\\\0243&\246\261\274\237\334\211+\013\337\221?K\334\367\311X\336\241?\025\311\357H\307\313\252?\035Qjm\217\333\261?"
	.size	.Lstrglobal_fkappsraycasterrcmath_mrcsin_l13_n3646, 2921

	.type	.Lstrglobal_fkappsraycasterrcmath_mrccos_l21_n3672,@object # @strglobal_fkappsraycasterrcmath_mrccos_l21_n3672
	.align	16
.Lstrglobal_fkappsraycasterrcmath_mrccos_l21_n3672:
	.asciz	"\000\000\000\000\000\000\360?\212\257\365\227\300\376\357?g\005\277x\002\373\357?\035\346\022\355\305\364\357?\366\377pq\013\354\357?\242\025\030\264\323\340\357?\306g\370\224\037\323\357?\213>\242%\360\302\357?z\2240\251F\260\357?\\\344/\224$\233\357?\027\034\201\214\213\203\357?\302\2668i}i\357?\200\000z2\374L\357?\017\207N!\n.\357?%\272y\237\251\f\357?\025\277HG\335\350\356?\200{^\343\247\302\356?\037\333{n\f\232\356?\377TD\023\016o\356?\313\264\376+\260A\356?\034-RB\366\021\356?\005\270\377\016\344\337\355?X\313\227y}\253\355?of,\230\306t\355?\225\177\377\256\303;\355?g\327-0y\000\355?\3128V\273\353\302\354?m,=\035 \203\354?\b'mO\033A\354?\3069\323w\342\374\353?\253LX\350z\266\353?\336\352v\036\352m\353?E\251\315\3025#\353?\334/\256\250c\326\352?\244\356\250\315y\207\352?G\207\025Y~6\352?\250\364\227\233w\343\351?\024z\242\016l\216\351?\321c\364Sb7\351?(\243\0255a\336\350?9P\317\242o\203\350?7\034\241\264\224&\350?\302\2763\250\327\307\347?\202i\310\340?g\347?9M\245\346\324\004\347?\315;\177f\236\240\346?\020s\3400\244:\346?+\234\2149\356\322\345?\330\013\342\226\204i\345?\324O8\201o\376\344?\035\026<R\267\221\344?\276zH\204d#\344?9\311\275\261\177\263\343?\267\276U\224\021B\343?^Zu\004#\317\342?yI|\370\274Z\342?\022\375\021\204\350\344\341?\035wp\327\256m\341?*\335\254>\031\365\340?\023\337\375 1{\340?\001\000\000\000\000\000\340?\356\240\357\355\036\007\337?zP$t\322\013\336?\001\336D+.\016\335?\311\005\276\332E\016\334?S\2307w-\f\333?\321\032\006!\371\007\332?\252\377\230\"\275\001\331?\200\226\345\356\215\371\327?>\323\316\037\200\357\326?\367\013\212t\250\343\325?\335\315\000\320\033\326\324?P\351/7\357\306\323?\310\325\203\3177\266\322?)\2162\335\n\244\321?\220\006\223\301}\220\320?\033\271\344\362K\367\316?r\306\31562\313\314?\372XB\254\331\234\312?Sbv\335ml\310?\214s\013~\032:\306?wS\250g\013\006\304?\032\236\215\226l\320\301?\324bOL\3242\277?kW<\233`\302\272?\000\201\302\270\326O\266?#Qjm\217\333\261?!\311\357H\307\313\252?7\334\367\311X\336\241?7\335\211+\013\337\221?\007\\\0243&\246\221<\024\335\211+\013\337\221\277%\334\367\311X\336\241\277\017\311\357H\307\313\252\277*Qjm\217\333\261\277\007\201\302\270\326O\266\277rW<\233`\302\272\277\313bOL\3242\277\277\026\236\215\226l\320\301\277sS\250g\013\006\304\277\210s\013~\032:\306\277Obv\335ml\310\277\366XB\254\331\234\312\277v\306\31562\313\314\277\037\271\344\362K\367\316\277\222\006\223\301}\220\320\277'\2162\335\n\244\321\277\306\325\203\3177\266\322\277N\351/7\357\306\323\277\333\315\000\320\033\326\324\277\365\013\212t\250\343\325\277<\323\316\037\200\357\326\277\202\226\345\356\215\371\327\277\253\377\230\"\275\001\331\277\322\032\006!\371\007\332\277Q\2307w-\f\333\277\312\005\276\332E\016\334\277\377\335D+.\016\335\277{P$t\322\013\336\277\354\240\357\355\036\007\337\277\374\377\377\377\377\377\337\277\024\337\375 1{\340\277)\335\254>\031\365\340\277\035wp\327\256m\341\277\021\375\021\204\350\344\341\277yI|\370\274Z\342\277]Zu\004#\317\342\277\267\276U\224\021B\343\2779\311\275\261\177\263\343\277\274zH\204d#\344\277\035\026<R\267\221\344\277\323O8\201o\376\344\277\330\013\342\226\204i\345\277*\234\2149\356\322\345\277\021s\3400\244:\346\277\314;\177f\236\240\346\2779M\245\346\324\004\347\277\202i\310\340?g\347\277\300\2763\250\327\307\347\2777\034\241\264\224&\350\2778P\317\242o\203\350\277(\243\0255a\336\350\277\321c\364Sb7\351\277\025z\242\016l\216\351\277\247\364\227\233w\343\351\277H\207\025Y~6\352\277\244\356\250\315y\207\352\277\333/\256\250c\326\352\277E\251\315\3025#\353\277\335\352v\036\352m\353\277\253LX\350z\266\353\277\3069\323w\342\374\353\277\b'mO\033A\354\277l,=\035 \203\354\277\3128V\273\353\302\354\277g\327-0y\000\355\277\224\177\377\256\303;\355\277of,\230\306t\355\277W\313\227y}\253\355\277\005\270\377\016\344\337\355\277\033-RB\366\021\356\277\313\264\376+\260A\356\277\377TD\023\016o\356\277 \333{n\f\232\356\277\200{^\343\247\302\356\277\024\277HG\335\350\356\277%\272y\237\251\f\357\277\016\207N!\n.\357\277\200\000z2\374L\357\277\302\2668i}i\357\277\027\034\201\214\213\203\357\277[\344/\224$\233\357\277z\2240\251F\260\357\277\213>\242%\360\302\357\277\306g\370\224\037\323\357\277\242\025\030\264\323\340\357\277\366\377pq\013\354\357\277\035\346\022\355\305\364\357\277g\005\277x\002\373\357\277\212\257\365\227\300\376\357\277\000\000\000\000\000\000\360\277\212\257\365\227\300\376\357\277g\005\277x\002\373\357\277\035\346\022\355\305\364\357\277\366\377pq\013\354\357\277\242\025\030\264\323\340\357\277\306g\370\224\037\323\357\277\214>\242%\360\302\357\277y\2240\251F\260\357\277\\\344/\224$\233\357\277\027\034\201\214\213\203\357\277\302\2668i}i\357\277\177\000z2\374L\357\277\017\207N!\n.\357\277%\272y\237\251\f\357\277\025\277HG\335\350\356\277\200{^\343\247\302\356\277\037\333{n\f\232\356\277\000UD\023\016o\356\277\312\264\376+\260A\356\277\034-RB\366\021\356\277\005\270\377\016\344\337\355\277X\313\227y}\253\355\277of,\230\306t\355\277\225\177\377\256\303;\355\277h\327-0y\000\355\277\3118V\273\353\302\354\277m,=\035 \203\354\277\007'mO\033A\354\277\3079\323w\342\374\353\277\252LX\350z\266\353\277\336\352v\036\352m\353\277F\251\315\3025#\353\277\334/\256\250c\326\352\277\246\356\250\315y\207\352\277G\207\025Y~6\352\277\251\364\227\233w\343\351\277\024z\242\016l\216\351\277\322c\364Sb7\351\277'\243\0255a\336\350\2779P\317\242o\203\350\2778\034\241\264\224&\350\277\302\2763\250\327\307\347\277\203i\310\340?g\347\2778M\245\346\324\004\347\277\316;\177f\236\240\346\277\020s\3400\244:\346\277,\234\2149\356\322\345\277\327\013\342\226\204i\345\277\324O8\201o\376\344\277\036\026<R\267\221\344\277\301zH\204d#\344\2777\311\275\261\177\263\343\277\266\276U\224\021B\343\277_Zu\004#\317\342\277{I|\370\274Z\342\277\020\375\021\204\350\344\341\277\034wp\327\256m\341\277+\335\254>\031\365\340\277\026\337\375 1{\340\277\004\000\000\000\000\000\340\277\351\240\357\355\036\007\337\277xP$t\322\013\336\277\003\336D+.\016\335\277\316\005\276\332E\016\334\277N\2307w-\f\333\277\317\032\006!\371\007\332\277\254\377\230\"\275\001\331\277\206\226\345\356\215\371\327\277D\323\316\037\200\357\326\277\362\013\212t\250\343\325\277\333\315\000\320\033\326\324\277R\351/7\357\306\323\277\316\325\203\3177\266\322\277$\2162\335\n\244\321\277\216\006\223\301}\220\320\277\037\271\344\362K\367\316\277~\306\31562\313\314\277\006YB\254\331\234\312\277Hbv\335ml\310\277\211s\013~\032:\306\277{S\250g\013\006\304\277'\236\215\226l\320\301\277\275bOL\3242\277\277dW<\233`\302\272\277\b\201\302\270\326O\266\277<Qjm\217\333\261\277R\311\357H\307\313\252\277\t\334\367\311X\336\241\277\032\335\211+\013\337\221\277\n\212\236L9y\252\274\260\334\211+\013\337\221?T\334\367\311X\336\241?\036\311\357H\307\313\252?\"Qjm\217\333\261?\356\200\302\270\326O\266?IW<\233`\302\272?\342bOL\3242\277?\032\236\215\226l\320\301?nS\250g\013\006\304?|s\013~\032:\306?Zbv\335ml\310?\371XB\254\331\234\312?r\306\31562\313\314?\023\271\344\362K\367\316?\210\006\223\301}\220\320?-\2162\335\n\244\321?\307\325\203\3177\266\322?L\351/7\357\306\323?\325\315\000\320\033\326\324?\372\013\212t\250\343\325?>\323\316\037\200\357\326?\200\226\345\356\215\371\327?\246\377\230\"\275\001\331?\311\032\006!\371\007\332?V\2307w-\f\333?\310\005\276\332E\016\334?\376\335D+.\016\335?rP$t\322\013\336?\361\240\357\355\036\007\337?\001\000\000\000\000\000\340?\023\337\375 1{\340?(\335\254>\031\365\340?\031wp\327\256m\341?\024\375\021\204\350\344\341?xI|\370\274Z\342?\\Zu\004#\317\342?\263\276U\224\021B\343?;\311\275\261\177\263\343?\276zH\204d#\344?\034\026<R\267\221\344?\322O8\201o\376\344?\324\013\342\226\204i\345?,\234\2149\356\322\345?\020s\3400\244:\346?\313;\177f\236\240\346?6M\245\346\324\004\347?\204i\310\340?g\347?\302\2763\250\327\307\347?6\034\241\264\224&\350?7P\317\242o\203\350?%\243\0255a\336\350?\322c\364Sb7\351?\024z\242\016l\216\351?\247\364\227\233w\343\351?E\207\025Y~6\352?\246\356\250\315y\207\352?\334/\256\250c\326\352?E\251\315\3025#\353?\334\352v\036\352m\353?\250LX\350z\266\353?\3079\323w\342\374\353?\007'mO\033A\354?l,=\035 \203\354?\3108V\273\353\302\354?h\327-0y\000\355?\226\177\377\256\303;\355?nf,\230\306t\355?W\313\227y}\253\355?\003\270\377\016\344\337\355?\034-RB\366\021\356?\313\264\376+\260A\356?\377TD\023\016o\356?\036\333{n\f\232\356?\200{^\343\247\302\356?\025\277HG\335\350\356?%\272y\237\251\f\357?\016\207N!\n.\357?\177\000z2\374L\357?\302\2668i}i\357?\027\034\201\214\213\203\357?[\344/\224$\233\357?y\2240\251F\260\357?\214>\242%\360\302\357?\306g\370\224\037\323\357?\242\025\030\264\323\340\357?\366\377pq\013\354\357?\035\346\022\355\305\364\357?g\005\277x\002\373\357?\212\257\365\227\300\376\357?\000\000\000\000\000\000\360?\212\257\365\227\300\376\357?g\005\277x\002\373\357?\035\346\022\355\305\364\357?\367\377pq\013\354\357?"
	.size	.Lstrglobal_fkappsraycasterrcmath_mrccos_l21_n3672, 2921

	.type	.Lstrglobal_fkappsraycasterrcrots_mrcrot_get___l9_n3684,@object # @strglobal_fkappsraycasterrcrots_mrcrot_get___l9_n3684
	.align	16
.Lstrglobal_fkappsraycasterrcrots_mrcrot_get___l9_n3684:
	.asciz	"\000\000\000\000\000\000\360?\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\037\205\353Q\270\036\345?\315>\005KE\320\357?~\302\275\370\"\230\273?^\000s\205T6\262\277\273\2121\3717\377\344?(\364~\215\243A\357?\027&\005\205\372n\313?\361e\203v*\033\302\277\350\226\240\347\024\241\344?\263l\357B\304U\356?\350\366\252\266\006`\324?2'\366\224'\345\312\277\201\275\274\356g\005\344?xq\261\013g\017\355?\024\033UT\310\313\332?\215\331\177\333t\257\321\277\344\312<s\001.\343?=~\376yYr\353?\302\027\273R\315s\340?\217R\206%\224\267\325\277QS\267\003d\035\342?\203p\260\271k\203\351?\262\034\335S\242P\343?y\277\236\300\352~\331\277\346\272\325\333\274\326\340?lH\2264bH\347?\341\341O\024\331\363\345?\363\366T\0063\372\334\277\231_\306\324\264\273\336?\233\3160^\344\307\344?\357\032\f\\\223U\350?\371D\351\030\205\017\340\277\316\276\370\354An\333?\022g)\332h\t\342?\241\311\330L\266n\352?\337Q\231\255\007r\341\277\334T~\013\373\316\327?\303jsq>*\336?=\272 \224\3778\354?\217\353\315\270\177\240\342\277d\030\036U\256\350\323?\261\336\334\026\257\347\327?\025\346\316\026\030\257\355?jZU\360f\227\343\277|\021\017\231\373\215\317?\221\251:6\320]\321?\274\003\177\337\243\314\356?c\324\323\313\334S\344\277\244\254W=y\354\306?\226?\3525F@\305?)\261|\037O\216\357?\331\306\346\031\257\323\344\277\376*^z)\r\274?\242\331A\326\034\026\256?\204\213\306\033\330\361\357?]=6\215`\025\345\277\034M\317\363d\333\243?z0:5\237.\251\277\375'y\350\025\366\357?'\220\351--\030\345\277\207\342\272<\305\236\240\277P\373\215\034\017\n\304\277\224\324\214\336\373\232\357?b:>\242\f\334\344\277f\223\027\214\255s\272\277+R\347\203W\306\320\277\214\343\223\301\231\341\356?v\367pG\262a\344\2778b\b\000\210$\306\277\232\223\374\030\235U\327\277\030\352\b\225\030\314\355?\361\327\256\032\213\252\343\277\216\341a\207+\315\316\277\315Qe\345F\237\335\277\223P\237*\264]\354?\200mJx\271\270\342\277\022d\256x\366\214\323\277\327\367q\223I\310\341\277\021Z\317|\261\232\352? \003\345\275\016\217\341\277\300\340\323\365\004y\327\277\001\352\224\332\343\213\344\277{8d\362Q\210\350?\\\323\211\342\0021\340\277!?\f\f\016\037\333\277|4\305q3\022\347\277\221Z\n\261\303,\346?\350\006\235;TE\335\277\271\2027m/t\336\277_\353JY\260S\351\277hc\242-\017\217\343?\177d\255yQ\321\331\277x \371\021<\267\340\277\306\332m\337\237I\353\277\201\372W1\002\267\340?M\273\r\223J\020\326\277'\006\264\035\203\002\342\277\252\003f\263(\356\354\277\022\247$$1Z\333?W\034jZr\r\322\277\360\355\\\237\020\030\343\277\356Z\371Wd<\356\277\356\224`\307\305\364\324?\031\260\262\362\177\251\313\277\223~v\240\250\364\343\277n\201\272\301m0\357\277d\025;\266\255\241\314?bod}\226\345\302\277\361@W\024\271\225\344\277\347\007M\365l\307\357\277le\035\250\315\b\276?\352\302\2426\234\322\263\277i\270-\203a\371\344\277\360\302\006\203\237\377\357\2770L\262l<\245\203?@d\302p\227\356y\277\306\005G\243x\036\345\277\355\007\240\306]\330\357\277&c\003\341\321&\271\277\r[\007\000\237\231\260?\033\200\344\317\217\004\345\277\224}J\333\034R\357\277X\253\250\343\241;\312\277s\0007?QP\301?\204\303JS\364\253\344\277O\261Z>mn\356\277\254x\247\306\314\312\323\277\34289\006- \312?\372\2351\200\256\025\344\277\345\213\226$\366/\355\277\346\332\206\354\275<\332\277\022*\265\265\fQ\321?\001\244D\235~C\343\277\371\203\024\220m\232\353\277h\204\314<50\340\277\261\000\345\300Z^\325?\211\224\344\253\3277\342\277\007\252G>\215\262\351\277)\024l\377\300\021\343\277\356\322\352F\352+\331?\210\250\276\031\330\365\340\277ix>\217\004~\347\277C&\007\025j\272\345\2779Q\204\021c\256\334?\342\307\n\346\200\002\337\277\025\236!\220g\003\345\277e\216-\006B\"\350\277\217Uo\351L\333\337?!\345\027b\320\274\333\277v\325\211[\033J\342\277l\247&\266\033B\352\277V\022\334h\227T\341?d\212O\215a$\330\277\220\222m\024\200\264\336\277\242K3\313\240\023\354\277\023\016\325\244\325\207\342?\326e\366!\356C\324\277\341\262\352\3530y\330\277P\370(\226d\221\355\277 \256\213\240\314\203\343?\221a/\260\006'\320\277\276'\007.\340\364\321\277\244*\001A\364\266\356\277vTC\272\214E\344?\312\303\301<\340\263\307\277\364\026\244'\375u\306\277x\\\027\024\344\200\357\277\007\275\307\370\323\312\344?\f\353\220>\374\245\275\277\2329\316\203r~\261\277\350_\177\252\331\354\357\277\333\201\221\307\024\022\345?j`l\353\214\027\247\277\376\257\305\267\211F\244?\037H\003\367\222\371\357\277\217\330\311\230z\032\345?$Yk\226\202\303\232?u\355P*_\323\302? L\330\004\352\246\357\277g\216[_\354\343\344?\002%#\031\222\331\270?Sn\200\250y.\320?}\305\330h\325\365\356\277\006\312\255\331\fo\344?\210\f\225:\021\\\305?\232\263*c\376\302\326?d\207\361ae\350\355\277)\246)\2548\275\343?k\245\031\266\241\013\316?%\003N\266\234\023\335?U\324T\261\275\201\354\277\017\3362Q\202\320\342?!\331\302\265\3100\323?\330\330\033\020\277\206\341?%\261\317<\f\306\352\277e\t\262\352\253\253\341??\036\264R\201\"\327?\215\260%ogO\344?x\0052\227|\272\350\277\234\003\241\007\037R\340?uO\364\2346\317\332?\344\003\213\215y\333\346?\035S\372\223(e\346\277\266mJ\354\304\217\335?\225B\255^\362+\336?\2530\360<\\#\351?\2525G\024\006\315\343\277\364\313*\201\034#\332?>\245#zV\227\340?\302Q\372\265A \353?R\004YC\322\371\340\277\004\276\177\362{h\326?\302\002\362\2335\347\341?<\375-\344;\314\354?VI(\001\365\347\333\277<\324\244\373\002k\322?\222d\365\245\254\001\343?^0~\026N\"\356?\244\030\304w\006\211\325\277\314\001_\1771m\314?Q\206]\372p\343\343?\367X\306\337{\036\357?\240\273\273=\264\323\315\277\033\335$\217\220\257\303?\351m\356\035\341\211\344?\340{\316\372\324\275\357?\032\201\t\234a<\300\277\3049T]ln\265?;f\r\221\f\363\344?1\353`\016~\376\357?\360\270C0\001\245\223\277\260\215\265?I\356\211?\373\220\331\230\271\035\345?\301AK7\266\337\357?\357\026\351\033\351\264\266?F\036q\276\n\371\255\277Z\324\r\347h\t\345?'\236\304G\331a\357?\310\017\232\017\253\007\311?\356\365\306\236\017\205\300\277\345S\304\025W\266\344?t\246\204\265^\206\356?\327O?{\0335\323?\307\317]\352\224Z\311\277\320\226\256\362{%\344?Ym\2749\325O\355?*\232UK\025\255\331?aV\\\"<\362\320\277S\244\335\233\207X\343?q[\376/\333\301\353?>wY\016w\330\337?!\f;\177\240\004\325\277X<\267v\335Q\342?gZ\327\312\023\341\351?Cj\202\253l\322\342?\261\311\034\001R\330\330\2778~\035\020\215\024\341?\277\266L>\031\263\347?P\276\212\rx\200\345?3\373Z&\346a\334\277\235W\023\366\221H\337?\360T\203\tl>\345?\323kA&_\356\347?\377\325j\204\317\226\337\277\240[\255\221\267\n\334?x\343j\221_\212\342?|\340\264\305\342\024\352?\230\3214\241\2766\341\277\260iEx6y\330?\340\020\222\214\b>\337?\004\2373\261\230\355\353?/\363\034\321\273n\342\277r\303\357\270\263\236\324?\351\210\252*\037\n\331?z\"4\306\376r\355?\022\317\210\241\274o\343\277n\b\205+\256\206\320?\340\020Q\334\203\213\322?\021r\341h\213\240\356?\217\254\017i\3026\344\277\274*\307K\270z\310?}\264\376\245,\253\307?|\351G\r\273r\357?\332\017It{\301\344\277q\370E7\034>\277?I\365'\035m\361\263?\210N\301\262\032\347\357?\017\276\333\360I\016\345\277X\264]\241)S\252?l\275p\351\363\273\236\277 U[2O\374\357?s\231\364\277H\034\345\277\354IEM\331H\224\277\346~\315\260=\234\301\277\202\002mJ\031\262\357?\221\323\302!N\353\344\277\270\332\250\312\340>\267\2776\257\266ot,\317\277p\264I[V\t\357?\256\220\0022\354{\344\277|\027\344\245\031\223\304\277\244\273\230i\326/\326\277w\344\336\322\375\003\356?\017x\"4o\317\343\277\260\367X\264bI\315\277\364\177m.C\207\334\277\016\242\356N\033\245\354?\265`\030\264\331\347\342\277\246\007>8'\324\322\277\222\ff\333\312D\341\277,\254f\207\305\360\352?\007\330q\207\336\307\341\277\364\237\330+r\313\326\277X\031\246\210p\022\344\277\027\315\355\033\022\354\350?FY\203\300\330r\340\277\262+-\201\275~\332\277*\205\356\3215\244\346\277\206\375\ti\006\235\346?R\226sW\203\331\335\277\3474\312\\\377\342\335\2779g\022\210p\362\350\277\331,\036\222\205\n\344?D\351\325\351It\332\277s\374\257\324\fw\340\277\016\372\033\367?\366\352\277\327\353\323\365;<\341?\212A\0030&\300\326\277\255\225\027#|\313\341\277:5\237j\241\251\354\277z\205u\224\020u\334?qg\361\212$\310\322\277\317\352\f\016\326\352\342\277\2748\317\033\202\007\356\277\357d\313I\305\034\326?\304G\331\23670\315\277\3154Fd\301\321\343\277\232\360\331S\316\013\357\277\b\232\t\346\006\005\317?2\250\276\351\023y\304\277yf\322K\215}\344\277\367hd\225}\263\357\277\026\311\351z\372s\301?p\340\025F\273\t\267\277\351\265\377H9\354\344\277\213\t\340\250\233\374\357\277\310]\266\262\355v\235?\234\341c3Ur\223\277}9#7{\034\345\277m\350\272pN\346\357\277\240^\374gwB\264\277\216\026v\274\"\276\252?\203\036q!\303\r\345\277\231\341\007t\330p\357\277\004\302\007J\035\323\307\277\315G\341\275\324r\277?\002\232k\360<\300\344\277\316|\t\030\230\235\356\277\275z+[\366\236\322\277\362\363\373\350c\224\310?\257\212\347\346\3174\344\277\221\245\357\212\003o\355\277\3028\027\323\321\034\331\277\006h=]\005\223\320?\336\206-\360\033m\343\277`M\366k\241\350\353\277\222\342\221\227\303O\337\277\031\330\242}g\252\324?\212GA\307tk\342\277\304\316\314F\376\016\352\277\205\276\b\326\246\222\342\277\3548S\347#\204\330?\360\234\304\005\3332\341\277\362M\246\001\237\347\347\277PqK[\004F\345\277}\347\033\022\276\024\334?\340fV^\346\215\337\277\340 nf\360x\345\277I9.\365\353\271\347\277\030`\314\237\223Q\337?\213\207\355\245\365W\334\277\032T=\3703\312\342\2775Q:\214\f\347\351\277\216^\241\n~\030\341?f\325\313\314w\315\330\277\327\324{\234\324\306\337\277\231_{+\350\306\353\277`\240\004\3252U\342?\017\246\243\366\374\370\324\277L\340\032iv\232\331\277\335\262@^\347S\355\277\317kIl7[\343?Lu\260\375\361\345\320\2774\260\251\264\267!\323\277_\364C\336i\211\356\277>Jj1~'\344?ncF\273\374@\311\277\315!nh\315\337\310\277\227\033s`\324c\357\277\343\331\306\304\245\267\344?\324\330\244\343\277j\300\277%K-r\357c\266\277X\0073W\233\340\357\277S\231\363\037\000\n\345?\266\252\266\226'\216\255\2770=\217\013\033\352\224?\207\215\002\212J\376\357\277\013\316\206\230\227\035\345?\310\267-ak\233\213?\244\272J\004\262d\300?\251\371\327k\211\274\357\277\331\322\357\2741\362\344?\023gXM\243\243\265?8\3023\2209\373\315?\227\252H#\034\034\357\277\005\256\316\002P\210\344?\210\270\344\375\245\311\303?4\357\263\243(\234\325?x\320fA\341\036\356\277\177\333\303D.\341\343?\r\035\207\025s\206\314?\2247%\234=\372\333?\265\313&.\314\307\354\277<S8\024\277\376\342?@g\274.\024w\322??\367\f\203n\002\341?\026\326\356Z\334\032\353\277\013\203\030\352\245\343\341?\234PD\216\331s\326?\202\272\273\226\000\325\343?\314'\223U\021\035\351\277\357\341\326G/\223\340?\254\n\002\236\244-\332?\311\3075\214il\346?\376\375Q\337[\324\346\277T\375a\300\215\"\336?\2550z\037X\231\335?\006\351\265a\356\300\350?\346\373I4\214G\344\277\0018$\312\327\304\332?\2048T\344_V\340?\305h%\240\233\313\352?\204\304G\270=~\341\277\333\027\356:G\027\327?O!VZW\257\341?6\315f\027Z\206\354?\353\273\030\213\200\001\335\277]\013\257\326\324$\323?\366r]a\215\323\342?k\242\205\t\001\354\355?R\211{\302\376\257\326\277\310w\t\271\215\362\315?\3412\330H\232\277\343?\330s\230\216e\370\356?\016\365\361>\317\032\320\277\022\264\367\315\033B\305?\360`Z\350\275p\344?\026\366k\003g\250\357?\330z\230\031*\253\302\277\325\227\201@\177\244\270?\211\247-\324\347\344\344?\3656\341]\370\371\357?\202\022\271B\024\244\243\2770\306\b\201\020\355\231?n\000\244\205\275\032\345?\342 *K&\354\357?>\201\004\207\213\317\261?\314\201\310t\231\202\247\2779\001\317d\236\021\345?+\033\244\005\032\177\357?\245t\256\327\377\235\306?\234\\\224\227\314\332\275\277i&\220\247\245\311\344?\310~\333\331\030\264\356?l|\337\357`\b\322?\300\270E\255\236\315\307\277\340\006m\000\252C\344?\263\300&\\\200\215\355?MZ\307\351\366\213\330?`\261\210\244j3\320\277\251\223\031\036;\201\343?\252\025(Z\277\016\354?\310\323\242MS\306\336?d%3\334\261O\324\277\224\357.\003\235\204\342?\337zB\235K<\352?l0\224\377pR\342?\356?4\365a/\330\277\211\216\363C\301P\341?\025k\216\234\224\033\350?\355\373\307^\020\013\345?\0238\022\246\354\306\333\277\374\375\273||\322\337?\013\303\376E\363\262\345?\002\313@\257\351\204\347?9\026\030\335\232\013\337\277\016\233\b\315\210\244\334?\003.\024\017\227\t\343?\274X\"\036\232\270\351?~\214\221[\326\371\340\277\234\267\310\216#!\331?F\377\232\205p'\340?r\342[#\220\237\353?\237q\211J;;\342\277pe\231\272\307R\325?\312\325\310@3*\332?\354\362\315\031\0374\355?\332\013\215|=F\343\277\223\2412\350\317D\321?\f\276D-x\267\323?\210\235\246,\220q\356?\344\271co\300\027\344\277\n.\230\337\250\006\312?\261*\303)\330\023\312?\246cug0T\357?r\t\220%S\255\344\277yT\354\252\0166\301?j\253\262\300\352\325\270?\357o\003\277[\331\357?\364w\265n7\005\345\277t\000$\2509d\260?\220\266^\033\210/\206\277\245h\005\362\204\377\357?v+\235\032g\036\345\277P\020TW\373H}\277\3116 \367\206Y\276\277x\341&*:\306\357?\354\031W\007\227\370\344\277\204\334.Q\343\007\264\277\314m)\343I\311\314\277\275V\240O&.\357?\256vZ\0018\224\344\277\024br\001\273\377\302\277\344p\020\214\370\007\325\277\304\256b\013\0179\356?\200\317\bsu\362\343\277\021l4q\327\302\313\277\260\027\344Q\217l\333\277\323\036\311}\317\351\354?\224\236\177\3471\025\343\277\\.\207\312\221\031\322\277_\000A\227\253\277\340\277$y\226\271OD\353?\226\300 k\001\377\341\277\372\0247\212\271\033\326\277& \346\013\031\227\343\277v\006\250\034yM\351?L\333\227\332!\263\340\277\217\257\201\334\355\333\331\277`B\336\f\0264\346\277\206Z!\251'\013\347?\255\252\234n\342j\336\2777\361\347b\376N\335\277\032Pj\364\326\216\350\277\276+\306\212\030\204\344?\366CM<\304\024\333\277\3364\035nP5\340\277\220\271=\262U\240\352\277\302m\246\374\325\277\341?$r\321\005\335m\327\277\253-f\353\307\222\341\277\324FD\277fb\354\277p5)\226A\215\335?j\377\347\257\021\201\323\277\020\347P,\323\273\342\277\343\257~\205\313\317\355\277\340\276\375i\257B\327?*\006\3759/\264\316\277\366\356\213\025\374\254\343\277\211\034\016\005B\344\356\277\215\3768\354\271\262\320?\262n~\177\243\n\306\277\350\300\306@sc\344\277\263*\303\207\221\234\357\277\270=y#\351\341\303?\371\023w\237\256>\272\277K!\271^\030\335\344\277\004\320L=\224\366\357\277>\3243:;\214\250?N\304\344\272\2273\240\277\000\250\333\216\200\030\345\277\242(\\\243=\361\357\277\022\035S{h\270\256\277\264\320\337e\202F\244?\343\310\345\231\372\024\345\277\364\206\240\246\235\214\357\2776I\255\000Zh\305\277:#Kg\020B\274?\0320t\002\221\322\344\277\t]Fs\340\311\356\277_\bt\305^q\321\277L\025\353\345I\006\307?\230p\256\345\tR\344\2771\265\206\365J\253\355\277\260\347\362\370\207\372\327\277\375\215\222q\334\246\317?\016\214I\254\344\224\343\277ie\266\02444\354\277\250\211_m)<\336\277AA\362\275\201\364\323?(M\312\222U\235\342\277\350~\006\275\372h\352\277-P]\253\314\021\342\277\312\222\341)\016\332\327?\276S[\026?n\341\277\343\223\255\325\370N\350\277x\302\204{\235\317\344\277^H\206\267sx\333?Z\327\323Y)\013\340\277 \340^Js\354\345\277\352\317$\224YO\347\277p\022E\342\346\304\336?7\21659o\360\334\277\323\314\255W\207H\343\277\374U\206\223\214\211\351\277\323\346\342L\310\332\340?\334\371\247\3057t\331\277\002\247'R\025k\340\277k\247\030\206\221w\353\277\272xC\316\325 \342?\240\017S\347\021\254\325\277\301\244\344NR\271\332\277\177\274\205\270\246\023\355\277[%\323P\3170\343?\216\020\363\256E\243\321\277i\266\r\277\301L\324\277\343\341\335\343\376X\356\277z{\351\201\211\007\344?N\263\253\020\270\313\312\277d5W\250EG\313\277\b\302\240\200\317C\357\277\356\372\344\324\203\242\344?\354\301l\247\365\000\302\277T\314\272IPG\273\277/\267\350\025\\\321\357\277J\337\372\371\357\377\344?\205\245\212\253\374\000\262\277\200\266\"\251\242RT?\242\336\373b\376\377\357\277^PTA\267\036\345?\200\316V\215z\323J?^\222r\337\362\350\273?a\223\351J+\317\357\277\275\365f\332}\376\344?\355A<\211\252k\262?L_\213\235\254\226\313?\373\306\206st?\357\277\365\363\330\345\243\237\344?P%8r]5\302?\233GT\240Is\324?\316H\363\222\206R\356\277\244I\277VD\003\344?\370\233\376b\224\376\312?\220\203\022\246;\336\332?\036\022\270p$\013\355\277x\367\215\2461+\343?d\031\207?\242\273\321?V%\235\252\203|\340?\234\231e\251\036m\353\277#\333\217e\360\031\342?>Z!3\024\303\325?\b\022v]\273X\343?N\250CMH}\351\277<K\035\270\257\322\340?\232\344r)\233\211\331?\202\345\224\247<\373\345?WW\005|hA\347\277\376\221\362\255\177\262\336?\226\237r\347\363\003\335?\031nCn+\\\350?\256\306o()\300\344\277\271\032V^\rd\333?\237\361i9\337\023\340?\350\177Z2ot\352?\177\363]7\003\001\342\277hA\206\206\345\303\327?\345h\203\202\316u\341?\322\200\004;\310=\354?\225\026\335jP\030\336\277\333\267^\352\330\334\323?#\332\375\375\247\243\342?y\317\3279\342\262\355?oR\264\313\323\324\327\277G\201\002\222\027u\317?\355\b\250:\347\231\343?\fq\2550d\317\356?\242@\267\346?J\321\277\214_\006E\246\322\306?{E?\245\255U\344?\231[\307i\375\217\357?H\245\226F0\030\305\277S6V\271?\330\273?g\345\273\027\313\324\344?\000\025\226[o\362\357?\254\t\216(\316s\255\277\202\213*\201Ep\243??tI`\304\025\345?D*\235Z\224\365\357?\330\2366\246\000\321\251?\fs\212\021\361\t\241\277\013\370q\254\327\027\345?g\320}\005c\231\357?\177\346Y\02032\304?\362N\347\315\251\250\272\277\320\352M\313\376\332\344?\347`\362`\356\336\356?5\236\221j\363\331\320?\332\247\375Dj>\306\2779!\374?\357_\344?\2258g\243b\310\355?({\243m\210h\327?\276\325\256\271$\346\316\277\235\206*$\030\250\343?)M\300\271\376X\354?\210r\3727I\261\335?\236\"\311H\331\230\323\277=\353\376\340\235\265\342?\375\026\241\230\n\225\352?\221\3776_\273\320\341?\rp\354\207*\204\327\277\246\243\"\313S\213\341?W\b\031w\312\201\350?\362p\003\030\255\223\344?O\237\262\037U)\333\277X)\001\265\263,\340?\003>\315\030o%\346?\331I\335\346<\031\347?\361u\263Yy}\336\277\357\377\274 \247;\335?M\342|V\003\207\343?\204\016'\b\345Y\351?_V\334\231T\273\340\277(hg|\262\306\331?g\273\366\033W\256\340?Z\302\341D\355N\353?\021\315a\377\002\006\342\277\222*Zb\331\004\326?\\\022V4\320G\333?\004\3667\376~\362\354?\\\"Xj\355\032\343\277\216IM\030Q\001\322?\337\036\275\345\220\341\324?\313Z\021\230\266?\356?&\306\303\312\331\366\343\277d\231\"\252%\220\313?\330\0048\246\016z\314?\327\215\272\016\2622\357?q\001\366\0238\227\344\277^_\213\021p\313\302?\227\226\317Q\021\270\275?\257M\037\214\234\310\357?\276\307\231\341)\372\344\277\033+e\034S\235\263? \247\347\302\356\032\201?'\225\t\332\266\377\357?n\342\310\n\210\036\345\277pb\313\3540\224v?E\223\023x\266w\271\277\311r3\230\\\327\357?\033[\210\022\346\003\345\277X\024i\253\002\317\260\277\235#d\370hc\312\277\301\370\237&\006P\357?\316\224ik\223\252\344\277\376\002\224\024\222j\301\277\207Q\"a\037\336\323\277\037\206\204>Gk\356?m\252\212\212\232\023\344\277\360\372t\212\2569\312\277\2533\376\362EO\332\277f\232\361=\312+\355?\332\016\271\314\275@\343\277\024\"7\304G]\321\277\204}\035R\3708\340\2771\331C4H\225\353?u\224\3716r4\342\277.\221\227\237\353i\325\277U\310\204\003\351\031\343\2774{\025\307}\254\351?\240\211\035\"\330\361\340\277t\337Hu\2566\331\277L\033.\263\336\301\345\277\223?\321\020\035w\347?\006\331\204\316c\371\336\277\272B\243q:\270\334\277\213.\322\000\355(\350\277L\362\r\243\274\373\344?8\246\034R\261\262\333\277\207\302\315\037\032\344\337\277Z\2419)\351G\352\277\235\337a\337\303A\342?R\2039\266^\031\330\277\217\230h\316kX\341\277\237\233|g\177\030\354\277\005:\235\302\251\242\336?5\370\232\\(8\324\277B)$h\f\213\342\277~\231\352\324E\225\355\277<{Ovhf\330?\247\211\342\032\241\032\320\277\371\254>+\\\206\343\277\335gL\217\314\271\356\277\251U\251\234]\341\321?F\244dh\037\232\307\277\322%\321hmG\344\277\210|S\365\252\202\357\2772V\3163\370M\306?\022S9\350(q\275\277\005vF1\000\314\344\277\226\256\272\321\211\355\357\277\252\201\003\275W-\261?\206c\372\r~\254\246\277\236\331k\n\211\022\345\277\241\366\302V*\371\357\2772Op!\375\350\244\277jh\360\370\361\231\233?|\301.\2135\032\345\277\303\3757\325i\245\357\277\234{\024U\222\373\302\277\271<Np\242\016\271?P\313H\317\356\342\344\277m\204\347#B\363\356\277\370\025[p\"B\320\277\247d\324\177\004v\305?\376p\211\273Ym\344\277\350\372V\266\306\344\355\277R\267J\270\373\325\326\277<\323\225\253\262$\316?\021\272\361\021\325\272\343\277\022\217fk\036}\354\277\271\213\361\362\265%\335\277\315uv\245\272<\323?\360I][u\315\342\277<\364Z&z\300\352\277!C\205\243>\217\341\277\216\201I\025\271-\327?\021\034\352\262\376\247\341\277\254\017ZN\b\264\350\277\031\211\272\235@W\344\277n\311\270\273\222\331\332?\"\327\241\205\334M\340\277\372\356\245Y\345]\346\277\250\361\274\355\224\342\346\277\257]\"\362S5\336?\374\375\003\276.\206\335\277Lg\261\222\t\305\343\277]\377e\233\244)\351\277\343\267)\000|\233\340?\026~\242\301\221\030\332\277\020,pM4\361\340\277\233,\316T\244%\353\277\202\313\246\177\303\352\341?\032cL\024\034]\326\277\235\302\320\225\251\325\333\277\252\365\325\262\250\320\354\277TU\022M\230\004\343?\375B\036\355\357^\322\277\332\273\355\037\342u\325\277'I\270\341\267%\356\277\203:\223\256\261\345\343?.\002m\013\355S\314\277:eS\351+\254\315\277D!\371x\330 \357\277\240\335\341&p\213\344?1)<$y\225\303\277\342~\255\220\017\024\300\277\330\302hV\035\277\357\277\277\334cH\345\363\344?\3226\030D39\265\277\200\362\337Y\345_\222\277\240\360\335X\256\376\357\277\256\231\027x\331\035\345?\020\356\337\200$A\210\277IE\201{\340\005\267??\262\234\340\315\336\357\277O\275\037\217\317\b\345?\361ow\340\352c\256?;\230\2510\206/\311?0N\000\005\333_\357\2770\315\031P\006\265\344?&,z\257]\237\300?\317$\005R}H\323?\210\n\321xP\203\356\277\211 \346\253w#\344?\274\214\374\212*t\311?\220\375\305\226\261\277\331?\312\346\223 \300K\355\277\350\261\017\330\325U\343?W'\227\221\204\376\320?\370_+J\026\352\337?\026C\376g\313\274\353\277\020\371\203?\206N\342?^\226E\351A\020\325?\201\017\353x\243\332\342?g\346km\030\333\351\277\344\273\262\\\232\020\341?T\217\027\264)\343\330?\350\263\235\211\375\207\345?Z\032\246#D\254\347\277\t\004\321$\215?\337?j\026\"\312\323k\334?\"d\035\341\034\365\347?\342wZ\223\3216\345\277#\360b=\256\000\334?\364P\022{\265\237\337?\000\031[\243\304\032\352?@|4n\026\202\342\277\007{x\221Fn\330?\001|K\200\240:\341?\234\305\204%\215\362\353?\271\361\030[J,\337\277\365\334\366\337\375\222\324?\245\214)\377\000r\342?\322\264H\t\367v\355?\266\035\342\373i\367\330\277\337\3643OUz\320?\271\335*][r\343?\301p!\243{\243\356?\264\241\300~\017x\322\277\213Z\2546\na\310?R\034m\341\2628\344?\304V\276z\232t\357?\"\032\375\2369\203\307\277\347_/\212`\t\277?S\347^\340\267\302\344?\036\027B\275\343\347\357?,\225\206\317`\240\263\277\230\343\273\336-\350\251?z\031\300\240\316\016\345?\231\242-\202\377\373\357?\212\323g\203{\000\240?\372\f\211[[\037\225\277jp\326'\024\034\345?\215@H\315\261\260\357?\244\260\033 \177\304\301?l\312.\367\003t\267\277\361\271\206\336`\352\344?\022p\220A\333\006\357?\326:\260\324\336S\317?\r1\357N\035\255\304\277X\260n\007Iz\344?\266\310\037\203v\000\356?\240\211\255L\345B\326?[\324\332\325\212b\315\277\2467\237\004\033\315\343?\346\330\320O\222\240\354?\004\247\372\347r\231\334?,\227\201\377'\340\322\277\262Q\036r\333\344\342?!\177C`H\353\352?\330\0034\003XM\341?\344\250D\333\273\326\326\277@c\320 ?\304\341?t0u,\261\345\350?\226\336\fyY\032\344?\214\033\226l.\211\332\277 \374\275\003\243n\340?\357ij\270\324\225\346?K\207^\362b\253\346?\314\274\245^x\354\335\277\304\264\226O\004\320\335?\020|A\226\230\002\344?\374\227>p\314\370\350?Kd\327??{\340\277\237\036\236\247\323i\332?Q\214ZS\2533\341?\004\377\325\256\267\373\352?\003Gd\363\027\317\341\277\330)\350\350\327\264\326?Jv\350\033\333b\334?\240\313m\242$\256\354?i\335\256\177\320\355\342\277\263\276\321\370\037\274\322?K\2641\357\261\t\326?\t\376\225]\003\013\356?\315\203\316\224\021\324\343\277\030s\345\227\t\027\315?\234\300\242;\226\335\316?2k\001+C\016\357?\343\"\264T,\177\344\277\330\235\036\035\f_\304?*\340\177\202\265K\301?\303\206\n\256\336\264\357?\327\252%T\"\355\344\277\205\301\321n\223\324\266?\364\211f\203\3441\234?\025\n\264\345\344\374\357?\3259]\215\253\034\345\277\200<\206#\317\233\222?<\343\327\247\177\223\264\277k}C\367~\345\357?\301\322\2152:\r\345\277\362\260;%\031)\253\277.E\021\207\013\373\307\277\255\350.\257\362n\357?\311\243\346T\374\276\344\277ze\260\030\212\247\277\277\003\337Y\371f\262\322\277P\272\345\260\241\232\356?\362\372&[\3332\344\277\330\021\264\013\r\256\310\277\371\204E\363\201/\331\277\001\004\342W\005k\355?\252\331\\Iyj\343\277\320\205\036\343Z\237\320\277S\266Nz{a\337\277\232\000MV\247\343\353?8$\353\341+h\342\277\252\007\342,\031\266\324\277\267[8;\354\232\342\277]\377:'\027\t\352? B_\256\365.\341\2771\325\207\335\016\217\330\277Z\277\356\207\232M\345\277\340K\372s\334\340\347?\370\007\273\t\372\204\337\277Y\311\253\275\301\036\334\277/\201\232G\274\300\347\277\005;\n\225fq\345?\342M\332I\002N\334\277?\240\023!\222Z\337\277P\244\372\260\002\355\351\277\252\006\360_\371\301\342?\224\325<\030\233\302\330\277\241\237\330Km\034\341\277.\357\362Y\362\313\353\277J\256Y\366.\265\337?M\324\253PW\355\324\277\271\030\026Z\206X\342\277\002\242\267\215\366W\355\277\316y\366\361\324\207\331?\007\301\320$\246\331\320\277x\255\rI\345]\343\277zc\300\362q\214\356\2772\3128\000R\016\323?i\366J\000b'\311\277[`\345g~)\344\277\222\244\330N\314e\357\277\243\341*?\355\267\310?\220\005\273\200nP\300\277\314\237\377\\\362\270\344\277\200\350<@}\341\357\277|\"x\206\363\022\266?\3147\017tA#\255\277\241\314\3019\225\n\345\277r\t\310\313\023\376\357\277\340\202\372\3122/\226\277h\376\002\272\212H\215?\211\276\"ws\035\345\277\332\252\246\251:\273\357\277\356\205`\305\000\215\300\277#\027\307\016\330\330\265?N3!\314T\361\344\277\351]\275C\271\031\357\277\302M\277\334\273\"\316\277\234k\332m\271\343\303?\343\017\253\325\274\206\344\277\210\223\312bq\033\356\277\262X\317\241H\257\325\277\220`Y\313\261\237\314?\217\224\000\216\351\336\343\277\265\3452\221Y\303\354\277\241\226\357d\203\f\334\277\377|-\205#\203\322?Q\266&\230\317\373\342\277&\0037Dt\025\353\277\200\301\255\013\t\013\341\277\270\267t\3464\177\326?d:vj\024\340\341\277\275S\361\345\303\026\351\277\207\001A\031\371\334\343\277&^\030\027*8\332?\310\242\256i\006\217\340\277\326\217\311\343;\315\346\277\034\016\235A\250s\346\277\326\034\234V\350\242\335?\210\0053\030&\031\336\277\3627\362\355\256?\344\277s_?\255]\307\350\277\201\252M\033\237Z\340?\\5TDv\272\332\277\346\222\344\234\272u\341\277y\224\314O(\321\352\277\251\251w\001\001\263\341?\311<\031\317\n\f\327\277\2321%sa\357\334\277xs%\235\363\212\354\277Gz\216\213\226\326\342?\200\226o\t\337\030\323\277\221\243'\330\374\234\326\2773)\266\254\231\357\355\277\373\347\277\347\371\301\343?\267\244\354\266v\331\315\277\316M\2535#\007\320\277\375e\344\224\362\372\356\277\373\212c\347lr\344?\364p\232<$(\305\277\210\007\371&\363\202\302\277\315\220\314\320\340\251\357\277\267\273\245-\341\345\344?V\231\303\353io\270\277&\027\254\322\234\001\243\277\215\211R\213Z\372\357\277~y\266Q\376\032\345?\264Gh\316\233\026\231\277\256\356x\276\242 \262?\261\007\315\263o\353\357\277\241G0\342%\021\345?axC\237\243\355\247?\341\237\344?\000\306\306?\231\350'\312L}\357\277\375-\276=u\310\344?\030X\360\355\231\017\276?B\343:\340\337\033\322?H$%Z:\261\356\277\335\351~;\305A\344?\276\370W\267Z\347\307?\035\326\000n\272\236\330?\253fH'\231\211\355\277(\252*\244\247~\343?\306\241\256\366\314?\320?\371\334pl#\330\336?\032\366\330\024\333\t\354\277X\364\204\203b\201\342?\224\207!\212s[\324?\306\313\251\312\304Z\342?\241(#\337x6\352\277\262\025\022`\351L\341?\217\246\313\354_:\330?\207T;\016\267\022\345?t\"\241\304\344\024\350\277\367A\227\332\250\311\337?\302\242\006\035\006\321\333?L;&p\314\213\347?=\236\325Fz\253\345\277\271t.\245\253\232\334?`\323\301\262\261\024\337?mY\tf\244\276\351?u\322O3k\001\343\277\247\271\370MZ\026\331?j!/\347\322\375\340?\310f\225\355\257\244\353?\tFk-\252\036\340\277k\205\337\2152G\325?Z\257\220\022\235>\342?$m,\035E8\355?q\304\242\361\245\027\332\2770m\353\\\2218\321?\300fKj\372H\343?FT\027\t\260t\356?<\036\355\226!\244\323\277\030\204$\031\"\355\311?\251\216\353W\320\031\344?\314\021\353\312@V\357?\277\262\266\316\013\354\311\277e\334YZ\312\033\301?\240\006\026\342\257\256\344?\336\016D\201V\332\357?z\316I\037\001\205\270\277=Z!\251\322.\260?\273[\352\356\334\005\345?\3673\b'g\377\357?\300\177Z\215\321\271\210?\000+\371$\256Q\200\277\016\030\315pS\036\345?\266\311\313*\004\305\357?\332F\2646=\252\276?\267.\252f(=\264\277\rW*n\312\367\344?s\342\246\270\333+\357?\250\224\004)\343\360\314?\030b\022\233\335\031\303\277\275v&\333\264\222\344?\330`\243\262\2665\356?\\\037\3351)\033\325?B\244\031#,\334\313\277{\202\263B@\360\343?<\207\321]s\345\354?~@\272\273\352~\333?\365\220kg\257%\322\277\346I\nCQ\022\343?\211\303\344\323\374>\353?,6\322LS\310\340?L\024\257F&'\326\277\017\201\002\350}\373\341?\027\323\336R?G\351?\262\227x\360 \237\343?\323a\322\243\207\346\331\277\233l\"\364\005\257\340?\335\235\247\215\031\004\347?\236\365\213+f;\346?4D\244\225\245X\335\277\226\003\323^\222a\336?\022h`)K|\344?4\004\203|Y\225\350?\026;LW\2349\340\277\263A\177\261w\n\333?\021\213\256\233`\267\341?S\225Z8\367\245\352?c\006FS\177\226\341\277\371\035\005\271\262b\327?\001K\027L9{\335?\006\3555w\026g\354?\242O\302\374\352\276\342\2770\371\250\357*u\323?\360\230\217b\277/\327?\f\016it{\323\355?\266\306\202\024k\257\343\277\210:\005\324/\233\316?+\374\200\245\032\237\320?\306s\034+\347\346\356?\3577\320+2e\344\277(.\374\305\274\360\305?\030\f()\301\271\303?\035\353\367\000$\236\357?L\240\243\000\"\336\344\277\214\322]\r\255\t\272?lh\203\305\324\351\247?)e\013Y\017\367\357??\327?\317\321\030\345\277pu\255-\321\220\237?\257id\007\261Z\257\277\243\177f\362\237\360\357?|^b\206\222\024\345\277\202\022\217\314\235\261\244\277\3528\325\242k\220\305\277I\222^\377\350\212\357?&\372\200\321p\321\344\277\215\210\307z\364v\274\277#\210j\222\353\204\321\277\344\321J\354\031\307\356?^.\376\3624P\344\277\3208&<\030 \307\277/\352\017p^\r\330\277\224\\a\326z\247\355?\361`\305n`\222\343\277z\304\n\031\272\277\317\277\004\355\322\\\021N\336\277:HA\275e/\354?\254\257D\214)\232\342\277Y\356\251#S\000\324\277\r\034!\252.\032\342\277\210\232w\203<c\352?2\031+\275tj\341\277\311\032\222\340\036\345\327\277\354E\244\177T\327\344\2779O\322\333[H\350?\r*\232\374\313\006\340\277\177\217\367\274\242\202\333\277\234\032\375\231NV\347\277y\325\200J\013\345\345?\364u\020\201\250\346\334\277\025L\201\325\025\316\336\277\024''\332\252\217\351\277\365\\\271ij@\343?d\302\2429\202i\331\277\227f\334\n\322\336\340\277\367\\-\315\306|\353\277\312\342\303\251[b\340?@\246\260y\215\240\325\2772a\333\304E$\342\277ZF\307v\343\027\355\277\226\253\235\227\331\246\332?,C\033\273\024\227\321\2771\244\b?\2333\343\277\nNku6\\\356\277$\357m\273z9\324?F\325\257\330E\262\312\277N\200\016\020\251\t\344\277p!\264L\370E\357\277\252\203\202\013\216\037\313?\020\263\230\007\277\346\301\277O \201\255\360\243\344\277\300\337w\253o\322\357\277\227\002\220\332z\366\272?\255*\344\000\243\313\261\277\230e\260\334\245\000\345\277\003\244\357\213\371\377\357\277\340\234\325\242\241Rd\277\200\367\0313y\323Z?\207\315\216\017\264\036\345\277+$\262\025\016\316\357\277\3120\263\365\2779\274\2771\240\205\261\376\240\262?\253\344\255\235\301\375\344\277\266\232\3602B=\357\277\2521\351\355[\276\313\277A\265\346\227\216O\302?cG\263\3170\236\344\277/\037=\324EO\356\277Rt\030z\212\206\324\277\200\3024x\376\027\313?#W(\272\036\001\344\277\242\226\007\350\336\006\355\277\264\230@B\254\360\332\277Cy\316\331\315\307\321?\223?\017\353_(\343\277\345\370\324\024\341g\353\277\266\352\354X8\205\340\277LJ\373\016\222\316\325?c)&\364z\026\342\277.q\336N\"w\351\277j\244\247s\322`\343\277\335|\020\377H\224\331?\371+\"\342\240\316\340\277C\f&kl:\347\277\303.o\003\236\002\346\277\327\302\222\333\261\r\335?\332W\267nG\251\336\277\353<\t\333k\270\344\277DV\251\013\301b\350\277\273\205\345\2727\030\340?H\313\245\f\326Y\333\277\374\266\323\303\233\370\341\277\207\353\367l%z\352\277q\033\270\224\223y\341?\247v\027\234\315\270\327\277\222ak[_\006\336\277{<\346\b\216B\354\277\215\230\bb\316\246\342?o\227\345~\001\321\323\277\032\004`\031\366\301\327\277\235\236?^\251\266\355\277e\007\001\213e\234\343?\222a\357^0\\\317\277x\317\342\330\2556\321\277\364\237\212f!\322\356\277p\344\301q|W\344?-\312\221\377\320\270\306\277\222:\2756\030\360\304\277\325\"U\205\250\221\357\277\345\350\326\373\344\325\344?Y$\211)S\243\273\277(e\225\202|\321\254\277\253\204\273b\003\363\357\277\252\\\025\023&\026\345?\306\302\276\030$\005\243\277\316\202\311|_s\252?\362\346\305\223\017\365\357\277\317~}\n\200\027\345??\377\204.\033u\241?\366\324\320\372TZ\304?\322W\277\374\306\227\357\277\007h\003\332\356\331\344?\266\211\216_\243\335\272?j\265=\236\215\355\320?\323|n\343?\334\356\277\305\270\225**^\344?f\030\302KJX\306?&\026\nfq{\327?\230d\371\260\251\304\355\277\0053>2\243\245\343?\354;_\316\032\377\316?\370\266\027\214H\303\335?\035\311 mFT\354\2775\231\276f\200\262\342?ai\005\037\272\244\323?Z\211\033_+\331\341?\214\325D\006a\217\352\277\274Y\177\023\227\207\341?\\c\373\272M\217\327?\374\303HBt\233\344?^J1\203@{\350\277\243s\362\345b(\340?(\0277v\2313\333?\232\364\263\007D \347?\027&\344D\030\036\346\277\350\242A\023\3671\335?\272\275 3\300\206\336?P>\234(\027`\351?pPE\207\365~\343\277\r\345\301\345\020\274\331?\267\302\327qk\277\340?\234Pi\3517T\353?O\005\375W\252\245\340\277S\277C\371e\371\325?n\277\317\017\201\t\342?8\001\317]\322\366\354?T\304R\204l5\333\277\177\323i\005.\365\321?\325W'H\310\035\343?F\362T\313\005C\356?\214\330\025\351Y\316\324\277\272\230\022\232\310v\313?\207\020\270\361\b\371\343?>\370e6\3634\357?\006\000\037\267lR\314\277X8\212\300G\261\302?\225\031\020\000\265\230\344?\375\025\177\356\310\311\357?^\334Z\374Qg\275\277y\221\325\007\bh\263?\235\023\207\"\360\372\344?\257\204\013\367\312\377\357?0\306\"\277>!}\277\240Z\375!\3109s?\2673!Q\225\036\345?#\237\3273X\326\357?k\032\273}\230\310\271?\004\002\347\244d\004\261\277t&\2626:\003\345?\260\277\253I\354M\357?h\306\362c-\213\312?\340\253](\321\204\301\277\373\022\020n0\251\344?\205au-\036h\356?`\177\302\372o\361\323?\200\016\271i-S\312\277\351\202\244\216\204\021\344?\227\314Jf\233'\355?\026\204PR\313a\332?\n\322|\022\201i\321\277\017^1\013\373=\343?\244\267n\020 \220\353?\265\274\253\304\271A\340?o\210\206Uzu\325\277\b\035 \354\n1\342?\357<(\271k\246\351?p\277\213\032\017\"\343?p\362\314\030pA\331\277\342o\025u\326\355\340?\243Y\25343p\347?\361-\263\037Q\311\345?\225eg\354\016\302\334\277\307\212q\227C\360\336?\203\346R\230\017\364\344?N,\320\213\225/\350?\200\021\364\036\344\354\337\277\235\277%w\217\250\333?2\243\363\213j9\342?\345\237\345\365\263M\352?\256E6t>\\\341\277\301f\016qY\016\330?\325:\376Y\320\220\336?!R\206.[\035\354?\255J\311LA\216\342\277i\300P\215`,\324?"
	.size	.Lstrglobal_fkappsraycasterrcrots_mrcrot_get___l9_n3684, 11521

	.type	.Lstrglobal_fkappsraycasterrcmap_mget_map_l1_n3698,@object # @strglobal_fkappsraycasterrcmap_mget_map_l1_n3698
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsraycasterrcmap_mget_map_l1_n3698:
	.asciz	"#########################                      ##                      ##                      ##       #              ##                      ##                      ##              #       ##              #       ##              #       ##           #######    ##              #       ##              #       ##              #       ##                      ##                      ##                      ##                      ##                      ##    #############     ##                      ##                      ##                      #########################"
	.size	.Lstrglobal_fkappsraycasterrcmap_mget_map_l1_n3698, 577

	.type	.Lstrglobal_ffontfont_mget_font_l1_n3703,@object # @strglobal_ffontfont_mget_font_l1_n3703
	.align	16
.Lstrglobal_ffontfont_mget_font_l1_n3703:
	.asciz	"....................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................#.......#.......#.......#.......#...............#..............#.#.....#.#.....................................................#.#.....#.#...#######...#.#...#######...#.#.....#.#..............#......####...#.#......###......#.#...####......#.....................##..#...##.#......#......#.##...#..##....................##.....#.#......#......#.#....#...##..#...#....###.#.............#.......#........................................................#......#......#.......#.......#........#........#.............#........#........#.......#.......#......#......#................#....#..#..#..#.#.#....###....#.#.#..#..#..#....#...............#.......#.......#....#######....#.......#.......#...............................................##......##.......#......#............................#######............................................................................##......##.................#......#......#......#......#......#......#.................###....#...#...#...#...#.#.#...#...#...#...#....###..........         ..##... ...#... ...#... ...#... ...#... ..###..        ...###....#...#.......#......#......#......#......#####............###....#...#.......#.....##........#...#...#....###..............##.....#.#....#..#....#####......#.......#......###...........#####...#.......#.......####........#...#...#....###.............###....#...#...#.......####....#...#...#...#....###............#####.......#......#......#......#.......#.......#...............###....#...#...#...#....###....#...#...#...#....###.............###....#...#...#...#....####.......#...#...#....###......................##......##..............##......##..............................##......##..............##......##.......#......#........#......#......#......#........#........#........#...........................#######.........#######..........................#........#........#........#......#......#......#................###....#...#.......#......#......#...............#..............###....#...#...#.###...#.#.#...#.###...#........###.............###....#...#...#...#...#####...#...#...#...#...#...#...........####....#...#...#...#...####....#...#...#...#...####.............###....#...#...#.......#.......#.......#...#....###............####....#...#...#...#...#...#...#...#...#...#...####............#####...#.......#.......####....#.......#.......#####...........#####...#.......#.......#####...#.......#.......#................###....#...#...#.......#.###...#...#...#...#....###............#...#...#...#...#...#...#####...#...#...#...#...#...#............###......#.......#.......#.......#.......#......###..............###......#.......#.......#....#..#....#..#.....##.............#...#...#...#...#..#....###.....#..#....#...#...#...#............#.......#.......#.......#.......#.......#.......####..........#.....#.##...##.#.#.#.#.#..#..#.#.....#.#.....#.#.....#..........#...#...##..#...#.#.#...#.#.#...#..##...#...#...#...#............###....#...#...#...#...#...#...#...#...#...#....###.............###.....#..#....#..#....###.....#.......#.......#...............###....#...#...#...#...#...#...#...#...#...#....###.......##...####....#...#...#...#...####....#.#.....#..#....#...#............###....#...#...#........###........#...#...#....###............#####.....#.......#.......#.......#.......#.......#.............#...#...#...#...#...#...#...#...#...#...#...#....###............#...#...#...#...#...#....#.#.....#.#......#.......#............#.....#.#.....#.#.....#..#.#.#...#.#.#....#.#.....#.#............#...#...#...#....#.#......#......#.#....#...#...#...#...........#...#...#...#....#.#......#.......#.......#.......#.............#####.......#......#......#......#......#.......#####............###.....#.......#.......#.......#.......#.......###...........#........#........#........#........#........#........#...........###.......#.......#.......#.......#.......#.....###..............#......#.#....#...#..................................................................................................#######...#........#..............................................................###........#....####...#...#...#...#....###.#...........#.......#.......###.....#..#....#..#....#..#...#.##.............................###....#.......#.......#........###................#.......#.....###....#..#....#..#....#..#.....##.#...........................###....#...#...#####...#........###..............##.....#..#....#......###......#.......#.......#...............................###.#..#...#...#...#....####.......#....###....#.......#.......#.##....##..#...#...#...#...#...#...#.....................#...............#.......#.......#.......#.......................#...............#.......#.......#.......#.....##......#.......#.......#..#....#.#.....##......#.#.....#..#.............##.......#.......#.......#.......#.......#.......#........................... .##.##..#..#..#.#..#..#.#.....#.#.....#..........................#.##.....#..#....#..#....#..#....#..#............................###....#...#...#...#...#...#....###............................#.##.....#..#....#..#....###.....#.......#.......................##.#...#..#....#..#.....###.......#.......#....................#.##....##......#.......#.......#................................###....#........##........#....###.......................#......###......#.......#.......#.......#.............................#..#....#..#....#..#....#..#.....##.#...........................#...#...#...#...#...#....#.#......#............................#.....#.#.....#.#..#..#.#.#.#.#..#...#...........................#...#....#.#......#......#.#....#...#............................#..#....#..#....#..#.....###.......#....###....................####.......#......#......#......####..............##.....#.......#......#........#.......#........##..............#.......#.......#.......#.......#.......#.......#.............##........#.......#........#......#.......#.....##..............................##.....#..#..#.....##........................................................................................."
	.size	.Lstrglobal_ffontfont_mget_font_l1_n3703, 8193

	.type	.Lstrglobal_ffontfont_mget_colors_l3_n3706,@object # @strglobal_ffontfont_mget_colors_l3_n3706
	.section	.rodata,"a",@progbits
	.align	16
.Lstrglobal_ffontfont_mget_colors_l3_n3706:
	.asciz	"\000\000\000\000\000\252\000\252\000\000\252\252\252\000\000\252\000\252\252U\000\252\252\252UUUUU\377U\377UU\377\377\377UU\377U\377\377\377U\377\377\377"
	.size	.Lstrglobal_ffontfont_mget_colors_l3_n3706, 49

	.type	.Lstrglobal_fframebuffer_mFramebuffer$drawchar_l70_n4061,@object # @"strglobal_fframebuffer_mFramebuffer$drawchar_l70_n4061"
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fframebuffer_mFramebuffer$drawchar_l70_n4061:
	.asciz	"#"
	.size	.Lstrglobal_fframebuffer_mFramebuffer$drawchar_l70_n4061, 2

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l8_n4195,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l8_n4195
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l8_n4195:
	.asciz	"1.234*1000="
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l8_n4195, 12

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l10_n4207,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l10_n4207
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l10_n4207:
	.asciz	"\nex="
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l10_n4207, 5

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l12_n4221,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l12_n4221
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l12_n4221:
	.asciz	" "
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l12_n4221, 2

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l14_n4235,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l14_n4235
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l14_n4235:
	.asciz	" "
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l14_n4235, 2

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l16_n4249,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l16_n4249
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l16_n4249:
	.asciz	" "
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l16_n4249, 2

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l18_n4263,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l18_n4263
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l18_n4263:
	.asciz	" "
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l18_n4263, 2

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l20_n4277,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l20_n4277
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l20_n4277:
	.asciz	" "
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l20_n4277, 2

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l22_n4291,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l22_n4291
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l22_n4291:
	.asciz	" "
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l22_n4291, 2

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l24_n4305,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l24_n4305
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l24_n4305:
	.asciz	" "
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l24_n4305, 2

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l26_n4319,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l26_n4319
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l26_n4319:
	.asciz	" "
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l26_n4319, 2

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l28_n4324,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l28_n4324
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l28_n4324:
	.asciz	"\n ex via RCFloatBox="
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l28_n4324, 21

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l31_n4339,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l31_n4339
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l31_n4339:
	.asciz	"\nsin(10)="
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l31_n4339, 10

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l33_n4354,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l33_n4354
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l33_n4354:
	.asciz	"\nsin(20)="
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l33_n4354, 10

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l35_n4369,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l35_n4369
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l35_n4369:
	.asciz	"\nsin(30)="
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l35_n4369, 10

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l37_n4384,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l37_n4384
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l37_n4384:
	.asciz	"\nsin(90)="
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l37_n4384, 10

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l40_n4399,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l40_n4399
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l40_n4399:
	.asciz	"\ncos(10)="
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l40_n4399, 10

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l42_n4414,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l42_n4414
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l42_n4414:
	.asciz	"\ncos(20)="
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l42_n4414, 10

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l44_n4429,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l44_n4429
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l44_n4429:
	.asciz	"\ncos(30)="
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l44_n4429, 10

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l46_n4444,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l46_n4444
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l46_n4444:
	.asciz	"\ncos(90)="
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l46_n4444, 10

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l49_n4459,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l49_n4459
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l49_n4459:
	.asciz	"\nsqrt(4)="
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l49_n4459, 10

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l51_n4471,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l51_n4471
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l51_n4471:
	.asciz	"\nsqrt(100)="
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l51_n4471, 12

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l53_n4483,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l53_n4483
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l53_n4483:
	.asciz	"\nsqrt(36)="
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l53_n4483, 11

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l56_n4495,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l56_n4495
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l56_n4495:
	.asciz	"\nsqrt(5)*1000="
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l56_n4495, 15

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_run_l68_n4524,@object # @strglobal_fkappsraycasterraycaster_mrc_run_l68_n4524
.Lstrglobal_fkappsraycasterraycaster_mrc_run_l68_n4524:
	.asciz	" "
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_run_l68_n4524, 2

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_run_l93_n4575,@object # @strglobal_fkappsraycasterraycaster_mrc_run_l93_n4575
.Lstrglobal_fkappsraycasterraycaster_mrc_run_l93_n4575:
	.asciz	"Newbf sz="
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_run_l93_n4575, 10

	.type	.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l45_n5042,@object # @strglobal_fkappsdrawbmp_mkc_draw_bmp_l45_n5042
.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l45_n5042:
	.asciz	"Invalid module"
	.size	.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l45_n5042, 15

	.type	.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l51_n5056,@object # @strglobal_fkappsdrawbmp_mkc_draw_bmp_l51_n5056
.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l51_n5056:
	.asciz	"B"
	.size	.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l51_n5056, 2

	.type	.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l52_n5062,@object # @strglobal_fkappsdrawbmp_mkc_draw_bmp_l52_n5062
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l52_n5062:
	.asciz	"Not a BMP ([0]!=B)"
	.size	.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l52_n5062, 19

	.type	.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l56_n5071,@object # @strglobal_fkappsdrawbmp_mkc_draw_bmp_l56_n5071
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l56_n5071:
	.asciz	"M"
	.size	.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l56_n5071, 2

	.type	.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l57_n5077,@object # @strglobal_fkappsdrawbmp_mkc_draw_bmp_l57_n5077
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l57_n5077:
	.asciz	"Not a BMP ([0]!=M)"
	.size	.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l57_n5077, 19

	.type	.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l62_n5088,@object # @strglobal_fkappsdrawbmp_mkc_draw_bmp_l62_n5088
	.align	16
.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l62_n5088:
	.asciz	"Don't know how to handle compressed BMPs"
	.size	.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l62_n5088, 41

	.type	.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l67_n5100,@object # @strglobal_fkappsdrawbmp_mkc_draw_bmp_l67_n5100
	.align	16
.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l67_n5100:
	.asciz	"Unknown depth (must == 24)"
	.size	.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l67_n5100, 27

	.type	.Lstrglobal_fkappsconsole_mconsole_disp_line_l26_n5192,@object # @strglobal_fkappsconsole_mconsole_disp_line_l26_n5192
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkappsconsole_mconsole_disp_line_l26_n5192:
	.asciz	"\nk>"
	.size	.Lstrglobal_fkappsconsole_mconsole_disp_line_l26_n5192, 4

	.type	.Lstrglobal_fkappsconsole_mconsole_submit_l36_n5209,@object # @strglobal_fkappsconsole_mconsole_submit_l36_n5209
.Lstrglobal_fkappsconsole_mconsole_submit_l36_n5209:
	.asciz	" "
	.size	.Lstrglobal_fkappsconsole_mconsole_submit_l36_n5209, 2

	.type	.Lstrglobal_fkappsconsole_mconsole_submit_l38_n5216,@object # @strglobal_fkappsconsole_mconsole_submit_l38_n5216
.Lstrglobal_fkappsconsole_mconsole_submit_l38_n5216:
	.zero	1
	.size	.Lstrglobal_fkappsconsole_mconsole_submit_l38_n5216, 1

	.type	.Lstrglobal_fkappsconsole_mconsole_submit_l40_n5224,@object # @strglobal_fkappsconsole_mconsole_submit_l40_n5224
.Lstrglobal_fkappsconsole_mconsole_submit_l40_n5224:
	.asciz	" "
	.size	.Lstrglobal_fkappsconsole_mconsole_submit_l40_n5224, 2

	.type	.Lstrglobal_fkappsconsole_mconsole_submit_l51_n5268,@object # @strglobal_fkappsconsole_mconsole_submit_l51_n5268
.Lstrglobal_fkappsconsole_mconsole_submit_l51_n5268:
	.asciz	"Invalid Command"
	.size	.Lstrglobal_fkappsconsole_mconsole_submit_l51_n5268, 16

	.type	.Lstrglobal_fkappsconsole_mkc_help_l68_n5304,@object # @strglobal_fkappsconsole_mkc_help_l68_n5304
.Lstrglobal_fkappsconsole_mkc_help_l68_n5304:
	.asciz	"Commands: "
	.size	.Lstrglobal_fkappsconsole_mkc_help_l68_n5304, 11

	.type	.Lstrglobal_fkappsconsole_mkc_help_l71_n5317,@object # @strglobal_fkappsconsole_mkc_help_l71_n5317
.Lstrglobal_fkappsconsole_mkc_help_l71_n5317:
	.asciz	" - "
	.size	.Lstrglobal_fkappsconsole_mkc_help_l71_n5317, 4

	.type	.Lstrglobal_fkappsconsole_mkc_help_l73_n5327,@object # @strglobal_fkappsconsole_mkc_help_l73_n5327
.Lstrglobal_fkappsconsole_mkc_help_l73_n5327:
	.asciz	": "
	.size	.Lstrglobal_fkappsconsole_mkc_help_l73_n5327, 3

	.type	.Lstrglobal_fkappsconsole_mkc_help_l75_n5337,@object # @strglobal_fkappsconsole_mkc_help_l75_n5337
.Lstrglobal_fkappsconsole_mkc_help_l75_n5337:
	.asciz	"\n"
	.size	.Lstrglobal_fkappsconsole_mkc_help_l75_n5337, 2

	.type	.Lstrglobal_fkappsconsole_mkc_dumpargs_l81_n5351,@object # @strglobal_fkappsconsole_mkc_dumpargs_l81_n5351
.Lstrglobal_fkappsconsole_mkc_dumpargs_l81_n5351:
	.asciz	"Args: "
	.size	.Lstrglobal_fkappsconsole_mkc_dumpargs_l81_n5351, 7

	.type	.Lstrglobal_fkappsconsole_mkc_mem_l86_n5360,@object # @strglobal_fkappsconsole_mkc_mem_l86_n5360
.Lstrglobal_fkappsconsole_mkc_mem_l86_n5360:
	.asciz	"mm_head: "
	.size	.Lstrglobal_fkappsconsole_mkc_mem_l86_n5360, 10

	.type	.Lstrglobal_fkappsconsole_mkc_mem_l88_n5369,@object # @strglobal_fkappsconsole_mkc_mem_l88_n5369
.Lstrglobal_fkappsconsole_mkc_mem_l88_n5369:
	.asciz	" mm_pos: "
	.size	.Lstrglobal_fkappsconsole_mkc_mem_l88_n5369, 10

	.type	.Lstrglobal_fkappsconsole_mkc_mem_l90_n5378,@object # @strglobal_fkappsconsole_mkc_mem_l90_n5378
.Lstrglobal_fkappsconsole_mkc_mem_l90_n5378:
	.asciz	"\nUsed: "
	.size	.Lstrglobal_fkappsconsole_mkc_mem_l90_n5378, 8

	.type	.Lstrglobal_fkappsconsole_mkc_mem_l92_n5390,@object # @strglobal_fkappsconsole_mkc_mem_l92_n5390
.Lstrglobal_fkappsconsole_mkc_mem_l92_n5390:
	.asciz	"\n"
	.size	.Lstrglobal_fkappsconsole_mkc_mem_l92_n5390, 2

	.type	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l101_n5406,@object # @strglobal_fkappsconsole_mkc_dump_parseed_multiboot_l101_n5406
.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l101_n5406:
	.asciz	"cmdline="
	.size	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l101_n5406, 9

	.type	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l103_n5416,@object # @strglobal_fkappsconsole_mkc_dump_parseed_multiboot_l103_n5416
.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l103_n5416:
	.asciz	"bootloader="
	.size	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l103_n5416, 12

	.type	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l105_n5426,@object # @strglobal_fkappsconsole_mkc_dump_parseed_multiboot_l105_n5426
.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l105_n5426:
	.asciz	"boot_device="
	.size	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l105_n5426, 13

	.type	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l107_n5437,@object # @strglobal_fkappsconsole_mkc_dump_parseed_multiboot_l107_n5437
.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l107_n5437:
	.asciz	"\nmodule count="
	.size	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l107_n5437, 15

	.type	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l109_n5447,@object # @strglobal_fkappsconsole_mkc_dump_parseed_multiboot_l109_n5447
.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l109_n5447:
	.zero	1
	.size	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l109_n5447, 1

	.type	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l111_n5456,@object # @strglobal_fkappsconsole_mkc_dump_parseed_multiboot_l111_n5456
.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l111_n5456:
	.asciz	"Text Mode"
	.size	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l111_n5456, 10

	.type	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l113_n5461,@object # @strglobal_fkappsconsole_mkc_dump_parseed_multiboot_l113_n5461
.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l113_n5461:
	.asciz	"Video Mode"
	.size	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l113_n5461, 11

	.type	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l115_n5466,@object # @strglobal_fkappsconsole_mkc_dump_parseed_multiboot_l115_n5466
.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l115_n5466:
	.asciz	"addr="
	.size	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l115_n5466, 6

	.type	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l117_n5476,@object # @strglobal_fkappsconsole_mkc_dump_parseed_multiboot_l117_n5476
.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l117_n5476:
	.asciz	"\n w="
	.size	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l117_n5476, 5

	.type	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l119_n5486,@object # @strglobal_fkappsconsole_mkc_dump_parseed_multiboot_l119_n5486
.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l119_n5486:
	.asciz	"\n h="
	.size	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l119_n5486, 5

	.type	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l121_n5496,@object # @strglobal_fkappsconsole_mkc_dump_parseed_multiboot_l121_n5496
.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l121_n5496:
	.asciz	"\n d="
	.size	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l121_n5496, 5

	.type	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l123_n5506,@object # @strglobal_fkappsconsole_mkc_dump_parseed_multiboot_l123_n5506
.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l123_n5506:
	.asciz	"\n p="
	.size	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l123_n5506, 5

	.type	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l125_n5516,@object # @strglobal_fkappsconsole_mkc_dump_parseed_multiboot_l125_n5516
.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l125_n5516:
	.zero	1
	.size	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l125_n5516, 1

	.type	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l127_n5521,@object # @strglobal_fkappsconsole_mkc_dump_parseed_multiboot_l127_n5521
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l127_n5521:
	.asciz	"mbinfo reports invalid"
	.size	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l127_n5521, 23

	.type	.Lstrglobal_fkappsconsole_mkc_fault_l132_n5527,@object # @strglobal_fkappsconsole_mkc_fault_l132_n5527
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkappsconsole_mkc_fault_l132_n5527:
	.asciz	"dbz"
	.size	.Lstrglobal_fkappsconsole_mkc_fault_l132_n5527, 4

	.type	.Lstrglobal_fkappsconsole_mkc_fault_l132_n5537,@object # @strglobal_fkappsconsole_mkc_fault_l132_n5537
.Lstrglobal_fkappsconsole_mkc_fault_l132_n5537:
	.asciz	"pw"
	.size	.Lstrglobal_fkappsconsole_mkc_fault_l132_n5537, 3

	.type	.Lstrglobal_fkappsconsole_mkc_fault_l132_n5551,@object # @strglobal_fkappsconsole_mkc_fault_l132_n5551
.Lstrglobal_fkappsconsole_mkc_fault_l132_n5551:
	.asciz	"pr"
	.size	.Lstrglobal_fkappsconsole_mkc_fault_l132_n5551, 3

	.type	.Lstrglobal_fkappsconsole_mkc_fault_l139_n5565,@object # @strglobal_fkappsconsole_mkc_fault_l139_n5565
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsconsole_mkc_fault_l139_n5565:
	.asciz	"Pass dbz, pw or pr"
	.size	.Lstrglobal_fkappsconsole_mkc_fault_l139_n5565, 19

	.type	.Lstrglobal_fkappsconsole_mkc_hexnum_l162_n5609,@object # @strglobal_fkappsconsole_mkc_hexnum_l162_n5609
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkappsconsole_mkc_hexnum_l162_n5609:
	.asciz	"Read: "
	.size	.Lstrglobal_fkappsconsole_mkc_hexnum_l162_n5609, 7

	.type	.Lstrglobal_fkappsconsole_mkc_shutdown_l168_n5622,@object # @strglobal_fkappsconsole_mkc_shutdown_l168_n5622
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsconsole_mkc_shutdown_l168_n5622:
	.asciz	"Shutting Down..."
	.size	.Lstrglobal_fkappsconsole_mkc_shutdown_l168_n5622, 17

	.type	.Lstrglobal_fkappsconsole_mkc_getpicticks_l173_n5632,@object # @strglobal_fkappsconsole_mkc_getpicticks_l173_n5632
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkappsconsole_mkc_getpicticks_l173_n5632:
	.asciz	"Ticks: "
	.size	.Lstrglobal_fkappsconsole_mkc_getpicticks_l173_n5632, 8

	.type	.Lstrglobal_fkappsconsole_mkc_getpicticks_l175_n5640,@object # @strglobal_fkappsconsole_mkc_getpicticks_l175_n5640
.Lstrglobal_fkappsconsole_mkc_getpicticks_l175_n5640:
	.asciz	"\nSeconds ~:"
	.size	.Lstrglobal_fkappsconsole_mkc_getpicticks_l175_n5640, 12

	.type	.Lstrglobal_fkappsconsole_mkc_getpicticks_l177_n5651,@object # @strglobal_fkappsconsole_mkc_getpicticks_l177_n5651
.Lstrglobal_fkappsconsole_mkc_getpicticks_l177_n5651:
	.asciz	"\n"
	.size	.Lstrglobal_fkappsconsole_mkc_getpicticks_l177_n5651, 2

	.type	.Lstrglobal_fkappsconsole_mkc_picsleep_l182_n5662,@object # @strglobal_fkappsconsole_mkc_picsleep_l182_n5662
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsconsole_mkc_picsleep_l182_n5662:
	.asciz	"Pass 1 hex digit for seconds to sleep"
	.size	.Lstrglobal_fkappsconsole_mkc_picsleep_l182_n5662, 38

	.type	.Lstrglobal_fkappsconsole_mkc_picsleep_l187_n5675,@object # @strglobal_fkappsconsole_mkc_picsleep_l187_n5675
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkappsconsole_mkc_picsleep_l187_n5675:
	.zero	1
	.size	.Lstrglobal_fkappsconsole_mkc_picsleep_l187_n5675, 1

	.type	.Lstrglobal_fkappsconsole_mkc_picsleep_l191_n5698,@object # @strglobal_fkappsconsole_mkc_picsleep_l191_n5698
.Lstrglobal_fkappsconsole_mkc_picsleep_l191_n5698:
	.zero	1
	.size	.Lstrglobal_fkappsconsole_mkc_picsleep_l191_n5698, 1

	.type	.Lstrglobal_fkappsconsole_mkc_color_l197_n5725,@object # @strglobal_fkappsconsole_mkc_color_l197_n5725
.Lstrglobal_fkappsconsole_mkc_color_l197_n5725:
	.asciz	"Set\n"
	.size	.Lstrglobal_fkappsconsole_mkc_color_l197_n5725, 5

	.type	.Lstrglobal_fkappsconsole_mkc_colorama_l209_n5752,@object # @strglobal_fkappsconsole_mkc_colorama_l209_n5752
.Lstrglobal_fkappsconsole_mkc_colorama_l209_n5752:
	.asciz	"X"
	.size	.Lstrglobal_fkappsconsole_mkc_colorama_l209_n5752, 2

	.type	.Lstrglobal_fkappsconsole_mkc_colorama_l212_n5763,@object # @strglobal_fkappsconsole_mkc_colorama_l212_n5763
.Lstrglobal_fkappsconsole_mkc_colorama_l212_n5763:
	.asciz	"\n"
	.size	.Lstrglobal_fkappsconsole_mkc_colorama_l212_n5763, 2

	.type	.Lstrglobal_fkappsconsole_mkc_drawstuff_l236_n5849,@object # @strglobal_fkappsconsole_mkc_drawstuff_l236_n5849
.Lstrglobal_fkappsconsole_mkc_drawstuff_l236_n5849:
	.asciz	"A"
	.size	.Lstrglobal_fkappsconsole_mkc_drawstuff_l236_n5849, 2

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l283_n5975,@object # @strglobal_fkappsconsole_mkconsole_run_l283_n5975
.Lstrglobal_fkappsconsole_mkconsole_run_l283_n5975:
	.asciz	"help"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l283_n5975, 5

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l283_n5978,@object # @strglobal_fkappsconsole_mkconsole_run_l283_n5978
.Lstrglobal_fkappsconsole_mkconsole_run_l283_n5978:
	.asciz	"Display Help"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l283_n5978, 13

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l284_n5985,@object # @strglobal_fkappsconsole_mkconsole_run_l284_n5985
.Lstrglobal_fkappsconsole_mkconsole_run_l284_n5985:
	.asciz	"dumpargs"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l284_n5985, 9

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l284_n5988,@object # @strglobal_fkappsconsole_mkconsole_run_l284_n5988
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsconsole_mkconsole_run_l284_n5988:
	.asciz	"Show the passed arguments"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l284_n5988, 26

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l285_n5995,@object # @strglobal_fkappsconsole_mkconsole_run_l285_n5995
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkappsconsole_mkconsole_run_l285_n5995:
	.asciz	"mem"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l285_n5995, 4

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l285_n5998,@object # @strglobal_fkappsconsole_mkconsole_run_l285_n5998
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsconsole_mkconsole_run_l285_n5998:
	.asciz	"Show memory statistics"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l285_n5998, 23

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l286_n6005,@object # @strglobal_fkappsconsole_mkconsole_run_l286_n6005
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkappsconsole_mkconsole_run_l286_n6005:
	.asciz	"fault"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l286_n6005, 6

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l286_n6008,@object # @strglobal_fkappsconsole_mkconsole_run_l286_n6008
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsconsole_mkconsole_run_l286_n6008:
	.asciz	"Cause a fault. Types are dbz, pw, pr"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l286_n6008, 37

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l287_n6015,@object # @strglobal_fkappsconsole_mkconsole_run_l287_n6015
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkappsconsole_mkconsole_run_l287_n6015:
	.asciz	"echo"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l287_n6015, 5

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l287_n6018,@object # @strglobal_fkappsconsole_mkconsole_run_l287_n6018
.Lstrglobal_fkappsconsole_mkconsole_run_l287_n6018:
	.asciz	"Repeat args"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l287_n6018, 12

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l288_n6025,@object # @strglobal_fkappsconsole_mkconsole_run_l288_n6025
.Lstrglobal_fkappsconsole_mkconsole_run_l288_n6025:
	.asciz	"add2h"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l288_n6025, 6

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l288_n6028,@object # @strglobal_fkappsconsole_mkconsole_run_l288_n6028
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsconsole_mkconsole_run_l288_n6028:
	.asciz	"Add two (hex) digits"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l288_n6028, 21

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l289_n6035,@object # @strglobal_fkappsconsole_mkconsole_run_l289_n6035
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkappsconsole_mkconsole_run_l289_n6035:
	.asciz	"clear"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l289_n6035, 6

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l289_n6038,@object # @strglobal_fkappsconsole_mkconsole_run_l289_n6038
.Lstrglobal_fkappsconsole_mkconsole_run_l289_n6038:
	.asciz	"Clear Screen"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l289_n6038, 13

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l290_n6045,@object # @strglobal_fkappsconsole_mkconsole_run_l290_n6045
.Lstrglobal_fkappsconsole_mkconsole_run_l290_n6045:
	.asciz	"hexnum"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l290_n6045, 7

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l290_n6048,@object # @strglobal_fkappsconsole_mkconsole_run_l290_n6048
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsconsole_mkconsole_run_l290_n6048:
	.asciz	"Parse a hex digit"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l290_n6048, 18

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l291_n6055,@object # @strglobal_fkappsconsole_mkconsole_run_l291_n6055
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkappsconsole_mkconsole_run_l291_n6055:
	.asciz	"dmpmbd"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l291_n6055, 7

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l291_n6058,@object # @strglobal_fkappsconsole_mkconsole_run_l291_n6058
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsconsole_mkconsole_run_l291_n6058:
	.asciz	"View Multiboot info structure"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l291_n6058, 30

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l292_n6065,@object # @strglobal_fkappsconsole_mkconsole_run_l292_n6065
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkappsconsole_mkconsole_run_l292_n6065:
	.asciz	"dmppmbd"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l292_n6065, 8

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l292_n6068,@object # @strglobal_fkappsconsole_mkconsole_run_l292_n6068
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsconsole_mkconsole_run_l292_n6068:
	.asciz	"View Parsed Multiboot info structure"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l292_n6068, 37

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l293_n6075,@object # @strglobal_fkappsconsole_mkconsole_run_l293_n6075
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkappsconsole_mkconsole_run_l293_n6075:
	.asciz	"pict"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l293_n6075, 5

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l293_n6078,@object # @strglobal_fkappsconsole_mkconsole_run_l293_n6078
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsconsole_mkconsole_run_l293_n6078:
	.asciz	"View PIC interrupt count"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l293_n6078, 25

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l294_n6085,@object # @strglobal_fkappsconsole_mkconsole_run_l294_n6085
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkappsconsole_mkconsole_run_l294_n6085:
	.asciz	"pics"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l294_n6085, 5

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l294_n6088,@object # @strglobal_fkappsconsole_mkconsole_run_l294_n6088
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsconsole_mkconsole_run_l294_n6088:
	.asciz	"Sleep for n secs. Pass 1 hex digit"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l294_n6088, 35

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l295_n6095,@object # @strglobal_fkappsconsole_mkconsole_run_l295_n6095
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkappsconsole_mkconsole_run_l295_n6095:
	.asciz	"shutdown"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l295_n6095, 9

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l295_n6098,@object # @strglobal_fkappsconsole_mkconsole_run_l295_n6098
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsconsole_mkconsole_run_l295_n6098:
	.asciz	"Try to shut down"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l295_n6098, 17

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l296_n6105,@object # @strglobal_fkappsconsole_mkconsole_run_l296_n6105
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkappsconsole_mkconsole_run_l296_n6105:
	.asciz	"color"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l296_n6105, 6

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l296_n6108,@object # @strglobal_fkappsconsole_mkconsole_run_l296_n6108
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsconsole_mkconsole_run_l296_n6108:
	.asciz	"Set terminal color mode. Pass 2 hex digits, or no args to reset"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l296_n6108, 64

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l297_n6115,@object # @strglobal_fkappsconsole_mkconsole_run_l297_n6115
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkappsconsole_mkconsole_run_l297_n6115:
	.asciz	"colorama"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l297_n6115, 9

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l297_n6118,@object # @strglobal_fkappsconsole_mkconsole_run_l297_n6118
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsconsole_mkconsole_run_l297_n6118:
	.asciz	"Demo availible colors"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l297_n6118, 22

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l298_n6125,@object # @strglobal_fkappsconsole_mkconsole_run_l298_n6125
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkappsconsole_mkconsole_run_l298_n6125:
	.asciz	"snowcrash"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l298_n6125, 10

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l298_n6128,@object # @strglobal_fkappsconsole_mkconsole_run_l298_n6128
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsconsole_mkconsole_run_l298_n6128:
	.asciz	"Dump kernel code into vram. *no getting out*"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l298_n6128, 45

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l299_n6135,@object # @strglobal_fkappsconsole_mkconsole_run_l299_n6135
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkappsconsole_mkconsole_run_l299_n6135:
	.asciz	"draw"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l299_n6135, 5

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l299_n6138,@object # @strglobal_fkappsconsole_mkconsole_run_l299_n6138
.Lstrglobal_fkappsconsole_mkconsole_run_l299_n6138:
	.asciz	"Draw some stuff"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l299_n6138, 16

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l300_n6145,@object # @strglobal_fkappsconsole_mkconsole_run_l300_n6145
.Lstrglobal_fkappsconsole_mkconsole_run_l300_n6145:
	.asciz	"drawcolors"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l300_n6145, 11

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l300_n6148,@object # @strglobal_fkappsconsole_mkconsole_run_l300_n6148
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsconsole_mkconsole_run_l300_n6148:
	.asciz	"Draw some colors"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l300_n6148, 17

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l301_n6155,@object # @strglobal_fkappsconsole_mkconsole_run_l301_n6155
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkappsconsole_mkconsole_run_l301_n6155:
	.asciz	"rcmtest"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l301_n6155, 8

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l301_n6158,@object # @strglobal_fkappsconsole_mkconsole_run_l301_n6158
.Lstrglobal_fkappsconsole_mkconsole_run_l301_n6158:
	.asciz	"Test some trig"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l301_n6158, 15

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l302_n6165,@object # @strglobal_fkappsconsole_mkconsole_run_l302_n6165
.Lstrglobal_fkappsconsole_mkconsole_run_l302_n6165:
	.asciz	"rc"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l302_n6165, 3

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l302_n6168,@object # @strglobal_fkappsconsole_mkconsole_run_l302_n6168
.Lstrglobal_fkappsconsole_mkconsole_run_l302_n6168:
	.asciz	"Raycaster"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l302_n6168, 10

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l303_n6175,@object # @strglobal_fkappsconsole_mkconsole_run_l303_n6175
.Lstrglobal_fkappsconsole_mkconsole_run_l303_n6175:
	.asciz	"drawbmp"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l303_n6175, 8

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l303_n6178,@object # @strglobal_fkappsconsole_mkconsole_run_l303_n6178
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsconsole_mkconsole_run_l303_n6178:
	.asciz	"Draw a BMP that was loaded as a kernel module"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l303_n6178, 46

	.type	.Lstrglobal_fvgatest_mtest_svga_l7_n6252,@object # @strglobal_fvgatest_mtest_svga_l7_n6252
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fvgatest_mtest_svga_l7_n6252:
	.asciz	"A"
	.size	.Lstrglobal_fvgatest_mtest_svga_l7_n6252, 2

	.type	.Lstrglobal_fpaging_mPageEntry$set_l11_n6614,@object # @"strglobal_fpaging_mPageEntry$set_l11_n6614"
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fpaging_mPageEntry$set_l11_n6614:
	.asciz	"Internal PDE Error"
	.size	.Lstrglobal_fpaging_mPageEntry$set_l11_n6614, 19

	.type	.Lstrglobal_fpaging_mPageEntry$set_l11_n6617,@object # @"strglobal_fpaging_mPageEntry$set_l11_n6617"
	.align	16
.Lstrglobal_fpaging_mPageEntry$set_l11_n6617:
	.asciz	"Address not 4KiB aligned"
	.size	.Lstrglobal_fpaging_mPageEntry$set_l11_n6617, 25

	.type	.Lstrglobal_fin_mkernel_main_l27_n6692,@object # @strglobal_fin_mkernel_main_l27_n6692
	.align	16
.Lstrglobal_fin_mkernel_main_l27_n6692:
	.asciz	"Kernel debugger check!\n"
	.size	.Lstrglobal_fin_mkernel_main_l27_n6692, 24

	.type	.Lstrglobal_fin_mkernel_main_l41_n6736,@object # @strglobal_fin_mkernel_main_l41_n6736
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fin_mkernel_main_l41_n6736:
	.asciz	"Text Mode\n"
	.size	.Lstrglobal_fin_mkernel_main_l41_n6736, 11

	.type	.Lstrglobal_fin_mkernel_main_l44_n6751,@object # @strglobal_fin_mkernel_main_l44_n6751
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fin_mkernel_main_l44_n6751:
	.asciz	"Graphical mode. Paging...\n"
	.size	.Lstrglobal_fin_mkernel_main_l44_n6751, 27

	.type	.Lstrglobal_fin_mkernel_main_l47_n6782,@object # @strglobal_fin_mkernel_main_l47_n6782
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fin_mkernel_main_l47_n6782:
	.asciz	"Paged\n"
	.size	.Lstrglobal_fin_mkernel_main_l47_n6782, 7

	.type	.Lstrglobal_fin_mkernel_main_l49_n6789,@object # @strglobal_fin_mkernel_main_l49_n6789
.Lstrglobal_fin_mkernel_main_l49_n6789:
	.asciz	"gfxtest"
	.size	.Lstrglobal_fin_mkernel_main_l49_n6789, 8

	.type	.Lstrglobal_fin_mkernel_main_l57_n6814,@object # @strglobal_fin_mkernel_main_l57_n6814
.Lstrglobal_fin_mkernel_main_l57_n6814:
	.asciz	"Blanking..."
	.size	.Lstrglobal_fin_mkernel_main_l57_n6814, 12

	.type	.Lstrglobal_fin_mkernel_main_l59_n6821,@object # @strglobal_fin_mkernel_main_l59_n6821
.Lstrglobal_fin_mkernel_main_l59_n6821:
	.asciz	"*\n"
	.size	.Lstrglobal_fin_mkernel_main_l59_n6821, 3

	.type	.Lstrglobal_fin_mkernel_main_l61_n6826,@object # @strglobal_fin_mkernel_main_l61_n6826
.Lstrglobal_fin_mkernel_main_l61_n6826:
	.asciz	"Terminal ready"
	.size	.Lstrglobal_fin_mkernel_main_l61_n6826, 15

	.type	.Lstrglobal_fin_mkernel_main_l63_n6831,@object # @strglobal_fin_mkernel_main_l63_n6831
.Lstrglobal_fin_mkernel_main_l63_n6831:
	.asciz	"  ..---.."
	.size	.Lstrglobal_fin_mkernel_main_l63_n6831, 10

	.type	.Lstrglobal_fin_mkernel_main_l65_n6836,@object # @strglobal_fin_mkernel_main_l65_n6836
.Lstrglobal_fin_mkernel_main_l65_n6836:
	.asciz	" /       \\"
	.size	.Lstrglobal_fin_mkernel_main_l65_n6836, 11

	.type	.Lstrglobal_fin_mkernel_main_l66_n6841,@object # @strglobal_fin_mkernel_main_l66_n6841
.Lstrglobal_fin_mkernel_main_l66_n6841:
	.asciz	"|         |"
	.size	.Lstrglobal_fin_mkernel_main_l66_n6841, 12

	.type	.Lstrglobal_fin_mkernel_main_l67_n6846,@object # @strglobal_fin_mkernel_main_l67_n6846
.Lstrglobal_fin_mkernel_main_l67_n6846:
	.asciz	":         ;"
	.size	.Lstrglobal_fin_mkernel_main_l67_n6846, 12

	.type	.Lstrglobal_fin_mkernel_main_l68_n6851,@object # @strglobal_fin_mkernel_main_l68_n6851
.Lstrglobal_fin_mkernel_main_l68_n6851:
	.asciz	" \\  \\"
	.size	.Lstrglobal_fin_mkernel_main_l68_n6851, 6

	.type	.Lstrglobal_fin_mkernel_main_l69_n6857,@object # @strglobal_fin_mkernel_main_l69_n6857
.Lstrglobal_fin_mkernel_main_l69_n6857:
	.asciz	"~"
	.size	.Lstrglobal_fin_mkernel_main_l69_n6857, 2

	.type	.Lstrglobal_fin_mkernel_main_l70_n6862,@object # @strglobal_fin_mkernel_main_l70_n6862
.Lstrglobal_fin_mkernel_main_l70_n6862:
	.asciz	"/  /"
	.size	.Lstrglobal_fin_mkernel_main_l70_n6862, 5

	.type	.Lstrglobal_fin_mkernel_main_l71_n6867,@object # @strglobal_fin_mkernel_main_l71_n6867
.Lstrglobal_fin_mkernel_main_l71_n6867:
	.asciz	"  `, Y ,'"
	.size	.Lstrglobal_fin_mkernel_main_l71_n6867, 10

	.type	.Lstrglobal_fin_mkernel_main_l72_n6872,@object # @strglobal_fin_mkernel_main_l72_n6872
.Lstrglobal_fin_mkernel_main_l72_n6872:
	.asciz	"   |_|_|"
	.size	.Lstrglobal_fin_mkernel_main_l72_n6872, 9

	.type	.Lstrglobal_fin_mkernel_main_l73_n6877,@object # @strglobal_fin_mkernel_main_l73_n6877
.Lstrglobal_fin_mkernel_main_l73_n6877:
	.asciz	"   |===|"
	.size	.Lstrglobal_fin_mkernel_main_l73_n6877, 9

	.type	.Lstrglobal_fin_mkernel_main_l74_n6882,@object # @strglobal_fin_mkernel_main_l74_n6882
.Lstrglobal_fin_mkernel_main_l74_n6882:
	.asciz	"   |===|"
	.size	.Lstrglobal_fin_mkernel_main_l74_n6882, 9

	.type	.Lstrglobal_fin_mkernel_main_l75_n6887,@object # @strglobal_fin_mkernel_main_l75_n6887
.Lstrglobal_fin_mkernel_main_l75_n6887:
	.asciz	"    \\_/"
	.size	.Lstrglobal_fin_mkernel_main_l75_n6887, 8

	.type	.Lstrglobal_fin_mkernel_main_l76_n6892,@object # @strglobal_fin_mkernel_main_l76_n6892
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fin_mkernel_main_l76_n6892:
	.asciz	"\nOrth OS. Louis G."
	.size	.Lstrglobal_fin_mkernel_main_l76_n6892, 19

	.type	.Lstrglobal_fin_mkernel_main_l78_n6897,@object # @strglobal_fin_mkernel_main_l78_n6897
	.align	16
.Lstrglobal_fin_mkernel_main_l78_n6897:
	.asciz	"Higher-Half addressing enabled, base_vma="
	.size	.Lstrglobal_fin_mkernel_main_l78_n6897, 42

	.type	.Lstrglobal_fin_mkernel_main_l80_n6905,@object # @strglobal_fin_mkernel_main_l80_n6905
	.align	16
.Lstrglobal_fin_mkernel_main_l80_n6905:
	.asciz	". kterm.baseaddr="
	.size	.Lstrglobal_fin_mkernel_main_l80_n6905, 18

	.type	.Lstrglobal_fin_mkernel_main_l83_n6916,@object # @strglobal_fin_mkernel_main_l83_n6916
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fin_mkernel_main_l83_n6916:
	.asciz	"\nCS="
	.size	.Lstrglobal_fin_mkernel_main_l83_n6916, 5

	.type	.Lstrglobal_fin_mkernel_main_l85_n6925,@object # @strglobal_fin_mkernel_main_l85_n6925
.Lstrglobal_fin_mkernel_main_l85_n6925:
	.asciz	" DS="
	.size	.Lstrglobal_fin_mkernel_main_l85_n6925, 5

	.type	.Lstrglobal_fin_mkernel_main_l87_n6934,@object # @strglobal_fin_mkernel_main_l87_n6934
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fin_mkernel_main_l87_n6934:
	.asciz	" Installing GDT: "
	.size	.Lstrglobal_fin_mkernel_main_l87_n6934, 18

	.type	.Lstrglobal_fin_mkernel_main_l91_n6941,@object # @strglobal_fin_mkernel_main_l91_n6941
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fin_mkernel_main_l91_n6941:
	.asciz	" Done! "
	.size	.Lstrglobal_fin_mkernel_main_l91_n6941, 8

	.type	.Lstrglobal_fin_mkernel_main_l93_n6946,@object # @strglobal_fin_mkernel_main_l93_n6946
.Lstrglobal_fin_mkernel_main_l93_n6946:
	.asciz	"CS="
	.size	.Lstrglobal_fin_mkernel_main_l93_n6946, 4

	.type	.Lstrglobal_fin_mkernel_main_l95_n6955,@object # @strglobal_fin_mkernel_main_l95_n6955
.Lstrglobal_fin_mkernel_main_l95_n6955:
	.asciz	" DS="
	.size	.Lstrglobal_fin_mkernel_main_l95_n6955, 5

	.type	.Lstrglobal_fin_mkernel_main_l98_n6964,@object # @strglobal_fin_mkernel_main_l98_n6964
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fin_mkernel_main_l98_n6964:
	.asciz	"\nTesting (some) Memory: "
	.size	.Lstrglobal_fin_mkernel_main_l98_n6964, 25

	.type	.Lstrglobal_fin_mkernel_main_l110_n7004,@object # @strglobal_fin_mkernel_main_l110_n7004
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fin_mkernel_main_l110_n7004:
	.asciz	"Done, at least "
	.size	.Lstrglobal_fin_mkernel_main_l110_n7004, 16

	.type	.Lstrglobal_fin_mkernel_main_l112_n7012,@object # @strglobal_fin_mkernel_main_l112_n7012
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fin_mkernel_main_l112_n7012:
	.asciz	"b accessible off 'heap'"
	.size	.Lstrglobal_fin_mkernel_main_l112_n7012, 24

	.type	.Lstrglobal_fin_mkernel_main_l114_n7017,@object # @strglobal_fin_mkernel_main_l114_n7017
	.align	16
.Lstrglobal_fin_mkernel_main_l114_n7017:
	.asciz	"Installing IRQs: "
	.size	.Lstrglobal_fin_mkernel_main_l114_n7017, 18

	.type	.Lstrglobal_fin_mkernel_main_l118_n7024,@object # @strglobal_fin_mkernel_main_l118_n7024
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fin_mkernel_main_l118_n7024:
	.asciz	"Installed!"
	.size	.Lstrglobal_fin_mkernel_main_l118_n7024, 11

	.type	.Lstrglobal_fin_mkernel_main_l120_n7029,@object # @strglobal_fin_mkernel_main_l120_n7029
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fin_mkernel_main_l120_n7029:
	.asciz	"Mutiboot structure physaddr="
	.size	.Lstrglobal_fin_mkernel_main_l120_n7029, 29

	.type	.Lstrglobal_fin_mkernel_main_l122_n7038,@object # @strglobal_fin_mkernel_main_l122_n7038
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fin_mkernel_main_l122_n7038:
	.asciz	". vaddr?="
	.size	.Lstrglobal_fin_mkernel_main_l122_n7038, 10

	.type	.Lstrglobal_fin_mkernel_main_l125_n7054,@object # @strglobal_fin_mkernel_main_l125_n7054
.Lstrglobal_fin_mkernel_main_l125_n7054:
	.asciz	" OK\n"
	.size	.Lstrglobal_fin_mkernel_main_l125_n7054, 5

	.type	.Lstrglobal_fin_mkernel_main_l127_n7059,@object # @strglobal_fin_mkernel_main_l127_n7059
.Lstrglobal_fin_mkernel_main_l127_n7059:
	.asciz	" OUTSIDE MAP!"
	.size	.Lstrglobal_fin_mkernel_main_l127_n7059, 14

	.type	.Lstrglobal_fin_mkernel_main_l130_n7064,@object # @strglobal_fin_mkernel_main_l130_n7064
.Lstrglobal_fin_mkernel_main_l130_n7064:
	.asciz	"Heap ptr at "
	.size	.Lstrglobal_fin_mkernel_main_l130_n7064, 13

	.type	.Lstrglobal_fin_mkernel_main_l132_n7073,@object # @strglobal_fin_mkernel_main_l132_n7073
.Lstrglobal_fin_mkernel_main_l132_n7073:
	.asciz	" , heap pos at "
	.size	.Lstrglobal_fin_mkernel_main_l132_n7073, 16

	.type	.Lstrglobal_fin_mkernel_main_l134_n7082,@object # @strglobal_fin_mkernel_main_l134_n7082
.Lstrglobal_fin_mkernel_main_l134_n7082:
	.asciz	" ("
	.size	.Lstrglobal_fin_mkernel_main_l134_n7082, 3

	.type	.Lstrglobal_fin_mkernel_main_l136_n7094,@object # @strglobal_fin_mkernel_main_l136_n7094
.Lstrglobal_fin_mkernel_main_l136_n7094:
	.asciz	"b consumed)"
	.size	.Lstrglobal_fin_mkernel_main_l136_n7094, 12

	.type	.Lstrglobal_fin_mkernel_main_l138_n7099,@object # @strglobal_fin_mkernel_main_l138_n7099
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fin_mkernel_main_l138_n7099:
	.asciz	"BG Colors 0-16, FG Colors:"
	.size	.Lstrglobal_fin_mkernel_main_l138_n7099, 27

	.type	.Lstrglobal_fin_mkernel_main_l143_n7111,@object # @strglobal_fin_mkernel_main_l143_n7111
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fin_mkernel_main_l143_n7111:
	.asciz	"."
	.size	.Lstrglobal_fin_mkernel_main_l143_n7111, 2

	.type	.Lstrglobal_fin_mkernel_main_l150_n7129,@object # @strglobal_fin_mkernel_main_l150_n7129
.Lstrglobal_fin_mkernel_main_l150_n7129:
	.asciz	"X"
	.size	.Lstrglobal_fin_mkernel_main_l150_n7129, 2

	.type	.Lstrglobal_fin_mkernel_main_l156_n7142,@object # @strglobal_fin_mkernel_main_l156_n7142
.Lstrglobal_fin_mkernel_main_l156_n7142:
	.asciz	"\n\nREADY"
	.size	.Lstrglobal_fin_mkernel_main_l156_n7142, 8


	.section	".note.GNU-stack","",@progbits
