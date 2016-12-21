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
# BB#1:                                 # %if_fmm_mfree_l27_n49___SUCC
	movl	gvar_fmm_mu_lu_n3__last_alloc, %eax
	movl	%eax, gvar_fmm_mu_lu_n2__mm_pos
	movl	$-559038737, gvar_fmm_mu_lu_n3__last_alloc # imm = 0xFFFFFFFFDEADBEEF
.LBB4_2:                                # %if_fmm_mfree_l27_n49___DONE
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
.LBB5_1:                                # %fmm_mmemset_l35_n58___LOOP___HEAD
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
.LBB5_2:                                # %fmm_mmemset_l35_n58___LOOP___END
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
.LBB6_1:                                # %fmm_mmemcpy_l43_n79___LOOP___HEAD
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
.LBB6_2:                                # %fmm_mmemcpy_l43_n79___LOOP___END
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
# BB#1:                                 # %if_fmm_mGDTEntry$$new_l68_n129___SUCC
	shrl	$12, 20(%esp)
	movb	$1, 19(%esp)
.LBB8_2:                                # %if_fmm_mGDTEntry$$new_l68_n129___DONE
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
# BB#3:                                 # %if_fmm_mGDTEntry$$new_l90_n184___SUCC
	movl	24(%esp), %eax
	addb	$96, 5(%eax)
.LBB8_4:                                # %if_fmm_mGDTEntry$$new_l90_n184___DONE
	movzbl	31(%esp), %eax
	cmpl	$1, %eax
	jne	.LBB8_6
# BB#5:                                 # %if_fmm_mGDTEntry$$new_l95_n194___SUCC
	movl	24(%esp), %eax
	addb	$8, 5(%eax)
.LBB8_6:                                # %if_fmm_mGDTEntry$$new_l95_n194___DONE
	movzbl	19(%esp), %eax
	cmpl	$1, %eax
	jne	.LBB8_8
# BB#7:                                 # %if_fmm_mGDTEntry$$new_l100_n204___SUCC
	movl	24(%esp), %eax
	addb	$-128, 6(%eax)
.LBB8_8:                                # %if_fmm_mGDTEntry$$new_l100_n204___DONE
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
	movl	$.Lstrglobal_fmm_mGDTEntry$print_l108_n217, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	8(%esp), %ecx
	movzwl	(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmm_mGDTEntry$print_l110_n228, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	8(%esp), %ecx
	movzwl	2(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmm_mGDTEntry$print_l112_n239, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	8(%esp), %ecx
	movzbl	4(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmm_mGDTEntry$print_l114_n250, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	8(%esp), %ecx
	movzbl	5(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmm_mGDTEntry$print_l116_n261, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	8(%esp), %ecx
	movzbl	6(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmm_mGDTEntry$print_l118_n272, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	8(%esp), %ecx
	movzbl	7(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmm_mGDTEntry$print_l120_n283, 4(%esp)
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
	movl	$.Lstrglobal_fmm_minstall_gdt_l161_n404, 4(%esp)
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
	movl	$.Lstrglobal_firqio_msetup_irq_l88_n579, 4(%esp)
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
.LBB23_1:                               # %firqio_msetup_irq_l93_n593___LOOP___HEAD
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
.LBB23_2:                               # %firqio_msetup_irq_l93_n593___LOOP___END
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_firqio_msetup_irq_l98_n615, 4(%esp)
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
	movl	$.Lstrglobal_firqio_msetup_irq_l112_n666, 4(%esp)
	calll	Terminal$print
	movl	gvar_firqio_mu_lu_n4__idt, %eax
	movl	%eax, (%esp)
	calll	__klidt
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_firqio_msetup_irq_l116_n675, 4(%esp)
	calll	Terminal$print
	calll	start_irqs
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_firqio_msetup_irq_l119_n682, 4(%esp)
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
# BB#1:                                 # %if_firqio_mKeyboardState$getkey_l167_n782___SUCC
	movl	20(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.Lstrglobal_firqio_mKeyboardState$getkey_l168_n785, (%esp)
	calll	ikpanici
.LBB28_2:                               # %if_firqio_mKeyboardState$getkey_l167_n782___DONE
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
# BB#1:                                 # %if_firqio_mKeyboardState$setkey_l173_n806___SUCC
	movl	20(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.Lstrglobal_firqio_mKeyboardState$setkey_l174_n809, (%esp)
	calll	ikpanici
.LBB29_2:                               # %if_firqio_mKeyboardState$setkey_l173_n806___DONE
	movl	24(%esp), %eax
	movl	(%eax), %eax
	movl	20(%esp), %ecx
	movb	19(%esp), %dl
	movb	%dl, (%eax,%ecx)
	movl	24(%esp), %eax
	cmpl	$0, 4(%eax)
	je	.LBB29_4
# BB#3:                                 # %if_firqio_mKeyboardState$setkey_l178_n828___SUCC
	movl	24(%esp), %eax
	movl	20(%esp), %ecx
	movzbl	19(%esp), %edx
	movl	%edx, 4(%esp)
	movl	%ecx, (%esp)
	calll	*4(%eax)
.LBB29_4:                               # %if_firqio_mKeyboardState$setkey_l178_n828___DONE
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
# BB#1:                                 # %if_firqio_mkirq_callback_l201_n862___SUCC
	movl	32(%esp), %eax
	movl	36(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$.Lstrglobal_firqio_mkirq_callback_l202_n870, 12(%esp)
	movl	$.Lstrglobal_firqio_mkirq_callback_l202_n867, 8(%esp)
	calll	kpanic
.LBB32_2:                               # %if_firqio_mkirq_callback_l201_n862___DONE
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
# BB#1:                                 # %if_firqio_mirq_keyboard_handler_l210_n896___SUCC
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
.LBB33_2:                               # %if_firqio_mirq_keyboard_handler_l210_n896___DONE
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
	movl	$.Lstrglobal_firqio_mirq_pagefault_handler_l218_n923, 12(%esp)
	movl	$.Lstrglobal_firqio_mirq_pagefault_handler_l218_n920, 8(%esp)
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
	movl	$.Lstrglobal_firqio_mirq_protectionfault_handler_l222_n936, 12(%esp)
	movl	$.Lstrglobal_firqio_mirq_protectionfault_handler_l222_n933, 8(%esp)
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
	movl	$.Lstrglobal_firqio_mirq_doublefault_handler_l226_n949, 12(%esp)
	movl	$.Lstrglobal_firqio_mirq_doublefault_handler_l226_n946, 8(%esp)
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
	movl	$.Lstrglobal_firqio_mirq_zerodivision_handler_l230_n962, 12(%esp)
	movl	$.Lstrglobal_firqio_mirq_zerodivision_handler_l230_n959, 8(%esp)
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
.LBB40_1:                               # %fserialdbg_mkswritecstr_l10_n981___LOOP___HEAD
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
.LBB40_2:                               # %fserialdbg_mkswritecstr_l10_n981___LOOP___END
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
	movl	$.Lstrglobal_fserialdbg_minit_serial_l26_n1041, (%esp)
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
# BB#1:                                 # %if_fterm_mTerminal$putchar_l38_n1140___SUCC
	movzbl	19(%esp), %eax
	movl	%eax, (%esp)
	calll	kswritebyte
.LBB45_2:                               # %if_fterm_mTerminal$putchar_l38_n1140___DONE
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
# BB#3:                                 # %if_fterm_mTerminal$putchar_l44_n1167___SUCC
	movl	20(%esp), %eax
	movl	$0, 12(%eax)
	movl	20(%esp), %eax
	incl	16(%eax)
.LBB45_4:                               # %if_fterm_mTerminal$putchar_l44_n1167___DONE
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
# BB#1:                                 # %if_fterm_mTerminal$print_l54_n1187___SUCC
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	calll	kswritecstr
.LBB46_2:                               # %if_fterm_mTerminal$print_l54_n1187___DONE
	movl	28(%esp), %eax
	movl	24(%esp), %ecx
	cmpb	$0, (%eax,%ecx)
	je	.LBB46_9
	.align	16, 0x90
.LBB46_3:                               # %fterm_mTerminal$print_l58_n1191___LOOP___HEAD
                                        # =>This Inner Loop Header: Depth=1
	movl	28(%esp), %eax
	movl	24(%esp), %ecx
	movzbl	(%eax,%ecx), %eax
	cmpl	$10, %eax
	je	.LBB46_5
# BB#4:                                 # %if_fterm_mTerminal$print_l59_n1210___SUCC
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
.LBB46_5:                               # %if_fterm_mTerminal$print_l59_n1210___FAIL
                                        #   in Loop: Header=BB46_3 Depth=1
	movl	32(%esp), %eax
	movl	$0, 12(%eax)
	movl	32(%esp), %eax
	incl	16(%eax)
.LBB46_6:                               # %if_fterm_mTerminal$print_l59_n1210___DONE
                                        #   in Loop: Header=BB46_3 Depth=1
	movl	32(%esp), %eax
	movl	12(%eax), %ecx
	cmpl	4(%eax), %ecx
	jl	.LBB46_8
# BB#7:                                 # %if_fterm_mTerminal$print_l66_n1249___SUCC
                                        #   in Loop: Header=BB46_3 Depth=1
	movl	32(%esp), %eax
	movl	$0, 12(%eax)
	movl	32(%esp), %eax
	incl	16(%eax)
.LBB46_8:                               # %if_fterm_mTerminal$print_l66_n1249___DONE
                                        #   in Loop: Header=BB46_3 Depth=1
	movl	24(%esp), %eax
	leal	1(%eax), %ecx
	movl	%ecx, 24(%esp)
	movl	28(%esp), %ecx
	cmpb	$0, 1(%ecx,%eax)
	jne	.LBB46_3
.LBB46_9:                               # %fterm_mTerminal$print_l58_n1191___LOOP___END
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
	movl	$.Lstrglobal_fterm_mTerminal$printl_l77_n1281, 4(%esp)
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
.LBB48_4:                               # %fterm_mTerminal$scroll_l84_n1297___LOOP___END
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
# BB#2:                                 # %fterm_mTerminal$scroll_l82_n1287___LOOP___HEAD
                                        #   in Loop: Header=BB48_1 Depth=1
	movl	%esp, %eax
	leal	-16(%eax), %edi
	movl	%edi, %esp
	movl	$0, -16(%eax)
	movl	-12(%ebp), %eax
	cmpl	$0, 8(%eax)
	jle	.LBB48_4
	.align	16, 0x90
.LBB48_3:                               # %fterm_mTerminal$scroll_l84_n1297___LOOP___HEAD
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
.LBB48_5:                               # %fterm_mTerminal$scroll_l82_n1287___LOOP___END
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
# BB#1:                                 # %if_fterm_mTerminal$movecursor_l96_n1397___SUCC
	movl	24(%esp), %eax
	movl	$0, 12(%eax)
	jmp	.LBB49_4
.LBB49_2:                               # %if_fterm_mTerminal$movecursor_l96_n1397___FAIL
	movl	24(%esp), %eax
	movl	12(%eax), %ecx
	cmpl	4(%eax), %ecx
	jle	.LBB49_4
# BB#3:                                 # %if_fterm_mTerminal$movecursor_l96_n1408___SUCC
	movl	24(%esp), %eax
	movl	4(%eax), %ecx
	subl	%ecx, 12(%eax)
	movl	24(%esp), %eax
	incl	16(%eax)
.LBB49_4:                               # %if_fterm_mTerminal$movecursor_l96_n1397___DONE
	movl	24(%esp), %eax
	movl	16(%esp), %ecx
	addl	%ecx, 16(%eax)
	movl	24(%esp), %eax
	cmpl	$0, 16(%eax)
	jns	.LBB49_6
# BB#5:                                 # %if_fterm_mTerminal$movecursor_l104_n1437___SUCC
	movl	24(%esp), %eax
	movl	$0, 16(%eax)
.LBB49_6:                               # %if_fterm_mTerminal$movecursor_l104_n1437___DONE
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
# BB#1:                                 # %if_fterm_mTerminal$printlong_l118_n1466___SUCC
	movl	-16(%ebp), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fterm_mTerminal$printlong_l119_n1469, 4(%esp)
	calll	Terminal$print
	jmp	.LBB51_2
.LBB51_3:                               # %if_fterm_mTerminal$printlong_l118_n1466___DONE
	cmpl	$0, -20(%ebp)
	jns	.LBB51_5
# BB#4:                                 # %if_fterm_mTerminal$printlong_l123_n1476___SUCC
	movl	-16(%ebp), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fterm_mTerminal$printlong_l124_n1479, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	subl	-24(%ebp), %ecx
	sbbl	-20(%ebp), %eax
	movl	%eax, -20(%ebp)
	movl	%ecx, -24(%ebp)
.LBB51_5:                               # %if_fterm_mTerminal$printlong_l123_n1476___DONE
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
	movl	$.Lstrglobal_fterm_mTerminal$printlong_l131_n1492, -16(%ecx)
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
.LBB51_6:                               # %fterm_mTerminal$printlong_l134_n1504___LOOP___HEAD
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
.LBB51_7:                               # %fterm_mTerminal$printlong_l134_n1504___LOOP___END
	cmpl	$0, -24(%ebp)
	sete	%al
	cmpl	$0, -20(%ebp)
	sets	%cl
	je	.LBB51_9
# BB#8:                                 # %fterm_mTerminal$printlong_l134_n1504___LOOP___END
	movb	%cl, %al
.LBB51_9:                               # %fterm_mTerminal$printlong_l134_n1504___LOOP___END
	testb	%al, %al
	movl	-32(%ebp), %esi         # 4-byte Reload
	movl	-36(%ebp), %ebx         # 4-byte Reload
	jne	.LBB51_13
	.align	16, 0x90
.LBB51_10:                              # %fterm_mTerminal$printlong_l138_n1525___LOOP___HEAD
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
# BB#11:                                # %fterm_mTerminal$printlong_l138_n1525___LOOP___HEAD
                                        #   in Loop: Header=BB51_10 Depth=1
	movb	%cl, %al
.LBB51_12:                              # %fterm_mTerminal$printlong_l138_n1525___LOOP___HEAD
                                        #   in Loop: Header=BB51_10 Depth=1
	testb	%al, %al
	jne	.LBB51_10
.LBB51_13:                              # %fterm_mTerminal$printlong_l138_n1525___LOOP___END
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
.LBB51_2:                               # %if_fterm_mTerminal$printlong_l118_n1466___SUCC
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
	movl	$.Lstrglobal_fterm_mTerminal$dumpbin_l150_n1571, 4(%esp)
	calll	Terminal$print
	movl	$32, 16(%esp)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB52_5
	.align	16, 0x90
.LBB52_1:                               # %fterm_mTerminal$dumpbin_l152_n1578___LOOP___HEAD
                                        # =>This Inner Loop Header: Depth=1
	decl	16(%esp)
	movl	20(%esp), %eax
	movl	16(%esp), %ecx
	btl	%ecx, %eax
	jae	.LBB52_3
# BB#2:                                 # %if_fterm_mTerminal$dumpbin_l154_n1592___SUCC
                                        #   in Loop: Header=BB52_1 Depth=1
	movl	24(%esp), %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fterm_mTerminal$dumpbin_l155_n1595, 4(%esp)
	jmp	.LBB52_4
	.align	16, 0x90
.LBB52_3:                               # %if_fterm_mTerminal$dumpbin_l154_n1592___FAIL
                                        #   in Loop: Header=BB52_1 Depth=1
	movl	24(%esp), %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fterm_mTerminal$dumpbin_l157_n1600, 4(%esp)
.LBB52_4:                               # %if_fterm_mTerminal$dumpbin_l154_n1592___DONE
                                        #   in Loop: Header=BB52_1 Depth=1
	calll	Terminal$print
	cmpl	$0, 16(%esp)
	jg	.LBB52_1
.LBB52_5:                               # %fterm_mTerminal$dumpbin_l152_n1578___LOOP___END
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
	movl	$.Lstrglobal_fterm_mTerminal$dumphex_l163_n1611, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	-16(%ebp), %eax
	movl	%eax, -20(%ebp)
	testl	%eax, %eax
	jle	.LBB53_5
	.align	16, 0x90
.LBB53_1:                               # %fterm_mTerminal$dumphex_l165_n1616___LOOP___HEAD
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
# BB#2:                                 # %if_fterm_mTerminal$dumphex_l168_n1634___SUCC
                                        #   in Loop: Header=BB53_1 Depth=1
	movl	-8(%ebp), %ecx
	movl	(%eax), %eax
	addl	$48, %eax
	jmp	.LBB53_4
	.align	16, 0x90
.LBB53_3:                               # %if_fterm_mTerminal$dumphex_l168_n1634___FAIL
                                        #   in Loop: Header=BB53_1 Depth=1
	movl	-8(%ebp), %ecx
	movl	(%eax), %eax
	addl	$55, %eax
.LBB53_4:                               # %if_fterm_mTerminal$dumphex_l168_n1634___DONE
                                        #   in Loop: Header=BB53_1 Depth=1
	subl	$16, %esp
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	calll	Terminal$putchar
	addl	$16, %esp
	cmpl	$0, -20(%ebp)
	jg	.LBB53_1
.LBB53_5:                               # %fterm_mTerminal$dumphex_l165_n1616___LOOP___END
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
.LBB56_1:                               # %fterm_mTerminal$blank_l186_n1667___LOOP___HEAD
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
.LBB56_2:                               # %fterm_mTerminal$blank_l186_n1667___LOOP___END
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
	movl	$.Lstrglobal_fpanic_mkpanic_l15_n1739, 4(%esp)
	calll	Terminal$printl
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fpanic_mkpanic_l16_n1744, 4(%esp)
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
	movl	$.Lstrglobal_fpanic_mkpanic_l19_n1755, 4(%esp)
	calll	Terminal$printl
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fpanic_mkpanic_l20_n1760, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	36(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$dumpbin
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fpanic_mkpanic_l22_n1768, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	32(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$dumphexi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fpanic_mkpanic_l24_n1776, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	calll	__kgetcs
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	movl	$2, 8(%esp)
	calll	Terminal$dumphex
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fpanic_mkpanic_l26_n1786, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	calll	__kgetds
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	movl	$2, 8(%esp)
	calll	Terminal$dumphex
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fpanic_mkpanic_l28_n1796, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	calll	__kgetss
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	movl	$2, 8(%esp)
	calll	Terminal$dumphex
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fpanic_mkpanic_l30_n1806, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	calll	__kgetes
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	movl	$2, 8(%esp)
	calll	Terminal$dumphex
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fpanic_mkpanic_l32_n1816, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	calll	__kgetfs
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	movl	$2, 8(%esp)
	calll	Terminal$dumphex
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fpanic_mkpanic_l34_n1826, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	calll	__kgetgs
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	movl	$2, 8(%esp)
	calll	Terminal$dumphex
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fpanic_mkpanic_l36_n1836, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	calll	__kgeteflags
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	Terminal$dumpbin
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fpanic_mkpanic_l38_n1845, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	calll	__kgetcr0
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	Terminal$dumpbin
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fpanic_mkpanic_l40_n1854, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	calll	__kgetcr2
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	Terminal$dumphexi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fpanic_mkpanic_l42_n1863, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	calll	__kgetcr3
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	Terminal$dumphexi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fpanic_mkpanic_l44_n1872, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	calll	__kgetcr4
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	Terminal$dumpbin
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fpanic_mkpanic_l46_n1881, 4(%esp)
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
	movl	$.Lstrglobal_fpanic_mikpanici_l51_n1893, 12(%esp)
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
.LBB62_1:                               # %futil_mcstr$len_l3_n1904___LOOP___HEAD
                                        # =>This Inner Loop Header: Depth=1
	movl	(%esp), %eax
	leal	1(%eax), %ecx
	movl	%ecx, (%esp)
	movl	4(%esp), %ecx
	cmpb	$0, 1(%ecx,%eax)
	jne	.LBB62_1
.LBB62_2:                               # %futil_mcstr$len_l3_n1904___LOOP___END
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
# BB#3:                                 # %if_futil_mcstr$__eq___l9_n1936___DONE
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
.LBB63_4:                               # %futil_mcstr$__eq___l13_n1941___LOOP___HEAD
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
# BB#5:                                 # %if_futil_mcstr$__eq___l14_n1953___DONE
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
.LBB63_6:                               # %futil_mcstr$__eq___l13_n1941___LOOP___END
	movb	$1, %al
	jmp	.LBB63_2
.LBB63_1:                               # %if_futil_mcstr$__eq___l9_n1936___SUCC
	xorl	%eax, %eax
.LBB63_2:                               # %if_futil_mcstr$__eq___l9_n1936___SUCC
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
.LBB64_1:                               # %futil_mcstr$index_l23_n1969___LOOP___HEAD
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
# BB#3:                                 # %if_futil_mcstr$index_l24_n1980___DONE
                                        #   in Loop: Header=BB64_1 Depth=1
	movl	12(%esp), %esi
	incl	%esi
	movl	%esi, 12(%esp)
	movl	20(%esp), %eax
	movl	%eax, (%esp)
	calll	cstr$len
	cmpl	%eax, %esi
	jl	.LBB64_1
.LBB64_4:                               # %futil_mcstr$index_l23_n1969___LOOP___END
	movl	$-1, %eax
	jmp	.LBB64_5
.LBB64_2:                               # %if_futil_mcstr$index_l24_n1980___SUCC
	movl	12(%esp), %eax
.LBB64_5:                               # %futil_mcstr$index_l23_n1969___LOOP___END
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
# BB#1:                                 # %if_futil_mhex_char_to_num_l41_n2018___SUCC
	cmpl	$57, (%esp)
	jg	.LBB68_2
# BB#4:                                 # %if_futil_mhex_char_to_num_l42_n2022___SUCC
	movl	(%esp), %eax
	addl	$-48, %eax
	popl	%edx
	retl
.LBB68_3:                               # %if_futil_mhex_char_to_num_l41_n2018___DONE
	movl	$-1, %eax
	popl	%edx
	retl
.LBB68_2:                               # %if_futil_mhex_char_to_num_l42_n2022___FAIL
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

	.globl	Keymap$$init
	.align	16, 0x90
	.type	Keymap$$init,@function
Keymap$$init:                           # @"Keymap$$init"
	.cfi_startproc
# BB#0:
	subl	$12, %esp
.Ltmp185:
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
.Ltmp186:
	.size	Keymap$$init, .Ltmp186-Keymap$$init
	.cfi_endproc

	.globl	Keymap$translate_keycode
	.align	16, 0x90
	.type	Keymap$translate_keycode,@function
Keymap$translate_keycode:               # @"Keymap$translate_keycode"
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp187:
	.cfi_def_cfa_offset 32
	movb	40(%esp), %al
	movl	36(%esp), %ecx
	movl	32(%esp), %edx
	movl	%edx, 24(%esp)
	movl	%ecx, 20(%esp)
	andb	$1, %al
	movb	%al, 19(%esp)
	movl	$.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l16_n2065, (%esp)
	calll	cstr$ord
	movl	%eax, 12(%esp)
	cmpl	$1, 20(%esp)
	jne	.LBB71_2
# BB#1:                                 # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2071___SUCC
	movl	$27, 12(%esp)
	jmp	.LBB71_35
.LBB71_2:                               # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2071___FAIL
	movl	20(%esp), %eax
	cmpl	$2, %eax
	jl	.LBB71_8
# BB#3:                                 # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2071___FAIL
	movl	$14, %ecx
	cmpl	%ecx, %eax
	jge	.LBB71_8
# BB#4:                                 # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2080___SUCC
	movzbl	19(%esp), %eax
	cmpl	$1, %eax
	jne	.LBB71_7
# BB#5:                                 # %if_fkeymap_us_mKeymap$translate_keycode_l20_n2082___SUCC
	movl	20(%esp), %eax
	addl	$-2, %eax
	movl	%eax, 4(%esp)
	movl	$.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l21_n2084, (%esp)
	calll	cstr$idxi
	jmp	.LBB71_34
.LBB71_8:                               # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2080___FAIL
	cmpl	$15, 20(%esp)
	jne	.LBB71_10
# BB#9:                                 # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2100___SUCC
	movl	$9, 12(%esp)
	jmp	.LBB71_35
.LBB71_7:                               # %if_fkeymap_us_mKeymap$translate_keycode_l20_n2082___FAIL
	movl	20(%esp), %eax
	addl	$-2, %eax
	movl	%eax, 4(%esp)
	movl	$.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l23_n2091, (%esp)
	calll	cstr$idxi
	jmp	.LBB71_34
.LBB71_10:                              # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2100___FAIL
	movl	20(%esp), %eax
	cmpl	$16, %eax
	jl	.LBB71_15
# BB#11:                                # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2100___FAIL
	movl	$29, %ecx
	cmpl	%ecx, %eax
	jge	.LBB71_15
# BB#12:                                # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2109___SUCC
	movzbl	19(%esp), %eax
	cmpl	$1, %eax
	jne	.LBB71_14
# BB#13:                                # %if_fkeymap_us_mKeymap$translate_keycode_l28_n2111___SUCC
	movl	20(%esp), %eax
	addl	$-16, %eax
	movl	%eax, 4(%esp)
	movl	$.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l29_n2113, (%esp)
	calll	cstr$idxi
	jmp	.LBB71_34
.LBB71_15:                              # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2109___FAIL
	movl	20(%esp), %eax
	cmpl	$30, %eax
	jl	.LBB71_20
# BB#16:                                # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2109___FAIL
	movl	$42, %ecx
	cmpl	%ecx, %eax
	jge	.LBB71_20
# BB#17:                                # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2133___SUCC
	movzbl	19(%esp), %eax
	cmpl	$1, %eax
	jne	.LBB71_19
# BB#18:                                # %if_fkeymap_us_mKeymap$translate_keycode_l35_n2135___SUCC
	movl	20(%esp), %eax
	addl	$-30, %eax
	movl	%eax, 4(%esp)
	movl	$.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l36_n2137, (%esp)
	calll	cstr$idxi
	jmp	.LBB71_34
.LBB71_14:                              # %if_fkeymap_us_mKeymap$translate_keycode_l28_n2111___FAIL
	movl	20(%esp), %eax
	addl	$-16, %eax
	movl	%eax, 4(%esp)
	movl	$.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l31_n2120, (%esp)
	calll	cstr$idxi
	jmp	.LBB71_34
.LBB71_20:                              # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2133___FAIL
	movl	20(%esp), %eax
	cmpl	$43, %eax
	jl	.LBB71_25
# BB#21:                                # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2133___FAIL
	movl	$54, %ecx
	cmpl	%ecx, %eax
	jge	.LBB71_25
# BB#22:                                # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2157___SUCC
	movzbl	19(%esp), %eax
	cmpl	$1, %eax
	jne	.LBB71_24
# BB#23:                                # %if_fkeymap_us_mKeymap$translate_keycode_l42_n2159___SUCC
	movl	20(%esp), %eax
	addl	$-43, %eax
	movl	%eax, 4(%esp)
	movl	$.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l43_n2161, (%esp)
	calll	cstr$idxi
	jmp	.LBB71_34
.LBB71_19:                              # %if_fkeymap_us_mKeymap$translate_keycode_l35_n2135___FAIL
	movl	20(%esp), %eax
	addl	$-30, %eax
	movl	%eax, 4(%esp)
	movl	$.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l38_n2144, (%esp)
	calll	cstr$idxi
	jmp	.LBB71_34
.LBB71_25:                              # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2157___FAIL
	cmpl	$55, 20(%esp)
	jne	.LBB71_28
# BB#26:                                # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2177___SUCC
	movl	$.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l49_n2179, (%esp)
	calll	cstr$ord
	jmp	.LBB71_34
.LBB71_24:                              # %if_fkeymap_us_mKeymap$translate_keycode_l42_n2159___FAIL
	movl	20(%esp), %eax
	addl	$-43, %eax
	movl	%eax, 4(%esp)
	movl	$.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l45_n2168, (%esp)
	calll	cstr$idxi
	jmp	.LBB71_34
.LBB71_28:                              # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2177___FAIL
	cmpl	$57, 20(%esp)
	jne	.LBB71_30
# BB#29:                                # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2185___SUCC
	movl	$.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l51_n2187, (%esp)
	calll	cstr$ord
	jmp	.LBB71_34
.LBB71_30:                              # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2185___FAIL
	cmpl	$59, 20(%esp)
	jne	.LBB71_32
# BB#31:                                # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2193___SUCC
	movl	24(%esp), %eax
	movzbl	2(%eax), %eax
	jmp	.LBB71_34
.LBB71_32:                              # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2193___FAIL
	cmpl	$60, 20(%esp)
	jne	.LBB71_35
# BB#33:                                # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2201___SUCC
	movl	24(%esp), %eax
	movzbl	3(%eax), %eax
.LBB71_34:                              # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2071___DONE
	movl	%eax, 12(%esp)
.LBB71_35:                              # %if_fkeymap_us_mKeymap$translate_keycode_l17_n2071___DONE
	movb	12(%esp), %al
	addl	$28, %esp
	retl
.Ltmp188:
	.size	Keymap$translate_keycode, .Ltmp188-Keymap$translate_keycode
	.cfi_endproc

	.globl	Keymap$is_shifted
	.align	16, 0x90
	.type	Keymap$is_shifted,@function
Keymap$is_shifted:                      # @"Keymap$is_shifted"
	.cfi_startproc
# BB#0:
	subl	$8, %esp
.Ltmp189:
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
.Ltmp190:
	.size	Keymap$is_shifted, .Ltmp190-Keymap$is_shifted
	.cfi_endproc

	.globl	init_keymap
	.align	16, 0x90
	.type	init_keymap,@function
init_keymap:                            # @init_keymap
	.cfi_startproc
# BB#0:
	subl	$12, %esp
.Ltmp191:
	.cfi_def_cfa_offset 16
	calll	Keymap$$init
	movl	%eax, gvar_fkeymap_us_mu_lu_n11__keymap
	addl	$12, %esp
	retl
.Ltmp192:
	.size	init_keymap, .Ltmp192-init_keymap
	.cfi_endproc

	.globl	translate_keycode
	.align	16, 0x90
	.type	translate_keycode,@function
translate_keycode:                      # @translate_keycode
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp193:
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
.Ltmp194:
	.size	translate_keycode, .Ltmp194-translate_keycode
	.cfi_endproc

	.globl	KeyboardBuf$$new
	.align	16, 0x90
	.type	KeyboardBuf$$new,@function
KeyboardBuf$$new:                       # @"KeyboardBuf$$new"
	.cfi_startproc
# BB#0:
	pushl	%esi
.Ltmp195:
	.cfi_def_cfa_offset 8
	subl	$24, %esp
.Ltmp196:
	.cfi_def_cfa_offset 32
.Ltmp197:
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
.Ltmp198:
	.size	KeyboardBuf$$new, .Ltmp198-KeyboardBuf$$new
	.cfi_endproc

	.globl	KeyboardBuf$append
	.align	16, 0x90
	.type	KeyboardBuf$append,@function
KeyboardBuf$append:                     # @"KeyboardBuf$append"
	.cfi_startproc
# BB#0:
	subl	$8, %esp
.Ltmp199:
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
.Ltmp200:
	.size	KeyboardBuf$append, .Ltmp200-KeyboardBuf$append
	.cfi_endproc

	.globl	KeyboardBuf$delete1
	.align	16, 0x90
	.type	KeyboardBuf$delete1,@function
KeyboardBuf$delete1:                    # @"KeyboardBuf$delete1"
	.cfi_startproc
# BB#0:
	pushl	%eax
.Ltmp201:
	.cfi_def_cfa_offset 8
	movl	8(%esp), %eax
	movl	%eax, (%esp)
	cmpl	$0, (%eax)
	jle	.LBB77_2
# BB#1:                                 # %if_fkappsutil_mKeyboardBuf$delete1_l27_n2302___SUCC
	movl	(%esp), %eax
	decl	(%eax)
	movl	(%esp), %eax
	movl	(%eax), %ecx
	movl	8(%eax), %eax
	movb	$0, (%eax,%ecx)
.LBB77_2:                               # %if_fkappsutil_mKeyboardBuf$delete1_l27_n2302___DONE
	popl	%eax
	retl
.Ltmp202:
	.size	KeyboardBuf$delete1, .Ltmp202-KeyboardBuf$delete1
	.cfi_endproc

	.globl	KeyboardBuf$stringview
	.align	16, 0x90
	.type	KeyboardBuf$stringview,@function
KeyboardBuf$stringview:                 # @"KeyboardBuf$stringview"
	.cfi_startproc
# BB#0:
	pushl	%eax
.Ltmp203:
	.cfi_def_cfa_offset 8
	movl	8(%esp), %eax
	movl	%eax, (%esp)
	movl	8(%eax), %eax
	popl	%edx
	retl
.Ltmp204:
	.size	KeyboardBuf$stringview, .Ltmp204-KeyboardBuf$stringview
	.cfi_endproc

	.globl	KeyboardBuf$clear
	.align	16, 0x90
	.type	KeyboardBuf$clear,@function
KeyboardBuf$clear:                      # @"KeyboardBuf$clear"
	.cfi_startproc
# BB#0:
	pushl	%eax
.Ltmp205:
	.cfi_def_cfa_offset 8
	movl	8(%esp), %eax
	movl	%eax, (%esp)
	movl	$0, (%eax)
	movl	(%esp), %eax
	movl	8(%eax), %eax
	movb	$0, (%eax)
	popl	%eax
	retl
.Ltmp206:
	.size	KeyboardBuf$clear, .Ltmp206-KeyboardBuf$clear
	.cfi_endproc

	.globl	KeyboardBuf$handleevent
	.align	16, 0x90
	.type	KeyboardBuf$handleevent,@function
KeyboardBuf$handleevent:                # @"KeyboardBuf$handleevent"
	.cfi_startproc
# BB#0:
	pushl	%ebp
.Ltmp207:
	.cfi_def_cfa_offset 8
.Ltmp208:
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
.Ltmp209:
	.cfi_def_cfa_register %ebp
	pushl	%edi
	pushl	%esi
	subl	$16, %esp
.Ltmp210:
	.cfi_offset %esi, -16
.Ltmp211:
	.cfi_offset %edi, -12
	movb	16(%ebp), %al
	andb	$1, %al
	movl	12(%ebp), %ecx
	movl	8(%ebp), %edx
	movl	%edx, -12(%ebp)
	movl	%ecx, -16(%ebp)
	movb	%al, -17(%ebp)
	je	.LBB80_10
# BB#1:                                 # %if_fkappsutil_mKeyboardBuf$handleevent_l42_n2343___SUCC
	cmpl	$14, -16(%ebp)
	jne	.LBB80_4
# BB#2:                                 # %if_fkappsutil_mKeyboardBuf$handleevent_l43_n2347___SUCC
	movl	-12(%ebp), %eax
	cmpl	$0, (%eax)
	je	.LBB80_10
# BB#3:                                 # %if_fkappsutil_mKeyboardBuf$handleevent_l44_n2353___SUCC
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
	movl	$.Lstrglobal_fkappsutil_mKeyboardBuf$handleevent_l46_n2365, 4(%esp)
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
	jmp	.LBB80_9
.LBB80_4:                               # %if_fkappsutil_mKeyboardBuf$handleevent_l43_n2347___FAIL
	cmpl	$28, -16(%ebp)
	jne	.LBB80_6
# BB#5:                                 # %if_fkappsutil_mKeyboardBuf$handleevent_l43_n2380___SUCC
	movl	-12(%ebp), %eax
	movl	16(%eax), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsutil_mKeyboardBuf$handleevent_l51_n2385, 4(%esp)
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
	jmp	.LBB80_9
.LBB80_6:                               # %if_fkappsutil_mKeyboardBuf$handleevent_l43_n2380___FAIL
	cmpl	$42, -16(%ebp)
	je	.LBB80_10
# BB#7:                                 # %if_fkappsutil_mKeyboardBuf$handleevent_l43_n2399___FAIL
	cmpl	$54, -16(%ebp)
	je	.LBB80_10
# BB#8:                                 # %if_fkappsutil_mKeyboardBuf$handleevent_l43_n2404___FAIL
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
.LBB80_9:                               # %if_fkappsutil_mKeyboardBuf$handleevent_l42_n2343___DONE
	addl	$16, %esp
.LBB80_10:                              # %if_fkappsutil_mKeyboardBuf$handleevent_l42_n2343___DONE
	leal	-8(%ebp), %esp
	popl	%esi
	popl	%edi
	popl	%ebp
	retl
.Ltmp212:
	.size	KeyboardBuf$handleevent, .Ltmp212-KeyboardBuf$handleevent
	.cfi_endproc

	.globl	RawMultibootInfo$get_tag
	.align	16, 0x90
	.type	RawMultibootInfo$get_tag,@function
RawMultibootInfo$get_tag:               # @"RawMultibootInfo$get_tag"
	.cfi_startproc
# BB#0:
	pushl	%esi
.Ltmp213:
	.cfi_def_cfa_offset 8
	subl	$40, %esp
.Ltmp214:
	.cfi_def_cfa_offset 48
.Ltmp215:
	.cfi_offset %esi, -8
	movl	52(%esp), %eax
	movl	48(%esp), %ecx
	movl	%ecx, 36(%esp)
	movl	%eax, 32(%esp)
	movl	$0, 28(%esp)
	movl	$8, 24(%esp)
	movl	36(%esp), %eax
	movl	%eax, 20(%esp)
	jmp	.LBB81_1
	.align	16, 0x90
.LBB81_6:                               # %if_fmbdata_mRawMultibootInfo$get_tag_l23_n2457___DONE
                                        #   in Loop: Header=BB81_1 Depth=1
	incl	28(%esp)
.LBB81_1:                               # =>This Inner Loop Header: Depth=1
	movl	24(%esp), %eax
	movl	36(%esp), %ecx
	cmpl	(%ecx), %eax
	jge	.LBB81_7
# BB#2:                                 # %fmbdata_mRawMultibootInfo$get_tag_l18_n2430___LOOP___HEAD
                                        #   in Loop: Header=BB81_1 Depth=1
	movl	28(%esp), %eax
	cmpl	32(%esp), %eax
	je	.LBB81_3
# BB#4:                                 # %if_fmbdata_mRawMultibootInfo$get_tag_l19_n2439___DONE
                                        #   in Loop: Header=BB81_1 Depth=1
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
	je	.LBB81_6
# BB#5:                                 # %if_fmbdata_mRawMultibootInfo$get_tag_l23_n2457___SUCC
                                        #   in Loop: Header=BB81_1 Depth=1
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
	jmp	.LBB81_6
.LBB81_7:                               # %fmbdata_mRawMultibootInfo$get_tag_l18_n2430___LOOP___END
	xorl	%eax, %eax
.LBB81_8:                               # %fmbdata_mRawMultibootInfo$get_tag_l18_n2430___LOOP___END
	addl	$40, %esp
	popl	%esi
	retl
.LBB81_3:                               # %if_fmbdata_mRawMultibootInfo$get_tag_l19_n2439___SUCC
	movl	20(%esp), %eax
	movl	24(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	ptr$offset
	jmp	.LBB81_8
.Ltmp216:
	.size	RawMultibootInfo$get_tag, .Ltmp216-RawMultibootInfo$get_tag
	.cfi_endproc

	.globl	RawMultibootInfo$get_type
	.align	16, 0x90
	.type	RawMultibootInfo$get_type,@function
RawMultibootInfo$get_type:              # @"RawMultibootInfo$get_type"
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp217:
	.cfi_def_cfa_offset 32
	movl	36(%esp), %eax
	movl	32(%esp), %ecx
	movl	%ecx, 24(%esp)
	movl	%eax, 20(%esp)
	movl	$0, 16(%esp)
	movl	24(%esp), %eax
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	jmp	.LBB82_1
	.align	16, 0x90
.LBB82_3:                               # %if_fmbdata_mRawMultibootInfo$get_type_l34_n2495___DONE
                                        #   in Loop: Header=BB82_1 Depth=1
	movl	16(%esp), %eax
	incl	%eax
	movl	%eax, 16(%esp)
	movl	24(%esp), %ecx
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
.LBB82_1:                               # =>This Inner Loop Header: Depth=1
	calll	RawMultibootInfo$get_tag
	movl	%eax, 12(%esp)
	cmpl	$0, (%eax)
	je	.LBB82_4
# BB#2:                                 # %fmbdata_mRawMultibootInfo$get_type_l33_n2484___LOOP___HEAD
                                        #   in Loop: Header=BB82_1 Depth=1
	movl	12(%esp), %eax
	movl	(%eax), %eax
	cmpl	20(%esp), %eax
	jne	.LBB82_3
# BB#5:                                 # %if_fmbdata_mRawMultibootInfo$get_type_l34_n2495___SUCC
	movl	12(%esp), %eax
	addl	$28, %esp
	retl
.LBB82_4:                               # %fmbdata_mRawMultibootInfo$get_type_l33_n2484___LOOP___END
	xorl	%eax, %eax
	addl	$28, %esp
	retl
.Ltmp218:
	.size	RawMultibootInfo$get_type, .Ltmp218-RawMultibootInfo$get_type
	.cfi_endproc

	.globl	RawMultibootInfo$has_type
	.align	16, 0x90
	.type	RawMultibootInfo$has_type,@function
RawMultibootInfo$has_type:              # @"RawMultibootInfo$has_type"
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
.LBB83_3:                               # %if_fmbdata_mRawMultibootInfo$has_type_l47_n2530___DONE
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
# BB#2:                                 # %fmbdata_mRawMultibootInfo$has_type_l46_n2519___LOOP___HEAD
                                        #   in Loop: Header=BB83_1 Depth=1
	movl	12(%esp), %eax
	movl	(%eax), %eax
	cmpl	20(%esp), %eax
	jne	.LBB83_3
# BB#5:                                 # %if_fmbdata_mRawMultibootInfo$has_type_l47_n2530___SUCC
	movb	$1, %al
	addl	$28, %esp
	retl
.LBB83_4:                               # %fmbdata_mRawMultibootInfo$has_type_l46_n2519___LOOP___END
	xorl	%eax, %eax
	addl	$28, %esp
	retl
.Ltmp220:
	.size	RawMultibootInfo$has_type, .Ltmp220-RawMultibootInfo$has_type
	.cfi_endproc

	.globl	RawMultibootInfo$print
	.align	16, 0x90
	.type	RawMultibootInfo$print,@function
RawMultibootInfo$print:                 # @"RawMultibootInfo$print"
	.cfi_startproc
# BB#0:
	pushl	%ebp
.Ltmp221:
	.cfi_def_cfa_offset 8
.Ltmp222:
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
.Ltmp223:
	.cfi_def_cfa_register %ebp
	pushl	%esi
	subl	$20, %esp
.Ltmp224:
	.cfi_offset %esi, -12
	movl	8(%ebp), %eax
	movl	%eax, -8(%ebp)
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l56_n2549, 4(%esp)
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
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l58_n2559, 4(%esp)
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
	jmp	.LBB84_1
	.align	16, 0x90
.LBB84_35:                              # %if_fmbdata_mRawMultibootInfo$print_l145_n2974___DONE
                                        #   in Loop: Header=BB84_1 Depth=1
	movl	-16(%ebp), %eax
.LBB84_1:                               # =>This Inner Loop Header: Depth=1
	cmpl	$0, (%eax)
	je	.LBB84_32
# BB#2:                                 # %fmbdata_mRawMultibootInfo$print_l62_n2568___LOOP___HEAD
                                        #   in Loop: Header=BB84_1 Depth=1
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
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l64_n2579, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	-16(%ebp), %eax
	cmpl	$1, (%eax)
	jne	.LBB84_4
# BB#3:                                 # %if_fmbdata_mRawMultibootInfo$print_l66_n2587___SUCC
                                        #   in Loop: Header=BB84_1 Depth=1
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l67_n2590, 4(%esp)
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
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l69_n2602, 4(%esp)
	jmp	.LBB84_29
	.align	16, 0x90
.LBB84_4:                               # %if_fmbdata_mRawMultibootInfo$print_l66_n2587___FAIL
                                        #   in Loop: Header=BB84_1 Depth=1
	movl	-16(%ebp), %eax
	cmpl	$2, (%eax)
	jne	.LBB84_6
# BB#5:                                 # %if_fmbdata_mRawMultibootInfo$print_l66_n2610___SUCC
                                        #   in Loop: Header=BB84_1 Depth=1
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l71_n2613, 4(%esp)
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
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l73_n2625, 4(%esp)
	jmp	.LBB84_29
.LBB84_6:                               # %if_fmbdata_mRawMultibootInfo$print_l66_n2610___FAIL
                                        #   in Loop: Header=BB84_1 Depth=1
	movl	-16(%ebp), %eax
	cmpl	$3, (%eax)
	jne	.LBB84_8
# BB#7:                                 # %if_fmbdata_mRawMultibootInfo$print_l66_n2633___SUCC
                                        #   in Loop: Header=BB84_1 Depth=1
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l75_n2636, 4(%esp)
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
.LBB84_29:                              # %if_fmbdata_mRawMultibootInfo$print_l66_n2587___DONE
                                        #   in Loop: Header=BB84_1 Depth=1
	calll	Terminal$print
.LBB84_30:                              # %if_fmbdata_mRawMultibootInfo$print_l66_n2587___DONE
                                        #   in Loop: Header=BB84_1 Depth=1
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l130_n2919, 4(%esp)
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
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l132_n2929, 4(%esp)
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
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l134_n2939, 4(%esp)
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
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l136_n2949, 4(%esp)
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
	je	.LBB84_31
# BB#33:                                # %if_fmbdata_mRawMultibootInfo$print_l140_n2963___DONE
                                        #   in Loop: Header=BB84_1 Depth=1
	movl	-16(%ebp), %eax
	cmpl	$0, (%eax)
	jne	.LBB84_35
# BB#34:                                # %if_fmbdata_mRawMultibootInfo$print_l145_n2974___SUCC
                                        #   in Loop: Header=BB84_1 Depth=1
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l146_n2977, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	jmp	.LBB84_35
.LBB84_8:                               # %if_fmbdata_mRawMultibootInfo$print_l66_n2633___FAIL
                                        #   in Loop: Header=BB84_1 Depth=1
	movl	-16(%ebp), %eax
	cmpl	$4, (%eax)
	jne	.LBB84_11
# BB#9:                                 # %if_fmbdata_mRawMultibootInfo$print_l66_n2649___SUCC
                                        #   in Loop: Header=BB84_1 Depth=1
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l78_n2652, 4(%esp)
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
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l80_n2663, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	-16(%ebp), %ecx
	movl	12(%ecx), %ecx
.LBB84_10:                              # %if_fmbdata_mRawMultibootInfo$print_l66_n2587___DONE
                                        #   in Loop: Header=BB84_1 Depth=1
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	jmp	.LBB84_30
.LBB84_11:                              # %if_fmbdata_mRawMultibootInfo$print_l66_n2649___FAIL
                                        #   in Loop: Header=BB84_1 Depth=1
	movl	-16(%ebp), %eax
	cmpl	$5, (%eax)
	jne	.LBB84_13
# BB#12:                                # %if_fmbdata_mRawMultibootInfo$print_l66_n2677___SUCC
                                        #   in Loop: Header=BB84_1 Depth=1
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l83_n2680, 4(%esp)
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
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l85_n2692, 4(%esp)
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
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l87_n2704, 4(%esp)
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
	jmp	.LBB84_30
.LBB84_13:                              # %if_fmbdata_mRawMultibootInfo$print_l66_n2677___FAIL
                                        #   in Loop: Header=BB84_1 Depth=1
	movl	-16(%ebp), %eax
	cmpl	$6, (%eax)
	jne	.LBB84_15
# BB#14:                                # %if_fmbdata_mRawMultibootInfo$print_l66_n2719___SUCC
                                        #   in Loop: Header=BB84_1 Depth=1
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l90_n2722, 4(%esp)
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
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l92_n2733, 4(%esp)
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
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l94_n2744, 4(%esp)
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
	jmp	.LBB84_30
.LBB84_15:                              # %if_fmbdata_mRawMultibootInfo$print_l66_n2719___FAIL
                                        #   in Loop: Header=BB84_1 Depth=1
	movl	-16(%ebp), %eax
	cmpl	$7, (%eax)
	jne	.LBB84_17
# BB#16:                                # %if_fmbdata_mRawMultibootInfo$print_l66_n2765___SUCC
                                        #   in Loop: Header=BB84_1 Depth=1
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l98_n2768, 4(%esp)
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
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l100_n2779, 4(%esp)
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
	jmp	.LBB84_30
.LBB84_17:                              # %if_fmbdata_mRawMultibootInfo$print_l66_n2765___FAIL
                                        #   in Loop: Header=BB84_1 Depth=1
	movl	-16(%ebp), %eax
	cmpl	$8, (%eax)
	jne	.LBB84_19
# BB#18:                                # %if_fmbdata_mRawMultibootInfo$print_l66_n2795___SUCC
                                        #   in Loop: Header=BB84_1 Depth=1
	movl	%esp, %esi
	leal	-16(%esi), %eax
	movl	%eax, %esp
	movl	-16(%ebp), %eax
	movl	%eax, -16(%esi)
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l104_n2801, 4(%esp)
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
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l106_n2812, 4(%esp)
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
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l108_n2822, 4(%esp)
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
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l110_n2832, 4(%esp)
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
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l112_n2842, 4(%esp)
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
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l114_n2853, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	-16(%esi), %ecx
	movzbl	29(%ecx), %ecx
	jmp	.LBB84_10
.LBB84_19:                              # %if_fmbdata_mRawMultibootInfo$print_l66_n2795___FAIL
                                        #   in Loop: Header=BB84_1 Depth=1
	movl	-16(%ebp), %eax
	cmpl	$10, (%eax)
	jne	.LBB84_21
# BB#20:                                # %if_fmbdata_mRawMultibootInfo$print_l66_n2867___SUCC
                                        #   in Loop: Header=BB84_1 Depth=1
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l117_n2870, 4(%esp)
	jmp	.LBB84_29
.LBB84_21:                              # %if_fmbdata_mRawMultibootInfo$print_l66_n2867___FAIL
                                        #   in Loop: Header=BB84_1 Depth=1
	movl	-16(%ebp), %eax
	cmpl	$14, (%eax)
	jne	.LBB84_24
# BB#22:                                # %if_fmbdata_mRawMultibootInfo$print_l66_n2878___SUCC
                                        #   in Loop: Header=BB84_1 Depth=1
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l119_n2881, 4(%esp)
	jmp	.LBB84_23
.LBB84_24:                              # %if_fmbdata_mRawMultibootInfo$print_l66_n2878___FAIL
                                        #   in Loop: Header=BB84_1 Depth=1
	movl	-16(%ebp), %eax
	cmpl	$15, (%eax)
	jne	.LBB84_26
# BB#25:                                # %if_fmbdata_mRawMultibootInfo$print_l66_n2892___SUCC
                                        #   in Loop: Header=BB84_1 Depth=1
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l122_n2895, 4(%esp)
.LBB84_23:                              # %if_fmbdata_mRawMultibootInfo$print_l66_n2587___DONE
                                        #   in Loop: Header=BB84_1 Depth=1
	calll	Terminal$print
	addl	$16, %esp
	movl	-16(%ebp), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	calll	MBRSDP1Tag$printOEM
	jmp	.LBB84_30
.LBB84_26:                              # %if_fmbdata_mRawMultibootInfo$print_l66_n2892___FAIL
                                        #   in Loop: Header=BB84_1 Depth=1
	movl	-16(%ebp), %eax
	cmpl	$16, (%eax)
	jne	.LBB84_28
# BB#27:                                # %if_fmbdata_mRawMultibootInfo$print_l66_n2906___SUCC
                                        #   in Loop: Header=BB84_1 Depth=1
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l125_n2909, 4(%esp)
	jmp	.LBB84_29
.LBB84_28:                              # %if_fmbdata_mRawMultibootInfo$print_l66_n2906___FAIL
                                        #   in Loop: Header=BB84_1 Depth=1
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l127_n2914, 4(%esp)
	jmp	.LBB84_29
.LBB84_31:                              # %if_fmbdata_mRawMultibootInfo$print_l140_n2963___SUCC
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawMultibootInfo$print_l141_n2966, 4(%esp)
	calll	Terminal$print
.LBB84_32:                              # %fmbdata_mRawMultibootInfo$print_l62_n2568___LOOP___END
	leal	-4(%ebp), %esp
	popl	%esi
	popl	%ebp
	retl
.Ltmp225:
	.size	RawMultibootInfo$print, .Ltmp225-RawMultibootInfo$print
	.cfi_endproc

	.globl	MBMMAPMemTag$print
	.align	16, 0x90
	.type	MBMMAPMemTag$print,@function
MBMMAPMemTag$print:                     # @"MBMMAPMemTag$print"
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp226:
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
	jle	.LBB85_2
	.align	16, 0x90
.LBB85_1:                               # %fmbdata_mMBMMAPMemTag$print_l176_n2999___LOOP___HEAD
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
	movl	$.Lstrglobal_fmbdata_mMBMMAPMemTag$print_l178_n3016, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	16(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mMBMMAPMemTag$print_l180_n3024, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	12(%esp), %ecx
	movl	16(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mMBMMAPMemTag$print_l182_n3034, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	12(%esp), %ecx
	movl	(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$dumphexi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mMBMMAPMemTag$print_l184_n3045, 4(%esp)
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
	jl	.LBB85_1
.LBB85_2:                               # %fmbdata_mMBMMAPMemTag$print_l176_n2999___LOOP___END
	addl	$28, %esp
	retl
.Ltmp227:
	.size	MBMMAPMemTag$print, .Ltmp227-MBMMAPMemTag$print
	.cfi_endproc

	.globl	MBModuleTag$get_args
	.align	16, 0x90
	.type	MBModuleTag$get_args,@function
MBModuleTag$get_args:                   # @"MBModuleTag$get_args"
	.cfi_startproc
# BB#0:
	subl	$12, %esp
.Ltmp228:
	.cfi_def_cfa_offset 16
	movl	16(%esp), %eax
	movl	%eax, 8(%esp)
	movl	%eax, (%esp)
	movl	$16, 4(%esp)
	calll	ptr$offset
	addl	$12, %esp
	retl
.Ltmp229:
	.size	MBModuleTag$get_args, .Ltmp229-MBModuleTag$get_args
	.cfi_endproc

	.globl	MBModuleTag$get_addr
	.align	16, 0x90
	.type	MBModuleTag$get_addr,@function
MBModuleTag$get_addr:                   # @"MBModuleTag$get_addr"
	.cfi_startproc
# BB#0:
	pushl	%eax
.Ltmp230:
	.cfi_def_cfa_offset 8
	movl	8(%esp), %eax
	movl	%eax, (%esp)
	movl	8(%eax), %eax
	addl	gvar_fin_mu_lu_n9__base_vma, %eax
	popl	%edx
	retl
.Ltmp231:
	.size	MBModuleTag$get_addr, .Ltmp231-MBModuleTag$get_addr
	.cfi_endproc

	.globl	MBRSDP1Tag$printOEM
	.align	16, 0x90
	.type	MBRSDP1Tag$printOEM,@function
MBRSDP1Tag$printOEM:                    # @"MBRSDP1Tag$printOEM"
	.cfi_startproc
# BB#0:
	subl	$12, %esp
.Ltmp232:
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
.Ltmp233:
	.size	MBRSDP1Tag$printOEM, .Ltmp233-MBRSDP1Tag$printOEM
	.cfi_endproc

	.globl	MultibootModuleInfo$$new
	.align	16, 0x90
	.type	MultibootModuleInfo$$new,@function
MultibootModuleInfo$$new:               # @"MultibootModuleInfo$$new"
	.cfi_startproc
# BB#0:
	pushl	%esi
.Ltmp234:
	.cfi_def_cfa_offset 8
	subl	$24, %esp
.Ltmp235:
	.cfi_def_cfa_offset 32
.Ltmp236:
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
.Ltmp237:
	.size	MultibootModuleInfo$$new, .Ltmp237-MultibootModuleInfo$$new
	.cfi_endproc

	.globl	MultibootInfo$$load
	.align	16, 0x90
	.type	MultibootInfo$$load,@function
MultibootInfo$$load:                    # @"MultibootInfo$$load"
	.cfi_startproc
# BB#0:
	pushl	%ebp
.Ltmp238:
	.cfi_def_cfa_offset 8
.Ltmp239:
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
.Ltmp240:
	.cfi_def_cfa_register %ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$28, %esp
.Ltmp241:
	.cfi_offset %esi, -20
.Ltmp242:
	.cfi_offset %edi, -16
.Ltmp243:
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
	jge	.LBB90_13
# BB#1:                                 # %if_fmbdata_mMultibootInfo$$load_l284_n3156___DONE
	movl	-20(%ebp), %eax
	movl	4(%eax), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$1, 4(%esp)
	calll	RawMultibootInfo$has_type
	addl	$16, %esp
	testb	$1, %al
	je	.LBB90_13
# BB#2:                                 # %if_fmbdata_mMultibootInfo$$load_l288_n3163___SUCC
	movl	-20(%ebp), %eax
	movl	4(%eax), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$2, 4(%esp)
	calll	RawMultibootInfo$has_type
	addl	$16, %esp
	testb	$1, %al
	je	.LBB90_13
# BB#3:                                 # %if_fmbdata_mMultibootInfo$$load_l289_n3169___SUCC
	movl	-20(%ebp), %eax
	movl	4(%eax), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$5, 4(%esp)
	calll	RawMultibootInfo$has_type
	addl	$16, %esp
	testb	$1, %al
	je	.LBB90_13
# BB#4:                                 # %if_fmbdata_mMultibootInfo$$load_l290_n3175___SUCC
	movl	-20(%ebp), %eax
	movl	4(%eax), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$8, 4(%esp)
	calll	RawMultibootInfo$has_type
	addl	$16, %esp
	testb	$1, %al
	je	.LBB90_13
# BB#5:                                 # %if_fmbdata_mMultibootInfo$$load_l291_n3181___SUCC
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
	jmp	.LBB90_6
.LBB90_12:                              # %if_fmbdata_mMultibootInfo$$load_l313_n3292___DONE
                                        #   in Loop: Header=BB90_6 Depth=1
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
.LBB90_6:                               # %if_fmbdata_mMultibootInfo$$load_l291_n3181___SUCC
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, (%eax)
	je	.LBB90_13
# BB#7:                                 # %fmbdata_mMultibootInfo$$load_l312_n3281___LOOP___HEAD
                                        #   in Loop: Header=BB90_6 Depth=1
	movl	(%edi), %eax
	cmpl	$3, (%eax)
	jne	.LBB90_12
# BB#8:                                 # %if_fmbdata_mMultibootInfo$$load_l313_n3292___SUCC
                                        #   in Loop: Header=BB90_6 Depth=1
	movl	-20(%ebp), %eax
	cmpl	$0, 52(%eax)
	jne	.LBB90_10
# BB#9:                                 # %if_fmbdata_mMultibootInfo$$load_l314_n3298___SUCC
                                        #   in Loop: Header=BB90_6 Depth=1
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
	jmp	.LBB90_11
.LBB90_10:                              # %if_fmbdata_mMultibootInfo$$load_l314_n3298___FAIL
                                        #   in Loop: Header=BB90_6 Depth=1
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
.LBB90_11:                              # %if_fmbdata_mMultibootInfo$$load_l314_n3298___DONE
                                        #   in Loop: Header=BB90_6 Depth=1
	movl	-20(%ebp), %eax
	incl	52(%eax)
	jmp	.LBB90_12
.LBB90_13:                              # %if_fmbdata_mMultibootInfo$$load_l284_n3156___SUCC
	movl	-20(%ebp), %eax
	leal	-12(%ebp), %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
.Ltmp244:
	.size	MultibootInfo$$load, .Ltmp244-MultibootInfo$$load
	.cfi_endproc

	.globl	MultibootInfo$get_mod_by_args
	.align	16, 0x90
	.type	MultibootInfo$get_mod_by_args,@function
MultibootInfo$get_mod_by_args:          # @"MultibootInfo$get_mod_by_args"
	.cfi_startproc
# BB#0:
	pushl	%ebp
.Ltmp245:
	.cfi_def_cfa_offset 8
.Ltmp246:
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
.Ltmp247:
	.cfi_def_cfa_register %ebp
	pushl	%edi
	pushl	%esi
	subl	$16, %esp
.Ltmp248:
	.cfi_offset %esi, -16
.Ltmp249:
	.cfi_offset %edi, -12
	movl	12(%ebp), %eax
	movl	8(%ebp), %ecx
	movl	%ecx, -12(%ebp)
	movl	%eax, -16(%ebp)
	movl	-12(%ebp), %eax
	cmpl	$0, 52(%eax)
	je	.LBB91_1
# BB#3:                                 # %if_fmbdata_mMultibootInfo$get_mod_by_args_l335_n3346___DONE
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
	jle	.LBB91_1
	.align	16, 0x90
.LBB91_4:                               # %fmbdata_mMultibootInfo$get_mod_by_args_l341_n3356___LOOP___HEAD
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
	jne	.LBB91_5
# BB#6:                                 # %if_fmbdata_mMultibootInfo$get_mod_by_args_l342_n3367___DONE
                                        #   in Loop: Header=BB91_4 Depth=1
	incl	(%edi)
	movl	(%esi), %eax
	movl	12(%eax), %eax
	movl	%eax, (%esi)
	movl	(%edi), %eax
	movl	-12(%ebp), %ecx
	cmpl	52(%ecx), %eax
	jl	.LBB91_4
.LBB91_1:                               # %if_fmbdata_mMultibootInfo$get_mod_by_args_l335_n3346___SUCC
	xorl	%eax, %eax
.LBB91_2:                               # %if_fmbdata_mMultibootInfo$get_mod_by_args_l335_n3346___SUCC
	leal	-8(%ebp), %esp
	popl	%esi
	popl	%edi
	popl	%ebp
	retl
.LBB91_5:                               # %if_fmbdata_mMultibootInfo$get_mod_by_args_l342_n3367___SUCC
	movl	(%esi), %eax
	jmp	.LBB91_2
.Ltmp250:
	.size	MultibootInfo$get_mod_by_args, .Ltmp250-MultibootInfo$get_mod_by_args
	.cfi_endproc

	.globl	RawVBEControllerInfo$print
	.align	16, 0x90
	.type	RawVBEControllerInfo$print,@function
RawVBEControllerInfo$print:             # @"RawVBEControllerInfo$print"
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp251:
	.cfi_def_cfa_offset 32
	movl	32(%esp), %eax
	movl	%eax, 24(%esp)
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l374_n3386, 4(%esp)
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
	movl	$.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l379_n3411, 4(%esp)
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
	movl	$.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l381_n3423, 4(%esp)
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
	movl	$.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l383_n3435, 4(%esp)
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
	movl	$.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l385_n3447, 4(%esp)
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
	movl	$.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l387_n3459, 4(%esp)
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
	movl	$.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l389_n3471, 4(%esp)
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
	movl	$.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l391_n3483, 4(%esp)
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
	movl	$.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l393_n3495, 4(%esp)
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
	movl	$.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l395_n3507, 4(%esp)
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
	movl	$.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l397_n3519, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	24(%esp), %ecx
	movzwl	18(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	addl	$28, %esp
	retl
.Ltmp252:
	.size	RawVBEControllerInfo$print, .Ltmp252-RawVBEControllerInfo$print
	.cfi_endproc

	.globl	RawVBEModeInfo$print
	.align	16, 0x90
	.type	RawVBEModeInfo$print,@function
RawVBEModeInfo$print:                   # @"RawVBEModeInfo$print"
	.cfi_startproc
# BB#0:
	subl	$28, %esp
.Ltmp253:
	.cfi_def_cfa_offset 32
	movl	32(%esp), %eax
	movl	%eax, 24(%esp)
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l445_n3531, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	24(%esp), %ecx
	movzwl	(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$dumpbin
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l447_n3542, 4(%esp)
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
	movl	$.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l449_n3554, 4(%esp)
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
	movl	$.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l452_n3566, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	24(%esp), %ecx
	movzwl	18(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l454_n3577, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	24(%esp), %ecx
	movzwl	20(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l456_n3588, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	24(%esp), %ecx
	movzbl	25(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l459_n3599, 4(%esp)
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
	movl	$.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l461_n3611, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	24(%esp), %ecx
	movl	40(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$dumphexi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l463_n3621, 4(%esp)
	calll	Terminal$print
	addl	$28, %esp
	retl
.Ltmp254:
	.size	RawVBEModeInfo$print, .Ltmp254-RawVBEModeInfo$print
	.cfi_endproc

	.globl	rcsin
	.align	16, 0x90
	.type	rcsin,@function
rcsin:                                  # @rcsin
	.cfi_startproc
# BB#0:
	pushl	%ebp
.Ltmp255:
	.cfi_def_cfa_offset 8
.Ltmp256:
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
.Ltmp257:
	.cfi_def_cfa_register %ebp
	pushl	%esi
	subl	$20, %esp
.Ltmp258:
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
	jbe	.LBB94_2
# BB#1:                                 # %if_fkappsraycasterrcmath_mrcsin_l9_n3629___SUCC
	fsubl	-16(%ebp)
	fstpl	-16(%ebp)
	fldz
.LBB94_2:                               # %if_fkappsraycasterrcmath_mrcsin_l9_n3629___DONE
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
	movl	$.Lstrglobal_fkappsraycasterrcmath_mrcsin_l13_n3639, -16(%eax)
	movl	-16(%esi), %eax
	shll	$3, %eax
	subl	$16, %esp
	movl	%eax, 4(%esp)
	movl	$.Lstrglobal_fkappsraycasterrcmath_mrcsin_l13_n3639, (%esp)
	calll	ptr$offset
	addl	$16, %esp
	fldl	(%eax)
	leal	-4(%ebp), %esp
	popl	%esi
	popl	%ebp
	retl
.Ltmp259:
	.size	rcsin, .Ltmp259-rcsin
	.cfi_endproc

	.globl	rccos
	.align	16, 0x90
	.type	rccos,@function
rccos:                                  # @rccos
	.cfi_startproc
# BB#0:
	pushl	%ebp
.Ltmp260:
	.cfi_def_cfa_offset 8
.Ltmp261:
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
.Ltmp262:
	.cfi_def_cfa_register %ebp
	pushl	%esi
	subl	$20, %esp
.Ltmp263:
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
# BB#1:                                 # %if_fkappsraycasterrcmath_mrccos_l17_n3655___SUCC
	fsubl	-16(%ebp)
	fstpl	-16(%ebp)
	fldz
.LBB95_2:                               # %if_fkappsraycasterrcmath_mrccos_l17_n3655___DONE
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
	movl	$.Lstrglobal_fkappsraycasterrcmath_mrccos_l21_n3665, -16(%eax)
	movl	-16(%esi), %eax
	shll	$3, %eax
	subl	$16, %esp
	movl	%eax, 4(%esp)
	movl	$.Lstrglobal_fkappsraycasterrcmath_mrccos_l21_n3665, (%esp)
	calll	ptr$offset
	addl	$16, %esp
	fldl	(%eax)
	leal	-4(%ebp), %esp
	popl	%esi
	popl	%ebp
	retl
.Ltmp264:
	.size	rccos, .Ltmp264-rccos
	.cfi_endproc

	.globl	rcrot_get__
	.align	16, 0x90
	.type	rcrot_get__,@function
rcrot_get__:                            # @rcrot_get__
	.cfi_startproc
# BB#0:
	movl	$.Lstrglobal_fkappsraycasterrcrots_mrcrot_get___l9_n3677, %eax
	retl
.Ltmp265:
	.size	rcrot_get__, .Ltmp265-rcrot_get__
	.cfi_endproc

	.globl	rcrot_get_for
	.align	16, 0x90
	.type	rcrot_get_for,@function
rcrot_get_for:                          # @rcrot_get_for
	.cfi_startproc
# BB#0:
	subl	$12, %esp
.Ltmp266:
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
.Ltmp267:
	.size	rcrot_get_for, .Ltmp267-rcrot_get_for
	.cfi_endproc

	.globl	get_map
	.align	16, 0x90
	.type	get_map,@function
get_map:                                # @get_map
	.cfi_startproc
# BB#0:
	movl	$.Lstrglobal_fkappsraycasterrcmap_mget_map_l1_n3691, %eax
	retl
.Ltmp268:
	.size	get_map, .Ltmp268-get_map
	.cfi_endproc

	.globl	get_map_w
	.align	16, 0x90
	.type	get_map_w,@function
get_map_w:                              # @get_map_w
	.cfi_startproc
# BB#0:
	movl	$24, %eax
	retl
.Ltmp269:
	.size	get_map_w, .Ltmp269-get_map_w
	.cfi_endproc

	.globl	get_map_h
	.align	16, 0x90
	.type	get_map_h,@function
get_map_h:                              # @get_map_h
	.cfi_startproc
# BB#0:
	movl	$24, %eax
	retl
.Ltmp270:
	.size	get_map_h, .Ltmp270-get_map_h
	.cfi_endproc

	.globl	get_font
	.align	16, 0x90
	.type	get_font,@function
get_font:                               # @get_font
	.cfi_startproc
# BB#0:
	movl	$.Lstrglobal_ffontfont_mget_font_l1_n3696, %eax
	retl
.Ltmp271:
	.size	get_font, .Ltmp271-get_font
	.cfi_endproc

	.globl	get_colors
	.align	16, 0x90
	.type	get_colors,@function
get_colors:                             # @get_colors
	.cfi_startproc
# BB#0:
	movl	$.Lstrglobal_ffontfont_mget_colors_l3_n3699, %eax
	retl
.Ltmp272:
	.size	get_colors, .Ltmp272-get_colors
	.cfi_endproc

	.globl	Framebuffer$$new_hw
	.align	16, 0x90
	.type	Framebuffer$$new_hw,@function
Framebuffer$$new_hw:                    # @"Framebuffer$$new_hw"
	.cfi_startproc
# BB#0:
	pushl	%edi
.Ltmp273:
	.cfi_def_cfa_offset 8
	pushl	%esi
.Ltmp274:
	.cfi_def_cfa_offset 12
	subl	$36, %esp
.Ltmp275:
	.cfi_def_cfa_offset 48
.Ltmp276:
	.cfi_offset %esi, -12
.Ltmp277:
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
.Ltmp278:
	.size	Framebuffer$$new_hw, .Ltmp278-Framebuffer$$new_hw
	.cfi_endproc

	.globl	Framebuffer$$new
	.align	16, 0x90
	.type	Framebuffer$$new,@function
Framebuffer$$new:                       # @"Framebuffer$$new"
	.cfi_startproc
# BB#0:
	pushl	%ebp
.Ltmp279:
	.cfi_def_cfa_offset 8
	pushl	%ebx
.Ltmp280:
	.cfi_def_cfa_offset 12
	pushl	%edi
.Ltmp281:
	.cfi_def_cfa_offset 16
	pushl	%esi
.Ltmp282:
	.cfi_def_cfa_offset 20
	subl	$44, %esp
.Ltmp283:
	.cfi_def_cfa_offset 64
.Ltmp284:
	.cfi_offset %esi, -20
.Ltmp285:
	.cfi_offset %edi, -16
.Ltmp286:
	.cfi_offset %ebx, -12
.Ltmp287:
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
.Ltmp288:
	.size	Framebuffer$$new, .Ltmp288-Framebuffer$$new
	.cfi_endproc

	.globl	Framebuffer$$from_mbinfo
	.align	16, 0x90
	.type	Framebuffer$$from_mbinfo,@function
Framebuffer$$from_mbinfo:               # @"Framebuffer$$from_mbinfo"
	.cfi_startproc
# BB#0:
	pushl	%edi
.Ltmp289:
	.cfi_def_cfa_offset 8
	pushl	%esi
.Ltmp290:
	.cfi_def_cfa_offset 12
	subl	$36, %esp
.Ltmp291:
	.cfi_def_cfa_offset 48
.Ltmp292:
	.cfi_offset %esi, -12
.Ltmp293:
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
.Ltmp294:
	.size	Framebuffer$$from_mbinfo, .Ltmp294-Framebuffer$$from_mbinfo
	.cfi_endproc

	.globl	Framebuffer$fill
	.align	16, 0x90
	.type	Framebuffer$fill,@function
Framebuffer$fill:                       # @"Framebuffer$fill"
	.cfi_startproc
# BB#0:
	pushl	%esi
.Ltmp295:
	.cfi_def_cfa_offset 8
	subl	$32, %esp
.Ltmp296:
	.cfi_def_cfa_offset 40
.Ltmp297:
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
	jle	.LBB106_4
	.align	16, 0x90
.LBB106_1:                              # %fframebuffer_mFramebuffer$fill_l31_n3772___LOOP___HEAD
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB106_2 Depth 2
	movl	$0, 8(%esp)
	movl	28(%esp), %eax
	cmpl	$0, 4(%eax)
	jle	.LBB106_3
	.align	16, 0x90
.LBB106_2:                              # %fframebuffer_mFramebuffer$fill_l33_n3779___LOOP___HEAD
                                        #   Parent Loop BB106_1 Depth=1
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
	jl	.LBB106_2
.LBB106_3:                              # %fframebuffer_mFramebuffer$fill_l33_n3779___LOOP___END
                                        #   in Loop: Header=BB106_1 Depth=1
	movl	12(%esp), %eax
	incl	%eax
	movl	%eax, 12(%esp)
	movl	28(%esp), %ecx
	cmpl	8(%ecx), %eax
	jl	.LBB106_1
.LBB106_4:                              # %fframebuffer_mFramebuffer$fill_l31_n3772___LOOP___END
	addl	$32, %esp
	popl	%esi
	retl
.Ltmp298:
	.size	Framebuffer$fill, .Ltmp298-Framebuffer$fill
	.cfi_endproc

	.globl	Framebuffer$setpx
	.align	16, 0x90
	.type	Framebuffer$setpx,@function
Framebuffer$setpx:                      # @"Framebuffer$setpx"
	.cfi_startproc
# BB#0:
	pushl	%ebx
.Ltmp299:
	.cfi_def_cfa_offset 8
	pushl	%edi
.Ltmp300:
	.cfi_def_cfa_offset 12
	pushl	%esi
.Ltmp301:
	.cfi_def_cfa_offset 16
	subl	$28, %esp
.Ltmp302:
	.cfi_def_cfa_offset 44
.Ltmp303:
	.cfi_offset %esi, -16
.Ltmp304:
	.cfi_offset %edi, -12
.Ltmp305:
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
.Ltmp306:
	.size	Framebuffer$setpx, .Ltmp306-Framebuffer$setpx
	.cfi_endproc

	.globl	Framebuffer$fillrect
	.align	16, 0x90
	.type	Framebuffer$fillrect,@function
Framebuffer$fillrect:                   # @"Framebuffer$fillrect"
	.cfi_startproc
# BB#0:
	pushl	%esi
.Ltmp307:
	.cfi_def_cfa_offset 8
	subl	$44, %esp
.Ltmp308:
	.cfi_def_cfa_offset 52
.Ltmp309:
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
	jle	.LBB108_4
	.align	16, 0x90
.LBB108_1:                              # %fframebuffer_mFramebuffer$fillrect_l54_n3934___LOOP___HEAD
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB108_2 Depth 2
	movl	$0, (%esp)
	cmpl	$0, 28(%esp)
	jle	.LBB108_3
	.align	16, 0x90
.LBB108_2:                              # %fframebuffer_mFramebuffer$fillrect_l56_n3939___LOOP___HEAD
                                        #   Parent Loop BB108_1 Depth=1
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
	jl	.LBB108_2
.LBB108_3:                              # %fframebuffer_mFramebuffer$fillrect_l56_n3939___LOOP___END
                                        #   in Loop: Header=BB108_1 Depth=1
	movl	4(%esp), %eax
	incl	%eax
	movl	%eax, 4(%esp)
	cmpl	24(%esp), %eax
	jl	.LBB108_1
.LBB108_4:                              # %fframebuffer_mFramebuffer$fillrect_l54_n3934___LOOP___END
	addl	$44, %esp
	popl	%esi
	retl
.Ltmp310:
	.size	Framebuffer$fillrect, .Ltmp310-Framebuffer$fillrect
	.cfi_endproc

	.globl	Framebuffer$drawchar
	.align	16, 0x90
	.type	Framebuffer$drawchar,@function
Framebuffer$drawchar:                   # @"Framebuffer$drawchar"
	.cfi_startproc
# BB#0:
	pushl	%esi
.Ltmp311:
	.cfi_def_cfa_offset 8
	subl	$72, %esp
.Ltmp312:
	.cfi_def_cfa_offset 80
.Ltmp313:
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
	movl	$.Lstrglobal_fframebuffer_mFramebuffer$drawchar_l70_n4054, (%esp)
	calll	cstr$ord
	movb	%al, 27(%esp)
	movl	$0, 20(%esp)
	cmpl	$0, 56(%esp)
	jle	.LBB109_6
	.align	16, 0x90
.LBB109_1:                              # %fframebuffer_mFramebuffer$drawchar_l73_n4060___LOOP___HEAD
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB109_2 Depth 2
	movl	$0, 16(%esp)
	cmpl	$0, 56(%esp)
	jle	.LBB109_5
	.align	16, 0x90
.LBB109_2:                              # %fframebuffer_mFramebuffer$drawchar_l75_n4065___LOOP___HEAD
                                        #   Parent Loop BB109_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	32(%esp), %eax
	movl	20(%esp), %ecx
	shll	$3, %ecx
	addl	16(%esp), %ecx
	addl	28(%esp), %ecx
	movzbl	(%eax,%ecx), %eax
	movzbl	27(%esp), %ecx
	cmpl	%ecx, %eax
	jne	.LBB109_4
# BB#3:                                 # %if_fframebuffer_mFramebuffer$drawchar_l76_n4083___SUCC
                                        #   in Loop: Header=BB109_2 Depth=2
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
.LBB109_4:                              # %if_fframebuffer_mFramebuffer$drawchar_l76_n4083___DONE
                                        #   in Loop: Header=BB109_2 Depth=2
	movl	16(%esp), %eax
	incl	%eax
	movl	%eax, 16(%esp)
	cmpl	56(%esp), %eax
	jl	.LBB109_2
.LBB109_5:                              # %fframebuffer_mFramebuffer$drawchar_l75_n4065___LOOP___END
                                        #   in Loop: Header=BB109_1 Depth=1
	movl	20(%esp), %eax
	incl	%eax
	movl	%eax, 20(%esp)
	cmpl	56(%esp), %eax
	jl	.LBB109_1
.LBB109_6:                              # %fframebuffer_mFramebuffer$drawchar_l73_n4060___LOOP___END
	addl	$72, %esp
	popl	%esi
	retl
.Ltmp314:
	.size	Framebuffer$drawchar, .Ltmp314-Framebuffer$drawchar
	.cfi_endproc

	.globl	Framebuffer$copyfrom
	.align	16, 0x90
	.type	Framebuffer$copyfrom,@function
Framebuffer$copyfrom:                   # @"Framebuffer$copyfrom"
	.cfi_startproc
# BB#0:
	pushl	%esi
.Ltmp315:
	.cfi_def_cfa_offset 8
	subl	$24, %esp
.Ltmp316:
	.cfi_def_cfa_offset 32
.Ltmp317:
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
.Ltmp318:
	.size	Framebuffer$copyfrom, .Ltmp318-Framebuffer$copyfrom
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI111_0:
	.quad	4608236261112822104     # double 1.234
	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI111_1:
	.long	1148846080              # float 1000
.LCPI111_2:
	.long	1092616192              # float 10
.LCPI111_3:
	.long	1101004800              # float 20
.LCPI111_4:
	.long	1106247680              # float 30
.LCPI111_5:
	.long	1119092736              # float 90
.LCPI111_6:
	.long	1082130432              # float 4
.LCPI111_7:
	.long	1120403456              # float 100
.LCPI111_8:
	.long	1108344832              # float 36
.LCPI111_9:
	.long	1084227584              # float 5
	.text
	.globl	rc_mtest
	.align	16, 0x90
	.type	rc_mtest,@function
rc_mtest:                               # @rc_mtest
	.cfi_startproc
# BB#0:
	pushl	%esi
.Ltmp319:
	.cfi_def_cfa_offset 8
	subl	$152, %esp
.Ltmp320:
	.cfi_def_cfa_offset 160
.Ltmp321:
	.cfi_offset %esi, -8
	movl	160(%esp), %eax
	movl	%eax, 148(%esp)
	fldl	_the_zero_double
	faddl	.LCPI111_0
	fstpl	136(%esp)
	leal	136(%esp), %eax
	movl	%eax, 132(%esp)
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l8_n4188, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	flds	.LCPI111_1
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
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l10_n4200, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	132(%esp), %ecx
	movzbl	(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l12_n4214, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	132(%esp), %ecx
	movzbl	1(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l14_n4228, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	132(%esp), %ecx
	movzbl	2(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l16_n4242, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	132(%esp), %ecx
	movzbl	3(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l18_n4256, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	132(%esp), %ecx
	movzbl	4(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l20_n4270, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	132(%esp), %ecx
	movzbl	5(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l22_n4284, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	132(%esp), %ecx
	movzbl	6(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l24_n4298, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	132(%esp), %ecx
	movzbl	7(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l26_n4312, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l28_n4317, 4(%esp)
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
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l31_n4332, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	flds	.LCPI111_2
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
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l33_n4347, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	flds	.LCPI111_3
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
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l35_n4362, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	flds	.LCPI111_4
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
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l37_n4377, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	flds	.LCPI111_5
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
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l40_n4392, 4(%esp)
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
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l42_n4407, 4(%esp)
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
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l44_n4422, 4(%esp)
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
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l46_n4437, 4(%esp)
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
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l49_n4452, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	fldl	_the_zero_double
	fadds	.LCPI111_6
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
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l51_n4464, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	fldl	_the_zero_double
	fadds	.LCPI111_7
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
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l53_n4476, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	fldl	_the_zero_double
	fadds	.LCPI111_8
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
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l56_n4488, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %esi
	fldl	_the_zero_double
	fadds	.LCPI111_9
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
.Ltmp322:
	.size	rc_mtest, .Ltmp322-rc_mtest
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI112_0:
	.quad	4633264571419040487     # double 57.324840764331206
	.text
	.globl	r2d
	.align	16, 0x90
	.type	r2d,@function
r2d:                                    # @r2d
	.cfi_startproc
# BB#0:
	subl	$12, %esp
.Ltmp323:
	.cfi_def_cfa_offset 16
	fldl	16(%esp)
	fstl	(%esp)
	fldl	_the_zero_double
	faddl	.LCPI112_0
	fmulp	%st(1)
	addl	$12, %esp
	retl
.Ltmp324:
	.size	r2d, .Ltmp324-r2d
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI113_0:
	.long	1102053376              # float 22
.LCPI113_1:
	.long	1094713344              # float 12
.LCPI113_4:
	.long	1073741824              # float 2
	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI113_2:
	.quad	4604119971053405471     # double 0.66000000000000003
.LCPI113_3:
	.quad	4608083138725491507     # double 1.2
	.text
	.globl	rc_run
	.align	16, 0x90
	.type	rc_run,@function
rc_run:                                 # @rc_run
	.cfi_startproc
# BB#0:
	pushl	%ebx
.Ltmp325:
	.cfi_def_cfa_offset 8
	pushl	%edi
.Ltmp326:
	.cfi_def_cfa_offset 12
	pushl	%esi
.Ltmp327:
	.cfi_def_cfa_offset 16
	subl	$368, %esp              # imm = 0x170
.Ltmp328:
	.cfi_def_cfa_offset 384
.Ltmp329:
	.cfi_offset %esi, -16
.Ltmp330:
	.cfi_offset %edi, -12
.Ltmp331:
	.cfi_offset %ebx, -8
	movl	384(%esp), %eax
	movl	%eax, 364(%esp)
	calll	get_map
	movl	%eax, 360(%esp)
	calll	get_map_w
	movl	%eax, 356(%esp)
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_run_l66_n4517, (%esp)
	calll	cstr$ord
	movb	%al, 355(%esp)
	fldl	_the_zero_double
	fadds	.LCPI113_0
	fstpl	344(%esp)
	fldl	_the_zero_double
	fadds	.LCPI113_1
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
	faddl	.LCPI113_2
	fstpl	304(%esp)
	movl	$10000, 300(%esp)       # imm = 0x2710
	movl	$0, 296(%esp)
	movl	$0, 292(%esp)
	movl	gvar_fin_mu_lu_n19__mbinfo, %eax
	movl	24(%eax), %eax
	movl	%eax, 244(%esp)
	movl	gvar_fin_mu_lu_n19__mbinfo, %eax
	movl	28(%eax), %eax
	movl	%eax, 240(%esp)
	movl	gvar_fin_mu_lu_n19__mbinfo, %ecx
	incl	%eax
	imull	32(%ecx), %eax
	movl	%eax, 232(%esp)
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsraycasterraycaster_mrc_run_l91_n4568, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	232(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fpaging_mu_lu_n18__page_manager, %eax
	movl	%eax, (%esp)
	movl	$4194304, 4(%esp)       # imm = 0x400000
	calll	PageManager$get_pde_slot_addr
	movl	%eax, (%esp)
	movl	$1, 8(%esp)
	movl	$83886080, 4(%esp)      # imm = 0x5000000
	calll	PageEntry$set
	movl	244(%esp), %eax
	movl	240(%esp), %ecx
	movl	gvar_fin_mu_lu_n19__mbinfo, %edx
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
	movl	gvar_fin_mu_lu_n19__mbinfo, %eax
	movl	%eax, (%esp)
	calll	Framebuffer$$from_mbinfo
	movl	%eax, 224(%esp)
	fldl	_the_zero_double
	faddl	.LCPI113_3
	fstpl	136(%esp)
	movl	gvar_firqio_mu_lu_n5__system_kbdstate, %eax
	movl	%eax, (%esp)
	movl	$_rc_null_handler, 4(%esp)
	calll	KeyboardState$set_handler
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	$_rc_term_null_handler, 24(%eax)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB113_38
# BB#1:
	movb	$1, %bl
	.align	16, 0x90
.LBB113_2:                              # %fkappsraycasterraycaster_mrc_run_l132_n4630___LOOP___HEAD
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB113_3 Depth 2
                                        #       Child Loop BB113_10 Depth 3
                                        #       Child Loop BB113_25 Depth 3
	movl	228(%esp), %eax
	movl	%eax, (%esp)
	movl	$0, 12(%esp)
	movl	$0, 8(%esp)
	movl	$0, 4(%esp)
	calll	Framebuffer$fill
	movl	$0, 236(%esp)
	cmpl	$0, 244(%esp)
	jle	.LBB113_27
	.align	16, 0x90
.LBB113_3:                              # %fkappsraycasterraycaster_mrc_run_l137_n4640___LOOP___HEAD
                                        #   Parent Loop BB113_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB113_10 Depth 3
                                        #       Child Loop BB113_25 Depth 3
	movl	236(%esp), %eax
	addl	%eax, %eax
	movl	%eax, 96(%esp)
	fildl	96(%esp)
	movl	244(%esp), %eax
	movl	%eax, 92(%esp)
	fidivl	92(%esp)
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
	fnstcw	50(%esp)
	movw	50(%esp), %ax
	movw	$3199, 50(%esp)         # imm = 0xC7F
	fldcw	50(%esp)
	movw	%ax, 50(%esp)
	fistpl	100(%esp)
	fldcw	50(%esp)
	movl	100(%esp), %eax
	movl	%eax, 220(%esp)
	fldl	264(%esp)
	fnstcw	48(%esp)
	movw	48(%esp), %ax
	movw	$3199, 48(%esp)         # imm = 0xC7F
	fldcw	48(%esp)
	movw	%ax, 48(%esp)
	fistpl	104(%esp)
	fldcw	48(%esp)
	movl	104(%esp), %eax
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
	jbe	.LBB113_5
# BB#4:                                 # %if_fkappsraycasterraycaster_mrc_run_l151_n4699___SUCC
                                        #   in Loop: Header=BB113_3 Depth=2
	movl	$-1, 172(%esp)
	fldl	272(%esp)
	movl	220(%esp), %eax
	movl	%eax, 84(%esp)
	fisubl	84(%esp)
	fmull	208(%esp)
	fstpl	192(%esp)
	fld1
	jmp	.LBB113_6
	.align	16, 0x90
.LBB113_5:                              # %if_fkappsraycasterraycaster_mrc_run_l151_n4699___FAIL
                                        #   in Loop: Header=BB113_3 Depth=2
	movl	$1, 172(%esp)
	movl	220(%esp), %eax
	movl	%eax, 88(%esp)
	fld1
	fld	%st(0)
	faddl	_the_zero_double
	fsubl	272(%esp)
	fiaddl	88(%esp)
	fmull	208(%esp)
	fstpl	192(%esp)
.LBB113_6:                              # %if_fkappsraycasterraycaster_mrc_run_l151_n4699___DONE
                                        #   in Loop: Header=BB113_3 Depth=2
	fldl	248(%esp)
	fldz
	faddl	_the_zero_double
	fucompp
	fnstsw	%ax
                                        # kill: AX<def> AX<kill> EAX<def>
                                        # kill: AH<def> AH<kill> EAX<kill>
	sahf
	jbe	.LBB113_8
# BB#7:                                 # %if_fkappsraycasterraycaster_mrc_run_l160_n4722___SUCC
                                        #   in Loop: Header=BB113_3 Depth=2
	movl	$-1, 168(%esp)
	fldl	264(%esp)
	movl	216(%esp), %eax
	movl	%eax, 76(%esp)
	fisubl	76(%esp)
	jmp	.LBB113_9
	.align	16, 0x90
.LBB113_8:                              # %if_fkappsraycasterraycaster_mrc_run_l160_n4722___FAIL
                                        #   in Loop: Header=BB113_3 Depth=2
	movl	$1, 168(%esp)
	movl	216(%esp), %eax
	movl	%eax, 80(%esp)
	fld	%st(0)
	faddl	_the_zero_double
	fsubl	264(%esp)
	fiaddl	80(%esp)
.LBB113_9:                              # %if_fkappsraycasterraycaster_mrc_run_l160_n4722___DONE
                                        #   in Loop: Header=BB113_3 Depth=2
	fmull	200(%esp)
	fstpl	184(%esp)
	jmp	.LBB113_10
	.align	16, 0x90
.LBB113_15:                             # %if_fkappsraycasterraycaster_mrc_run_l181_n4775___SUCC
                                        #   in Loop: Header=BB113_10 Depth=3
	movl	$1, 164(%esp)
.LBB113_10:                             # %if_fkappsraycasterraycaster_mrc_run_l160_n4722___DONE
                                        #   Parent Loop BB113_2 Depth=1
                                        #     Parent Loop BB113_3 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	$0, 164(%esp)
	jne	.LBB113_16
# BB#11:                                # %fkappsraycasterraycaster_mrc_run_l169_n4741___LOOP___HEAD
                                        #   in Loop: Header=BB113_10 Depth=3
	fldl	192(%esp)
	fldl	184(%esp)
	fucompp
	fnstsw	%ax
                                        # kill: AX<def> AX<kill> EAX<def>
                                        # kill: AH<def> AH<kill> EAX<kill>
	sahf
	jbe	.LBB113_13
# BB#12:                                # %if_fkappsraycasterraycaster_mrc_run_l170_n4748___SUCC
                                        #   in Loop: Header=BB113_10 Depth=3
	fldl	192(%esp)
	faddl	208(%esp)
	fstpl	192(%esp)
	movl	172(%esp), %eax
	addl	%eax, 220(%esp)
	movl	$0, 160(%esp)
	jmp	.LBB113_14
	.align	16, 0x90
.LBB113_13:                             # %if_fkappsraycasterraycaster_mrc_run_l170_n4748___FAIL
                                        #   in Loop: Header=BB113_10 Depth=3
	fldl	184(%esp)
	faddl	200(%esp)
	fstpl	184(%esp)
	movl	168(%esp), %eax
	addl	%eax, 216(%esp)
	movl	$1, 160(%esp)
.LBB113_14:                             # %if_fkappsraycasterraycaster_mrc_run_l170_n4748___DONE
                                        #   in Loop: Header=BB113_10 Depth=3
	movl	360(%esp), %eax
	movl	216(%esp), %ecx
	imull	356(%esp), %ecx
	addl	220(%esp), %ecx
	movzbl	(%eax,%ecx), %eax
	movzbl	355(%esp), %ecx
	cmpl	%ecx, %eax
	je	.LBB113_10
	jmp	.LBB113_15
	.align	16, 0x90
.LBB113_16:                             # %fkappsraycasterraycaster_mrc_run_l169_n4741___LOOP___END
                                        #   in Loop: Header=BB113_3 Depth=2
	cmpl	$0, 160(%esp)
	jne	.LBB113_18
# BB#17:                                # %if_fkappsraycasterraycaster_mrc_run_l186_n4783___SUCC
                                        #   in Loop: Header=BB113_3 Depth=2
	movl	220(%esp), %eax
	movl	%eax, 60(%esp)
	fildl	60(%esp)
	fldl	_the_zero_double
	fadd	%st(0), %st(2)
	movl	172(%esp), %eax
	movl	%eax, 64(%esp)
	fxch	%st(2)
	fisubl	64(%esp)
	fxch	%st(2)
	fadds	.LCPI113_4
	fdivrp	%st(2)
	fxch	%st(1)
	faddl	272(%esp)
	fsubrp	%st(1)
	fdivl	256(%esp)
	jmp	.LBB113_19
	.align	16, 0x90
.LBB113_18:                             # %if_fkappsraycasterraycaster_mrc_run_l186_n4783___FAIL
                                        #   in Loop: Header=BB113_3 Depth=2
	movl	216(%esp), %eax
	movl	%eax, 68(%esp)
	fildl	68(%esp)
	fldl	_the_zero_double
	fadd	%st(0), %st(2)
	movl	168(%esp), %eax
	movl	%eax, 72(%esp)
	fxch	%st(2)
	fisubl	72(%esp)
	fxch	%st(2)
	fadds	.LCPI113_4
	fdivrp	%st(2)
	fxch	%st(1)
	faddl	264(%esp)
	fsubrp	%st(1)
	fdivl	248(%esp)
.LBB113_19:                             # %if_fkappsraycasterraycaster_mrc_run_l186_n4783___DONE
                                        #   in Loop: Header=BB113_3 Depth=2
	fstpl	176(%esp)
	movl	240(%esp), %eax
	movl	%eax, 52(%esp)
	fildl	52(%esp)
	fdivl	176(%esp)
	fnstcw	46(%esp)
	movw	46(%esp), %ax
	movw	$3199, 46(%esp)         # imm = 0xC7F
	fldcw	46(%esp)
	movw	%ax, 46(%esp)
	fistpl	56(%esp)
	fldcw	46(%esp)
	movl	56(%esp), %eax
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
	jns	.LBB113_21
# BB#20:                                # %if_fkappsraycasterraycaster_mrc_run_l196_n4837___SUCC
                                        #   in Loop: Header=BB113_3 Depth=2
	movl	$0, 148(%esp)
.LBB113_21:                             # %if_fkappsraycasterraycaster_mrc_run_l196_n4837___DONE
                                        #   in Loop: Header=BB113_3 Depth=2
	movl	152(%esp), %eax
	cmpl	240(%esp), %eax
	jle	.LBB113_23
# BB#22:                                # %if_fkappsraycasterraycaster_mrc_run_l200_n4842___SUCC
                                        #   in Loop: Header=BB113_3 Depth=2
	movl	240(%esp), %eax
	movl	%eax, 152(%esp)
.LBB113_23:                             # %if_fkappsraycasterraycaster_mrc_run_l200_n4842___DONE
                                        #   in Loop: Header=BB113_3 Depth=2
	movl	152(%esp), %eax
	jmp	.LBB113_25
	.align	16, 0x90
.LBB113_24:                             # %fkappsraycasterraycaster_mrc_run_l205_n4844___LOOP___HEAD
                                        #   in Loop: Header=BB113_25 Depth=3
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
.LBB113_25:                             # %fkappsraycasterraycaster_mrc_run_l205_n4844___LOOP___HEAD
                                        #   Parent Loop BB113_2 Depth=1
                                        #     Parent Loop BB113_3 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	148(%esp), %eax
	jg	.LBB113_24
# BB#26:                                # %fkappsraycasterraycaster_mrc_run_l205_n4844___LOOP___END
                                        #   in Loop: Header=BB113_3 Depth=2
	movl	236(%esp), %eax
	incl	%eax
	movl	%eax, 236(%esp)
	cmpl	244(%esp), %eax
	jl	.LBB113_3
.LBB113_27:                             # %fkappsraycasterraycaster_mrc_run_l137_n4640___LOOP___END
                                        #   in Loop: Header=BB113_2 Depth=1
	movl	gvar_firqio_mu_lu_n5__system_kbdstate, %eax
	movl	%eax, (%esp)
	movl	$72, 4(%esp)
	calll	KeyboardState$getkey
	testb	$1, %al
	je	.LBB113_29
# BB#28:                                # %if_fkappsraycasterraycaster_mrc_run_l212_n4873___SUCC
                                        #   in Loop: Header=BB113_2 Depth=1
	fldl	328(%esp)
	fmull	136(%esp)
	faddl	344(%esp)
	fstpl	344(%esp)
	fldl	320(%esp)
	fmull	136(%esp)
	faddl	336(%esp)
	jmp	.LBB113_31
	.align	16, 0x90
.LBB113_29:                             # %if_fkappsraycasterraycaster_mrc_run_l212_n4873___FAIL
                                        #   in Loop: Header=BB113_2 Depth=1
	movl	gvar_firqio_mu_lu_n5__system_kbdstate, %eax
	movl	%eax, (%esp)
	movl	$80, 4(%esp)
	calll	KeyboardState$getkey
	testb	$1, %al
	je	.LBB113_32
# BB#30:                                # %if_fkappsraycasterraycaster_mrc_run_l212_n4887___SUCC
                                        #   in Loop: Header=BB113_2 Depth=1
	fldl	344(%esp)
	fldl	328(%esp)
	fmull	136(%esp)
	fsubrp	%st(1)
	fstpl	344(%esp)
	fldl	336(%esp)
	fldl	320(%esp)
	fmull	136(%esp)
	fsubrp	%st(1)
.LBB113_31:                             # %if_fkappsraycasterraycaster_mrc_run_l212_n4873___DONE
                                        #   in Loop: Header=BB113_2 Depth=1
	fstpl	336(%esp)
.LBB113_32:                             # %if_fkappsraycasterraycaster_mrc_run_l212_n4873___DONE
                                        #   in Loop: Header=BB113_2 Depth=1
	movl	gvar_firqio_mu_lu_n5__system_kbdstate, %eax
	movl	%eax, (%esp)
	movl	$75, 4(%esp)
	calll	KeyboardState$getkey
	testb	$1, %al
	je	.LBB113_34
# BB#33:                                # %if_fkappsraycasterraycaster_mrc_run_l220_n4901___SUCC
                                        #   in Loop: Header=BB113_2 Depth=1
	movl	300(%esp), %eax
	decl	%eax
	jmp	.LBB113_36
	.align	16, 0x90
.LBB113_34:                             # %if_fkappsraycasterraycaster_mrc_run_l220_n4901___FAIL
                                        #   in Loop: Header=BB113_2 Depth=1
	movl	gvar_firqio_mu_lu_n5__system_kbdstate, %eax
	movl	%eax, (%esp)
	movl	$77, 4(%esp)
	calll	KeyboardState$getkey
	testb	$1, %al
	je	.LBB113_37
# BB#35:                                # %if_fkappsraycasterraycaster_mrc_run_l220_n4923___SUCC
                                        #   in Loop: Header=BB113_2 Depth=1
	movl	300(%esp), %eax
	incl	%eax
.LBB113_36:                             # %if_fkappsraycasterraycaster_mrc_run_l220_n4901___DONE
                                        #   in Loop: Header=BB113_2 Depth=1
	movl	%eax, 300(%esp)
	movl	%eax, (%esp)
	calll	rcrot_get_for
	movl	%eax, 108(%esp)
	fldl	(%eax)
	fstpl	328(%esp)
	movl	108(%esp), %eax
	fldl	8(%eax)
	fstpl	320(%esp)
	movl	108(%esp), %eax
	fldl	16(%eax)
	fstpl	312(%esp)
	movl	108(%esp), %eax
	fldl	24(%eax)
	fstpl	304(%esp)
.LBB113_37:                             # %if_fkappsraycasterraycaster_mrc_run_l220_n4901___DONE
                                        #   in Loop: Header=BB113_2 Depth=1
	movl	224(%esp), %eax
	movl	228(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Framebuffer$copyfrom
	testb	%bl, %bl
	jne	.LBB113_2
.LBB113_38:                             # %fkappsraycasterraycaster_mrc_run_l132_n4630___LOOP___END
	addl	$368, %esp              # imm = 0x170
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
.Ltmp332:
	.size	rc_run, .Ltmp332-rc_run
	.cfi_endproc

	.globl	_rc_null_handler
	.align	16, 0x90
	.type	_rc_null_handler,@function
_rc_null_handler:                       # @_rc_null_handler
	.cfi_startproc
# BB#0:
	subl	$8, %esp
.Ltmp333:
	.cfi_def_cfa_offset 12
	movb	16(%esp), %al
	movl	12(%esp), %ecx
	movl	%ecx, 4(%esp)
	andb	$1, %al
	movb	%al, 3(%esp)
	addl	$8, %esp
	retl
.Ltmp334:
	.size	_rc_null_handler, .Ltmp334-_rc_null_handler
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
	je	.LBB117_2
# BB#1:                                 # %if_fkappsdrawbmp_mBMPImage$get_pitch_l32_n4974___SUCC
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
.LBB117_2:                              # %if_fkappsdrawbmp_mBMPImage$get_pitch_l32_n4974___DONE
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
	movl	gvar_fin_mu_lu_n19__mbinfo, %ecx
	subl	$16, %esp
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	calll	MultibootInfo$get_mod_by_args
	addl	$16, %esp
	movl	%eax, -20(%ebp)
	testl	%eax, %eax
	jne	.LBB119_4
# BB#1:                                 # %if_fkappsdrawbmp_mkc_draw_bmp_l44_n5017___SUCC
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l45_n5020, 4(%esp)
	jmp	.LBB119_2
.LBB119_4:                              # %if_fkappsdrawbmp_mkc_draw_bmp_l44_n5017___DONE
	movl	%esp, %eax
	leal	-16(%eax), %esi
	movl	%esi, -36(%ebp)         # 4-byte Spill
	movl	%esi, %esp
	movl	-20(%ebp), %ecx
	movl	4(%ecx), %ecx
	movl	%ecx, -16(%eax)
	movzbl	(%ecx), %edi
	subl	$16, %esp
	movl	$.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l51_n5034, (%esp)
	calll	cstr$ord
	addl	$16, %esp
	movzbl	%al, %eax
	cmpl	%eax, %edi
	je	.LBB119_6
# BB#5:                                 # %if_fkappsdrawbmp_mkc_draw_bmp_l51_n5037___SUCC
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l52_n5040, 4(%esp)
	jmp	.LBB119_2
.LBB119_6:                              # %if_fkappsdrawbmp_mkc_draw_bmp_l51_n5037___DONE
	movl	(%esi), %eax
	movzbl	1(%eax), %edi
	subl	$16, %esp
	movl	$.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l56_n5049, (%esp)
	calll	cstr$ord
	addl	$16, %esp
	movzbl	%al, %eax
	cmpl	%eax, %edi
	je	.LBB119_8
# BB#7:                                 # %if_fkappsdrawbmp_mkc_draw_bmp_l56_n5052___SUCC
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l57_n5055, 4(%esp)
	jmp	.LBB119_2
.LBB119_8:                              # %if_fkappsdrawbmp_mkc_draw_bmp_l56_n5052___DONE
	movl	(%esi), %eax
	cmpl	$0, 30(%eax)
	je	.LBB119_10
# BB#9:                                 # %if_fkappsdrawbmp_mkc_draw_bmp_l61_n5063___SUCC
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l62_n5066, 4(%esp)
	jmp	.LBB119_2
.LBB119_10:                             # %if_fkappsdrawbmp_mkc_draw_bmp_l61_n5063___DONE
	movl	(%esi), %eax
	movzwl	28(%eax), %eax
	cmpl	$24, %eax
	je	.LBB119_12
# BB#11:                                # %if_fkappsdrawbmp_mkc_draw_bmp_l66_n5075___SUCC
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l67_n5078, 4(%esp)
.LBB119_2:                              # %if_fkappsdrawbmp_mkc_draw_bmp_l44_n5017___SUCC
	calll	Terminal$printl
.LBB119_3:                              # %fkappsdrawbmp_mkc_draw_bmp_l76_n5089___LOOP___END
	leal	-12(%ebp), %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
.LBB119_12:                             # %if_fkappsdrawbmp_mkc_draw_bmp_l66_n5075___DONE
	movl	%esp, %edi
	leal	-16(%edi), %ebx
	movl	%ebx, %esp
	movl	gvar_fin_mu_lu_n19__mbinfo, %eax
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
	jmp	.LBB119_13
.LBB119_16:                             # %fkappsdrawbmp_mkc_draw_bmp_l78_n5096___LOOP___END
                                        #   in Loop: Header=BB119_13 Depth=1
	movl	(%edi), %eax
	incl	%eax
	movl	%eax, (%edi)
.LBB119_13:                             # %if_fkappsdrawbmp_mkc_draw_bmp_l66_n5075___DONE
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB119_15 Depth 2
	movl	(%esi), %ecx
	cmpl	22(%ecx), %eax
	jge	.LBB119_3
# BB#14:                                # %fkappsdrawbmp_mkc_draw_bmp_l76_n5089___LOOP___HEAD
                                        #   in Loop: Header=BB119_13 Depth=1
	movl	$0, (%edx)
	movl	(%esi), %eax
	cmpl	$0, 18(%eax)
	jle	.LBB119_16
	.align	16, 0x90
.LBB119_15:                             # %fkappsdrawbmp_mkc_draw_bmp_l78_n5096___LOOP___HEAD
                                        #   Parent Loop BB119_13 Depth=1
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
	jl	.LBB119_15
	jmp	.LBB119_16
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
	movl	$.Lstrglobal_fkappsconsole_mconsole_disp_line_l26_n5170, 4(%esp)
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
	movl	gvar_fkappsconsole_mu_lu_n12__console_buf, %eax
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
	movl	$.Lstrglobal_fkappsconsole_mconsole_submit_l36_n5187, (%esp)
	calll	char
	addl	$16, %esp
	subl	$16, %esp
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	cstr$index
	addl	$16, %esp
	cmpl	$-1, %eax
	jne	.LBB124_2
# BB#1:                                 # %if_fkappsconsole_mconsole_submit_l36_n5192___SUCC
	movl	-12(%ebp), %eax
	movl	%eax, -16(%ebp)
	movl	$.Lstrglobal_fkappsconsole_mconsole_submit_l38_n5194, -20(%ebp)
	jmp	.LBB124_3
.LBB124_2:                              # %if_fkappsconsole_mconsole_submit_l36_n5192___FAIL
	movl	%esp, %esi
	leal	-16(%esi), %eax
	movl	%eax, %esp
	movl	-12(%ebp), %edi
	subl	$16, %esp
	movl	$.Lstrglobal_fkappsconsole_mconsole_submit_l40_n5202, (%esp)
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
.LBB124_3:                              # %if_fkappsconsole_mconsole_submit_l36_n5192___DONE
	movl	%esp, %edi
	leal	-16(%edi), %esi
	movl	%esi, %esp
	movl	gvar_fkappsconsole_mu_lu_n15__kcommand_head, %eax
	movl	-16(%ebp), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	get_command
	addl	$16, %esp
	movl	%eax, -16(%edi)
	testl	%eax, %eax
	je	.LBB124_5
# BB#4:                                 # %if_fkappsconsole_mconsole_submit_l47_n5241___SUCC
	movl	(%esi), %eax
	movl	%eax, gvar_fkappsconsole_mu_lu_n13__command_to_run
	movl	-20(%ebp), %eax
	movl	%eax, gvar_fkappsconsole_mu_lu_n14__command_args
	jmp	.LBB124_6
.LBB124_5:                              # %if_fkappsconsole_mconsole_submit_l47_n5241___FAIL
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mconsole_submit_l51_n5246, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	calll	console_disp_line
.LBB124_6:                              # %if_fkappsconsole_mconsole_submit_l47_n5241___DONE
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
	jmp	.LBB125_1
	.align	16, 0x90
.LBB125_3:                              # %if_fkappsconsole_mget_command_l60_n5266___DONE
                                        #   in Loop: Header=BB125_1 Depth=1
	movl	16(%esp), %eax
	movl	12(%eax), %eax
.LBB125_1:                              # =>This Inner Loop Header: Depth=1
	movl	%eax, 16(%esp)
	testl	%eax, %eax
	je	.LBB125_4
# BB#2:                                 # %fkappsconsole_mget_command_l59_n5255___LOOP___HEAD
                                        #   in Loop: Header=BB125_1 Depth=1
	movl	16(%esp), %eax
	movl	(%eax), %eax
	movl	20(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	cstr$__eq__
	testb	$1, %al
	je	.LBB125_3
# BB#5:                                 # %if_fkappsconsole_mget_command_l60_n5266___SUCC
	movl	16(%esp), %eax
	addl	$28, %esp
	retl
.LBB125_4:                              # %fkappsconsole_mget_command_l59_n5255___LOOP___END
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
	movl	$.Lstrglobal_fkappsconsole_mkc_help_l68_n5282, 4(%esp)
	calll	Terminal$printl
	movl	gvar_fkappsconsole_mu_lu_n15__kcommand_head, %eax
	jmp	.LBB126_2
	.align	16, 0x90
.LBB126_1:                              # %fkappsconsole_mkc_help_l70_n5287___LOOP___HEAD
                                        #   in Loop: Header=BB126_2 Depth=1
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_help_l71_n5295, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	20(%esp), %ecx
	movl	(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_help_l73_n5305, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	20(%esp), %ecx
	movl	4(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_help_l75_n5315, 4(%esp)
	calll	Terminal$print
	movl	20(%esp), %eax
	movl	12(%eax), %eax
.LBB126_2:                              # %fkappsconsole_mkc_help_l70_n5287___LOOP___HEAD
                                        # =>This Inner Loop Header: Depth=1
	movl	%eax, 20(%esp)
	testl	%eax, %eax
	jne	.LBB126_1
# BB#3:                                 # %fkappsconsole_mkc_help_l70_n5287___LOOP___END
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
	movl	$.Lstrglobal_fkappsconsole_mkc_dumpargs_l81_n5329, 4(%esp)
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
	movl	$.Lstrglobal_fkappsconsole_mkc_mem_l86_n5338, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	gvar_fmm_mu_lu_n1__mm_head, %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$dumphexi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_mem_l88_n5347, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	gvar_fmm_mu_lu_n2__mm_pos, %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$dumphexi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_mem_l90_n5356, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	gvar_fmm_mu_lu_n2__mm_pos, %ecx
	subl	gvar_fmm_mu_lu_n1__mm_head, %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_mem_l92_n5368, 4(%esp)
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
	movl	gvar_fin_mu_lu_n19__mbinfo, %eax
	movzbl	8(%eax), %eax
	cmpl	$1, %eax
	jne	.LBB130_5
# BB#1:                                 # %if_fkappsconsole_mkc_dump_parseed_multiboot_l100_n5381___SUCC
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l101_n5384, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	gvar_fin_mu_lu_n19__mbinfo, %ecx
	movl	16(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printl
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l103_n5394, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	gvar_fin_mu_lu_n19__mbinfo, %ecx
	movl	12(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printl
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l105_n5404, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	gvar_fin_mu_lu_n19__mbinfo, %ecx
	movl	48(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$2, 8(%esp)
	calll	Terminal$dumphex
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l107_n5415, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	gvar_fin_mu_lu_n19__mbinfo, %ecx
	movl	52(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l109_n5425, 4(%esp)
	calll	Terminal$printl
	movl	gvar_fin_mu_lu_n19__mbinfo, %eax
	movzbl	20(%eax), %eax
	cmpl	$1, %eax
	jne	.LBB130_3
# BB#2:                                 # %if_fkappsconsole_mkc_dump_parseed_multiboot_l110_n5431___SUCC
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l111_n5434, 4(%esp)
	jmp	.LBB130_4
.LBB130_5:                              # %if_fkappsconsole_mkc_dump_parseed_multiboot_l100_n5381___FAIL
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l127_n5499, 4(%esp)
	jmp	.LBB130_6
.LBB130_3:                              # %if_fkappsconsole_mkc_dump_parseed_multiboot_l110_n5431___FAIL
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l113_n5439, 4(%esp)
.LBB130_4:                              # %if_fkappsconsole_mkc_dump_parseed_multiboot_l110_n5431___DONE
	calll	Terminal$printl
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l115_n5444, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	gvar_fin_mu_lu_n19__mbinfo, %ecx
	movl	40(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$dumphexi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l117_n5454, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	gvar_fin_mu_lu_n19__mbinfo, %ecx
	movl	24(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l119_n5464, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	gvar_fin_mu_lu_n19__mbinfo, %ecx
	movl	28(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l121_n5474, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	gvar_fin_mu_lu_n19__mbinfo, %ecx
	movl	36(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l123_n5484, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	gvar_fin_mu_lu_n19__mbinfo, %ecx
	movl	32(%ecx), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l125_n5494, 4(%esp)
.LBB130_6:                              # %if_fkappsconsole_mkc_dump_parseed_multiboot_l100_n5381___DONE
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
	movl	$.Lstrglobal_fkappsconsole_mkc_fault_l132_n5505, 4(%esp)
	calll	cstr$__eq__
	addl	$16, %esp
	testb	$1, %al
	je	.LBB131_2
# BB#1:                                 # %if_fkappsconsole_mkc_fault_l132_n5508___SUCC
	movl	%esp, %ecx
	leal	-16(%ecx), %eax
	movl	%eax, %esp
	xorl	%esi, %esi
	movl	$1, %eax
	xorl	%edx, %edx
	divl	%esi
	movl	%eax, -16(%ecx)
	jmp	.LBB131_7
.LBB131_2:                              # %if_fkappsconsole_mkc_fault_l132_n5508___FAIL
	movl	-8(%ebp), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_fault_l132_n5515, 4(%esp)
	calll	cstr$__eq__
	addl	$16, %esp
	testb	$1, %al
	je	.LBB131_4
# BB#3:                                 # %if_fkappsconsole_mkc_fault_l132_n5518___SUCC
	movb	$0, -559038737
	jmp	.LBB131_7
.LBB131_4:                              # %if_fkappsconsole_mkc_fault_l132_n5518___FAIL
	movl	-8(%ebp), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_fault_l132_n5529, 4(%esp)
	calll	cstr$__eq__
	addl	$16, %esp
	testb	$1, %al
	je	.LBB131_6
# BB#5:                                 # %if_fkappsconsole_mkc_fault_l132_n5532___SUCC
	movl	%esp, %eax
	leal	-16(%eax), %ecx
	movl	%ecx, %esp
	movb	-559038737, %cl
	movb	%cl, -16(%eax)
	jmp	.LBB131_7
.LBB131_6:                              # %if_fkappsconsole_mkc_fault_l132_n5532___FAIL
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_fault_l139_n5543, 4(%esp)
	calll	Terminal$printl
	addl	$16, %esp
.LBB131_7:                              # %if_fkappsconsole_mkc_fault_l132_n5508___DONE
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
	movl	gvar_fin_mu_lu_n19__mbinfo, %eax
	movb	20(%eax), %al
	testb	%al, %al
	jne	.LBB134_2
# BB#1:                                 # %if_fkappsconsole_mkc_clear_l152_n5572___SUCC
	movl	gvar_fgfxterm_mu_lu_n16__console_emulator, %eax
	movl	%eax, (%esp)
	calll	VGATextModeEmulator$clear
.LBB134_2:                              # %if_fkappsconsole_mkc_clear_l152_n5572___DONE
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
	movl	$.Lstrglobal_fkappsconsole_mkc_hexnum_l162_n5587, 4(%esp)
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
	movl	$.Lstrglobal_fkappsconsole_mkc_shutdown_l168_n5600, 4(%esp)
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
	movl	$.Lstrglobal_fkappsconsole_mkc_getpicticks_l173_n5610, 4(%esp)
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
	movl	$.Lstrglobal_fkappsconsole_mkc_getpicticks_l175_n5618, 4(%esp)
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
	movl	$.Lstrglobal_fkappsconsole_mkc_getpicticks_l177_n5629, 4(%esp)
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
	je	.LBB138_2
# BB#1:                                 # %if_fkappsconsole_mkc_picsleep_l181_n5637___SUCC
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_picsleep_l182_n5640, 4(%esp)
	calll	Terminal$printl
	jmp	.LBB138_9
.LBB138_2:                              # %if_fkappsconsole_mkc_picsleep_l181_n5637___DONE
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
	movl	$.Lstrglobal_fkappsconsole_mkc_picsleep_l187_n5653, (%esp)
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
	je	.LBB138_4
# BB#3:                                 # %if_fkappsconsole_mkc_picsleep_l181_n5637___DONE
	movb	%cl, %al
.LBB138_4:                              # %if_fkappsconsole_mkc_picsleep_l181_n5637___DONE
	testb	%al, %al
	jne	.LBB138_8
	.align	16, 0x90
.LBB138_5:                              # %fkappsconsole_mkc_picsleep_l188_n5656___LOOP___HEAD
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
	je	.LBB138_7
# BB#6:                                 # %fkappsconsole_mkc_picsleep_l188_n5656___LOOP___HEAD
                                        #   in Loop: Header=BB138_5 Depth=1
	movb	%cl, %al
.LBB138_7:                              # %fkappsconsole_mkc_picsleep_l188_n5656___LOOP___HEAD
                                        #   in Loop: Header=BB138_5 Depth=1
	testb	%al, %al
	jne	.LBB138_5
.LBB138_8:                              # %fkappsconsole_mkc_picsleep_l188_n5656___LOOP___END
	subl	$16, %esp
	movl	$.Lstrglobal_fkappsconsole_mkc_picsleep_l191_n5676, (%esp)
	calll	kc_getpicticks
.LBB138_9:                              # %fkappsconsole_mkc_picsleep_l188_n5656___LOOP___END
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
	jne	.LBB139_2
# BB#1:                                 # %if_fkappsconsole_mkc_color_l195_n5684___SUCC
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
	movl	$.Lstrglobal_fkappsconsole_mkc_color_l197_n5703, 4(%esp)
	calll	Terminal$print
	jmp	.LBB139_3
.LBB139_2:                              # %if_fkappsconsole_mkc_color_l195_n5684___FAIL
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movb	$15, 20(%eax)
.LBB139_3:                              # %if_fkappsconsole_mkc_color_l195_n5684___DONE
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
	jne	.LBB140_5
# BB#1:
	xorl	%ebx, %ebx
	.align	16, 0x90
.LBB140_2:                              # %fkappsconsole_mkc_colorama_l206_n5714___LOOP___HEAD
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB140_3 Depth 2
	movl	$0, 12(%esp)
	testb	%bl, %bl
	jne	.LBB140_4
	.align	16, 0x90
.LBB140_3:                              # %fkappsconsole_mkc_colorama_l208_n5719___LOOP___HEAD
                                        #   Parent Loop BB140_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	16(%esp), %ecx
	shll	$4, %ecx
	addl	12(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_colorama_l209_n5730, 8(%esp)
	calll	Terminal$printa
	movl	12(%esp), %eax
	incl	%eax
	movl	%eax, 12(%esp)
	cmpl	$16, %eax
	jl	.LBB140_3
.LBB140_4:                              # %fkappsconsole_mkc_colorama_l208_n5719___LOOP___END
                                        #   in Loop: Header=BB140_2 Depth=1
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkappsconsole_mkc_colorama_l212_n5741, 4(%esp)
	calll	Terminal$print
	movl	16(%esp), %eax
	incl	%eax
	movl	%eax, 16(%esp)
	cmpl	$16, %eax
	jl	.LBB140_2
.LBB140_5:                              # %fkappsconsole_mkc_colorama_l206_n5714___LOOP___END
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
	jne	.LBB141_5
# BB#1:
	movb	$1, %bl
	.align	16, 0x90
.LBB141_2:                              # %fkappsconsole_mkc_snowcrash_code_l219_n5752___LOOP___HEAD
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB141_3 Depth 2
	movl	$0, 12(%esp)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB141_4
	.align	16, 0x90
.LBB141_3:                              # %fkappsconsole_mkc_snowcrash_code_l221_n5757___LOOP___HEAD
                                        #   Parent Loop BB141_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	gvar_fin_mu_lu_n9__base_vma, %eax
	addl	12(%esp), %eax
	movl	gvar_fin_mu_lu_n19__mbinfo, %ecx
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
	jl	.LBB141_3
.LBB141_4:                              # %fkappsconsole_mkc_snowcrash_code_l221_n5757___LOOP___END
                                        #   in Loop: Header=BB141_2 Depth=1
	testb	%bl, %bl
	jne	.LBB141_2
.LBB141_5:                              # %fkappsconsole_mkc_snowcrash_code_l219_n5752___LOOP___END
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
	movl	gvar_fin_mu_lu_n19__mbinfo, %eax
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
	movl	$.Lstrglobal_fkappsconsole_mkc_drawstuff_l236_n5827, (%esp)
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
	jne	.LBB142_2
	.align	16, 0x90
.LBB142_1:                              # %fkappsconsole_mkc_drawstuff_l239_n5835___LOOP___HEAD
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
	jl	.LBB142_1
.LBB142_2:                              # %fkappsconsole_mkc_drawstuff_l239_n5835___LOOP___END
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
	movl	gvar_fin_mu_lu_n19__mbinfo, %eax
	movl	%eax, (%esp)
	calll	Framebuffer$$from_mbinfo
	movl	%eax, 44(%esp)
	movl	$0, 40(%esp)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB143_10
# BB#1:
	xorl	%ebx, %ebx
	.align	16, 0x90
.LBB143_2:                              # %fkappsconsole_mkc_drawcolors_l252_n5875___LOOP___HEAD
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB143_3 Depth 2
                                        #       Child Loop BB143_4 Depth 3
                                        #         Child Loop BB143_6 Depth 4
	movl	$0, 36(%esp)
	testb	%bl, %bl
	jne	.LBB143_9
	.align	16, 0x90
.LBB143_3:                              # %fkappsconsole_mkc_drawcolors_l254_n5880___LOOP___HEAD
                                        #   Parent Loop BB143_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB143_4 Depth 3
                                        #         Child Loop BB143_6 Depth 4
	movl	$0, 32(%esp)
	testb	%bl, %bl
	jne	.LBB143_8
	.align	16, 0x90
.LBB143_4:                              # %fkappsconsole_mkc_drawcolors_l256_n5885___LOOP___HEAD
                                        #   Parent Loop BB143_2 Depth=1
                                        #     Parent Loop BB143_3 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB143_6 Depth 4
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
	jmp	.LBB143_6
	.align	16, 0x90
.LBB143_5:                              # %fkappsconsole_mkc_drawcolors_l259_n5895___LOOP___HEAD
                                        #   in Loop: Header=BB143_6 Depth=4
	movl	gvar_firqio_mu_lu_n6__pic_ticks, %eax
	movl	gvar_firqio_mu_lu_n6__pic_ticks+4, %ecx
	xorl	28(%esp), %ecx
	xorl	24(%esp), %eax
.LBB143_6:                              # %fkappsconsole_mkc_drawcolors_l259_n5895___LOOP___HEAD
                                        #   Parent Loop BB143_2 Depth=1
                                        #     Parent Loop BB143_3 Depth=2
                                        #       Parent Loop BB143_4 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	orl	%ecx, %eax
	je	.LBB143_5
# BB#7:                                 # %fkappsconsole_mkc_drawcolors_l259_n5895___LOOP___END
                                        #   in Loop: Header=BB143_4 Depth=3
	movl	32(%esp), %eax
	addl	$64, %eax
	movl	%eax, 32(%esp)
	cmpl	$257, %eax              # imm = 0x101
	jl	.LBB143_4
.LBB143_8:                              # %fkappsconsole_mkc_drawcolors_l256_n5885___LOOP___END
                                        #   in Loop: Header=BB143_3 Depth=2
	movl	36(%esp), %eax
	addl	$64, %eax
	movl	%eax, 36(%esp)
	cmpl	$257, %eax              # imm = 0x101
	jl	.LBB143_3
.LBB143_9:                              # %fkappsconsole_mkc_drawcolors_l254_n5880___LOOP___END
                                        #   in Loop: Header=BB143_2 Depth=1
	movl	40(%esp), %eax
	addl	$64, %eax
	movl	%eax, 40(%esp)
	cmpl	$257, %eax              # imm = 0x101
	jl	.LBB143_2
.LBB143_10:                             # %fkappsconsole_mkc_drawcolors_l252_n5875___LOOP___END
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
	movl	gvar_fkappsconsole_mu_lu_n15__kcommand_head, %eax
	jmp	.LBB144_2
	.align	16, 0x90
.LBB144_1:                              # %fkappsconsole_madd_cmd_l272_n5926___LOOP___HEAD
                                        #   in Loop: Header=BB144_2 Depth=1
	movl	24(%esp), %eax
	movl	12(%eax), %eax
.LBB144_2:                              # %fkappsconsole_madd_cmd_l272_n5926___LOOP___HEAD
                                        # =>This Inner Loop Header: Depth=1
	movl	%eax, 24(%esp)
	cmpl	$0, 12(%eax)
	jne	.LBB144_1
# BB#3:                                 # %fkappsconsole_madd_cmd_l272_n5926___LOOP___END
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
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l283_n5956, 4(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l283_n5953, (%esp)
	calll	KConsoleCommand$$new
	movl	%eax, gvar_fkappsconsole_mu_lu_n15__kcommand_head
	movl	$kc_dumpargs, 8(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l284_n5966, 4(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l284_n5963, (%esp)
	calll	add_cmd
	movl	$kc_mem, 8(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l285_n5976, 4(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l285_n5973, (%esp)
	calll	add_cmd
	movl	$kc_fault, 8(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l286_n5986, 4(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l286_n5983, (%esp)
	calll	add_cmd
	movl	$kc_echo, 8(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l287_n5996, 4(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l287_n5993, (%esp)
	calll	add_cmd
	movl	$kc_addhex, 8(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l288_n6006, 4(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l288_n6003, (%esp)
	calll	add_cmd
	movl	$kc_clear, 8(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l289_n6016, 4(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l289_n6013, (%esp)
	calll	add_cmd
	movl	$kc_hexnum, 8(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l290_n6026, 4(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l290_n6023, (%esp)
	calll	add_cmd
	movl	$kc_dump_multiboot, 8(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l291_n6036, 4(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l291_n6033, (%esp)
	calll	add_cmd
	movl	$kc_dump_parseed_multiboot, 8(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l292_n6046, 4(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l292_n6043, (%esp)
	calll	add_cmd
	movl	$kc_getpicticks, 8(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l293_n6056, 4(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l293_n6053, (%esp)
	calll	add_cmd
	movl	$kc_picsleep, 8(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l294_n6066, 4(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l294_n6063, (%esp)
	calll	add_cmd
	movl	$kc_shutdown, 8(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l295_n6076, 4(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l295_n6073, (%esp)
	calll	add_cmd
	movl	$kc_color, 8(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l296_n6086, 4(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l296_n6083, (%esp)
	calll	add_cmd
	movl	$kc_colorama, 8(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l297_n6096, 4(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l297_n6093, (%esp)
	calll	add_cmd
	movl	$kc_snowcrash_code, 8(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l298_n6106, 4(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l298_n6103, (%esp)
	calll	add_cmd
	movl	$kc_drawstuff, 8(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l299_n6116, 4(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l299_n6113, (%esp)
	calll	add_cmd
	movl	$kc_drawcolors, 8(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l300_n6126, 4(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l300_n6123, (%esp)
	calll	add_cmd
	movl	$rc_mtest, 8(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l301_n6136, 4(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l301_n6133, (%esp)
	calll	add_cmd
	movl	$rc_run, 8(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l302_n6146, 4(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l302_n6143, (%esp)
	calll	add_cmd
	movl	$kc_draw_bmp, 8(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l303_n6156, 4(%esp)
	movl	$.Lstrglobal_fkappsconsole_mkconsole_run_l303_n6153, (%esp)
	calll	add_cmd
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, 4(%esp)
	movl	$console_submit, 8(%esp)
	movl	$1024, (%esp)           # imm = 0x400
	calll	KeyboardBuf$$new
	movl	%eax, gvar_fkappsconsole_mu_lu_n12__console_buf
	movl	$0, gvar_fkappsconsole_mu_lu_n13__command_to_run
	movl	gvar_firqio_mu_lu_n5__system_kbdstate, %eax
	movl	%eax, (%esp)
	movl	$consolehandler, 4(%esp)
	calll	KeyboardState$set_handler
	calll	console_disp_line
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB145_5
# BB#1:
	movb	$1, %bl
	.align	16, 0x90
.LBB145_2:                              # %fkappsconsole_mkconsole_run_l309_n6176___LOOP___HEAD
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, gvar_fkappsconsole_mu_lu_n13__command_to_run
	je	.LBB145_4
# BB#3:                                 # %if_fkappsconsole_mkconsole_run_l310_n6184___SUCC
                                        #   in Loop: Header=BB145_2 Depth=1
	movl	gvar_fkappsconsole_mu_lu_n13__command_to_run, %eax
	movl	gvar_fkappsconsole_mu_lu_n14__command_args, %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	KConsoleCommand$run
	movl	gvar_firqio_mu_lu_n5__system_kbdstate, %eax
	movl	%eax, (%esp)
	movl	$consolehandler, 4(%esp)
	calll	KeyboardState$set_handler
	calll	console_disp_line
	movl	$0, gvar_fkappsconsole_mu_lu_n13__command_to_run
.LBB145_4:                              # %if_fkappsconsole_mkconsole_run_l310_n6184___DONE
                                        #   in Loop: Header=BB145_2 Depth=1
	testb	%bl, %bl
	jne	.LBB145_2
.LBB145_5:                              # %fkappsconsole_mkconsole_run_l309_n6176___LOOP___END
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
	movl	gvar_fin_mu_lu_n19__mbinfo, %eax
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
	movl	$.Lstrglobal_fvgatest_mtest_svga_l7_n6230, (%esp)
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
	jne	.LBB147_3
# BB#1:                                 # %if_fgfxterm_mVGABox$__eq___l9_n6247___FAIL
	movl	4(%esp), %eax
	movl	(%esp), %ecx
	movzbl	1(%ecx), %ecx
	movzbl	1(%eax), %eax
	cmpl	%ecx, %eax
	je	.LBB147_2
.LBB147_3:                              # %if_fgfxterm_mVGABox$__eq___l9_n6247___SUCC
	xorl	%eax, %eax
	addl	$8, %esp
	retl
.LBB147_2:                              # %if_fgfxterm_mVGABox$__eq___l9_n6247___DONE
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
	jne	.LBB148_3
# BB#1:                                 # %if_fgfxterm_mVGABox$__ne___l17_n6271___SUCC
	movl	4(%esp), %eax
	movl	(%esp), %ecx
	movzbl	1(%ecx), %ecx
	movzbl	1(%eax), %eax
	cmpl	%ecx, %eax
	jne	.LBB148_3
# BB#2:                                 # %if_fgfxterm_mVGABox$__ne___l18_n6279___SUCC
	xorl	%eax, %eax
	addl	$8, %esp
	retl
.LBB148_3:                              # %if_fgfxterm_mVGABox$__ne___l17_n6271___DONE
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
	jmp	.LBB151_1
	.align	16, 0x90
.LBB151_6:                              # %fgfxterm_mVGATextModeEmulator$update_l62_n6382___LOOP___END
                                        #   in Loop: Header=BB151_1 Depth=1
	movl	68(%esp), %eax
	incl	%eax
	movl	%eax, 68(%esp)
.LBB151_1:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB151_3 Depth 2
	movl	72(%esp), %ecx
	cmpl	20(%ecx), %eax
	jge	.LBB151_7
# BB#2:                                 # %fgfxterm_mVGATextModeEmulator$update_l60_n6375___LOOP___HEAD
                                        #   in Loop: Header=BB151_1 Depth=1
	movl	$0, 64(%esp)
	movl	72(%esp), %eax
	cmpl	$0, 16(%eax)
	jle	.LBB151_6
	.align	16, 0x90
.LBB151_3:                              # %fgfxterm_mVGATextModeEmulator$update_l62_n6382___LOOP___HEAD
                                        #   Parent Loop BB151_1 Depth=1
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
	je	.LBB151_5
# BB#4:                                 # %if_fgfxterm_mVGATextModeEmulator$update_l64_n6412___SUCC
                                        #   in Loop: Header=BB151_3 Depth=2
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
.LBB151_5:                              # %if_fgfxterm_mVGATextModeEmulator$update_l64_n6412___DONE
                                        #   in Loop: Header=BB151_3 Depth=2
	movl	64(%esp), %eax
	incl	%eax
	movl	%eax, 64(%esp)
	movl	72(%esp), %ecx
	cmpl	16(%ecx), %eax
	jl	.LBB151_3
	jmp	.LBB151_6
.LBB151_7:                              # %fgfxterm_mVGATextModeEmulator$update_l60_n6375___LOOP___END
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
	movl	%eax, gvar_fgfxterm_mu_lu_n17__console_fb
	movl	%eax, (%esp)
	calll	VGATextModeEmulator$$new
	movl	%eax, gvar_fgfxterm_mu_lu_n16__console_emulator
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
	movl	gvar_fgfxterm_mu_lu_n16__console_emulator, %eax
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
	je	.LBB154_2
# BB#1:                                 # %if_fpaging_mPageEntry$set_l10_n6586___SUCC
	movzbl	19(%esp), %eax
	movl	20(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fpaging_mPageEntry$set_l11_n6595, 12(%esp)
	movl	$.Lstrglobal_fpaging_mPageEntry$set_l11_n6592, 8(%esp)
	calll	kpanic
.LBB154_2:                              # %if_fpaging_mPageEntry$set_l10_n6586___DONE
	movl	24(%esp), %eax
	movl	20(%esp), %ecx
	movl	%ecx, (%eax)
	movl	24(%esp), %eax
	addl	$3, (%eax)
	movzbl	19(%esp), %eax
	cmpl	$1, %eax
	jne	.LBB154_4
# BB#3:                                 # %if_fpaging_mPageEntry$set_l17_n6609___SUCC
	movl	24(%esp), %eax
	subl	$-128, (%eax)
.LBB154_4:                              # %if_fpaging_mPageEntry$set_l17_n6609___DONE
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
	movl	%eax, gvar_fpaging_mu_lu_n18__page_manager
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

	.globl	KModule$get_entry
	.align	16, 0x90
	.type	KModule$get_entry,@function
KModule$get_entry:                      # @"KModule$get_entry"
	.cfi_startproc
# BB#0:
	pushl	%esi
.Ltmp489:
	.cfi_def_cfa_offset 8
	subl	$24, %esp
.Ltmp490:
	.cfi_def_cfa_offset 32
.Ltmp491:
	.cfi_offset %esi, -8
	movl	32(%esp), %esi
	movl	%esi, 20(%esp)
	movl	%esi, (%esp)
	movl	$24, 4(%esp)
	calll	ptr$offset
	movl	(%eax), %eax
	addl	$4096, %eax             # imm = 0x1000
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	ptr$offset
	addl	$24, %esp
	popl	%esi
	retl
.Ltmp492:
	.size	KModule$get_entry, .Ltmp492-KModule$get_entry
	.cfi_endproc

	.globl	km_print
	.align	16, 0x90
	.type	km_print,@function
km_print:                               # @km_print
	.cfi_startproc
# BB#0:
	subl	$12, %esp
.Ltmp493:
	.cfi_def_cfa_offset 16
	movl	16(%esp), %eax
	movl	%eax, 8(%esp)
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkmods_mkm_print_l20_n6680, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	8(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printl
	addl	$12, %esp
	retl
.Ltmp494:
	.size	km_print, .Ltmp494-km_print
	.cfi_endproc

	.globl	km_rep
	.align	16, 0x90
	.type	km_rep,@function
km_rep:                                 # @km_rep
	.cfi_startproc
# BB#0:
	subl	$12, %esp
.Ltmp495:
	.cfi_def_cfa_offset 16
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkmods_mkm_rep_l25_n6688, 4(%esp)
	calll	Terminal$printl
	addl	$12, %esp
	retl
.Ltmp496:
	.size	km_rep, .Ltmp496-km_rep
	.cfi_endproc

	.globl	km_printi
	.align	16, 0x90
	.type	km_printi,@function
km_printi:                              # @km_printi
	.cfi_startproc
# BB#0:
	subl	$12, %esp
.Ltmp497:
	.cfi_def_cfa_offset 16
	movl	16(%esp), %eax
	movl	%eax, 8(%esp)
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkmods_mkm_printi_l29_n6694, 4(%esp)
	calll	Terminal$print
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	8(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkmods_mkm_printi_l31_n6702, 4(%esp)
	calll	Terminal$print
	addl	$12, %esp
	retl
.Ltmp498:
	.size	km_printi, .Ltmp498-km_printi
	.cfi_endproc

	.globl	km_invoke
	.align	16, 0x90
	.type	km_invoke,@function
km_invoke:                              # @km_invoke
	.cfi_startproc
# BB#0:
	pushl	%ebp
.Ltmp499:
	.cfi_def_cfa_offset 8
.Ltmp500:
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
.Ltmp501:
	.cfi_def_cfa_register %ebp
	pushl	%edi
	pushl	%esi
	subl	$16, %esp
.Ltmp502:
	.cfi_offset %esi, -16
.Ltmp503:
	.cfi_offset %edi, -12
	movl	8(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	gvar_fin_mu_lu_n19__mbinfo, %ecx
	subl	$16, %esp
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	calll	MultibootInfo$get_mod_by_args
	addl	$16, %esp
	movl	%eax, -16(%ebp)
	movl	4(%eax), %eax
	movl	%eax, -20(%ebp)
	subl	$16, %esp
	movl	%eax, (%esp)
	calll	KModule$get_entry
	addl	$16, %esp
	movl	%eax, -24(%ebp)
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkmods_mkm_invoke_l40_n6720, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	-20(%ebp), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$dumphexi
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkmods_mkm_invoke_l42_n6730, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	-20(%ebp), %ecx
	movzbl	1(%ecx), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$putchar
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	-20(%ebp), %ecx
	movzbl	2(%ecx), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$putchar
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	-20(%ebp), %ecx
	movzbl	3(%ecx), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$putchar
	addl	$16, %esp
	movl	-20(%ebp), %eax
	movzbl	4(%eax), %eax
	cmpl	$1, %eax
	jne	.LBB165_2
# BB#1:                                 # %if_fkmods_mkm_invoke_l46_n6754___SUCC
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkmods_mkm_invoke_l47_n6757, 4(%esp)
	jmp	.LBB165_3
.LBB165_2:                              # %if_fkmods_mkm_invoke_l46_n6754___FAIL
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkmods_mkm_invoke_l49_n6762, 4(%esp)
.LBB165_3:                              # %if_fkmods_mkm_invoke_l46_n6754___DONE
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkmods_mkm_invoke_l51_n6767, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	-24(%ebp), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$dumphexi
	addl	$16, %esp
	calll	-1072664592
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkmods_mkm_invoke_l56_n6781, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	$km_rep, %esi
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$km_rep, 4(%esp)
	calll	Terminal$dumphexi
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkmods_mkm_invoke_l58_n6791, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	%esp, %edi
	leal	-16(%edi), %eax
	movl	%eax, %esp
	subl	$16, %esp
	movl	$km_printi, (%esp)
	calll	*-24(%ebp)
	addl	$16, %esp
	movl	%eax, -16(%edi)
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkmods_mkm_invoke_l60_n6800, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	-16(%edi), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$dumphexi
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkmods_mkm_invoke_l62_n6808, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	-16(%edi), %ecx
	subl	%esi, %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	Terminal$printi
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fkmods_mkm_invoke_l64_n6820, 4(%esp)
	calll	Terminal$print
	leal	-8(%ebp), %esp
	popl	%esi
	popl	%edi
	popl	%ebp
	retl
.Ltmp504:
	.size	km_invoke, .Ltmp504-km_invoke
	.cfi_endproc

	.globl	kernel_main
	.align	16, 0x90
	.type	kernel_main,@function
kernel_main:                            # @kernel_main
	.cfi_startproc
# BB#0:
	pushl	%ebp
.Ltmp505:
	.cfi_def_cfa_offset 8
.Ltmp506:
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
.Ltmp507:
	.cfi_def_cfa_register %ebp
	pushl	%esi
	subl	$20, %esp
.Ltmp508:
	.cfi_offset %esi, -12
	movl	8(%ebp), %eax
	movl	%eax, -8(%ebp)
	movl	%eax, gvar_fin_mu_lu_n10__multiboot_data_physaddr
	movl	$-1073741824, gvar_fin_mu_lu_n9__base_vma # imm = 0xFFFFFFFFC0000000
	calll	init_serial
	subl	$16, %esp
	movl	$.Lstrglobal_fin_mkernel_main_l27_n6830, (%esp)
	calll	kswritecstr
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n9__base_vma, %eax
	addl	$2097152, %eax          # imm = 0x200000
	subl	$16, %esp
	movl	%eax, (%esp)
	calll	KMM$$init
	addl	$16, %esp
	movl	-8(%ebp), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	calll	MultibootInfo$$load
	addl	$16, %esp
	movl	%eax, gvar_fin_mu_lu_n19__mbinfo
	calll	init_pm
	movl	$4194304, -12(%ebp)     # imm = 0x400000
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB166_3
# BB#1:
	movl	$4194304, %esi          # imm = 0x400000
	.align	16, 0x90
.LBB166_2:                              # %fin_mkernel_main_l34_n6845___LOOP___HEAD
                                        # =>This Inner Loop Header: Depth=1
	movl	gvar_fpaging_mu_lu_n18__page_manager, %eax
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
	jl	.LBB166_2
.LBB166_3:                              # %fin_mkernel_main_l34_n6845___LOOP___END
	movl	gvar_fin_mu_lu_n19__mbinfo, %eax
	movzbl	20(%eax), %eax
	subl	$16, %esp
	cmpl	$1, %eax
	jne	.LBB166_5
# BB#4:                                 # %if_fin_mkernel_main_l40_n6871___SUCC
	movl	$.Lstrglobal_fin_mkernel_main_l41_n6874, (%esp)
	calll	kswritecstr
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n19__mbinfo, %eax
	movl	44(%eax), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$_null_updater, 12(%esp)
	movl	$25, 8(%esp)
	movl	$80, 4(%esp)
	jmp	.LBB166_8
.LBB166_5:                              # %if_fin_mkernel_main_l40_n6871___FAIL
	movl	$.Lstrglobal_fin_mkernel_main_l44_n6889, (%esp)
	calll	kswritecstr
	addl	$16, %esp
	movl	gvar_fpaging_mu_lu_n18__page_manager, %eax
	movl	gvar_fin_mu_lu_n19__mbinfo, %ecx
	movl	44(%ecx), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	PageManager$get_pde_slot_addr
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n19__mbinfo, %ecx
	movl	40(%ecx), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$1, 8(%esp)
	calll	PageEntry$set
	addl	$16, %esp
	movl	gvar_fpaging_mu_lu_n18__page_manager, %eax
	movl	gvar_fin_mu_lu_n19__mbinfo, %ecx
	movl	$4194304, %edx          # imm = 0x400000
	addl	44(%ecx), %edx
	subl	$16, %esp
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	calll	PageManager$get_pde_slot_addr
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n19__mbinfo, %ecx
	movl	40(%ecx), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$1, 8(%esp)
	calll	PageEntry$set
	addl	$16, %esp
	subl	$16, %esp
	movl	$.Lstrglobal_fin_mkernel_main_l47_n6920, (%esp)
	calll	kswritecstr
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n19__mbinfo, %eax
	movl	16(%eax), %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l49_n6927, 4(%esp)
	calll	cstr$__eq__
	addl	$16, %esp
	testb	$1, %al
	je	.LBB166_7
# BB#6:                                 # %if_fin_mkernel_main_l49_n6930___SUCC
	calll	test_svga
.LBB166_7:                              # %if_fin_mkernel_main_l49_n6930___DONE
	movl	gvar_fin_mu_lu_n19__mbinfo, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	calll	init_emulator
	addl	$16, %esp
	movl	gvar_fgfxterm_mu_lu_n16__console_emulator, %eax
	movl	(%eax), %ecx
	movl	16(%eax), %edx
	movl	20(%eax), %eax
	subl	$16, %esp
	movl	%eax, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%ecx, (%esp)
	movl	$_update_framebuffer, 12(%esp)
.LBB166_8:                              # %if_fin_mkernel_main_l40_n6871___DONE
	calll	Terminal$$new
	addl	$16, %esp
	movl	%eax, gvar_fin_mu_lu_n8__kterm
	subl	$16, %esp
	movl	$.Lstrglobal_fin_mkernel_main_l57_n6952, (%esp)
	calll	kswritecstr
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	calll	Terminal$blank
	addl	$16, %esp
	subl	$16, %esp
	movl	$.Lstrglobal_fin_mkernel_main_l59_n6959, (%esp)
	calll	kswritecstr
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l61_n6964, 4(%esp)
	calll	Terminal$printl
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l63_n6969, 4(%esp)
	calll	Terminal$printl
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l65_n6974, 4(%esp)
	calll	Terminal$printl
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l66_n6979, 4(%esp)
	calll	Terminal$printl
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l67_n6984, 4(%esp)
	calll	Terminal$printl
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l68_n6989, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l69_n6995, 8(%esp)
	movl	$14, 4(%esp)
	calll	Terminal$printa
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l70_n7000, 4(%esp)
	calll	Terminal$printl
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l71_n7005, 4(%esp)
	calll	Terminal$printl
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l72_n7010, 4(%esp)
	calll	Terminal$printl
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l73_n7015, 4(%esp)
	calll	Terminal$printl
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l74_n7020, 4(%esp)
	calll	Terminal$printl
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l75_n7025, 4(%esp)
	calll	Terminal$printl
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l76_n7030, 4(%esp)
	calll	Terminal$printl
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l78_n7035, 4(%esp)
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
	movl	$.Lstrglobal_fin_mkernel_main_l80_n7043, 4(%esp)
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
	movl	$.Lstrglobal_fin_mkernel_main_l83_n7054, 4(%esp)
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
	movl	$.Lstrglobal_fin_mkernel_main_l85_n7063, 4(%esp)
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
	movl	$.Lstrglobal_fin_mkernel_main_l87_n7072, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	calll	install_gdt
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l91_n7079, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l93_n7084, 4(%esp)
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
	movl	$.Lstrglobal_fin_mkernel_main_l95_n7093, 4(%esp)
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
	movl	$.Lstrglobal_fin_mkernel_main_l98_n7102, 4(%esp)
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
	jne	.LBB166_10
	.align	16, 0x90
.LBB166_9:                              # %fin_mkernel_main_l104_n7115___LOOP___HEAD
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
	jl	.LBB166_9
.LBB166_10:                             # %fin_mkernel_main_l104_n7115___LOOP___END
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movb	$1, 21(%eax)
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l110_n7142, 4(%esp)
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
	movl	$.Lstrglobal_fin_mkernel_main_l112_n7150, 4(%esp)
	calll	Terminal$printl
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l114_n7155, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	calll	setup_irq
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l118_n7162, 4(%esp)
	calll	Terminal$printl
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l120_n7167, 4(%esp)
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
	movl	$.Lstrglobal_fin_mkernel_main_l122_n7176, 4(%esp)
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
	jg	.LBB166_12
# BB#11:                                # %if_fin_mkernel_main_l124_n7189___SUCC
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l125_n7192, 4(%esp)
	jmp	.LBB166_13
.LBB166_12:                             # %if_fin_mkernel_main_l124_n7189___FAIL
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l127_n7197, 4(%esp)
.LBB166_13:                             # %if_fin_mkernel_main_l124_n7189___DONE
	calll	Terminal$print
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l130_n7202, 4(%esp)
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
	movl	$.Lstrglobal_fin_mkernel_main_l132_n7211, 4(%esp)
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
	movl	$.Lstrglobal_fin_mkernel_main_l134_n7220, 4(%esp)
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
	movl	$.Lstrglobal_fin_mkernel_main_l136_n7232, 4(%esp)
	calll	Terminal$printl
	addl	$16, %esp
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l138_n7237, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	movl	%esp, %eax
	leal	-16(%eax), %esi
	movl	%esi, %esp
	movl	$15, -16(%eax)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB166_15
	.align	16, 0x90
.LBB166_14:                             # %fin_mkernel_main_l142_n7242___LOOP___HEAD
                                        # =>This Inner Loop Header: Depth=1
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	(%esi), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l143_n7249, 8(%esp)
	calll	Terminal$printa
	addl	$16, %esp
	movl	(%esi), %eax
	addl	$16, %eax
	movl	%eax, (%esi)
	cmpl	$256, %eax              # imm = 0x100
	jl	.LBB166_14
.LBB166_15:                             # %fin_mkernel_main_l142_n7242___LOOP___END
	movl	%esp, %eax
	leal	-16(%eax), %esi
	movl	%esi, %esp
	movl	$0, -16(%eax)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB166_17
	.align	16, 0x90
.LBB166_16:                             # %fin_mkernel_main_l149_n7260___LOOP___HEAD
                                        # =>This Inner Loop Header: Depth=1
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	movl	(%esi), %ecx
	subl	$16, %esp
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l150_n7267, 8(%esp)
	calll	Terminal$printa
	addl	$16, %esp
	movl	(%esi), %eax
	incl	%eax
	movl	%eax, (%esi)
	cmpl	$16, %eax
	jl	.LBB166_16
.LBB166_17:                             # %fin_mkernel_main_l149_n7260___LOOP___END
	calll	init_keymap
	movl	gvar_fin_mu_lu_n8__kterm, %eax
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	$.Lstrglobal_fin_mkernel_main_l156_n7280, 4(%esp)
	calll	Terminal$print
	addl	$16, %esp
	calll	kconsole_run
	leal	-4(%ebp), %esp
	popl	%esi
	popl	%ebp
	retl
.Ltmp509:
	.size	kernel_main, .Ltmp509-kernel_main
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

	.type	gvar_fkappsconsole_mu_lu_n12__console_buf,@object # @gvar_fkappsconsole_mu_lu_n12__console_buf
	.globl	gvar_fkappsconsole_mu_lu_n12__console_buf
	.align	4
gvar_fkappsconsole_mu_lu_n12__console_buf:
	.long	0
	.size	gvar_fkappsconsole_mu_lu_n12__console_buf, 4

	.type	gvar_fkappsconsole_mu_lu_n13__command_to_run,@object # @gvar_fkappsconsole_mu_lu_n13__command_to_run
	.globl	gvar_fkappsconsole_mu_lu_n13__command_to_run
	.align	4
gvar_fkappsconsole_mu_lu_n13__command_to_run:
	.long	0
	.size	gvar_fkappsconsole_mu_lu_n13__command_to_run, 4

	.type	gvar_fkappsconsole_mu_lu_n14__command_args,@object # @gvar_fkappsconsole_mu_lu_n14__command_args
	.globl	gvar_fkappsconsole_mu_lu_n14__command_args
	.align	4
gvar_fkappsconsole_mu_lu_n14__command_args:
	.long	0
	.size	gvar_fkappsconsole_mu_lu_n14__command_args, 4

	.type	gvar_fkappsconsole_mu_lu_n15__kcommand_head,@object # @gvar_fkappsconsole_mu_lu_n15__kcommand_head
	.globl	gvar_fkappsconsole_mu_lu_n15__kcommand_head
	.align	4
gvar_fkappsconsole_mu_lu_n15__kcommand_head:
	.long	0
	.size	gvar_fkappsconsole_mu_lu_n15__kcommand_head, 4

	.type	gvar_fgfxterm_mu_lu_n16__console_emulator,@object # @gvar_fgfxterm_mu_lu_n16__console_emulator
	.globl	gvar_fgfxterm_mu_lu_n16__console_emulator
	.align	4
gvar_fgfxterm_mu_lu_n16__console_emulator:
	.long	0
	.size	gvar_fgfxterm_mu_lu_n16__console_emulator, 4

	.type	gvar_fgfxterm_mu_lu_n17__console_fb,@object # @gvar_fgfxterm_mu_lu_n17__console_fb
	.globl	gvar_fgfxterm_mu_lu_n17__console_fb
	.align	4
gvar_fgfxterm_mu_lu_n17__console_fb:
	.long	0
	.size	gvar_fgfxterm_mu_lu_n17__console_fb, 4

	.type	gvar_fpaging_mu_lu_n18__page_manager,@object # @gvar_fpaging_mu_lu_n18__page_manager
	.globl	gvar_fpaging_mu_lu_n18__page_manager
	.align	4
gvar_fpaging_mu_lu_n18__page_manager:
	.long	0
	.size	gvar_fpaging_mu_lu_n18__page_manager, 4

	.type	gvar_fin_mu_lu_n19__mbinfo,@object # @gvar_fin_mu_lu_n19__mbinfo
	.globl	gvar_fin_mu_lu_n19__mbinfo
	.align	4
gvar_fin_mu_lu_n19__mbinfo:
	.long	0
	.size	gvar_fin_mu_lu_n19__mbinfo, 4

	.type	.Lstrglobal_fmm_mGDTEntry$print_l108_n217,@object # @"strglobal_fmm_mGDTEntry$print_l108_n217"
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fmm_mGDTEntry$print_l108_n217:
	.asciz	"GDTEntry<"
	.size	.Lstrglobal_fmm_mGDTEntry$print_l108_n217, 10

	.type	.Lstrglobal_fmm_mGDTEntry$print_l110_n228,@object # @"strglobal_fmm_mGDTEntry$print_l110_n228"
.Lstrglobal_fmm_mGDTEntry$print_l110_n228:
	.asciz	","
	.size	.Lstrglobal_fmm_mGDTEntry$print_l110_n228, 2

	.type	.Lstrglobal_fmm_mGDTEntry$print_l112_n239,@object # @"strglobal_fmm_mGDTEntry$print_l112_n239"
.Lstrglobal_fmm_mGDTEntry$print_l112_n239:
	.asciz	","
	.size	.Lstrglobal_fmm_mGDTEntry$print_l112_n239, 2

	.type	.Lstrglobal_fmm_mGDTEntry$print_l114_n250,@object # @"strglobal_fmm_mGDTEntry$print_l114_n250"
.Lstrglobal_fmm_mGDTEntry$print_l114_n250:
	.asciz	","
	.size	.Lstrglobal_fmm_mGDTEntry$print_l114_n250, 2

	.type	.Lstrglobal_fmm_mGDTEntry$print_l116_n261,@object # @"strglobal_fmm_mGDTEntry$print_l116_n261"
.Lstrglobal_fmm_mGDTEntry$print_l116_n261:
	.asciz	","
	.size	.Lstrglobal_fmm_mGDTEntry$print_l116_n261, 2

	.type	.Lstrglobal_fmm_mGDTEntry$print_l118_n272,@object # @"strglobal_fmm_mGDTEntry$print_l118_n272"
.Lstrglobal_fmm_mGDTEntry$print_l118_n272:
	.asciz	","
	.size	.Lstrglobal_fmm_mGDTEntry$print_l118_n272, 2

	.type	.Lstrglobal_fmm_mGDTEntry$print_l120_n283,@object # @"strglobal_fmm_mGDTEntry$print_l120_n283"
.Lstrglobal_fmm_mGDTEntry$print_l120_n283:
	.asciz	">"
	.size	.Lstrglobal_fmm_mGDTEntry$print_l120_n283, 2

	.type	.Lstrglobal_fmm_minstall_gdt_l161_n404,@object # @strglobal_fmm_minstall_gdt_l161_n404
.Lstrglobal_fmm_minstall_gdt_l161_n404:
	.asciz	"GDT@"
	.size	.Lstrglobal_fmm_minstall_gdt_l161_n404, 5

	.type	.Lstrglobal_firqio_msetup_irq_l88_n579,@object # @strglobal_firqio_msetup_irq_l88_n579
.Lstrglobal_firqio_msetup_irq_l88_n579:
	.asciz	"IDT@"
	.size	.Lstrglobal_firqio_msetup_irq_l88_n579, 5

	.type	.Lstrglobal_firqio_msetup_irq_l98_n615,@object # @strglobal_firqio_msetup_irq_l98_n615
.Lstrglobal_firqio_msetup_irq_l98_n615:
	.asciz	"!"
	.size	.Lstrglobal_firqio_msetup_irq_l98_n615, 2

	.type	.Lstrglobal_firqio_msetup_irq_l112_n666,@object # @strglobal_firqio_msetup_irq_l112_n666
.Lstrglobal_firqio_msetup_irq_l112_n666:
	.asciz	"."
	.size	.Lstrglobal_firqio_msetup_irq_l112_n666, 2

	.type	.Lstrglobal_firqio_msetup_irq_l116_n675,@object # @strglobal_firqio_msetup_irq_l116_n675
.Lstrglobal_firqio_msetup_irq_l116_n675:
	.asciz	"."
	.size	.Lstrglobal_firqio_msetup_irq_l116_n675, 2

	.type	.Lstrglobal_firqio_msetup_irq_l119_n682,@object # @strglobal_firqio_msetup_irq_l119_n682
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_firqio_msetup_irq_l119_n682:
	.asciz	" KBD, PIC started. "
	.size	.Lstrglobal_firqio_msetup_irq_l119_n682, 20

	.type	.Lstrglobal_firqio_mKeyboardState$getkey_l168_n785,@object # @"strglobal_firqio_mKeyboardState$getkey_l168_n785"
	.align	16
.Lstrglobal_firqio_mKeyboardState$getkey_l168_n785:
	.asciz	"Internal Error - Invalid Scancode in KeyboardState:getkey"
	.size	.Lstrglobal_firqio_mKeyboardState$getkey_l168_n785, 58

	.type	.Lstrglobal_firqio_mKeyboardState$setkey_l174_n809,@object # @"strglobal_firqio_mKeyboardState$setkey_l174_n809"
	.align	16
.Lstrglobal_firqio_mKeyboardState$setkey_l174_n809:
	.asciz	"Internal Error - Invalid Scancode in KeyboardState:setkey"
	.size	.Lstrglobal_firqio_mKeyboardState$setkey_l174_n809, 58

	.type	.Lstrglobal_firqio_mkirq_callback_l202_n867,@object # @strglobal_firqio_mkirq_callback_l202_n867
	.align	16
.Lstrglobal_firqio_mkirq_callback_l202_n867:
	.asciz	"No handler for IRQ"
	.size	.Lstrglobal_firqio_mkirq_callback_l202_n867, 19

	.type	.Lstrglobal_firqio_mkirq_callback_l202_n870,@object # @strglobal_firqio_mkirq_callback_l202_n870
	.align	16
.Lstrglobal_firqio_mkirq_callback_l202_n870:
	.asciz	"A unregistered IRQ was fired (unhandled IRQ)"
	.size	.Lstrglobal_firqio_mkirq_callback_l202_n870, 45

	.type	.Lstrglobal_firqio_mirq_pagefault_handler_l218_n920,@object # @strglobal_firqio_mirq_pagefault_handler_l218_n920
	.align	16
.Lstrglobal_firqio_mirq_pagefault_handler_l218_n920:
	.asciz	"Unrecoverable Page Fault Error - INT 0x0E - #PF"
	.size	.Lstrglobal_firqio_mirq_pagefault_handler_l218_n920, 48

	.type	.Lstrglobal_firqio_mirq_pagefault_handler_l218_n923,@object # @strglobal_firqio_mirq_pagefault_handler_l218_n923
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_firqio_mirq_pagefault_handler_l218_n923:
	.asciz	"???"
	.size	.Lstrglobal_firqio_mirq_pagefault_handler_l218_n923, 4

	.type	.Lstrglobal_firqio_mirq_protectionfault_handler_l222_n933,@object # @strglobal_firqio_mirq_protectionfault_handler_l222_n933
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_firqio_mirq_protectionfault_handler_l222_n933:
	.asciz	"Unrecoverable Page Fault Error - INT 0x0D - #GPF"
	.size	.Lstrglobal_firqio_mirq_protectionfault_handler_l222_n933, 49

	.type	.Lstrglobal_firqio_mirq_protectionfault_handler_l222_n936,@object # @strglobal_firqio_mirq_protectionfault_handler_l222_n936
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_firqio_mirq_protectionfault_handler_l222_n936:
	.asciz	"???"
	.size	.Lstrglobal_firqio_mirq_protectionfault_handler_l222_n936, 4

	.type	.Lstrglobal_firqio_mirq_doublefault_handler_l226_n946,@object # @strglobal_firqio_mirq_doublefault_handler_l226_n946
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_firqio_mirq_doublefault_handler_l226_n946:
	.asciz	"Unrecoverable Double Fault Error - INT 0x08 - #DF"
	.size	.Lstrglobal_firqio_mirq_doublefault_handler_l226_n946, 50

	.type	.Lstrglobal_firqio_mirq_doublefault_handler_l226_n949,@object # @strglobal_firqio_mirq_doublefault_handler_l226_n949
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_firqio_mirq_doublefault_handler_l226_n949:
	.asciz	"???"
	.size	.Lstrglobal_firqio_mirq_doublefault_handler_l226_n949, 4

	.type	.Lstrglobal_firqio_mirq_zerodivision_handler_l230_n959,@object # @strglobal_firqio_mirq_zerodivision_handler_l230_n959
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_firqio_mirq_zerodivision_handler_l230_n959:
	.asciz	"Unrecoverable Zero Division Error - INT 0x00 - #DBZ"
	.size	.Lstrglobal_firqio_mirq_zerodivision_handler_l230_n959, 52

	.type	.Lstrglobal_firqio_mirq_zerodivision_handler_l230_n962,@object # @strglobal_firqio_mirq_zerodivision_handler_l230_n962
	.align	16
.Lstrglobal_firqio_mirq_zerodivision_handler_l230_n962:
	.asciz	"Why would you do that?"
	.size	.Lstrglobal_firqio_mirq_zerodivision_handler_l230_n962, 23

	.type	.Lstrglobal_fserialdbg_minit_serial_l26_n1041,@object # @strglobal_fserialdbg_minit_serial_l26_n1041
	.align	16
.Lstrglobal_fserialdbg_minit_serial_l26_n1041:
	.asciz	"Serial Debugger started!\n"
	.size	.Lstrglobal_fserialdbg_minit_serial_l26_n1041, 26

	.type	.Lstrglobal_fterm_mTerminal$printl_l77_n1281,@object # @"strglobal_fterm_mTerminal$printl_l77_n1281"
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fterm_mTerminal$printl_l77_n1281:
	.asciz	"\n"
	.size	.Lstrglobal_fterm_mTerminal$printl_l77_n1281, 2

	.type	.Lstrglobal_fterm_mTerminal$printlong_l119_n1469,@object # @"strglobal_fterm_mTerminal$printlong_l119_n1469"
.Lstrglobal_fterm_mTerminal$printlong_l119_n1469:
	.asciz	"0"
	.size	.Lstrglobal_fterm_mTerminal$printlong_l119_n1469, 2

	.type	.Lstrglobal_fterm_mTerminal$printlong_l124_n1479,@object # @"strglobal_fterm_mTerminal$printlong_l124_n1479"
.Lstrglobal_fterm_mTerminal$printlong_l124_n1479:
	.asciz	"-"
	.size	.Lstrglobal_fterm_mTerminal$printlong_l124_n1479, 2

	.type	.Lstrglobal_fterm_mTerminal$printlong_l131_n1492,@object # @"strglobal_fterm_mTerminal$printlong_l131_n1492"
.Lstrglobal_fterm_mTerminal$printlong_l131_n1492:
	.asciz	"?"
	.size	.Lstrglobal_fterm_mTerminal$printlong_l131_n1492, 2

	.type	.Lstrglobal_fterm_mTerminal$dumpbin_l150_n1571,@object # @"strglobal_fterm_mTerminal$dumpbin_l150_n1571"
.Lstrglobal_fterm_mTerminal$dumpbin_l150_n1571:
	.asciz	"0b"
	.size	.Lstrglobal_fterm_mTerminal$dumpbin_l150_n1571, 3

	.type	.Lstrglobal_fterm_mTerminal$dumpbin_l155_n1595,@object # @"strglobal_fterm_mTerminal$dumpbin_l155_n1595"
.Lstrglobal_fterm_mTerminal$dumpbin_l155_n1595:
	.asciz	"1"
	.size	.Lstrglobal_fterm_mTerminal$dumpbin_l155_n1595, 2

	.type	.Lstrglobal_fterm_mTerminal$dumpbin_l157_n1600,@object # @"strglobal_fterm_mTerminal$dumpbin_l157_n1600"
.Lstrglobal_fterm_mTerminal$dumpbin_l157_n1600:
	.asciz	"0"
	.size	.Lstrglobal_fterm_mTerminal$dumpbin_l157_n1600, 2

	.type	.Lstrglobal_fterm_mTerminal$dumphex_l163_n1611,@object # @"strglobal_fterm_mTerminal$dumphex_l163_n1611"
.Lstrglobal_fterm_mTerminal$dumphex_l163_n1611:
	.asciz	"0x"
	.size	.Lstrglobal_fterm_mTerminal$dumphex_l163_n1611, 3

	.type	.Lstrglobal_fpanic_mkpanic_l15_n1739,@object # @strglobal_fpanic_mkpanic_l15_n1739
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fpanic_mkpanic_l15_n1739:
	.asciz	"********************************************************************************"
	.size	.Lstrglobal_fpanic_mkpanic_l15_n1739, 81

	.type	.Lstrglobal_fpanic_mkpanic_l16_n1744,@object # @strglobal_fpanic_mkpanic_l16_n1744
	.align	16
.Lstrglobal_fpanic_mkpanic_l16_n1744:
	.asciz	"                             THOUSANDER MEDITATION"
	.size	.Lstrglobal_fpanic_mkpanic_l16_n1744, 51

	.type	.Lstrglobal_fpanic_mkpanic_l19_n1755,@object # @strglobal_fpanic_mkpanic_l19_n1755
	.align	16
.Lstrglobal_fpanic_mkpanic_l19_n1755:
	.asciz	"********************************************************************************"
	.size	.Lstrglobal_fpanic_mkpanic_l19_n1755, 81

	.type	.Lstrglobal_fpanic_mkpanic_l20_n1760,@object # @strglobal_fpanic_mkpanic_l20_n1760
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fpanic_mkpanic_l20_n1760:
	.asciz	"\nError Code: "
	.size	.Lstrglobal_fpanic_mkpanic_l20_n1760, 14

	.type	.Lstrglobal_fpanic_mkpanic_l22_n1768,@object # @strglobal_fpanic_mkpanic_l22_n1768
.Lstrglobal_fpanic_mkpanic_l22_n1768:
	.asciz	"\nIdentifier: "
	.size	.Lstrglobal_fpanic_mkpanic_l22_n1768, 14

	.type	.Lstrglobal_fpanic_mkpanic_l24_n1776,@object # @strglobal_fpanic_mkpanic_l24_n1776
.Lstrglobal_fpanic_mkpanic_l24_n1776:
	.asciz	"\n\nCS:"
	.size	.Lstrglobal_fpanic_mkpanic_l24_n1776, 6

	.type	.Lstrglobal_fpanic_mkpanic_l26_n1786,@object # @strglobal_fpanic_mkpanic_l26_n1786
.Lstrglobal_fpanic_mkpanic_l26_n1786:
	.asciz	" DS:"
	.size	.Lstrglobal_fpanic_mkpanic_l26_n1786, 5

	.type	.Lstrglobal_fpanic_mkpanic_l28_n1796,@object # @strglobal_fpanic_mkpanic_l28_n1796
.Lstrglobal_fpanic_mkpanic_l28_n1796:
	.asciz	" SS:"
	.size	.Lstrglobal_fpanic_mkpanic_l28_n1796, 5

	.type	.Lstrglobal_fpanic_mkpanic_l30_n1806,@object # @strglobal_fpanic_mkpanic_l30_n1806
.Lstrglobal_fpanic_mkpanic_l30_n1806:
	.asciz	" ES:"
	.size	.Lstrglobal_fpanic_mkpanic_l30_n1806, 5

	.type	.Lstrglobal_fpanic_mkpanic_l32_n1816,@object # @strglobal_fpanic_mkpanic_l32_n1816
.Lstrglobal_fpanic_mkpanic_l32_n1816:
	.asciz	" FS:"
	.size	.Lstrglobal_fpanic_mkpanic_l32_n1816, 5

	.type	.Lstrglobal_fpanic_mkpanic_l34_n1826,@object # @strglobal_fpanic_mkpanic_l34_n1826
.Lstrglobal_fpanic_mkpanic_l34_n1826:
	.asciz	" GS:"
	.size	.Lstrglobal_fpanic_mkpanic_l34_n1826, 5

	.type	.Lstrglobal_fpanic_mkpanic_l36_n1836,@object # @strglobal_fpanic_mkpanic_l36_n1836
.Lstrglobal_fpanic_mkpanic_l36_n1836:
	.asciz	"\nEFLAGS:"
	.size	.Lstrglobal_fpanic_mkpanic_l36_n1836, 9

	.type	.Lstrglobal_fpanic_mkpanic_l38_n1845,@object # @strglobal_fpanic_mkpanic_l38_n1845
.Lstrglobal_fpanic_mkpanic_l38_n1845:
	.asciz	"\nCR0:"
	.size	.Lstrglobal_fpanic_mkpanic_l38_n1845, 6

	.type	.Lstrglobal_fpanic_mkpanic_l40_n1854,@object # @strglobal_fpanic_mkpanic_l40_n1854
.Lstrglobal_fpanic_mkpanic_l40_n1854:
	.asciz	"\nCR2:"
	.size	.Lstrglobal_fpanic_mkpanic_l40_n1854, 6

	.type	.Lstrglobal_fpanic_mkpanic_l42_n1863,@object # @strglobal_fpanic_mkpanic_l42_n1863
.Lstrglobal_fpanic_mkpanic_l42_n1863:
	.asciz	" CR3:"
	.size	.Lstrglobal_fpanic_mkpanic_l42_n1863, 6

	.type	.Lstrglobal_fpanic_mkpanic_l44_n1872,@object # @strglobal_fpanic_mkpanic_l44_n1872
.Lstrglobal_fpanic_mkpanic_l44_n1872:
	.asciz	"\nCR4:"
	.size	.Lstrglobal_fpanic_mkpanic_l44_n1872, 6

	.type	.Lstrglobal_fpanic_mkpanic_l46_n1881,@object # @strglobal_fpanic_mkpanic_l46_n1881
.Lstrglobal_fpanic_mkpanic_l46_n1881:
	.asciz	"\n\nSystem halted"
	.size	.Lstrglobal_fpanic_mkpanic_l46_n1881, 16

	.type	.Lstrglobal_fpanic_mikpanici_l51_n1893,@object # @strglobal_fpanic_mikpanici_l51_n1893
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fpanic_mikpanici_l51_n1893:
	.asciz	"Internal Kernel Error :("
	.size	.Lstrglobal_fpanic_mikpanici_l51_n1893, 25

	.type	.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l16_n2065,@object # @"strglobal_fkeymap_us_mKeymap$translate_keycode_l16_n2065"
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l16_n2065:
	.asciz	"?"
	.size	.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l16_n2065, 2

	.type	.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l21_n2084,@object # @"strglobal_fkeymap_us_mKeymap$translate_keycode_l21_n2084"
.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l21_n2084:
	.asciz	"!@#$%^&*()_+"
	.size	.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l21_n2084, 13

	.type	.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l23_n2091,@object # @"strglobal_fkeymap_us_mKeymap$translate_keycode_l23_n2091"
.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l23_n2091:
	.asciz	"1234567890-="
	.size	.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l23_n2091, 13

	.type	.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l29_n2113,@object # @"strglobal_fkeymap_us_mKeymap$translate_keycode_l29_n2113"
.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l29_n2113:
	.asciz	"QWERTYUIOP{}|\n"
	.size	.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l29_n2113, 15

	.type	.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l31_n2120,@object # @"strglobal_fkeymap_us_mKeymap$translate_keycode_l31_n2120"
.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l31_n2120:
	.asciz	"qwertyuiop[]\n"
	.size	.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l31_n2120, 14

	.type	.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l36_n2137,@object # @"strglobal_fkeymap_us_mKeymap$translate_keycode_l36_n2137"
.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l36_n2137:
	.asciz	"ASDFGHJKL:\"~"
	.size	.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l36_n2137, 13

	.type	.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l38_n2144,@object # @"strglobal_fkeymap_us_mKeymap$translate_keycode_l38_n2144"
.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l38_n2144:
	.asciz	"asdfghjkl;'`"
	.size	.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l38_n2144, 13

	.type	.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l43_n2161,@object # @"strglobal_fkeymap_us_mKeymap$translate_keycode_l43_n2161"
.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l43_n2161:
	.asciz	"|ZXCVBNM<>?"
	.size	.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l43_n2161, 12

	.type	.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l45_n2168,@object # @"strglobal_fkeymap_us_mKeymap$translate_keycode_l45_n2168"
.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l45_n2168:
	.asciz	"\\zxcvbnm,./"
	.size	.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l45_n2168, 12

	.type	.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l49_n2179,@object # @"strglobal_fkeymap_us_mKeymap$translate_keycode_l49_n2179"
.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l49_n2179:
	.asciz	"*"
	.size	.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l49_n2179, 2

	.type	.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l51_n2187,@object # @"strglobal_fkeymap_us_mKeymap$translate_keycode_l51_n2187"
.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l51_n2187:
	.asciz	" "
	.size	.Lstrglobal_fkeymap_us_mKeymap$translate_keycode_l51_n2187, 2

	.type	.Lstrglobal_fkappsutil_mKeyboardBuf$handleevent_l46_n2365,@object # @"strglobal_fkappsutil_mKeyboardBuf$handleevent_l46_n2365"
.Lstrglobal_fkappsutil_mKeyboardBuf$handleevent_l46_n2365:
	.asciz	" "
	.size	.Lstrglobal_fkappsutil_mKeyboardBuf$handleevent_l46_n2365, 2

	.type	.Lstrglobal_fkappsutil_mKeyboardBuf$handleevent_l51_n2385,@object # @"strglobal_fkappsutil_mKeyboardBuf$handleevent_l51_n2385"
.Lstrglobal_fkappsutil_mKeyboardBuf$handleevent_l51_n2385:
	.asciz	"\n"
	.size	.Lstrglobal_fkappsutil_mKeyboardBuf$handleevent_l51_n2385, 2

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l56_n2549,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l56_n2549"
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l56_n2549:
	.asciz	"Total Size: "
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l56_n2549, 13

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l58_n2559,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l58_n2559"
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l58_n2559:
	.asciz	"\n"
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l58_n2559, 2

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l64_n2579,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l64_n2579"
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l64_n2579:
	.asciz	" - "
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l64_n2579, 4

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l67_n2590,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l67_n2590"
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l67_n2590:
	.asciz	"Cmdline tag, cmdline=`"
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l67_n2590, 23

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l69_n2602,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l69_n2602"
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l69_n2602:
	.asciz	"'"
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l69_n2602, 2

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l71_n2613,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l71_n2613"
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l71_n2613:
	.asciz	"Loader tag, name=`"
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l71_n2613, 19

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l73_n2625,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l73_n2625"
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l73_n2625:
	.asciz	"'"
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l73_n2625, 2

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l75_n2636,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l75_n2636"
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l75_n2636:
	.asciz	"Module tag, args="
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l75_n2636, 18

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l78_n2652,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l78_n2652"
	.align	16
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l78_n2652:
	.asciz	"BasicMem tag, lower="
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l78_n2652, 21

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l80_n2663,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l80_n2663"
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l80_n2663:
	.asciz	", upper="
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l80_n2663, 9

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l83_n2680,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l83_n2680"
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l83_n2680:
	.asciz	"Boot Device tag, dev="
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l83_n2680, 22

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l85_n2692,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l85_n2692"
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l85_n2692:
	.asciz	", p="
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l85_n2692, 5

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l87_n2704,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l87_n2704"
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l87_n2704:
	.asciz	":"
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l87_n2704, 2

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l90_n2722,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l90_n2722"
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l90_n2722:
	.asciz	"MMAP Tag esz="
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l90_n2722, 14

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l92_n2733,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l92_n2733"
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l92_n2733:
	.asciz	", ev="
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l92_n2733, 6

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l94_n2744,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l94_n2744"
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l94_n2744:
	.asciz	", #="
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l94_n2744, 5

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l98_n2768,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l98_n2768"
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l98_n2768:
	.asciz	"VBE Info Tag:. Controller info:\n"
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l98_n2768, 33

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l100_n2779,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l100_n2779"
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l100_n2779:
	.asciz	"\nMode info:\n"
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l100_n2779, 13

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l104_n2801,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l104_n2801"
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l104_n2801:
	.asciz	"FB Tag addr="
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l104_n2801, 13

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l106_n2812,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l106_n2812"
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l106_n2812:
	.asciz	", pitch="
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l106_n2812, 9

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l108_n2822,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l108_n2822"
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l108_n2822:
	.asciz	", width="
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l108_n2822, 9

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l110_n2832,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l110_n2832"
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l110_n2832:
	.asciz	", height="
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l110_n2832, 10

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l112_n2842,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l112_n2842"
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l112_n2842:
	.asciz	", bpp="
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l112_n2842, 7

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l114_n2853,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l114_n2853"
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l114_n2853:
	.asciz	", fbtype="
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l114_n2853, 10

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l117_n2870,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l117_n2870"
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l117_n2870:
	.asciz	"APM Tag (unk.)"
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l117_n2870, 15

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l119_n2881,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l119_n2881"
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l119_n2881:
	.asciz	"RSDP1 Tag, oem="
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l119_n2881, 16

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l122_n2895,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l122_n2895"
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l122_n2895:
	.asciz	"RSDP2 Tag, oem="
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l122_n2895, 16

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l125_n2909,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l125_n2909"
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l125_n2909:
	.asciz	"NIC Tag (unk.)"
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l125_n2909, 15

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l127_n2914,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l127_n2914"
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l127_n2914:
	.asciz	"??? Tag"
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l127_n2914, 8

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l130_n2919,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l130_n2919"
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l130_n2919:
	.asciz	", type="
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l130_n2919, 8

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l132_n2929,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l132_n2929"
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l132_n2929:
	.asciz	", sz="
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l132_n2929, 6

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l134_n2939,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l134_n2939"
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l134_n2939:
	.asciz	", pos="
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l134_n2939, 7

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l136_n2949,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l136_n2949"
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l136_n2949:
	.asciz	"\n"
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l136_n2949, 2

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l141_n2966,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l141_n2966"
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l141_n2966:
	.asciz	"\nMalformed structure, no terminator tag!\n"
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l141_n2966, 42

	.type	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l146_n2977,@object # @"strglobal_fmbdata_mRawMultibootInfo$print_l146_n2977"
	.align	16
.Lstrglobal_fmbdata_mRawMultibootInfo$print_l146_n2977:
	.asciz	"Reached End Tag\n"
	.size	.Lstrglobal_fmbdata_mRawMultibootInfo$print_l146_n2977, 17

	.type	.Lstrglobal_fmbdata_mMBMMAPMemTag$print_l178_n3016,@object # @"strglobal_fmbdata_mMBMMAPMemTag$print_l178_n3016"
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fmbdata_mMBMMAPMemTag$print_l178_n3016:
	.asciz	"\n  MMAP Tag "
	.size	.Lstrglobal_fmbdata_mMBMMAPMemTag$print_l178_n3016, 13

	.type	.Lstrglobal_fmbdata_mMBMMAPMemTag$print_l180_n3024,@object # @"strglobal_fmbdata_mMBMMAPMemTag$print_l180_n3024"
.Lstrglobal_fmbdata_mMBMMAPMemTag$print_l180_n3024:
	.asciz	" - type="
	.size	.Lstrglobal_fmbdata_mMBMMAPMemTag$print_l180_n3024, 9

	.type	.Lstrglobal_fmbdata_mMBMMAPMemTag$print_l182_n3034,@object # @"strglobal_fmbdata_mMBMMAPMemTag$print_l182_n3034"
.Lstrglobal_fmbdata_mMBMMAPMemTag$print_l182_n3034:
	.asciz	", start="
	.size	.Lstrglobal_fmbdata_mMBMMAPMemTag$print_l182_n3034, 9

	.type	.Lstrglobal_fmbdata_mMBMMAPMemTag$print_l184_n3045,@object # @"strglobal_fmbdata_mMBMMAPMemTag$print_l184_n3045"
.Lstrglobal_fmbdata_mMBMMAPMemTag$print_l184_n3045:
	.asciz	", len="
	.size	.Lstrglobal_fmbdata_mMBMMAPMemTag$print_l184_n3045, 7

	.type	.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l374_n3386,@object # @"strglobal_fmbdata_mRawVBEControllerInfo$print_l374_n3386"
.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l374_n3386:
	.asciz	" Signature: "
	.size	.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l374_n3386, 13

	.type	.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l379_n3411,@object # @"strglobal_fmbdata_mRawVBEControllerInfo$print_l379_n3411"
.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l379_n3411:
	.asciz	"\n Version: "
	.size	.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l379_n3411, 12

	.type	.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l381_n3423,@object # @"strglobal_fmbdata_mRawVBEControllerInfo$print_l381_n3423"
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l381_n3423:
	.asciz	"\n OEM String FarPtr: "
	.size	.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l381_n3423, 22

	.type	.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l383_n3435,@object # @"strglobal_fmbdata_mRawVBEControllerInfo$print_l383_n3435"
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l383_n3435:
	.asciz	":"
	.size	.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l383_n3435, 2

	.type	.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l385_n3447,@object # @"strglobal_fmbdata_mRawVBEControllerInfo$print_l385_n3447"
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l385_n3447:
	.asciz	"\n Capabilities: "
	.size	.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l385_n3447, 17

	.type	.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l387_n3459,@object # @"strglobal_fmbdata_mRawVBEControllerInfo$print_l387_n3459"
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l387_n3459:
	.asciz	" "
	.size	.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l387_n3459, 2

	.type	.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l389_n3471,@object # @"strglobal_fmbdata_mRawVBEControllerInfo$print_l389_n3471"
.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l389_n3471:
	.asciz	" "
	.size	.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l389_n3471, 2

	.type	.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l391_n3483,@object # @"strglobal_fmbdata_mRawVBEControllerInfo$print_l391_n3483"
.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l391_n3483:
	.asciz	" "
	.size	.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l391_n3483, 2

	.type	.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l393_n3495,@object # @"strglobal_fmbdata_mRawVBEControllerInfo$print_l393_n3495"
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l393_n3495:
	.asciz	"\n VMode FarPtr: "
	.size	.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l393_n3495, 17

	.type	.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l395_n3507,@object # @"strglobal_fmbdata_mRawVBEControllerInfo$print_l395_n3507"
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l395_n3507:
	.asciz	":"
	.size	.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l395_n3507, 2

	.type	.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l397_n3519,@object # @"strglobal_fmbdata_mRawVBEControllerInfo$print_l397_n3519"
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l397_n3519:
	.asciz	"\n Availible Memory (64KB units): "
	.size	.Lstrglobal_fmbdata_mRawVBEControllerInfo$print_l397_n3519, 34

	.type	.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l445_n3531,@object # @"strglobal_fmbdata_mRawVBEModeInfo$print_l445_n3531"
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l445_n3531:
	.asciz	" Attributes:"
	.size	.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l445_n3531, 13

	.type	.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l447_n3542,@object # @"strglobal_fmbdata_mRawVBEModeInfo$print_l447_n3542"
.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l447_n3542:
	.asciz	" "
	.size	.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l447_n3542, 2

	.type	.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l449_n3554,@object # @"strglobal_fmbdata_mRawVBEModeInfo$print_l449_n3554"
.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l449_n3554:
	.asciz	":"
	.size	.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l449_n3554, 2

	.type	.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l452_n3566,@object # @"strglobal_fmbdata_mRawVBEModeInfo$print_l452_n3566"
.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l452_n3566:
	.asciz	"\n Res: "
	.size	.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l452_n3566, 8

	.type	.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l454_n3577,@object # @"strglobal_fmbdata_mRawVBEModeInfo$print_l454_n3577"
.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l454_n3577:
	.asciz	"x"
	.size	.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l454_n3577, 2

	.type	.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l456_n3588,@object # @"strglobal_fmbdata_mRawVBEModeInfo$print_l456_n3588"
.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l456_n3588:
	.asciz	"x"
	.size	.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l456_n3588, 2

	.type	.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l459_n3599,@object # @"strglobal_fmbdata_mRawVBEModeInfo$print_l459_n3599"
.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l459_n3599:
	.asciz	"\n Pitch: "
	.size	.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l459_n3599, 10

	.type	.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l461_n3611,@object # @"strglobal_fmbdata_mRawVBEModeInfo$print_l461_n3611"
.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l461_n3611:
	.asciz	" PysAddr: "
	.size	.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l461_n3611, 11

	.type	.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l463_n3621,@object # @"strglobal_fmbdata_mRawVBEModeInfo$print_l463_n3621"
.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l463_n3621:
	.asciz	"\n"
	.size	.Lstrglobal_fmbdata_mRawVBEModeInfo$print_l463_n3621, 2

	.type	.Lstrglobal_fkappsraycasterrcmath_mrcsin_l13_n3639,@object # @strglobal_fkappsraycasterrcmath_mrcsin_l13_n3639
	.section	.rodata,"a",@progbits
	.align	16
.Lstrglobal_fkappsraycasterrcmath_mrcsin_l13_n3639:
	.asciz	"\000\000\000\000\000\000\000\000\036\335\211+\013\337\221?'\334\367\311X\336\241?\016\311\357H\307\313\252?(Qjm\217\333\261?\002\201\302\270\326O\266?lW<\233`\302\272?\323bOL\3242\277?\031\236\215\226l\320\301?uS\250g\013\006\304?\211s\013~\032:\306?Obv\335ml\310?\366XB\254\331\234\312?u\306\31562\313\314?\035\271\344\362K\367\316?\220\006\223\301}\220\320?)\2162\335\n\244\321?\310\325\203\3177\266\322?O\351/7\357\306\323?\334\315\000\320\033\326\324?\365\013\212t\250\343\325?<\323\316\037\200\357\326?\201\226\345\356\215\371\327?\253\377\230\"\275\001\331?\321\032\006!\371\007\332?S\2307w-\f\333?\310\005\276\332E\016\334?\000\336D+.\016\335?yP$t\322\013\336?\355\240\357\355\036\007\337?\377\377\377\377\377\377\337?\023\337\375 1{\340?*\335\254>\031\365\340?\035wp\327\256m\341?\023\375\021\204\350\344\341?xI|\370\274Z\342?^Zu\004#\317\342?\266\276U\224\021B\343?9\311\275\261\177\263\343?\275zH\204d#\344?\034\026<R\267\221\344?\324O8\201o\376\344?\330\013\342\226\204i\345?+\234\2149\356\322\345?\020s\3400\244:\346?\314;\177f\236\240\346?8M\245\346\324\004\347?\202i\310\340?g\347?\302\2763\250\327\307\347?7\034\241\264\224&\350?9P\317\242o\203\350?(\243\0255a\336\350?\322c\364Sb7\351?\024z\242\016l\216\351?\250\364\227\233w\343\351?G\207\025Y~6\352?\245\356\250\315y\207\352?\334/\256\250c\326\352?E\251\315\3025#\353?\336\352v\036\352m\353?\252LX\350z\266\353?\3069\323w\342\374\353?\007'mO\033A\354?l,=\035 \203\354?\3128V\273\353\302\354?g\327-0y\000\355?\225\177\377\256\303;\355?of,\230\306t\355?X\313\227y}\253\355?\005\270\377\016\344\337\355?\033-RB\366\021\356?\312\264\376+\260A\356?\377TD\023\016o\356?\037\333{n\f\232\356?\200{^\343\247\302\356?\025\277HG\335\350\356?%\272y\237\251\f\357?\017\207N!\n.\357?\177\000z2\374L\357?\302\2668i}i\357?\027\034\201\214\213\203\357?\\\344/\224$\233\357?z\2240\251F\260\357?\213>\242%\360\302\357?\306g\370\224\037\323\357?\242\025\030\264\323\340\357?\366\377pq\013\354\357?\035\346\022\355\305\364\357?g\005\277x\002\373\357?\212\257\365\227\300\376\357?\000\000\000\000\000\000\360?\212\257\365\227\300\376\357?g\005\277x\002\373\357?\035\346\022\355\305\364\357?\366\377pq\013\354\357?\242\025\030\264\323\340\357?\306g\370\224\037\323\357?\214>\242%\360\302\357?z\2240\251F\260\357?\\\344/\224$\233\357?\027\034\201\214\213\203\357?\302\2668i}i\357?\200\000z2\374L\357?\017\207N!\n.\357?%\272y\237\251\f\357?\025\277HG\335\350\356?\200{^\343\247\302\356? \333{n\f\232\356?\000UD\023\016o\356?\313\264\376+\260A\356?\034-RB\366\021\356?\005\270\377\016\344\337\355?X\313\227y}\253\355?nf,\230\306t\355?\225\177\377\256\303;\355?h\327-0y\000\355?\3118V\273\353\302\354?m,=\035 \203\354?\007'mO\033A\354?\3079\323w\342\374\353?\253LX\350z\266\353?\336\352v\036\352m\353?F\251\315\3025#\353?\333/\256\250c\326\352?\245\356\250\315y\207\352?F\207\025Y~6\352?\250\364\227\233w\343\351?\023z\242\016l\216\351?\322c\364Sb7\351?)\243\0255a\336\350?9P\317\242o\203\350?8\034\241\264\224&\350?\302\2763\250\327\307\347?\203i\310\340?g\347?8M\245\346\324\004\347?\315;\177f\236\240\346?\017s\3400\244:\346?,\234\2149\356\322\345?\331\013\342\226\204i\345?\324O8\201o\376\344?\036\026<R\267\221\344?\275zH\204d#\344?:\311\275\261\177\263\343?\265\276U\224\021B\343?_Zu\004#\317\342?wI|\370\274Z\342?\023\375\021\204\350\344\341?\037wp\327\256m\341?*\335\254>\031\365\340?\025\337\375 1{\340?\377\377\377\377\377\377\337?\357\240\357\355\036\007\337?wP$t\322\013\336?\002\336D+.\016\335?\306\005\276\332E\016\334?T\2307w-\f\333?\325\032\006!\371\007\332?\253\377\230\"\275\001\331?\205\226\345\356\215\371\327?;\323\316\037\200\357\326?\370\013\212t\250\343\325?\332\315\000\320\033\326\324?Q\351/7\357\306\323?\305\325\203\3177\266\322?*\2162\335\n\244\321?\225\006\223\301}\220\320?\035\271\344\362K\367\316?|\306\31562\313\314?\365XB\254\331\234\312?Ubv\335ml\310?\207s\013~\032:\306?yS\250g\013\006\304?\025\236\215\226l\320\301?\330bOL\3242\277?\177W<\233`\302\272?\004\201\302\270\326O\266?8Qjm\217\333\261?\n\311\357H\307\313\252?@\334\367\311X\336\241?\t\335\211+\013\337\221?\007\\\0243&\246\241<B\335\211+\013\337\221\277\035\334\367\311X\336\241\277\347\310\357H\307\313\252\277&Qjm\217\333\261\277\362\200\302\270\326O\266\277nW<\233`\302\272\277\307bOL\3242\277\277\034\236\215\226l\320\301\277pS\250g\013\006\304\277\216s\013~\032:\306\277Lbv\335ml\310\277\374XB\254\331\234\312\277t\306\31562\313\314\277\025\271\344\362K\367\316\277\221\006\223\301}\220\320\277&\2162\335\n\244\321\277\310\325\203\3177\266\322\277M\351/7\357\306\323\277\335\315\000\320\033\326\324\277\364\013\212t\250\343\325\277?\323\316\037\200\357\326\277\201\226\345\356\215\371\327\277\247\377\230\"\275\001\331\277\321\032\006!\371\007\332\277P\2307w-\f\333\277\311\005\276\332E\016\334\277\377\335D+.\016\335\277zP$t\322\013\336\277\353\240\357\355\036\007\337\277\001\000\000\000\000\000\340\277\023\337\375 1{\340\277)\335\254>\031\365\340\277\035wp\327\256m\341\277\021\375\021\204\350\344\341\277yI|\370\274Z\342\277]Zu\004#\317\342\277\267\276U\224\021B\343\2778\311\275\261\177\263\343\277\277zH\204d#\344\277\034\026<R\267\221\344\277\322O8\201o\376\344\277\330\013\342\226\204i\345\277*\234\2149\356\322\345\277\021s\3400\244:\346\277\314;\177f\236\240\346\2779M\245\346\324\004\347\277\202i\310\340?g\347\277\303\2763\250\327\307\347\2777\034\241\264\224&\350\2778P\317\242o\203\350\277%\243\0255a\336\350\277\323c\364Sb7\351\277\024z\242\016l\216\351\277\247\364\227\233w\343\351\277E\207\025Y~6\352\277\246\356\250\315y\207\352\277\334/\256\250c\326\352\277E\251\315\3025#\353\277\334\352v\036\352m\353\277\250LX\350z\266\353\277\3109\323w\342\374\353\277\b'mO\033A\354\277l,=\035 \203\354\277\3108V\273\353\302\354\277h\327-0y\000\355\277\226\177\377\256\303;\355\277nf,\230\306t\355\277W\313\227y}\253\355\277\004\270\377\016\344\337\355\277\034-RB\366\021\356\277\313\264\376+\260A\356\277\377TD\023\016o\356\277\036\333{n\f\232\356\277\201{^\343\247\302\356\277\025\277HG\335\350\356\277%\272y\237\251\f\357\277\016\207N!\n.\357\277\177\000z2\374L\357\277\302\2668i}i\357\277\027\034\201\214\213\203\357\277[\344/\224$\233\357\277y\2240\251F\260\357\277\214>\242%\360\302\357\277\307g\370\224\037\323\357\277\242\025\030\264\323\340\357\277\366\377pq\013\354\357\277\035\346\022\355\305\364\357\277g\005\277x\002\373\357\277\212\257\365\227\300\376\357\277\000\000\000\000\000\000\360\277\212\257\365\227\300\376\357\277g\005\277x\002\373\357\277\035\346\022\355\305\364\357\277\367\377pq\013\354\357\277\242\025\030\264\323\340\357\277\307g\370\224\037\323\357\277\213>\242%\360\302\357\277z\2240\251F\260\357\277\\\344/\224$\233\357\277\030\034\201\214\213\203\357\277\301\2668i}i\357\277\177\000z2\374L\357\277\017\207N!\n.\357\277&\272y\237\251\f\357\277\026\277HG\335\350\356\277\177{^\343\247\302\356\277\037\333{n\f\232\356\277\000UD\023\016o\356\277\314\264\376+\260A\356\277\033-RB\366\021\356\277\005\270\377\016\344\337\355\277X\313\227y}\253\355\277pf,\230\306t\355\277\227\177\377\256\303;\355\277g\327-0y\000\355\277\3128V\273\353\302\354\277m,=\035 \203\354\277\t'mO\033A\354\277\3059\323w\342\374\353\277\252LX\350z\266\353\277\336\352v\036\352m\353\277G\251\315\3025#\353\277\336/\256\250c\326\352\277\244\356\250\315y\207\352\277G\207\025Y~6\352\277\251\364\227\233w\343\351\277\026z\242\016l\216\351\277\320c\364Sb7\351\277'\243\0255a\336\350\277:P\317\242o\203\350\2779\034\241\264\224&\350\277\305\2763\250\327\307\347\277\201i\310\340?g\347\2779M\245\346\324\004\347\277\316;\177f\236\240\346\277\023s\3400\244:\346\277)\234\2149\356\322\345\277\327\013\342\226\204i\345\277\325O8\201o\376\344\277\037\026<R\267\221\344\277\301zH\204d#\344\2778\311\275\261\177\263\343\277\266\276U\224\021B\343\277`Zu\004#\317\342\277|I|\370\274Z\342\277\020\375\021\204\350\344\341\277\034wp\327\256m\341\277+\335\254>\031\365\340\277\026\337\375 1{\340\277\004\000\000\000\000\000\340\277\352\240\357\355\036\007\337\277yP$t\322\013\336\277\004\336D+.\016\335\277\317\005\276\332E\016\334\277O\2307w-\f\333\277\320\032\006!\371\007\332\277\255\377\230\"\275\001\331\277\207\226\345\356\215\371\327\277E\323\316\037\200\357\326\277\363\013\212t\250\343\325\277\334\315\000\320\033\326\324\277S\351/7\357\306\323\277\317\325\203\3177\266\322\277%\2162\335\n\244\321\277\217\006\223\301}\220\320\277\"\271\344\362K\367\316\277\201\306\31562\313\314\277\tYB\254\331\234\312\277Jbv\335ml\310\277\213s\013~\032:\306\277}S\250g\013\006\304\277)\236\215\226l\320\301\277\301bOL\3242\277\277hW<\233`\302\272\277\r\201\302\270\326O\266\277@Qjm\217\333\261\277[\311\357H\307\313\252\277\022\334\367\311X\336\241\277,\335\211+\013\337\221\277\007\\\0243&\246\261\274\237\334\211+\013\337\221?K\334\367\311X\336\241?\025\311\357H\307\313\252?\035Qjm\217\333\261?"
	.size	.Lstrglobal_fkappsraycasterrcmath_mrcsin_l13_n3639, 2921

	.type	.Lstrglobal_fkappsraycasterrcmath_mrccos_l21_n3665,@object # @strglobal_fkappsraycasterrcmath_mrccos_l21_n3665
	.align	16
.Lstrglobal_fkappsraycasterrcmath_mrccos_l21_n3665:
	.asciz	"\000\000\000\000\000\000\360?\212\257\365\227\300\376\357?g\005\277x\002\373\357?\035\346\022\355\305\364\357?\366\377pq\013\354\357?\242\025\030\264\323\340\357?\306g\370\224\037\323\357?\213>\242%\360\302\357?z\2240\251F\260\357?\\\344/\224$\233\357?\027\034\201\214\213\203\357?\302\2668i}i\357?\200\000z2\374L\357?\017\207N!\n.\357?%\272y\237\251\f\357?\025\277HG\335\350\356?\200{^\343\247\302\356?\037\333{n\f\232\356?\377TD\023\016o\356?\313\264\376+\260A\356?\034-RB\366\021\356?\005\270\377\016\344\337\355?X\313\227y}\253\355?of,\230\306t\355?\225\177\377\256\303;\355?g\327-0y\000\355?\3128V\273\353\302\354?m,=\035 \203\354?\b'mO\033A\354?\3069\323w\342\374\353?\253LX\350z\266\353?\336\352v\036\352m\353?E\251\315\3025#\353?\334/\256\250c\326\352?\244\356\250\315y\207\352?G\207\025Y~6\352?\250\364\227\233w\343\351?\024z\242\016l\216\351?\321c\364Sb7\351?(\243\0255a\336\350?9P\317\242o\203\350?7\034\241\264\224&\350?\302\2763\250\327\307\347?\202i\310\340?g\347?9M\245\346\324\004\347?\315;\177f\236\240\346?\020s\3400\244:\346?+\234\2149\356\322\345?\330\013\342\226\204i\345?\324O8\201o\376\344?\035\026<R\267\221\344?\276zH\204d#\344?9\311\275\261\177\263\343?\267\276U\224\021B\343?^Zu\004#\317\342?yI|\370\274Z\342?\022\375\021\204\350\344\341?\035wp\327\256m\341?*\335\254>\031\365\340?\023\337\375 1{\340?\001\000\000\000\000\000\340?\356\240\357\355\036\007\337?zP$t\322\013\336?\001\336D+.\016\335?\311\005\276\332E\016\334?S\2307w-\f\333?\321\032\006!\371\007\332?\252\377\230\"\275\001\331?\200\226\345\356\215\371\327?>\323\316\037\200\357\326?\367\013\212t\250\343\325?\335\315\000\320\033\326\324?P\351/7\357\306\323?\310\325\203\3177\266\322?)\2162\335\n\244\321?\220\006\223\301}\220\320?\033\271\344\362K\367\316?r\306\31562\313\314?\372XB\254\331\234\312?Sbv\335ml\310?\214s\013~\032:\306?wS\250g\013\006\304?\032\236\215\226l\320\301?\324bOL\3242\277?kW<\233`\302\272?\000\201\302\270\326O\266?#Qjm\217\333\261?!\311\357H\307\313\252?7\334\367\311X\336\241?7\335\211+\013\337\221?\007\\\0243&\246\221<\024\335\211+\013\337\221\277%\334\367\311X\336\241\277\017\311\357H\307\313\252\277*Qjm\217\333\261\277\007\201\302\270\326O\266\277rW<\233`\302\272\277\313bOL\3242\277\277\026\236\215\226l\320\301\277sS\250g\013\006\304\277\210s\013~\032:\306\277Obv\335ml\310\277\366XB\254\331\234\312\277v\306\31562\313\314\277\037\271\344\362K\367\316\277\222\006\223\301}\220\320\277'\2162\335\n\244\321\277\306\325\203\3177\266\322\277N\351/7\357\306\323\277\333\315\000\320\033\326\324\277\365\013\212t\250\343\325\277<\323\316\037\200\357\326\277\202\226\345\356\215\371\327\277\253\377\230\"\275\001\331\277\322\032\006!\371\007\332\277Q\2307w-\f\333\277\312\005\276\332E\016\334\277\377\335D+.\016\335\277{P$t\322\013\336\277\354\240\357\355\036\007\337\277\374\377\377\377\377\377\337\277\024\337\375 1{\340\277)\335\254>\031\365\340\277\035wp\327\256m\341\277\021\375\021\204\350\344\341\277yI|\370\274Z\342\277]Zu\004#\317\342\277\267\276U\224\021B\343\2779\311\275\261\177\263\343\277\274zH\204d#\344\277\035\026<R\267\221\344\277\323O8\201o\376\344\277\330\013\342\226\204i\345\277*\234\2149\356\322\345\277\021s\3400\244:\346\277\314;\177f\236\240\346\2779M\245\346\324\004\347\277\202i\310\340?g\347\277\300\2763\250\327\307\347\2777\034\241\264\224&\350\2778P\317\242o\203\350\277(\243\0255a\336\350\277\321c\364Sb7\351\277\025z\242\016l\216\351\277\247\364\227\233w\343\351\277H\207\025Y~6\352\277\244\356\250\315y\207\352\277\333/\256\250c\326\352\277E\251\315\3025#\353\277\335\352v\036\352m\353\277\253LX\350z\266\353\277\3069\323w\342\374\353\277\b'mO\033A\354\277l,=\035 \203\354\277\3128V\273\353\302\354\277g\327-0y\000\355\277\224\177\377\256\303;\355\277of,\230\306t\355\277W\313\227y}\253\355\277\005\270\377\016\344\337\355\277\033-RB\366\021\356\277\313\264\376+\260A\356\277\377TD\023\016o\356\277 \333{n\f\232\356\277\200{^\343\247\302\356\277\024\277HG\335\350\356\277%\272y\237\251\f\357\277\016\207N!\n.\357\277\200\000z2\374L\357\277\302\2668i}i\357\277\027\034\201\214\213\203\357\277[\344/\224$\233\357\277z\2240\251F\260\357\277\213>\242%\360\302\357\277\306g\370\224\037\323\357\277\242\025\030\264\323\340\357\277\366\377pq\013\354\357\277\035\346\022\355\305\364\357\277g\005\277x\002\373\357\277\212\257\365\227\300\376\357\277\000\000\000\000\000\000\360\277\212\257\365\227\300\376\357\277g\005\277x\002\373\357\277\035\346\022\355\305\364\357\277\366\377pq\013\354\357\277\242\025\030\264\323\340\357\277\306g\370\224\037\323\357\277\214>\242%\360\302\357\277y\2240\251F\260\357\277\\\344/\224$\233\357\277\027\034\201\214\213\203\357\277\302\2668i}i\357\277\177\000z2\374L\357\277\017\207N!\n.\357\277%\272y\237\251\f\357\277\025\277HG\335\350\356\277\200{^\343\247\302\356\277\037\333{n\f\232\356\277\000UD\023\016o\356\277\312\264\376+\260A\356\277\034-RB\366\021\356\277\005\270\377\016\344\337\355\277X\313\227y}\253\355\277of,\230\306t\355\277\225\177\377\256\303;\355\277h\327-0y\000\355\277\3118V\273\353\302\354\277m,=\035 \203\354\277\007'mO\033A\354\277\3079\323w\342\374\353\277\252LX\350z\266\353\277\336\352v\036\352m\353\277F\251\315\3025#\353\277\334/\256\250c\326\352\277\246\356\250\315y\207\352\277G\207\025Y~6\352\277\251\364\227\233w\343\351\277\024z\242\016l\216\351\277\322c\364Sb7\351\277'\243\0255a\336\350\2779P\317\242o\203\350\2778\034\241\264\224&\350\277\302\2763\250\327\307\347\277\203i\310\340?g\347\2778M\245\346\324\004\347\277\316;\177f\236\240\346\277\020s\3400\244:\346\277,\234\2149\356\322\345\277\327\013\342\226\204i\345\277\324O8\201o\376\344\277\036\026<R\267\221\344\277\301zH\204d#\344\2777\311\275\261\177\263\343\277\266\276U\224\021B\343\277_Zu\004#\317\342\277{I|\370\274Z\342\277\020\375\021\204\350\344\341\277\034wp\327\256m\341\277+\335\254>\031\365\340\277\026\337\375 1{\340\277\004\000\000\000\000\000\340\277\351\240\357\355\036\007\337\277xP$t\322\013\336\277\003\336D+.\016\335\277\316\005\276\332E\016\334\277N\2307w-\f\333\277\317\032\006!\371\007\332\277\254\377\230\"\275\001\331\277\206\226\345\356\215\371\327\277D\323\316\037\200\357\326\277\362\013\212t\250\343\325\277\333\315\000\320\033\326\324\277R\351/7\357\306\323\277\316\325\203\3177\266\322\277$\2162\335\n\244\321\277\216\006\223\301}\220\320\277\037\271\344\362K\367\316\277~\306\31562\313\314\277\006YB\254\331\234\312\277Hbv\335ml\310\277\211s\013~\032:\306\277{S\250g\013\006\304\277'\236\215\226l\320\301\277\275bOL\3242\277\277dW<\233`\302\272\277\b\201\302\270\326O\266\277<Qjm\217\333\261\277R\311\357H\307\313\252\277\t\334\367\311X\336\241\277\032\335\211+\013\337\221\277\n\212\236L9y\252\274\260\334\211+\013\337\221?T\334\367\311X\336\241?\036\311\357H\307\313\252?\"Qjm\217\333\261?\356\200\302\270\326O\266?IW<\233`\302\272?\342bOL\3242\277?\032\236\215\226l\320\301?nS\250g\013\006\304?|s\013~\032:\306?Zbv\335ml\310?\371XB\254\331\234\312?r\306\31562\313\314?\023\271\344\362K\367\316?\210\006\223\301}\220\320?-\2162\335\n\244\321?\307\325\203\3177\266\322?L\351/7\357\306\323?\325\315\000\320\033\326\324?\372\013\212t\250\343\325?>\323\316\037\200\357\326?\200\226\345\356\215\371\327?\246\377\230\"\275\001\331?\311\032\006!\371\007\332?V\2307w-\f\333?\310\005\276\332E\016\334?\376\335D+.\016\335?rP$t\322\013\336?\361\240\357\355\036\007\337?\001\000\000\000\000\000\340?\023\337\375 1{\340?(\335\254>\031\365\340?\031wp\327\256m\341?\024\375\021\204\350\344\341?xI|\370\274Z\342?\\Zu\004#\317\342?\263\276U\224\021B\343?;\311\275\261\177\263\343?\276zH\204d#\344?\034\026<R\267\221\344?\322O8\201o\376\344?\324\013\342\226\204i\345?,\234\2149\356\322\345?\020s\3400\244:\346?\313;\177f\236\240\346?6M\245\346\324\004\347?\204i\310\340?g\347?\302\2763\250\327\307\347?6\034\241\264\224&\350?7P\317\242o\203\350?%\243\0255a\336\350?\322c\364Sb7\351?\024z\242\016l\216\351?\247\364\227\233w\343\351?E\207\025Y~6\352?\246\356\250\315y\207\352?\334/\256\250c\326\352?E\251\315\3025#\353?\334\352v\036\352m\353?\250LX\350z\266\353?\3079\323w\342\374\353?\007'mO\033A\354?l,=\035 \203\354?\3108V\273\353\302\354?h\327-0y\000\355?\226\177\377\256\303;\355?nf,\230\306t\355?W\313\227y}\253\355?\003\270\377\016\344\337\355?\034-RB\366\021\356?\313\264\376+\260A\356?\377TD\023\016o\356?\036\333{n\f\232\356?\200{^\343\247\302\356?\025\277HG\335\350\356?%\272y\237\251\f\357?\016\207N!\n.\357?\177\000z2\374L\357?\302\2668i}i\357?\027\034\201\214\213\203\357?[\344/\224$\233\357?y\2240\251F\260\357?\214>\242%\360\302\357?\306g\370\224\037\323\357?\242\025\030\264\323\340\357?\366\377pq\013\354\357?\035\346\022\355\305\364\357?g\005\277x\002\373\357?\212\257\365\227\300\376\357?\000\000\000\000\000\000\360?\212\257\365\227\300\376\357?g\005\277x\002\373\357?\035\346\022\355\305\364\357?\367\377pq\013\354\357?"
	.size	.Lstrglobal_fkappsraycasterrcmath_mrccos_l21_n3665, 2921

	.type	.Lstrglobal_fkappsraycasterrcrots_mrcrot_get___l9_n3677,@object # @strglobal_fkappsraycasterrcrots_mrcrot_get___l9_n3677
	.align	16
.Lstrglobal_fkappsraycasterrcrots_mrcrot_get___l9_n3677:
	.asciz	"\000\000\000\000\000\000\360?\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\037\205\353Q\270\036\345?\315>\005KE\320\357?~\302\275\370\"\230\273?^\000s\205T6\262\277\273\2121\3717\377\344?(\364~\215\243A\357?\027&\005\205\372n\313?\361e\203v*\033\302\277\350\226\240\347\024\241\344?\263l\357B\304U\356?\350\366\252\266\006`\324?2'\366\224'\345\312\277\201\275\274\356g\005\344?xq\261\013g\017\355?\024\033UT\310\313\332?\215\331\177\333t\257\321\277\344\312<s\001.\343?=~\376yYr\353?\302\027\273R\315s\340?\217R\206%\224\267\325\277QS\267\003d\035\342?\203p\260\271k\203\351?\262\034\335S\242P\343?y\277\236\300\352~\331\277\346\272\325\333\274\326\340?lH\2264bH\347?\341\341O\024\331\363\345?\363\366T\0063\372\334\277\231_\306\324\264\273\336?\233\3160^\344\307\344?\357\032\f\\\223U\350?\371D\351\030\205\017\340\277\316\276\370\354An\333?\022g)\332h\t\342?\241\311\330L\266n\352?\337Q\231\255\007r\341\277\334T~\013\373\316\327?\303jsq>*\336?=\272 \224\3778\354?\217\353\315\270\177\240\342\277d\030\036U\256\350\323?\261\336\334\026\257\347\327?\025\346\316\026\030\257\355?jZU\360f\227\343\277|\021\017\231\373\215\317?\221\251:6\320]\321?\274\003\177\337\243\314\356?c\324\323\313\334S\344\277\244\254W=y\354\306?\226?\3525F@\305?)\261|\037O\216\357?\331\306\346\031\257\323\344\277\376*^z)\r\274?\242\331A\326\034\026\256?\204\213\306\033\330\361\357?]=6\215`\025\345\277\034M\317\363d\333\243?z0:5\237.\251\277\375'y\350\025\366\357?'\220\351--\030\345\277\207\342\272<\305\236\240\277P\373\215\034\017\n\304\277\224\324\214\336\373\232\357?b:>\242\f\334\344\277f\223\027\214\255s\272\277+R\347\203W\306\320\277\214\343\223\301\231\341\356?v\367pG\262a\344\2778b\b\000\210$\306\277\232\223\374\030\235U\327\277\030\352\b\225\030\314\355?\361\327\256\032\213\252\343\277\216\341a\207+\315\316\277\315Qe\345F\237\335\277\223P\237*\264]\354?\200mJx\271\270\342\277\022d\256x\366\214\323\277\327\367q\223I\310\341\277\021Z\317|\261\232\352? \003\345\275\016\217\341\277\300\340\323\365\004y\327\277\001\352\224\332\343\213\344\277{8d\362Q\210\350?\\\323\211\342\0021\340\277!?\f\f\016\037\333\277|4\305q3\022\347\277\221Z\n\261\303,\346?\350\006\235;TE\335\277\271\2027m/t\336\277_\353JY\260S\351\277hc\242-\017\217\343?\177d\255yQ\321\331\277x \371\021<\267\340\277\306\332m\337\237I\353\277\201\372W1\002\267\340?M\273\r\223J\020\326\277'\006\264\035\203\002\342\277\252\003f\263(\356\354\277\022\247$$1Z\333?W\034jZr\r\322\277\360\355\\\237\020\030\343\277\356Z\371Wd<\356\277\356\224`\307\305\364\324?\031\260\262\362\177\251\313\277\223~v\240\250\364\343\277n\201\272\301m0\357\277d\025;\266\255\241\314?bod}\226\345\302\277\361@W\024\271\225\344\277\347\007M\365l\307\357\277le\035\250\315\b\276?\352\302\2426\234\322\263\277i\270-\203a\371\344\277\360\302\006\203\237\377\357\2770L\262l<\245\203?@d\302p\227\356y\277\306\005G\243x\036\345\277\355\007\240\306]\330\357\277&c\003\341\321&\271\277\r[\007\000\237\231\260?\033\200\344\317\217\004\345\277\224}J\333\034R\357\277X\253\250\343\241;\312\277s\0007?QP\301?\204\303JS\364\253\344\277O\261Z>mn\356\277\254x\247\306\314\312\323\277\34289\006- \312?\372\2351\200\256\025\344\277\345\213\226$\366/\355\277\346\332\206\354\275<\332\277\022*\265\265\fQ\321?\001\244D\235~C\343\277\371\203\024\220m\232\353\277h\204\314<50\340\277\261\000\345\300Z^\325?\211\224\344\253\3277\342\277\007\252G>\215\262\351\277)\024l\377\300\021\343\277\356\322\352F\352+\331?\210\250\276\031\330\365\340\277ix>\217\004~\347\277C&\007\025j\272\345\2779Q\204\021c\256\334?\342\307\n\346\200\002\337\277\025\236!\220g\003\345\277e\216-\006B\"\350\277\217Uo\351L\333\337?!\345\027b\320\274\333\277v\325\211[\033J\342\277l\247&\266\033B\352\277V\022\334h\227T\341?d\212O\215a$\330\277\220\222m\024\200\264\336\277\242K3\313\240\023\354\277\023\016\325\244\325\207\342?\326e\366!\356C\324\277\341\262\352\3530y\330\277P\370(\226d\221\355\277 \256\213\240\314\203\343?\221a/\260\006'\320\277\276'\007.\340\364\321\277\244*\001A\364\266\356\277vTC\272\214E\344?\312\303\301<\340\263\307\277\364\026\244'\375u\306\277x\\\027\024\344\200\357\277\007\275\307\370\323\312\344?\f\353\220>\374\245\275\277\2329\316\203r~\261\277\350_\177\252\331\354\357\277\333\201\221\307\024\022\345?j`l\353\214\027\247\277\376\257\305\267\211F\244?\037H\003\367\222\371\357\277\217\330\311\230z\032\345?$Yk\226\202\303\232?u\355P*_\323\302? L\330\004\352\246\357\277g\216[_\354\343\344?\002%#\031\222\331\270?Sn\200\250y.\320?}\305\330h\325\365\356\277\006\312\255\331\fo\344?\210\f\225:\021\\\305?\232\263*c\376\302\326?d\207\361ae\350\355\277)\246)\2548\275\343?k\245\031\266\241\013\316?%\003N\266\234\023\335?U\324T\261\275\201\354\277\017\3362Q\202\320\342?!\331\302\265\3100\323?\330\330\033\020\277\206\341?%\261\317<\f\306\352\277e\t\262\352\253\253\341??\036\264R\201\"\327?\215\260%ogO\344?x\0052\227|\272\350\277\234\003\241\007\037R\340?uO\364\2346\317\332?\344\003\213\215y\333\346?\035S\372\223(e\346\277\266mJ\354\304\217\335?\225B\255^\362+\336?\2530\360<\\#\351?\2525G\024\006\315\343\277\364\313*\201\034#\332?>\245#zV\227\340?\302Q\372\265A \353?R\004YC\322\371\340\277\004\276\177\362{h\326?\302\002\362\2335\347\341?<\375-\344;\314\354?VI(\001\365\347\333\277<\324\244\373\002k\322?\222d\365\245\254\001\343?^0~\026N\"\356?\244\030\304w\006\211\325\277\314\001_\1771m\314?Q\206]\372p\343\343?\367X\306\337{\036\357?\240\273\273=\264\323\315\277\033\335$\217\220\257\303?\351m\356\035\341\211\344?\340{\316\372\324\275\357?\032\201\t\234a<\300\277\3049T]ln\265?;f\r\221\f\363\344?1\353`\016~\376\357?\360\270C0\001\245\223\277\260\215\265?I\356\211?\373\220\331\230\271\035\345?\301AK7\266\337\357?\357\026\351\033\351\264\266?F\036q\276\n\371\255\277Z\324\r\347h\t\345?'\236\304G\331a\357?\310\017\232\017\253\007\311?\356\365\306\236\017\205\300\277\345S\304\025W\266\344?t\246\204\265^\206\356?\327O?{\0335\323?\307\317]\352\224Z\311\277\320\226\256\362{%\344?Ym\2749\325O\355?*\232UK\025\255\331?aV\\\"<\362\320\277S\244\335\233\207X\343?q[\376/\333\301\353?>wY\016w\330\337?!\f;\177\240\004\325\277X<\267v\335Q\342?gZ\327\312\023\341\351?Cj\202\253l\322\342?\261\311\034\001R\330\330\2778~\035\020\215\024\341?\277\266L>\031\263\347?P\276\212\rx\200\345?3\373Z&\346a\334\277\235W\023\366\221H\337?\360T\203\tl>\345?\323kA&_\356\347?\377\325j\204\317\226\337\277\240[\255\221\267\n\334?x\343j\221_\212\342?|\340\264\305\342\024\352?\230\3214\241\2766\341\277\260iEx6y\330?\340\020\222\214\b>\337?\004\2373\261\230\355\353?/\363\034\321\273n\342\277r\303\357\270\263\236\324?\351\210\252*\037\n\331?z\"4\306\376r\355?\022\317\210\241\274o\343\277n\b\205+\256\206\320?\340\020Q\334\203\213\322?\021r\341h\213\240\356?\217\254\017i\3026\344\277\274*\307K\270z\310?}\264\376\245,\253\307?|\351G\r\273r\357?\332\017It{\301\344\277q\370E7\034>\277?I\365'\035m\361\263?\210N\301\262\032\347\357?\017\276\333\360I\016\345\277X\264]\241)S\252?l\275p\351\363\273\236\277 U[2O\374\357?s\231\364\277H\034\345\277\354IEM\331H\224\277\346~\315\260=\234\301\277\202\002mJ\031\262\357?\221\323\302!N\353\344\277\270\332\250\312\340>\267\2776\257\266ot,\317\277p\264I[V\t\357?\256\220\0022\354{\344\277|\027\344\245\031\223\304\277\244\273\230i\326/\326\277w\344\336\322\375\003\356?\017x\"4o\317\343\277\260\367X\264bI\315\277\364\177m.C\207\334\277\016\242\356N\033\245\354?\265`\030\264\331\347\342\277\246\007>8'\324\322\277\222\ff\333\312D\341\277,\254f\207\305\360\352?\007\330q\207\336\307\341\277\364\237\330+r\313\326\277X\031\246\210p\022\344\277\027\315\355\033\022\354\350?FY\203\300\330r\340\277\262+-\201\275~\332\277*\205\356\3215\244\346\277\206\375\ti\006\235\346?R\226sW\203\331\335\277\3474\312\\\377\342\335\2779g\022\210p\362\350\277\331,\036\222\205\n\344?D\351\325\351It\332\277s\374\257\324\fw\340\277\016\372\033\367?\366\352\277\327\353\323\365;<\341?\212A\0030&\300\326\277\255\225\027#|\313\341\277:5\237j\241\251\354\277z\205u\224\020u\334?qg\361\212$\310\322\277\317\352\f\016\326\352\342\277\2748\317\033\202\007\356\277\357d\313I\305\034\326?\304G\331\23670\315\277\3154Fd\301\321\343\277\232\360\331S\316\013\357\277\b\232\t\346\006\005\317?2\250\276\351\023y\304\277yf\322K\215}\344\277\367hd\225}\263\357\277\026\311\351z\372s\301?p\340\025F\273\t\267\277\351\265\377H9\354\344\277\213\t\340\250\233\374\357\277\310]\266\262\355v\235?\234\341c3Ur\223\277}9#7{\034\345\277m\350\272pN\346\357\277\240^\374gwB\264\277\216\026v\274\"\276\252?\203\036q!\303\r\345\277\231\341\007t\330p\357\277\004\302\007J\035\323\307\277\315G\341\275\324r\277?\002\232k\360<\300\344\277\316|\t\030\230\235\356\277\275z+[\366\236\322\277\362\363\373\350c\224\310?\257\212\347\346\3174\344\277\221\245\357\212\003o\355\277\3028\027\323\321\034\331\277\006h=]\005\223\320?\336\206-\360\033m\343\277`M\366k\241\350\353\277\222\342\221\227\303O\337\277\031\330\242}g\252\324?\212GA\307tk\342\277\304\316\314F\376\016\352\277\205\276\b\326\246\222\342\277\3548S\347#\204\330?\360\234\304\005\3332\341\277\362M\246\001\237\347\347\277PqK[\004F\345\277}\347\033\022\276\024\334?\340fV^\346\215\337\277\340 nf\360x\345\277I9.\365\353\271\347\277\030`\314\237\223Q\337?\213\207\355\245\365W\334\277\032T=\3703\312\342\2775Q:\214\f\347\351\277\216^\241\n~\030\341?f\325\313\314w\315\330\277\327\324{\234\324\306\337\277\231_{+\350\306\353\277`\240\004\3252U\342?\017\246\243\366\374\370\324\277L\340\032iv\232\331\277\335\262@^\347S\355\277\317kIl7[\343?Lu\260\375\361\345\320\2774\260\251\264\267!\323\277_\364C\336i\211\356\277>Jj1~'\344?ncF\273\374@\311\277\315!nh\315\337\310\277\227\033s`\324c\357\277\343\331\306\304\245\267\344?\324\330\244\343\277j\300\277%K-r\357c\266\277X\0073W\233\340\357\277S\231\363\037\000\n\345?\266\252\266\226'\216\255\2770=\217\013\033\352\224?\207\215\002\212J\376\357\277\013\316\206\230\227\035\345?\310\267-ak\233\213?\244\272J\004\262d\300?\251\371\327k\211\274\357\277\331\322\357\2741\362\344?\023gXM\243\243\265?8\3023\2209\373\315?\227\252H#\034\034\357\277\005\256\316\002P\210\344?\210\270\344\375\245\311\303?4\357\263\243(\234\325?x\320fA\341\036\356\277\177\333\303D.\341\343?\r\035\207\025s\206\314?\2247%\234=\372\333?\265\313&.\314\307\354\277<S8\024\277\376\342?@g\274.\024w\322??\367\f\203n\002\341?\026\326\356Z\334\032\353\277\013\203\030\352\245\343\341?\234PD\216\331s\326?\202\272\273\226\000\325\343?\314'\223U\021\035\351\277\357\341\326G/\223\340?\254\n\002\236\244-\332?\311\3075\214il\346?\376\375Q\337[\324\346\277T\375a\300\215\"\336?\2550z\037X\231\335?\006\351\265a\356\300\350?\346\373I4\214G\344\277\0018$\312\327\304\332?\2048T\344_V\340?\305h%\240\233\313\352?\204\304G\270=~\341\277\333\027\356:G\027\327?O!VZW\257\341?6\315f\027Z\206\354?\353\273\030\213\200\001\335\277]\013\257\326\324$\323?\366r]a\215\323\342?k\242\205\t\001\354\355?R\211{\302\376\257\326\277\310w\t\271\215\362\315?\3412\330H\232\277\343?\330s\230\216e\370\356?\016\365\361>\317\032\320\277\022\264\367\315\033B\305?\360`Z\350\275p\344?\026\366k\003g\250\357?\330z\230\031*\253\302\277\325\227\201@\177\244\270?\211\247-\324\347\344\344?\3656\341]\370\371\357?\202\022\271B\024\244\243\2770\306\b\201\020\355\231?n\000\244\205\275\032\345?\342 *K&\354\357?>\201\004\207\213\317\261?\314\201\310t\231\202\247\2779\001\317d\236\021\345?+\033\244\005\032\177\357?\245t\256\327\377\235\306?\234\\\224\227\314\332\275\277i&\220\247\245\311\344?\310~\333\331\030\264\356?l|\337\357`\b\322?\300\270E\255\236\315\307\277\340\006m\000\252C\344?\263\300&\\\200\215\355?MZ\307\351\366\213\330?`\261\210\244j3\320\277\251\223\031\036;\201\343?\252\025(Z\277\016\354?\310\323\242MS\306\336?d%3\334\261O\324\277\224\357.\003\235\204\342?\337zB\235K<\352?l0\224\377pR\342?\356?4\365a/\330\277\211\216\363C\301P\341?\025k\216\234\224\033\350?\355\373\307^\020\013\345?\0238\022\246\354\306\333\277\374\375\273||\322\337?\013\303\376E\363\262\345?\002\313@\257\351\204\347?9\026\030\335\232\013\337\277\016\233\b\315\210\244\334?\003.\024\017\227\t\343?\274X\"\036\232\270\351?~\214\221[\326\371\340\277\234\267\310\216#!\331?F\377\232\205p'\340?r\342[#\220\237\353?\237q\211J;;\342\277pe\231\272\307R\325?\312\325\310@3*\332?\354\362\315\031\0374\355?\332\013\215|=F\343\277\223\2412\350\317D\321?\f\276D-x\267\323?\210\235\246,\220q\356?\344\271co\300\027\344\277\n.\230\337\250\006\312?\261*\303)\330\023\312?\246cug0T\357?r\t\220%S\255\344\277yT\354\252\0166\301?j\253\262\300\352\325\270?\357o\003\277[\331\357?\364w\265n7\005\345\277t\000$\2509d\260?\220\266^\033\210/\206\277\245h\005\362\204\377\357?v+\235\032g\036\345\277P\020TW\373H}\277\3116 \367\206Y\276\277x\341&*:\306\357?\354\031W\007\227\370\344\277\204\334.Q\343\007\264\277\314m)\343I\311\314\277\275V\240O&.\357?\256vZ\0018\224\344\277\024br\001\273\377\302\277\344p\020\214\370\007\325\277\304\256b\013\0179\356?\200\317\bsu\362\343\277\021l4q\327\302\313\277\260\027\344Q\217l\333\277\323\036\311}\317\351\354?\224\236\177\3471\025\343\277\\.\207\312\221\031\322\277_\000A\227\253\277\340\277$y\226\271OD\353?\226\300 k\001\377\341\277\372\0247\212\271\033\326\277& \346\013\031\227\343\277v\006\250\034yM\351?L\333\227\332!\263\340\277\217\257\201\334\355\333\331\277`B\336\f\0264\346\277\206Z!\251'\013\347?\255\252\234n\342j\336\2777\361\347b\376N\335\277\032Pj\364\326\216\350\277\276+\306\212\030\204\344?\366CM<\304\024\333\277\3364\035nP5\340\277\220\271=\262U\240\352\277\302m\246\374\325\277\341?$r\321\005\335m\327\277\253-f\353\307\222\341\277\324FD\277fb\354\277p5)\226A\215\335?j\377\347\257\021\201\323\277\020\347P,\323\273\342\277\343\257~\205\313\317\355\277\340\276\375i\257B\327?*\006\3759/\264\316\277\366\356\213\025\374\254\343\277\211\034\016\005B\344\356\277\215\3768\354\271\262\320?\262n~\177\243\n\306\277\350\300\306@sc\344\277\263*\303\207\221\234\357\277\270=y#\351\341\303?\371\023w\237\256>\272\277K!\271^\030\335\344\277\004\320L=\224\366\357\277>\3243:;\214\250?N\304\344\272\2273\240\277\000\250\333\216\200\030\345\277\242(\\\243=\361\357\277\022\035S{h\270\256\277\264\320\337e\202F\244?\343\310\345\231\372\024\345\277\364\206\240\246\235\214\357\2776I\255\000Zh\305\277:#Kg\020B\274?\0320t\002\221\322\344\277\t]Fs\340\311\356\277_\bt\305^q\321\277L\025\353\345I\006\307?\230p\256\345\tR\344\2771\265\206\365J\253\355\277\260\347\362\370\207\372\327\277\375\215\222q\334\246\317?\016\214I\254\344\224\343\277ie\266\02444\354\277\250\211_m)<\336\277AA\362\275\201\364\323?(M\312\222U\235\342\277\350~\006\275\372h\352\277-P]\253\314\021\342\277\312\222\341)\016\332\327?\276S[\026?n\341\277\343\223\255\325\370N\350\277x\302\204{\235\317\344\277^H\206\267sx\333?Z\327\323Y)\013\340\277 \340^Js\354\345\277\352\317$\224YO\347\277p\022E\342\346\304\336?7\21659o\360\334\277\323\314\255W\207H\343\277\374U\206\223\214\211\351\277\323\346\342L\310\332\340?\334\371\247\3057t\331\277\002\247'R\025k\340\277k\247\030\206\221w\353\277\272xC\316\325 \342?\240\017S\347\021\254\325\277\301\244\344NR\271\332\277\177\274\205\270\246\023\355\277[%\323P\3170\343?\216\020\363\256E\243\321\277i\266\r\277\301L\324\277\343\341\335\343\376X\356\277z{\351\201\211\007\344?N\263\253\020\270\313\312\277d5W\250EG\313\277\b\302\240\200\317C\357\277\356\372\344\324\203\242\344?\354\301l\247\365\000\302\277T\314\272IPG\273\277/\267\350\025\\\321\357\277J\337\372\371\357\377\344?\205\245\212\253\374\000\262\277\200\266\"\251\242RT?\242\336\373b\376\377\357\277^PTA\267\036\345?\200\316V\215z\323J?^\222r\337\362\350\273?a\223\351J+\317\357\277\275\365f\332}\376\344?\355A<\211\252k\262?L_\213\235\254\226\313?\373\306\206st?\357\277\365\363\330\345\243\237\344?P%8r]5\302?\233GT\240Is\324?\316H\363\222\206R\356\277\244I\277VD\003\344?\370\233\376b\224\376\312?\220\203\022\246;\336\332?\036\022\270p$\013\355\277x\367\215\2461+\343?d\031\207?\242\273\321?V%\235\252\203|\340?\234\231e\251\036m\353\277#\333\217e\360\031\342?>Z!3\024\303\325?\b\022v]\273X\343?N\250CMH}\351\277<K\035\270\257\322\340?\232\344r)\233\211\331?\202\345\224\247<\373\345?WW\005|hA\347\277\376\221\362\255\177\262\336?\226\237r\347\363\003\335?\031nCn+\\\350?\256\306o()\300\344\277\271\032V^\rd\333?\237\361i9\337\023\340?\350\177Z2ot\352?\177\363]7\003\001\342\277hA\206\206\345\303\327?\345h\203\202\316u\341?\322\200\004;\310=\354?\225\026\335jP\030\336\277\333\267^\352\330\334\323?#\332\375\375\247\243\342?y\317\3279\342\262\355?oR\264\313\323\324\327\277G\201\002\222\027u\317?\355\b\250:\347\231\343?\fq\2550d\317\356?\242@\267\346?J\321\277\214_\006E\246\322\306?{E?\245\255U\344?\231[\307i\375\217\357?H\245\226F0\030\305\277S6V\271?\330\273?g\345\273\027\313\324\344?\000\025\226[o\362\357?\254\t\216(\316s\255\277\202\213*\201Ep\243??tI`\304\025\345?D*\235Z\224\365\357?\330\2366\246\000\321\251?\fs\212\021\361\t\241\277\013\370q\254\327\027\345?g\320}\005c\231\357?\177\346Y\02032\304?\362N\347\315\251\250\272\277\320\352M\313\376\332\344?\347`\362`\356\336\356?5\236\221j\363\331\320?\332\247\375Dj>\306\2779!\374?\357_\344?\2258g\243b\310\355?({\243m\210h\327?\276\325\256\271$\346\316\277\235\206*$\030\250\343?)M\300\271\376X\354?\210r\3727I\261\335?\236\"\311H\331\230\323\277=\353\376\340\235\265\342?\375\026\241\230\n\225\352?\221\3776_\273\320\341?\rp\354\207*\204\327\277\246\243\"\313S\213\341?W\b\031w\312\201\350?\362p\003\030\255\223\344?O\237\262\037U)\333\277X)\001\265\263,\340?\003>\315\030o%\346?\331I\335\346<\031\347?\361u\263Yy}\336\277\357\377\274 \247;\335?M\342|V\003\207\343?\204\016'\b\345Y\351?_V\334\231T\273\340\277(hg|\262\306\331?g\273\366\033W\256\340?Z\302\341D\355N\353?\021\315a\377\002\006\342\277\222*Zb\331\004\326?\\\022V4\320G\333?\004\3667\376~\362\354?\\\"Xj\355\032\343\277\216IM\030Q\001\322?\337\036\275\345\220\341\324?\313Z\021\230\266?\356?&\306\303\312\331\366\343\277d\231\"\252%\220\313?\330\0048\246\016z\314?\327\215\272\016\2622\357?q\001\366\0238\227\344\277^_\213\021p\313\302?\227\226\317Q\021\270\275?\257M\037\214\234\310\357?\276\307\231\341)\372\344\277\033+e\034S\235\263? \247\347\302\356\032\201?'\225\t\332\266\377\357?n\342\310\n\210\036\345\277pb\313\3540\224v?E\223\023x\266w\271\277\311r3\230\\\327\357?\033[\210\022\346\003\345\277X\024i\253\002\317\260\277\235#d\370hc\312\277\301\370\237&\006P\357?\316\224ik\223\252\344\277\376\002\224\024\222j\301\277\207Q\"a\037\336\323\277\037\206\204>Gk\356?m\252\212\212\232\023\344\277\360\372t\212\2569\312\277\2533\376\362EO\332\277f\232\361=\312+\355?\332\016\271\314\275@\343\277\024\"7\304G]\321\277\204}\035R\3708\340\2771\331C4H\225\353?u\224\3716r4\342\277.\221\227\237\353i\325\277U\310\204\003\351\031\343\2774{\025\307}\254\351?\240\211\035\"\330\361\340\277t\337Hu\2566\331\277L\033.\263\336\301\345\277\223?\321\020\035w\347?\006\331\204\316c\371\336\277\272B\243q:\270\334\277\213.\322\000\355(\350\277L\362\r\243\274\373\344?8\246\034R\261\262\333\277\207\302\315\037\032\344\337\277Z\2419)\351G\352\277\235\337a\337\303A\342?R\2039\266^\031\330\277\217\230h\316kX\341\277\237\233|g\177\030\354\277\005:\235\302\251\242\336?5\370\232\\(8\324\277B)$h\f\213\342\277~\231\352\324E\225\355\277<{Ovhf\330?\247\211\342\032\241\032\320\277\371\254>+\\\206\343\277\335gL\217\314\271\356\277\251U\251\234]\341\321?F\244dh\037\232\307\277\322%\321hmG\344\277\210|S\365\252\202\357\2772V\3163\370M\306?\022S9\350(q\275\277\005vF1\000\314\344\277\226\256\272\321\211\355\357\277\252\201\003\275W-\261?\206c\372\r~\254\246\277\236\331k\n\211\022\345\277\241\366\302V*\371\357\2772Op!\375\350\244\277jh\360\370\361\231\233?|\301.\2135\032\345\277\303\3757\325i\245\357\277\234{\024U\222\373\302\277\271<Np\242\016\271?P\313H\317\356\342\344\277m\204\347#B\363\356\277\370\025[p\"B\320\277\247d\324\177\004v\305?\376p\211\273Ym\344\277\350\372V\266\306\344\355\277R\267J\270\373\325\326\277<\323\225\253\262$\316?\021\272\361\021\325\272\343\277\022\217fk\036}\354\277\271\213\361\362\265%\335\277\315uv\245\272<\323?\360I][u\315\342\277<\364Z&z\300\352\277!C\205\243>\217\341\277\216\201I\025\271-\327?\021\034\352\262\376\247\341\277\254\017ZN\b\264\350\277\031\211\272\235@W\344\277n\311\270\273\222\331\332?\"\327\241\205\334M\340\277\372\356\245Y\345]\346\277\250\361\274\355\224\342\346\277\257]\"\362S5\336?\374\375\003\276.\206\335\277Lg\261\222\t\305\343\277]\377e\233\244)\351\277\343\267)\000|\233\340?\026~\242\301\221\030\332\277\020,pM4\361\340\277\233,\316T\244%\353\277\202\313\246\177\303\352\341?\032cL\024\034]\326\277\235\302\320\225\251\325\333\277\252\365\325\262\250\320\354\277TU\022M\230\004\343?\375B\036\355\357^\322\277\332\273\355\037\342u\325\277'I\270\341\267%\356\277\203:\223\256\261\345\343?.\002m\013\355S\314\277:eS\351+\254\315\277D!\371x\330 \357\277\240\335\341&p\213\344?1)<$y\225\303\277\342~\255\220\017\024\300\277\330\302hV\035\277\357\277\277\334cH\345\363\344?\3226\030D39\265\277\200\362\337Y\345_\222\277\240\360\335X\256\376\357\277\256\231\027x\331\035\345?\020\356\337\200$A\210\277IE\201{\340\005\267??\262\234\340\315\336\357\277O\275\037\217\317\b\345?\361ow\340\352c\256?;\230\2510\206/\311?0N\000\005\333_\357\2770\315\031P\006\265\344?&,z\257]\237\300?\317$\005R}H\323?\210\n\321xP\203\356\277\211 \346\253w#\344?\274\214\374\212*t\311?\220\375\305\226\261\277\331?\312\346\223 \300K\355\277\350\261\017\330\325U\343?W'\227\221\204\376\320?\370_+J\026\352\337?\026C\376g\313\274\353\277\020\371\203?\206N\342?^\226E\351A\020\325?\201\017\353x\243\332\342?g\346km\030\333\351\277\344\273\262\\\232\020\341?T\217\027\264)\343\330?\350\263\235\211\375\207\345?Z\032\246#D\254\347\277\t\004\321$\215?\337?j\026\"\312\323k\334?\"d\035\341\034\365\347?\342wZ\223\3216\345\277#\360b=\256\000\334?\364P\022{\265\237\337?\000\031[\243\304\032\352?@|4n\026\202\342\277\007{x\221Fn\330?\001|K\200\240:\341?\234\305\204%\215\362\353?\271\361\030[J,\337\277\365\334\366\337\375\222\324?\245\214)\377\000r\342?\322\264H\t\367v\355?\266\035\342\373i\367\330\277\337\3643OUz\320?\271\335*][r\343?\301p!\243{\243\356?\264\241\300~\017x\322\277\213Z\2546\na\310?R\034m\341\2628\344?\304V\276z\232t\357?\"\032\375\2369\203\307\277\347_/\212`\t\277?S\347^\340\267\302\344?\036\027B\275\343\347\357?,\225\206\317`\240\263\277\230\343\273\336-\350\251?z\031\300\240\316\016\345?\231\242-\202\377\373\357?\212\323g\203{\000\240?\372\f\211[[\037\225\277jp\326'\024\034\345?\215@H\315\261\260\357?\244\260\033 \177\304\301?l\312.\367\003t\267\277\361\271\206\336`\352\344?\022p\220A\333\006\357?\326:\260\324\336S\317?\r1\357N\035\255\304\277X\260n\007Iz\344?\266\310\037\203v\000\356?\240\211\255L\345B\326?[\324\332\325\212b\315\277\2467\237\004\033\315\343?\346\330\320O\222\240\354?\004\247\372\347r\231\334?,\227\201\377'\340\322\277\262Q\036r\333\344\342?!\177C`H\353\352?\330\0034\003XM\341?\344\250D\333\273\326\326\277@c\320 ?\304\341?t0u,\261\345\350?\226\336\fyY\032\344?\214\033\226l.\211\332\277 \374\275\003\243n\340?\357ij\270\324\225\346?K\207^\362b\253\346?\314\274\245^x\354\335\277\304\264\226O\004\320\335?\020|A\226\230\002\344?\374\227>p\314\370\350?Kd\327??{\340\277\237\036\236\247\323i\332?Q\214ZS\2533\341?\004\377\325\256\267\373\352?\003Gd\363\027\317\341\277\330)\350\350\327\264\326?Jv\350\033\333b\334?\240\313m\242$\256\354?i\335\256\177\320\355\342\277\263\276\321\370\037\274\322?K\2641\357\261\t\326?\t\376\225]\003\013\356?\315\203\316\224\021\324\343\277\030s\345\227\t\027\315?\234\300\242;\226\335\316?2k\001+C\016\357?\343\"\264T,\177\344\277\330\235\036\035\f_\304?*\340\177\202\265K\301?\303\206\n\256\336\264\357?\327\252%T\"\355\344\277\205\301\321n\223\324\266?\364\211f\203\3441\234?\025\n\264\345\344\374\357?\3259]\215\253\034\345\277\200<\206#\317\233\222?<\343\327\247\177\223\264\277k}C\367~\345\357?\301\322\2152:\r\345\277\362\260;%\031)\253\277.E\021\207\013\373\307\277\255\350.\257\362n\357?\311\243\346T\374\276\344\277ze\260\030\212\247\277\277\003\337Y\371f\262\322\277P\272\345\260\241\232\356?\362\372&[\3332\344\277\330\021\264\013\r\256\310\277\371\204E\363\201/\331\277\001\004\342W\005k\355?\252\331\\Iyj\343\277\320\205\036\343Z\237\320\277S\266Nz{a\337\277\232\000MV\247\343\353?8$\353\341+h\342\277\252\007\342,\031\266\324\277\267[8;\354\232\342\277]\377:'\027\t\352? B_\256\365.\341\2771\325\207\335\016\217\330\277Z\277\356\207\232M\345\277\340K\372s\334\340\347?\370\007\273\t\372\204\337\277Y\311\253\275\301\036\334\277/\201\232G\274\300\347\277\005;\n\225fq\345?\342M\332I\002N\334\277?\240\023!\222Z\337\277P\244\372\260\002\355\351\277\252\006\360_\371\301\342?\224\325<\030\233\302\330\277\241\237\330Km\034\341\277.\357\362Y\362\313\353\277J\256Y\366.\265\337?M\324\253PW\355\324\277\271\030\026Z\206X\342\277\002\242\267\215\366W\355\277\316y\366\361\324\207\331?\007\301\320$\246\331\320\277x\255\rI\345]\343\277zc\300\362q\214\356\2772\3128\000R\016\323?i\366J\000b'\311\277[`\345g~)\344\277\222\244\330N\314e\357\277\243\341*?\355\267\310?\220\005\273\200nP\300\277\314\237\377\\\362\270\344\277\200\350<@}\341\357\277|\"x\206\363\022\266?\3147\017tA#\255\277\241\314\3019\225\n\345\277r\t\310\313\023\376\357\277\340\202\372\3122/\226\277h\376\002\272\212H\215?\211\276\"ws\035\345\277\332\252\246\251:\273\357\277\356\205`\305\000\215\300\277#\027\307\016\330\330\265?N3!\314T\361\344\277\351]\275C\271\031\357\277\302M\277\334\273\"\316\277\234k\332m\271\343\303?\343\017\253\325\274\206\344\277\210\223\312bq\033\356\277\262X\317\241H\257\325\277\220`Y\313\261\237\314?\217\224\000\216\351\336\343\277\265\3452\221Y\303\354\277\241\226\357d\203\f\334\277\377|-\205#\203\322?Q\266&\230\317\373\342\277&\0037Dt\025\353\277\200\301\255\013\t\013\341\277\270\267t\3464\177\326?d:vj\024\340\341\277\275S\361\345\303\026\351\277\207\001A\031\371\334\343\277&^\030\027*8\332?\310\242\256i\006\217\340\277\326\217\311\343;\315\346\277\034\016\235A\250s\346\277\326\034\234V\350\242\335?\210\0053\030&\031\336\277\3627\362\355\256?\344\277s_?\255]\307\350\277\201\252M\033\237Z\340?\\5TDv\272\332\277\346\222\344\234\272u\341\277y\224\314O(\321\352\277\251\251w\001\001\263\341?\311<\031\317\n\f\327\277\2321%sa\357\334\277xs%\235\363\212\354\277Gz\216\213\226\326\342?\200\226o\t\337\030\323\277\221\243'\330\374\234\326\2773)\266\254\231\357\355\277\373\347\277\347\371\301\343?\267\244\354\266v\331\315\277\316M\2535#\007\320\277\375e\344\224\362\372\356\277\373\212c\347lr\344?\364p\232<$(\305\277\210\007\371&\363\202\302\277\315\220\314\320\340\251\357\277\267\273\245-\341\345\344?V\231\303\353io\270\277&\027\254\322\234\001\243\277\215\211R\213Z\372\357\277~y\266Q\376\032\345?\264Gh\316\233\026\231\277\256\356x\276\242 \262?\261\007\315\263o\353\357\277\241G0\342%\021\345?axC\237\243\355\247?\341\237\344?\000\306\306?\231\350'\312L}\357\277\375-\276=u\310\344?\030X\360\355\231\017\276?B\343:\340\337\033\322?H$%Z:\261\356\277\335\351~;\305A\344?\276\370W\267Z\347\307?\035\326\000n\272\236\330?\253fH'\231\211\355\277(\252*\244\247~\343?\306\241\256\366\314?\320?\371\334pl#\330\336?\032\366\330\024\333\t\354\277X\364\204\203b\201\342?\224\207!\212s[\324?\306\313\251\312\304Z\342?\241(#\337x6\352\277\262\025\022`\351L\341?\217\246\313\354_:\330?\207T;\016\267\022\345?t\"\241\304\344\024\350\277\367A\227\332\250\311\337?\302\242\006\035\006\321\333?L;&p\314\213\347?=\236\325Fz\253\345\277\271t.\245\253\232\334?`\323\301\262\261\024\337?mY\tf\244\276\351?u\322O3k\001\343\277\247\271\370MZ\026\331?j!/\347\322\375\340?\310f\225\355\257\244\353?\tFk-\252\036\340\277k\205\337\2152G\325?Z\257\220\022\235>\342?$m,\035E8\355?q\304\242\361\245\027\332\2770m\353\\\2218\321?\300fKj\372H\343?FT\027\t\260t\356?<\036\355\226!\244\323\277\030\204$\031\"\355\311?\251\216\353W\320\031\344?\314\021\353\312@V\357?\277\262\266\316\013\354\311\277e\334YZ\312\033\301?\240\006\026\342\257\256\344?\336\016D\201V\332\357?z\316I\037\001\205\270\277=Z!\251\322.\260?\273[\352\356\334\005\345?\3673\b'g\377\357?\300\177Z\215\321\271\210?\000+\371$\256Q\200\277\016\030\315pS\036\345?\266\311\313*\004\305\357?\332F\2646=\252\276?\267.\252f(=\264\277\rW*n\312\367\344?s\342\246\270\333+\357?\250\224\004)\343\360\314?\030b\022\233\335\031\303\277\275v&\333\264\222\344?\330`\243\262\2665\356?\\\037\3351)\033\325?B\244\031#,\334\313\277{\202\263B@\360\343?<\207\321]s\345\354?~@\272\273\352~\333?\365\220kg\257%\322\277\346I\nCQ\022\343?\211\303\344\323\374>\353?,6\322LS\310\340?L\024\257F&'\326\277\017\201\002\350}\373\341?\027\323\336R?G\351?\262\227x\360 \237\343?\323a\322\243\207\346\331\277\233l\"\364\005\257\340?\335\235\247\215\031\004\347?\236\365\213+f;\346?4D\244\225\245X\335\277\226\003\323^\222a\336?\022h`)K|\344?4\004\203|Y\225\350?\026;LW\2349\340\277\263A\177\261w\n\333?\021\213\256\233`\267\341?S\225Z8\367\245\352?c\006FS\177\226\341\277\371\035\005\271\262b\327?\001K\027L9{\335?\006\3555w\026g\354?\242O\302\374\352\276\342\2770\371\250\357*u\323?\360\230\217b\277/\327?\f\016it{\323\355?\266\306\202\024k\257\343\277\210:\005\324/\233\316?+\374\200\245\032\237\320?\306s\034+\347\346\356?\3577\320+2e\344\277(.\374\305\274\360\305?\030\f()\301\271\303?\035\353\367\000$\236\357?L\240\243\000\"\336\344\277\214\322]\r\255\t\272?lh\203\305\324\351\247?)e\013Y\017\367\357??\327?\317\321\030\345\277pu\255-\321\220\237?\257id\007\261Z\257\277\243\177f\362\237\360\357?|^b\206\222\024\345\277\202\022\217\314\235\261\244\277\3528\325\242k\220\305\277I\222^\377\350\212\357?&\372\200\321p\321\344\277\215\210\307z\364v\274\277#\210j\222\353\204\321\277\344\321J\354\031\307\356?^.\376\3624P\344\277\3208&<\030 \307\277/\352\017p^\r\330\277\224\\a\326z\247\355?\361`\305n`\222\343\277z\304\n\031\272\277\317\277\004\355\322\\\021N\336\277:HA\275e/\354?\254\257D\214)\232\342\277Y\356\251#S\000\324\277\r\034!\252.\032\342\277\210\232w\203<c\352?2\031+\275tj\341\277\311\032\222\340\036\345\327\277\354E\244\177T\327\344\2779O\322\333[H\350?\r*\232\374\313\006\340\277\177\217\367\274\242\202\333\277\234\032\375\231NV\347\277y\325\200J\013\345\345?\364u\020\201\250\346\334\277\025L\201\325\025\316\336\277\024''\332\252\217\351\277\365\\\271ij@\343?d\302\2429\202i\331\277\227f\334\n\322\336\340\277\367\\-\315\306|\353\277\312\342\303\251[b\340?@\246\260y\215\240\325\2772a\333\304E$\342\277ZF\307v\343\027\355\277\226\253\235\227\331\246\332?,C\033\273\024\227\321\2771\244\b?\2333\343\277\nNku6\\\356\277$\357m\273z9\324?F\325\257\330E\262\312\277N\200\016\020\251\t\344\277p!\264L\370E\357\277\252\203\202\013\216\037\313?\020\263\230\007\277\346\301\277O \201\255\360\243\344\277\300\337w\253o\322\357\277\227\002\220\332z\366\272?\255*\344\000\243\313\261\277\230e\260\334\245\000\345\277\003\244\357\213\371\377\357\277\340\234\325\242\241Rd\277\200\367\0313y\323Z?\207\315\216\017\264\036\345\277+$\262\025\016\316\357\277\3120\263\365\2779\274\2771\240\205\261\376\240\262?\253\344\255\235\301\375\344\277\266\232\3602B=\357\277\2521\351\355[\276\313\277A\265\346\227\216O\302?cG\263\3170\236\344\277/\037=\324EO\356\277Rt\030z\212\206\324\277\200\3024x\376\027\313?#W(\272\036\001\344\277\242\226\007\350\336\006\355\277\264\230@B\254\360\332\277Cy\316\331\315\307\321?\223?\017\353_(\343\277\345\370\324\024\341g\353\277\266\352\354X8\205\340\277LJ\373\016\222\316\325?c)&\364z\026\342\277.q\336N\"w\351\277j\244\247s\322`\343\277\335|\020\377H\224\331?\371+\"\342\240\316\340\277C\f&kl:\347\277\303.o\003\236\002\346\277\327\302\222\333\261\r\335?\332W\267nG\251\336\277\353<\t\333k\270\344\277DV\251\013\301b\350\277\273\205\345\2727\030\340?H\313\245\f\326Y\333\277\374\266\323\303\233\370\341\277\207\353\367l%z\352\277q\033\270\224\223y\341?\247v\027\234\315\270\327\277\222ak[_\006\336\277{<\346\b\216B\354\277\215\230\bb\316\246\342?o\227\345~\001\321\323\277\032\004`\031\366\301\327\277\235\236?^\251\266\355\277e\007\001\213e\234\343?\222a\357^0\\\317\277x\317\342\330\2556\321\277\364\237\212f!\322\356\277p\344\301q|W\344?-\312\221\377\320\270\306\277\222:\2756\030\360\304\277\325\"U\205\250\221\357\277\345\350\326\373\344\325\344?Y$\211)S\243\273\277(e\225\202|\321\254\277\253\204\273b\003\363\357\277\252\\\025\023&\026\345?\306\302\276\030$\005\243\277\316\202\311|_s\252?\362\346\305\223\017\365\357\277\317~}\n\200\027\345??\377\204.\033u\241?\366\324\320\372TZ\304?\322W\277\374\306\227\357\277\007h\003\332\356\331\344?\266\211\216_\243\335\272?j\265=\236\215\355\320?\323|n\343?\334\356\277\305\270\225**^\344?f\030\302KJX\306?&\026\nfq{\327?\230d\371\260\251\304\355\277\0053>2\243\245\343?\354;_\316\032\377\316?\370\266\027\214H\303\335?\035\311 mFT\354\2775\231\276f\200\262\342?ai\005\037\272\244\323?Z\211\033_+\331\341?\214\325D\006a\217\352\277\274Y\177\023\227\207\341?\\c\373\272M\217\327?\374\303HBt\233\344?^J1\203@{\350\277\243s\362\345b(\340?(\0277v\2313\333?\232\364\263\007D \347?\027&\344D\030\036\346\277\350\242A\023\3671\335?\272\275 3\300\206\336?P>\234(\027`\351?pPE\207\365~\343\277\r\345\301\345\020\274\331?\267\302\327qk\277\340?\234Pi\3517T\353?O\005\375W\252\245\340\277S\277C\371e\371\325?n\277\317\017\201\t\342?8\001\317]\322\366\354?T\304R\204l5\333\277\177\323i\005.\365\321?\325W'H\310\035\343?F\362T\313\005C\356?\214\330\025\351Y\316\324\277\272\230\022\232\310v\313?\207\020\270\361\b\371\343?>\370e6\3634\357?\006\000\037\267lR\314\277X8\212\300G\261\302?\225\031\020\000\265\230\344?\375\025\177\356\310\311\357?^\334Z\374Qg\275\277y\221\325\007\bh\263?\235\023\207\"\360\372\344?\257\204\013\367\312\377\357?0\306\"\277>!}\277\240Z\375!\3109s?\2673!Q\225\036\345?#\237\3273X\326\357?k\032\273}\230\310\271?\004\002\347\244d\004\261\277t&\2626:\003\345?\260\277\253I\354M\357?h\306\362c-\213\312?\340\253](\321\204\301\277\373\022\020n0\251\344?\205au-\036h\356?`\177\302\372o\361\323?\200\016\271i-S\312\277\351\202\244\216\204\021\344?\227\314Jf\233'\355?\026\204PR\313a\332?\n\322|\022\201i\321\277\017^1\013\373=\343?\244\267n\020 \220\353?\265\274\253\304\271A\340?o\210\206Uzu\325\277\b\035 \354\n1\342?\357<(\271k\246\351?p\277\213\032\017\"\343?p\362\314\030pA\331\277\342o\025u\326\355\340?\243Y\25343p\347?\361-\263\037Q\311\345?\225eg\354\016\302\334\277\307\212q\227C\360\336?\203\346R\230\017\364\344?N,\320\213\225/\350?\200\021\364\036\344\354\337\277\235\277%w\217\250\333?2\243\363\213j9\342?\345\237\345\365\263M\352?\256E6t>\\\341\277\301f\016qY\016\330?\325:\376Y\320\220\336?!R\206.[\035\354?\255J\311LA\216\342\277i\300P\215`,\324?"
	.size	.Lstrglobal_fkappsraycasterrcrots_mrcrot_get___l9_n3677, 11521

	.type	.Lstrglobal_fkappsraycasterrcmap_mget_map_l1_n3691,@object # @strglobal_fkappsraycasterrcmap_mget_map_l1_n3691
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsraycasterrcmap_mget_map_l1_n3691:
	.asciz	"#########################                      ##                      ##                      ##       #              ##                      ##                      ##              #       ##              #       ##              #       ##           #######    ##              #       ##              #       ##              #       ##                      ##                      ##                      ##                      ##                      ##    #############     ##                      ##                      ##                      #########################"
	.size	.Lstrglobal_fkappsraycasterrcmap_mget_map_l1_n3691, 577

	.type	.Lstrglobal_ffontfont_mget_font_l1_n3696,@object # @strglobal_ffontfont_mget_font_l1_n3696
	.align	16
.Lstrglobal_ffontfont_mget_font_l1_n3696:
	.asciz	"....................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................#.......#.......#.......#.......#...............#..............#.#.....#.#.....................................................#.#.....#.#...#######...#.#...#######...#.#.....#.#..............#......####...#.#......###......#.#...####......#.....................##..#...##.#......#......#.##...#..##....................##.....#.#......#......#.#....#...##..#...#....###.#.............#.......#........................................................#......#......#.......#.......#........#........#.............#........#........#.......#.......#......#......#................#....#..#..#..#.#.#....###....#.#.#..#..#..#....#...............#.......#.......#....#######....#.......#.......#...............................................##......##.......#......#............................#######............................................................................##......##.................#......#......#......#......#......#......#.................###....#...#...#...#...#.#.#...#...#...#...#....###..........         ..##... ...#... ...#... ...#... ...#... ..###..        ...###....#...#.......#......#......#......#......#####............###....#...#.......#.....##........#...#...#....###..............##.....#.#....#..#....#####......#.......#......###...........#####...#.......#.......####........#...#...#....###.............###....#...#...#.......####....#...#...#...#....###............#####.......#......#......#......#.......#.......#...............###....#...#...#...#....###....#...#...#...#....###.............###....#...#...#...#....####.......#...#...#....###......................##......##..............##......##..............................##......##..............##......##.......#......#........#......#......#......#........#........#........#...........................#######.........#######..........................#........#........#........#......#......#......#................###....#...#.......#......#......#...............#..............###....#...#...#.###...#.#.#...#.###...#........###.............###....#...#...#...#...#####...#...#...#...#...#...#...........####....#...#...#...#...####....#...#...#...#...####.............###....#...#...#.......#.......#.......#...#....###............####....#...#...#...#...#...#...#...#...#...#...####............#####...#.......#.......####....#.......#.......#####...........#####...#.......#.......#####...#.......#.......#................###....#...#...#.......#.###...#...#...#...#....###............#...#...#...#...#...#...#####...#...#...#...#...#...#............###......#.......#.......#.......#.......#......###..............###......#.......#.......#....#..#....#..#.....##.............#...#...#...#...#..#....###.....#..#....#...#...#...#............#.......#.......#.......#.......#.......#.......####..........#.....#.##...##.#.#.#.#.#..#..#.#.....#.#.....#.#.....#..........#...#...##..#...#.#.#...#.#.#...#..##...#...#...#...#............###....#...#...#...#...#...#...#...#...#...#....###.............###.....#..#....#..#....###.....#.......#.......#...............###....#...#...#...#...#...#...#...#...#...#....###.......##...####....#...#...#...#...####....#.#.....#..#....#...#............###....#...#...#........###........#...#...#....###............#####.....#.......#.......#.......#.......#.......#.............#...#...#...#...#...#...#...#...#...#...#...#....###............#...#...#...#...#...#....#.#.....#.#......#.......#............#.....#.#.....#.#.....#..#.#.#...#.#.#....#.#.....#.#............#...#...#...#....#.#......#......#.#....#...#...#...#...........#...#...#...#....#.#......#.......#.......#.......#.............#####.......#......#......#......#......#.......#####............###.....#.......#.......#.......#.......#.......###...........#........#........#........#........#........#........#...........###.......#.......#.......#.......#.......#.....###..............#......#.#....#...#..................................................................................................#######...#........#..............................................................###........#....####...#...#...#...#....###.#...........#.......#.......###.....#..#....#..#....#..#...#.##.............................###....#.......#.......#........###................#.......#.....###....#..#....#..#....#..#.....##.#...........................###....#...#...#####...#........###..............##.....#..#....#......###......#.......#.......#...............................###.#..#...#...#...#....####.......#....###....#.......#.......#.##....##..#...#...#...#...#...#...#.....................#...............#.......#.......#.......#.......................#...............#.......#.......#.......#.....##......#.......#.......#..#....#.#.....##......#.#.....#..#.............##.......#.......#.......#.......#.......#.......#........................... .##.##..#..#..#.#..#..#.#.....#.#.....#..........................#.##.....#..#....#..#....#..#....#..#............................###....#...#...#...#...#...#....###............................#.##.....#..#....#..#....###.....#.......#.......................##.#...#..#....#..#.....###.......#.......#....................#.##....##......#.......#.......#................................###....#........##........#....###.......................#......###......#.......#.......#.......#.............................#..#....#..#....#..#....#..#.....##.#...........................#...#...#...#...#...#....#.#......#............................#.....#.#.....#.#..#..#.#.#.#.#..#...#...........................#...#....#.#......#......#.#....#...#............................#..#....#..#....#..#.....###.......#....###....................####.......#......#......#......####..............##.....#.......#......#........#.......#........##..............#.......#.......#.......#.......#.......#.......#.............##........#.......#........#......#.......#.....##..............................##.....#..#..#.....##........................................................................................."
	.size	.Lstrglobal_ffontfont_mget_font_l1_n3696, 8193

	.type	.Lstrglobal_ffontfont_mget_colors_l3_n3699,@object # @strglobal_ffontfont_mget_colors_l3_n3699
	.section	.rodata,"a",@progbits
	.align	16
.Lstrglobal_ffontfont_mget_colors_l3_n3699:
	.asciz	"\000\000\000\000\000\252\000\252\000\000\252\252\252\000\000\252\000\252\252U\000\252\252\252UUUUU\377U\377UU\377\377\377UU\377U\377\377\377U\377\377\377"
	.size	.Lstrglobal_ffontfont_mget_colors_l3_n3699, 49

	.type	.Lstrglobal_fframebuffer_mFramebuffer$drawchar_l70_n4054,@object # @"strglobal_fframebuffer_mFramebuffer$drawchar_l70_n4054"
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fframebuffer_mFramebuffer$drawchar_l70_n4054:
	.asciz	"#"
	.size	.Lstrglobal_fframebuffer_mFramebuffer$drawchar_l70_n4054, 2

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l8_n4188,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l8_n4188
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l8_n4188:
	.asciz	"1.234*1000="
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l8_n4188, 12

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l10_n4200,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l10_n4200
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l10_n4200:
	.asciz	"\nex="
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l10_n4200, 5

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l12_n4214,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l12_n4214
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l12_n4214:
	.asciz	" "
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l12_n4214, 2

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l14_n4228,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l14_n4228
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l14_n4228:
	.asciz	" "
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l14_n4228, 2

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l16_n4242,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l16_n4242
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l16_n4242:
	.asciz	" "
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l16_n4242, 2

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l18_n4256,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l18_n4256
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l18_n4256:
	.asciz	" "
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l18_n4256, 2

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l20_n4270,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l20_n4270
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l20_n4270:
	.asciz	" "
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l20_n4270, 2

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l22_n4284,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l22_n4284
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l22_n4284:
	.asciz	" "
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l22_n4284, 2

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l24_n4298,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l24_n4298
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l24_n4298:
	.asciz	" "
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l24_n4298, 2

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l26_n4312,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l26_n4312
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l26_n4312:
	.asciz	" "
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l26_n4312, 2

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l28_n4317,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l28_n4317
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l28_n4317:
	.asciz	"\n ex via RCFloatBox="
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l28_n4317, 21

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l31_n4332,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l31_n4332
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l31_n4332:
	.asciz	"\nsin(10)="
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l31_n4332, 10

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l33_n4347,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l33_n4347
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l33_n4347:
	.asciz	"\nsin(20)="
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l33_n4347, 10

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l35_n4362,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l35_n4362
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l35_n4362:
	.asciz	"\nsin(30)="
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l35_n4362, 10

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l37_n4377,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l37_n4377
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l37_n4377:
	.asciz	"\nsin(90)="
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l37_n4377, 10

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l40_n4392,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l40_n4392
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l40_n4392:
	.asciz	"\ncos(10)="
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l40_n4392, 10

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l42_n4407,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l42_n4407
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l42_n4407:
	.asciz	"\ncos(20)="
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l42_n4407, 10

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l44_n4422,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l44_n4422
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l44_n4422:
	.asciz	"\ncos(30)="
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l44_n4422, 10

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l46_n4437,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l46_n4437
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l46_n4437:
	.asciz	"\ncos(90)="
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l46_n4437, 10

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l49_n4452,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l49_n4452
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l49_n4452:
	.asciz	"\nsqrt(4)="
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l49_n4452, 10

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l51_n4464,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l51_n4464
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l51_n4464:
	.asciz	"\nsqrt(100)="
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l51_n4464, 12

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l53_n4476,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l53_n4476
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l53_n4476:
	.asciz	"\nsqrt(36)="
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l53_n4476, 11

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l56_n4488,@object # @strglobal_fkappsraycasterraycaster_mrc_mtest_l56_n4488
.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l56_n4488:
	.asciz	"\nsqrt(5)*1000="
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_mtest_l56_n4488, 15

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_run_l66_n4517,@object # @strglobal_fkappsraycasterraycaster_mrc_run_l66_n4517
.Lstrglobal_fkappsraycasterraycaster_mrc_run_l66_n4517:
	.asciz	" "
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_run_l66_n4517, 2

	.type	.Lstrglobal_fkappsraycasterraycaster_mrc_run_l91_n4568,@object # @strglobal_fkappsraycasterraycaster_mrc_run_l91_n4568
.Lstrglobal_fkappsraycasterraycaster_mrc_run_l91_n4568:
	.asciz	"Newbf sz="
	.size	.Lstrglobal_fkappsraycasterraycaster_mrc_run_l91_n4568, 10

	.type	.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l45_n5020,@object # @strglobal_fkappsdrawbmp_mkc_draw_bmp_l45_n5020
.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l45_n5020:
	.asciz	"Invalid module"
	.size	.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l45_n5020, 15

	.type	.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l51_n5034,@object # @strglobal_fkappsdrawbmp_mkc_draw_bmp_l51_n5034
.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l51_n5034:
	.asciz	"B"
	.size	.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l51_n5034, 2

	.type	.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l52_n5040,@object # @strglobal_fkappsdrawbmp_mkc_draw_bmp_l52_n5040
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l52_n5040:
	.asciz	"Not a BMP ([0]!=B)"
	.size	.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l52_n5040, 19

	.type	.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l56_n5049,@object # @strglobal_fkappsdrawbmp_mkc_draw_bmp_l56_n5049
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l56_n5049:
	.asciz	"M"
	.size	.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l56_n5049, 2

	.type	.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l57_n5055,@object # @strglobal_fkappsdrawbmp_mkc_draw_bmp_l57_n5055
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l57_n5055:
	.asciz	"Not a BMP ([0]!=M)"
	.size	.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l57_n5055, 19

	.type	.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l62_n5066,@object # @strglobal_fkappsdrawbmp_mkc_draw_bmp_l62_n5066
	.align	16
.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l62_n5066:
	.asciz	"Don't know how to handle compressed BMPs"
	.size	.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l62_n5066, 41

	.type	.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l67_n5078,@object # @strglobal_fkappsdrawbmp_mkc_draw_bmp_l67_n5078
	.align	16
.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l67_n5078:
	.asciz	"Unknown depth (must == 24)"
	.size	.Lstrglobal_fkappsdrawbmp_mkc_draw_bmp_l67_n5078, 27

	.type	.Lstrglobal_fkappsconsole_mconsole_disp_line_l26_n5170,@object # @strglobal_fkappsconsole_mconsole_disp_line_l26_n5170
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkappsconsole_mconsole_disp_line_l26_n5170:
	.asciz	"\nk>"
	.size	.Lstrglobal_fkappsconsole_mconsole_disp_line_l26_n5170, 4

	.type	.Lstrglobal_fkappsconsole_mconsole_submit_l36_n5187,@object # @strglobal_fkappsconsole_mconsole_submit_l36_n5187
.Lstrglobal_fkappsconsole_mconsole_submit_l36_n5187:
	.asciz	" "
	.size	.Lstrglobal_fkappsconsole_mconsole_submit_l36_n5187, 2

	.type	.Lstrglobal_fkappsconsole_mconsole_submit_l38_n5194,@object # @strglobal_fkappsconsole_mconsole_submit_l38_n5194
.Lstrglobal_fkappsconsole_mconsole_submit_l38_n5194:
	.zero	1
	.size	.Lstrglobal_fkappsconsole_mconsole_submit_l38_n5194, 1

	.type	.Lstrglobal_fkappsconsole_mconsole_submit_l40_n5202,@object # @strglobal_fkappsconsole_mconsole_submit_l40_n5202
.Lstrglobal_fkappsconsole_mconsole_submit_l40_n5202:
	.asciz	" "
	.size	.Lstrglobal_fkappsconsole_mconsole_submit_l40_n5202, 2

	.type	.Lstrglobal_fkappsconsole_mconsole_submit_l51_n5246,@object # @strglobal_fkappsconsole_mconsole_submit_l51_n5246
.Lstrglobal_fkappsconsole_mconsole_submit_l51_n5246:
	.asciz	"Invalid Command"
	.size	.Lstrglobal_fkappsconsole_mconsole_submit_l51_n5246, 16

	.type	.Lstrglobal_fkappsconsole_mkc_help_l68_n5282,@object # @strglobal_fkappsconsole_mkc_help_l68_n5282
.Lstrglobal_fkappsconsole_mkc_help_l68_n5282:
	.asciz	"Commands: "
	.size	.Lstrglobal_fkappsconsole_mkc_help_l68_n5282, 11

	.type	.Lstrglobal_fkappsconsole_mkc_help_l71_n5295,@object # @strglobal_fkappsconsole_mkc_help_l71_n5295
.Lstrglobal_fkappsconsole_mkc_help_l71_n5295:
	.asciz	" - "
	.size	.Lstrglobal_fkappsconsole_mkc_help_l71_n5295, 4

	.type	.Lstrglobal_fkappsconsole_mkc_help_l73_n5305,@object # @strglobal_fkappsconsole_mkc_help_l73_n5305
.Lstrglobal_fkappsconsole_mkc_help_l73_n5305:
	.asciz	": "
	.size	.Lstrglobal_fkappsconsole_mkc_help_l73_n5305, 3

	.type	.Lstrglobal_fkappsconsole_mkc_help_l75_n5315,@object # @strglobal_fkappsconsole_mkc_help_l75_n5315
.Lstrglobal_fkappsconsole_mkc_help_l75_n5315:
	.asciz	"\n"
	.size	.Lstrglobal_fkappsconsole_mkc_help_l75_n5315, 2

	.type	.Lstrglobal_fkappsconsole_mkc_dumpargs_l81_n5329,@object # @strglobal_fkappsconsole_mkc_dumpargs_l81_n5329
.Lstrglobal_fkappsconsole_mkc_dumpargs_l81_n5329:
	.asciz	"Args: "
	.size	.Lstrglobal_fkappsconsole_mkc_dumpargs_l81_n5329, 7

	.type	.Lstrglobal_fkappsconsole_mkc_mem_l86_n5338,@object # @strglobal_fkappsconsole_mkc_mem_l86_n5338
.Lstrglobal_fkappsconsole_mkc_mem_l86_n5338:
	.asciz	"mm_head: "
	.size	.Lstrglobal_fkappsconsole_mkc_mem_l86_n5338, 10

	.type	.Lstrglobal_fkappsconsole_mkc_mem_l88_n5347,@object # @strglobal_fkappsconsole_mkc_mem_l88_n5347
.Lstrglobal_fkappsconsole_mkc_mem_l88_n5347:
	.asciz	" mm_pos: "
	.size	.Lstrglobal_fkappsconsole_mkc_mem_l88_n5347, 10

	.type	.Lstrglobal_fkappsconsole_mkc_mem_l90_n5356,@object # @strglobal_fkappsconsole_mkc_mem_l90_n5356
.Lstrglobal_fkappsconsole_mkc_mem_l90_n5356:
	.asciz	"\nUsed: "
	.size	.Lstrglobal_fkappsconsole_mkc_mem_l90_n5356, 8

	.type	.Lstrglobal_fkappsconsole_mkc_mem_l92_n5368,@object # @strglobal_fkappsconsole_mkc_mem_l92_n5368
.Lstrglobal_fkappsconsole_mkc_mem_l92_n5368:
	.asciz	"\n"
	.size	.Lstrglobal_fkappsconsole_mkc_mem_l92_n5368, 2

	.type	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l101_n5384,@object # @strglobal_fkappsconsole_mkc_dump_parseed_multiboot_l101_n5384
.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l101_n5384:
	.asciz	"cmdline="
	.size	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l101_n5384, 9

	.type	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l103_n5394,@object # @strglobal_fkappsconsole_mkc_dump_parseed_multiboot_l103_n5394
.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l103_n5394:
	.asciz	"bootloader="
	.size	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l103_n5394, 12

	.type	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l105_n5404,@object # @strglobal_fkappsconsole_mkc_dump_parseed_multiboot_l105_n5404
.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l105_n5404:
	.asciz	"boot_device="
	.size	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l105_n5404, 13

	.type	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l107_n5415,@object # @strglobal_fkappsconsole_mkc_dump_parseed_multiboot_l107_n5415
.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l107_n5415:
	.asciz	"\nmodule count="
	.size	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l107_n5415, 15

	.type	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l109_n5425,@object # @strglobal_fkappsconsole_mkc_dump_parseed_multiboot_l109_n5425
.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l109_n5425:
	.zero	1
	.size	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l109_n5425, 1

	.type	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l111_n5434,@object # @strglobal_fkappsconsole_mkc_dump_parseed_multiboot_l111_n5434
.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l111_n5434:
	.asciz	"Text Mode"
	.size	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l111_n5434, 10

	.type	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l113_n5439,@object # @strglobal_fkappsconsole_mkc_dump_parseed_multiboot_l113_n5439
.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l113_n5439:
	.asciz	"Video Mode"
	.size	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l113_n5439, 11

	.type	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l115_n5444,@object # @strglobal_fkappsconsole_mkc_dump_parseed_multiboot_l115_n5444
.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l115_n5444:
	.asciz	"addr="
	.size	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l115_n5444, 6

	.type	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l117_n5454,@object # @strglobal_fkappsconsole_mkc_dump_parseed_multiboot_l117_n5454
.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l117_n5454:
	.asciz	"\n w="
	.size	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l117_n5454, 5

	.type	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l119_n5464,@object # @strglobal_fkappsconsole_mkc_dump_parseed_multiboot_l119_n5464
.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l119_n5464:
	.asciz	"\n h="
	.size	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l119_n5464, 5

	.type	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l121_n5474,@object # @strglobal_fkappsconsole_mkc_dump_parseed_multiboot_l121_n5474
.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l121_n5474:
	.asciz	"\n d="
	.size	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l121_n5474, 5

	.type	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l123_n5484,@object # @strglobal_fkappsconsole_mkc_dump_parseed_multiboot_l123_n5484
.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l123_n5484:
	.asciz	"\n p="
	.size	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l123_n5484, 5

	.type	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l125_n5494,@object # @strglobal_fkappsconsole_mkc_dump_parseed_multiboot_l125_n5494
.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l125_n5494:
	.zero	1
	.size	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l125_n5494, 1

	.type	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l127_n5499,@object # @strglobal_fkappsconsole_mkc_dump_parseed_multiboot_l127_n5499
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l127_n5499:
	.asciz	"mbinfo reports invalid"
	.size	.Lstrglobal_fkappsconsole_mkc_dump_parseed_multiboot_l127_n5499, 23

	.type	.Lstrglobal_fkappsconsole_mkc_fault_l132_n5505,@object # @strglobal_fkappsconsole_mkc_fault_l132_n5505
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkappsconsole_mkc_fault_l132_n5505:
	.asciz	"dbz"
	.size	.Lstrglobal_fkappsconsole_mkc_fault_l132_n5505, 4

	.type	.Lstrglobal_fkappsconsole_mkc_fault_l132_n5515,@object # @strglobal_fkappsconsole_mkc_fault_l132_n5515
.Lstrglobal_fkappsconsole_mkc_fault_l132_n5515:
	.asciz	"pw"
	.size	.Lstrglobal_fkappsconsole_mkc_fault_l132_n5515, 3

	.type	.Lstrglobal_fkappsconsole_mkc_fault_l132_n5529,@object # @strglobal_fkappsconsole_mkc_fault_l132_n5529
.Lstrglobal_fkappsconsole_mkc_fault_l132_n5529:
	.asciz	"pr"
	.size	.Lstrglobal_fkappsconsole_mkc_fault_l132_n5529, 3

	.type	.Lstrglobal_fkappsconsole_mkc_fault_l139_n5543,@object # @strglobal_fkappsconsole_mkc_fault_l139_n5543
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsconsole_mkc_fault_l139_n5543:
	.asciz	"Pass dbz, pw or pr"
	.size	.Lstrglobal_fkappsconsole_mkc_fault_l139_n5543, 19

	.type	.Lstrglobal_fkappsconsole_mkc_hexnum_l162_n5587,@object # @strglobal_fkappsconsole_mkc_hexnum_l162_n5587
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkappsconsole_mkc_hexnum_l162_n5587:
	.asciz	"Read: "
	.size	.Lstrglobal_fkappsconsole_mkc_hexnum_l162_n5587, 7

	.type	.Lstrglobal_fkappsconsole_mkc_shutdown_l168_n5600,@object # @strglobal_fkappsconsole_mkc_shutdown_l168_n5600
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsconsole_mkc_shutdown_l168_n5600:
	.asciz	"Shutting Down..."
	.size	.Lstrglobal_fkappsconsole_mkc_shutdown_l168_n5600, 17

	.type	.Lstrglobal_fkappsconsole_mkc_getpicticks_l173_n5610,@object # @strglobal_fkappsconsole_mkc_getpicticks_l173_n5610
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkappsconsole_mkc_getpicticks_l173_n5610:
	.asciz	"Ticks: "
	.size	.Lstrglobal_fkappsconsole_mkc_getpicticks_l173_n5610, 8

	.type	.Lstrglobal_fkappsconsole_mkc_getpicticks_l175_n5618,@object # @strglobal_fkappsconsole_mkc_getpicticks_l175_n5618
.Lstrglobal_fkappsconsole_mkc_getpicticks_l175_n5618:
	.asciz	"\nSeconds ~:"
	.size	.Lstrglobal_fkappsconsole_mkc_getpicticks_l175_n5618, 12

	.type	.Lstrglobal_fkappsconsole_mkc_getpicticks_l177_n5629,@object # @strglobal_fkappsconsole_mkc_getpicticks_l177_n5629
.Lstrglobal_fkappsconsole_mkc_getpicticks_l177_n5629:
	.asciz	"\n"
	.size	.Lstrglobal_fkappsconsole_mkc_getpicticks_l177_n5629, 2

	.type	.Lstrglobal_fkappsconsole_mkc_picsleep_l182_n5640,@object # @strglobal_fkappsconsole_mkc_picsleep_l182_n5640
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsconsole_mkc_picsleep_l182_n5640:
	.asciz	"Pass 1 hex digit for seconds to sleep"
	.size	.Lstrglobal_fkappsconsole_mkc_picsleep_l182_n5640, 38

	.type	.Lstrglobal_fkappsconsole_mkc_picsleep_l187_n5653,@object # @strglobal_fkappsconsole_mkc_picsleep_l187_n5653
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkappsconsole_mkc_picsleep_l187_n5653:
	.zero	1
	.size	.Lstrglobal_fkappsconsole_mkc_picsleep_l187_n5653, 1

	.type	.Lstrglobal_fkappsconsole_mkc_picsleep_l191_n5676,@object # @strglobal_fkappsconsole_mkc_picsleep_l191_n5676
.Lstrglobal_fkappsconsole_mkc_picsleep_l191_n5676:
	.zero	1
	.size	.Lstrglobal_fkappsconsole_mkc_picsleep_l191_n5676, 1

	.type	.Lstrglobal_fkappsconsole_mkc_color_l197_n5703,@object # @strglobal_fkappsconsole_mkc_color_l197_n5703
.Lstrglobal_fkappsconsole_mkc_color_l197_n5703:
	.asciz	"Set\n"
	.size	.Lstrglobal_fkappsconsole_mkc_color_l197_n5703, 5

	.type	.Lstrglobal_fkappsconsole_mkc_colorama_l209_n5730,@object # @strglobal_fkappsconsole_mkc_colorama_l209_n5730
.Lstrglobal_fkappsconsole_mkc_colorama_l209_n5730:
	.asciz	"X"
	.size	.Lstrglobal_fkappsconsole_mkc_colorama_l209_n5730, 2

	.type	.Lstrglobal_fkappsconsole_mkc_colorama_l212_n5741,@object # @strglobal_fkappsconsole_mkc_colorama_l212_n5741
.Lstrglobal_fkappsconsole_mkc_colorama_l212_n5741:
	.asciz	"\n"
	.size	.Lstrglobal_fkappsconsole_mkc_colorama_l212_n5741, 2

	.type	.Lstrglobal_fkappsconsole_mkc_drawstuff_l236_n5827,@object # @strglobal_fkappsconsole_mkc_drawstuff_l236_n5827
.Lstrglobal_fkappsconsole_mkc_drawstuff_l236_n5827:
	.asciz	"A"
	.size	.Lstrglobal_fkappsconsole_mkc_drawstuff_l236_n5827, 2

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l283_n5953,@object # @strglobal_fkappsconsole_mkconsole_run_l283_n5953
.Lstrglobal_fkappsconsole_mkconsole_run_l283_n5953:
	.asciz	"help"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l283_n5953, 5

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l283_n5956,@object # @strglobal_fkappsconsole_mkconsole_run_l283_n5956
.Lstrglobal_fkappsconsole_mkconsole_run_l283_n5956:
	.asciz	"Display Help"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l283_n5956, 13

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l284_n5963,@object # @strglobal_fkappsconsole_mkconsole_run_l284_n5963
.Lstrglobal_fkappsconsole_mkconsole_run_l284_n5963:
	.asciz	"dumpargs"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l284_n5963, 9

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l284_n5966,@object # @strglobal_fkappsconsole_mkconsole_run_l284_n5966
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsconsole_mkconsole_run_l284_n5966:
	.asciz	"Show the passed arguments"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l284_n5966, 26

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l285_n5973,@object # @strglobal_fkappsconsole_mkconsole_run_l285_n5973
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkappsconsole_mkconsole_run_l285_n5973:
	.asciz	"mem"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l285_n5973, 4

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l285_n5976,@object # @strglobal_fkappsconsole_mkconsole_run_l285_n5976
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsconsole_mkconsole_run_l285_n5976:
	.asciz	"Show memory statistics"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l285_n5976, 23

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l286_n5983,@object # @strglobal_fkappsconsole_mkconsole_run_l286_n5983
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkappsconsole_mkconsole_run_l286_n5983:
	.asciz	"fault"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l286_n5983, 6

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l286_n5986,@object # @strglobal_fkappsconsole_mkconsole_run_l286_n5986
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsconsole_mkconsole_run_l286_n5986:
	.asciz	"Cause a fault. Types are dbz, pw, pr"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l286_n5986, 37

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l287_n5993,@object # @strglobal_fkappsconsole_mkconsole_run_l287_n5993
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkappsconsole_mkconsole_run_l287_n5993:
	.asciz	"echo"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l287_n5993, 5

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l287_n5996,@object # @strglobal_fkappsconsole_mkconsole_run_l287_n5996
.Lstrglobal_fkappsconsole_mkconsole_run_l287_n5996:
	.asciz	"Repeat args"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l287_n5996, 12

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l288_n6003,@object # @strglobal_fkappsconsole_mkconsole_run_l288_n6003
.Lstrglobal_fkappsconsole_mkconsole_run_l288_n6003:
	.asciz	"add2h"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l288_n6003, 6

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l288_n6006,@object # @strglobal_fkappsconsole_mkconsole_run_l288_n6006
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsconsole_mkconsole_run_l288_n6006:
	.asciz	"Add two (hex) digits"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l288_n6006, 21

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l289_n6013,@object # @strglobal_fkappsconsole_mkconsole_run_l289_n6013
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkappsconsole_mkconsole_run_l289_n6013:
	.asciz	"clear"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l289_n6013, 6

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l289_n6016,@object # @strglobal_fkappsconsole_mkconsole_run_l289_n6016
.Lstrglobal_fkappsconsole_mkconsole_run_l289_n6016:
	.asciz	"Clear Screen"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l289_n6016, 13

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l290_n6023,@object # @strglobal_fkappsconsole_mkconsole_run_l290_n6023
.Lstrglobal_fkappsconsole_mkconsole_run_l290_n6023:
	.asciz	"hexnum"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l290_n6023, 7

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l290_n6026,@object # @strglobal_fkappsconsole_mkconsole_run_l290_n6026
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsconsole_mkconsole_run_l290_n6026:
	.asciz	"Parse a hex digit"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l290_n6026, 18

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l291_n6033,@object # @strglobal_fkappsconsole_mkconsole_run_l291_n6033
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkappsconsole_mkconsole_run_l291_n6033:
	.asciz	"dmpmbd"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l291_n6033, 7

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l291_n6036,@object # @strglobal_fkappsconsole_mkconsole_run_l291_n6036
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsconsole_mkconsole_run_l291_n6036:
	.asciz	"View Multiboot info structure"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l291_n6036, 30

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l292_n6043,@object # @strglobal_fkappsconsole_mkconsole_run_l292_n6043
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkappsconsole_mkconsole_run_l292_n6043:
	.asciz	"dmppmbd"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l292_n6043, 8

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l292_n6046,@object # @strglobal_fkappsconsole_mkconsole_run_l292_n6046
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsconsole_mkconsole_run_l292_n6046:
	.asciz	"View Parsed Multiboot info structure"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l292_n6046, 37

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l293_n6053,@object # @strglobal_fkappsconsole_mkconsole_run_l293_n6053
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkappsconsole_mkconsole_run_l293_n6053:
	.asciz	"pict"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l293_n6053, 5

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l293_n6056,@object # @strglobal_fkappsconsole_mkconsole_run_l293_n6056
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsconsole_mkconsole_run_l293_n6056:
	.asciz	"View PIC interrupt count"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l293_n6056, 25

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l294_n6063,@object # @strglobal_fkappsconsole_mkconsole_run_l294_n6063
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkappsconsole_mkconsole_run_l294_n6063:
	.asciz	"pics"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l294_n6063, 5

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l294_n6066,@object # @strglobal_fkappsconsole_mkconsole_run_l294_n6066
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsconsole_mkconsole_run_l294_n6066:
	.asciz	"Sleep for n secs. Pass 1 hex digit"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l294_n6066, 35

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l295_n6073,@object # @strglobal_fkappsconsole_mkconsole_run_l295_n6073
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkappsconsole_mkconsole_run_l295_n6073:
	.asciz	"shutdown"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l295_n6073, 9

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l295_n6076,@object # @strglobal_fkappsconsole_mkconsole_run_l295_n6076
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsconsole_mkconsole_run_l295_n6076:
	.asciz	"Try to shut down"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l295_n6076, 17

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l296_n6083,@object # @strglobal_fkappsconsole_mkconsole_run_l296_n6083
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkappsconsole_mkconsole_run_l296_n6083:
	.asciz	"color"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l296_n6083, 6

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l296_n6086,@object # @strglobal_fkappsconsole_mkconsole_run_l296_n6086
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsconsole_mkconsole_run_l296_n6086:
	.asciz	"Set terminal color mode. Pass 2 hex digits, or no args to reset"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l296_n6086, 64

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l297_n6093,@object # @strglobal_fkappsconsole_mkconsole_run_l297_n6093
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkappsconsole_mkconsole_run_l297_n6093:
	.asciz	"colorama"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l297_n6093, 9

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l297_n6096,@object # @strglobal_fkappsconsole_mkconsole_run_l297_n6096
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsconsole_mkconsole_run_l297_n6096:
	.asciz	"Demo availible colors"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l297_n6096, 22

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l298_n6103,@object # @strglobal_fkappsconsole_mkconsole_run_l298_n6103
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkappsconsole_mkconsole_run_l298_n6103:
	.asciz	"snowcrash"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l298_n6103, 10

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l298_n6106,@object # @strglobal_fkappsconsole_mkconsole_run_l298_n6106
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsconsole_mkconsole_run_l298_n6106:
	.asciz	"Dump kernel code into vram. *no getting out*"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l298_n6106, 45

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l299_n6113,@object # @strglobal_fkappsconsole_mkconsole_run_l299_n6113
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkappsconsole_mkconsole_run_l299_n6113:
	.asciz	"draw"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l299_n6113, 5

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l299_n6116,@object # @strglobal_fkappsconsole_mkconsole_run_l299_n6116
.Lstrglobal_fkappsconsole_mkconsole_run_l299_n6116:
	.asciz	"Draw some stuff"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l299_n6116, 16

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l300_n6123,@object # @strglobal_fkappsconsole_mkconsole_run_l300_n6123
.Lstrglobal_fkappsconsole_mkconsole_run_l300_n6123:
	.asciz	"drawcolors"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l300_n6123, 11

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l300_n6126,@object # @strglobal_fkappsconsole_mkconsole_run_l300_n6126
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsconsole_mkconsole_run_l300_n6126:
	.asciz	"Draw some colors"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l300_n6126, 17

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l301_n6133,@object # @strglobal_fkappsconsole_mkconsole_run_l301_n6133
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkappsconsole_mkconsole_run_l301_n6133:
	.asciz	"rcmtest"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l301_n6133, 8

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l301_n6136,@object # @strglobal_fkappsconsole_mkconsole_run_l301_n6136
.Lstrglobal_fkappsconsole_mkconsole_run_l301_n6136:
	.asciz	"Test some trig"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l301_n6136, 15

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l302_n6143,@object # @strglobal_fkappsconsole_mkconsole_run_l302_n6143
.Lstrglobal_fkappsconsole_mkconsole_run_l302_n6143:
	.asciz	"rc"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l302_n6143, 3

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l302_n6146,@object # @strglobal_fkappsconsole_mkconsole_run_l302_n6146
.Lstrglobal_fkappsconsole_mkconsole_run_l302_n6146:
	.asciz	"Raycaster"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l302_n6146, 10

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l303_n6153,@object # @strglobal_fkappsconsole_mkconsole_run_l303_n6153
.Lstrglobal_fkappsconsole_mkconsole_run_l303_n6153:
	.asciz	"drawbmp"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l303_n6153, 8

	.type	.Lstrglobal_fkappsconsole_mkconsole_run_l303_n6156,@object # @strglobal_fkappsconsole_mkconsole_run_l303_n6156
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkappsconsole_mkconsole_run_l303_n6156:
	.asciz	"Draw a BMP that was loaded as a kernel module"
	.size	.Lstrglobal_fkappsconsole_mkconsole_run_l303_n6156, 46

	.type	.Lstrglobal_fvgatest_mtest_svga_l7_n6230,@object # @strglobal_fvgatest_mtest_svga_l7_n6230
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fvgatest_mtest_svga_l7_n6230:
	.asciz	"A"
	.size	.Lstrglobal_fvgatest_mtest_svga_l7_n6230, 2

	.type	.Lstrglobal_fpaging_mPageEntry$set_l11_n6592,@object # @"strglobal_fpaging_mPageEntry$set_l11_n6592"
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fpaging_mPageEntry$set_l11_n6592:
	.asciz	"Internal PDE Error"
	.size	.Lstrglobal_fpaging_mPageEntry$set_l11_n6592, 19

	.type	.Lstrglobal_fpaging_mPageEntry$set_l11_n6595,@object # @"strglobal_fpaging_mPageEntry$set_l11_n6595"
	.align	16
.Lstrglobal_fpaging_mPageEntry$set_l11_n6595:
	.asciz	"Address not 4KiB aligned"
	.size	.Lstrglobal_fpaging_mPageEntry$set_l11_n6595, 25

	.type	.Lstrglobal_fkmods_mkm_print_l20_n6680,@object # @strglobal_fkmods_mkm_print_l20_n6680
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkmods_mkm_print_l20_n6680:
	.asciz	"[KMOD]: "
	.size	.Lstrglobal_fkmods_mkm_print_l20_n6680, 9

	.type	.Lstrglobal_fkmods_mkm_rep_l25_n6688,@object # @strglobal_fkmods_mkm_rep_l25_n6688
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fkmods_mkm_rep_l25_n6688:
	.asciz	"[MODULE REPORTED]"
	.size	.Lstrglobal_fkmods_mkm_rep_l25_n6688, 18

	.type	.Lstrglobal_fkmods_mkm_printi_l29_n6694,@object # @strglobal_fkmods_mkm_printi_l29_n6694
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fkmods_mkm_printi_l29_n6694:
	.asciz	"[MOD_I]:"
	.size	.Lstrglobal_fkmods_mkm_printi_l29_n6694, 9

	.type	.Lstrglobal_fkmods_mkm_printi_l31_n6702,@object # @strglobal_fkmods_mkm_printi_l31_n6702
.Lstrglobal_fkmods_mkm_printi_l31_n6702:
	.asciz	"\n"
	.size	.Lstrglobal_fkmods_mkm_printi_l31_n6702, 2

	.type	.Lstrglobal_fkmods_mkm_invoke_l40_n6720,@object # @strglobal_fkmods_mkm_invoke_l40_n6720
.Lstrglobal_fkmods_mkm_invoke_l40_n6720:
	.asciz	"\nModule@="
	.size	.Lstrglobal_fkmods_mkm_invoke_l40_n6720, 10

	.type	.Lstrglobal_fkmods_mkm_invoke_l42_n6730,@object # @strglobal_fkmods_mkm_invoke_l42_n6730
.Lstrglobal_fkmods_mkm_invoke_l42_n6730:
	.asciz	" Magic:"
	.size	.Lstrglobal_fkmods_mkm_invoke_l42_n6730, 8

	.type	.Lstrglobal_fkmods_mkm_invoke_l47_n6757,@object # @strglobal_fkmods_mkm_invoke_l47_n6757
.Lstrglobal_fkmods_mkm_invoke_l47_n6757:
	.asciz	" 32b"
	.size	.Lstrglobal_fkmods_mkm_invoke_l47_n6757, 5

	.type	.Lstrglobal_fkmods_mkm_invoke_l49_n6762,@object # @strglobal_fkmods_mkm_invoke_l49_n6762
.Lstrglobal_fkmods_mkm_invoke_l49_n6762:
	.asciz	" 64b!"
	.size	.Lstrglobal_fkmods_mkm_invoke_l49_n6762, 6

	.type	.Lstrglobal_fkmods_mkm_invoke_l51_n6767,@object # @strglobal_fkmods_mkm_invoke_l51_n6767
.Lstrglobal_fkmods_mkm_invoke_l51_n6767:
	.asciz	" Entry="
	.size	.Lstrglobal_fkmods_mkm_invoke_l51_n6767, 8

	.type	.Lstrglobal_fkmods_mkm_invoke_l56_n6781,@object # @strglobal_fkmods_mkm_invoke_l56_n6781
.Lstrglobal_fkmods_mkm_invoke_l56_n6781:
	.asciz	" km_rep="
	.size	.Lstrglobal_fkmods_mkm_invoke_l56_n6781, 9

	.type	.Lstrglobal_fkmods_mkm_invoke_l58_n6791,@object # @strglobal_fkmods_mkm_invoke_l58_n6791
.Lstrglobal_fkmods_mkm_invoke_l58_n6791:
	.asciz	"\nInvoking..."
	.size	.Lstrglobal_fkmods_mkm_invoke_l58_n6791, 13

	.type	.Lstrglobal_fkmods_mkm_invoke_l60_n6800,@object # @strglobal_fkmods_mkm_invoke_l60_n6800
.Lstrglobal_fkmods_mkm_invoke_l60_n6800:
	.asciz	" Module return="
	.size	.Lstrglobal_fkmods_mkm_invoke_l60_n6800, 16

	.type	.Lstrglobal_fkmods_mkm_invoke_l62_n6808,@object # @strglobal_fkmods_mkm_invoke_l62_n6808
.Lstrglobal_fkmods_mkm_invoke_l62_n6808:
	.asciz	" delta="
	.size	.Lstrglobal_fkmods_mkm_invoke_l62_n6808, 8

	.type	.Lstrglobal_fkmods_mkm_invoke_l64_n6820,@object # @strglobal_fkmods_mkm_invoke_l64_n6820
.Lstrglobal_fkmods_mkm_invoke_l64_n6820:
	.asciz	"\n"
	.size	.Lstrglobal_fkmods_mkm_invoke_l64_n6820, 2

	.type	.Lstrglobal_fin_mkernel_main_l27_n6830,@object # @strglobal_fin_mkernel_main_l27_n6830
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fin_mkernel_main_l27_n6830:
	.asciz	"Kernel debugger check!\n"
	.size	.Lstrglobal_fin_mkernel_main_l27_n6830, 24

	.type	.Lstrglobal_fin_mkernel_main_l41_n6874,@object # @strglobal_fin_mkernel_main_l41_n6874
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fin_mkernel_main_l41_n6874:
	.asciz	"Text Mode\n"
	.size	.Lstrglobal_fin_mkernel_main_l41_n6874, 11

	.type	.Lstrglobal_fin_mkernel_main_l44_n6889,@object # @strglobal_fin_mkernel_main_l44_n6889
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fin_mkernel_main_l44_n6889:
	.asciz	"Graphical mode. Paging...\n"
	.size	.Lstrglobal_fin_mkernel_main_l44_n6889, 27

	.type	.Lstrglobal_fin_mkernel_main_l47_n6920,@object # @strglobal_fin_mkernel_main_l47_n6920
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fin_mkernel_main_l47_n6920:
	.asciz	"Paged\n"
	.size	.Lstrglobal_fin_mkernel_main_l47_n6920, 7

	.type	.Lstrglobal_fin_mkernel_main_l49_n6927,@object # @strglobal_fin_mkernel_main_l49_n6927
.Lstrglobal_fin_mkernel_main_l49_n6927:
	.asciz	"gfxtest"
	.size	.Lstrglobal_fin_mkernel_main_l49_n6927, 8

	.type	.Lstrglobal_fin_mkernel_main_l57_n6952,@object # @strglobal_fin_mkernel_main_l57_n6952
.Lstrglobal_fin_mkernel_main_l57_n6952:
	.asciz	"Blanking..."
	.size	.Lstrglobal_fin_mkernel_main_l57_n6952, 12

	.type	.Lstrglobal_fin_mkernel_main_l59_n6959,@object # @strglobal_fin_mkernel_main_l59_n6959
.Lstrglobal_fin_mkernel_main_l59_n6959:
	.asciz	"*\n"
	.size	.Lstrglobal_fin_mkernel_main_l59_n6959, 3

	.type	.Lstrglobal_fin_mkernel_main_l61_n6964,@object # @strglobal_fin_mkernel_main_l61_n6964
.Lstrglobal_fin_mkernel_main_l61_n6964:
	.asciz	"Terminal ready"
	.size	.Lstrglobal_fin_mkernel_main_l61_n6964, 15

	.type	.Lstrglobal_fin_mkernel_main_l63_n6969,@object # @strglobal_fin_mkernel_main_l63_n6969
.Lstrglobal_fin_mkernel_main_l63_n6969:
	.asciz	"  ..---.."
	.size	.Lstrglobal_fin_mkernel_main_l63_n6969, 10

	.type	.Lstrglobal_fin_mkernel_main_l65_n6974,@object # @strglobal_fin_mkernel_main_l65_n6974
.Lstrglobal_fin_mkernel_main_l65_n6974:
	.asciz	" /       \\"
	.size	.Lstrglobal_fin_mkernel_main_l65_n6974, 11

	.type	.Lstrglobal_fin_mkernel_main_l66_n6979,@object # @strglobal_fin_mkernel_main_l66_n6979
.Lstrglobal_fin_mkernel_main_l66_n6979:
	.asciz	"|         |"
	.size	.Lstrglobal_fin_mkernel_main_l66_n6979, 12

	.type	.Lstrglobal_fin_mkernel_main_l67_n6984,@object # @strglobal_fin_mkernel_main_l67_n6984
.Lstrglobal_fin_mkernel_main_l67_n6984:
	.asciz	":         ;"
	.size	.Lstrglobal_fin_mkernel_main_l67_n6984, 12

	.type	.Lstrglobal_fin_mkernel_main_l68_n6989,@object # @strglobal_fin_mkernel_main_l68_n6989
.Lstrglobal_fin_mkernel_main_l68_n6989:
	.asciz	" \\  \\"
	.size	.Lstrglobal_fin_mkernel_main_l68_n6989, 6

	.type	.Lstrglobal_fin_mkernel_main_l69_n6995,@object # @strglobal_fin_mkernel_main_l69_n6995
.Lstrglobal_fin_mkernel_main_l69_n6995:
	.asciz	"~"
	.size	.Lstrglobal_fin_mkernel_main_l69_n6995, 2

	.type	.Lstrglobal_fin_mkernel_main_l70_n7000,@object # @strglobal_fin_mkernel_main_l70_n7000
.Lstrglobal_fin_mkernel_main_l70_n7000:
	.asciz	"/  /"
	.size	.Lstrglobal_fin_mkernel_main_l70_n7000, 5

	.type	.Lstrglobal_fin_mkernel_main_l71_n7005,@object # @strglobal_fin_mkernel_main_l71_n7005
.Lstrglobal_fin_mkernel_main_l71_n7005:
	.asciz	"  `, Y ,'"
	.size	.Lstrglobal_fin_mkernel_main_l71_n7005, 10

	.type	.Lstrglobal_fin_mkernel_main_l72_n7010,@object # @strglobal_fin_mkernel_main_l72_n7010
.Lstrglobal_fin_mkernel_main_l72_n7010:
	.asciz	"   |_|_|"
	.size	.Lstrglobal_fin_mkernel_main_l72_n7010, 9

	.type	.Lstrglobal_fin_mkernel_main_l73_n7015,@object # @strglobal_fin_mkernel_main_l73_n7015
.Lstrglobal_fin_mkernel_main_l73_n7015:
	.asciz	"   |===|"
	.size	.Lstrglobal_fin_mkernel_main_l73_n7015, 9

	.type	.Lstrglobal_fin_mkernel_main_l74_n7020,@object # @strglobal_fin_mkernel_main_l74_n7020
.Lstrglobal_fin_mkernel_main_l74_n7020:
	.asciz	"   |===|"
	.size	.Lstrglobal_fin_mkernel_main_l74_n7020, 9

	.type	.Lstrglobal_fin_mkernel_main_l75_n7025,@object # @strglobal_fin_mkernel_main_l75_n7025
.Lstrglobal_fin_mkernel_main_l75_n7025:
	.asciz	"    \\_/"
	.size	.Lstrglobal_fin_mkernel_main_l75_n7025, 8

	.type	.Lstrglobal_fin_mkernel_main_l76_n7030,@object # @strglobal_fin_mkernel_main_l76_n7030
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fin_mkernel_main_l76_n7030:
	.asciz	"\nOrth OS. Louis G."
	.size	.Lstrglobal_fin_mkernel_main_l76_n7030, 19

	.type	.Lstrglobal_fin_mkernel_main_l78_n7035,@object # @strglobal_fin_mkernel_main_l78_n7035
	.align	16
.Lstrglobal_fin_mkernel_main_l78_n7035:
	.asciz	"Higher-Half addressing enabled, base_vma="
	.size	.Lstrglobal_fin_mkernel_main_l78_n7035, 42

	.type	.Lstrglobal_fin_mkernel_main_l80_n7043,@object # @strglobal_fin_mkernel_main_l80_n7043
	.align	16
.Lstrglobal_fin_mkernel_main_l80_n7043:
	.asciz	". kterm.baseaddr="
	.size	.Lstrglobal_fin_mkernel_main_l80_n7043, 18

	.type	.Lstrglobal_fin_mkernel_main_l83_n7054,@object # @strglobal_fin_mkernel_main_l83_n7054
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fin_mkernel_main_l83_n7054:
	.asciz	"\nCS="
	.size	.Lstrglobal_fin_mkernel_main_l83_n7054, 5

	.type	.Lstrglobal_fin_mkernel_main_l85_n7063,@object # @strglobal_fin_mkernel_main_l85_n7063
.Lstrglobal_fin_mkernel_main_l85_n7063:
	.asciz	" DS="
	.size	.Lstrglobal_fin_mkernel_main_l85_n7063, 5

	.type	.Lstrglobal_fin_mkernel_main_l87_n7072,@object # @strglobal_fin_mkernel_main_l87_n7072
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fin_mkernel_main_l87_n7072:
	.asciz	" Installing GDT: "
	.size	.Lstrglobal_fin_mkernel_main_l87_n7072, 18

	.type	.Lstrglobal_fin_mkernel_main_l91_n7079,@object # @strglobal_fin_mkernel_main_l91_n7079
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fin_mkernel_main_l91_n7079:
	.asciz	" Done! "
	.size	.Lstrglobal_fin_mkernel_main_l91_n7079, 8

	.type	.Lstrglobal_fin_mkernel_main_l93_n7084,@object # @strglobal_fin_mkernel_main_l93_n7084
.Lstrglobal_fin_mkernel_main_l93_n7084:
	.asciz	"CS="
	.size	.Lstrglobal_fin_mkernel_main_l93_n7084, 4

	.type	.Lstrglobal_fin_mkernel_main_l95_n7093,@object # @strglobal_fin_mkernel_main_l95_n7093
.Lstrglobal_fin_mkernel_main_l95_n7093:
	.asciz	" DS="
	.size	.Lstrglobal_fin_mkernel_main_l95_n7093, 5

	.type	.Lstrglobal_fin_mkernel_main_l98_n7102,@object # @strglobal_fin_mkernel_main_l98_n7102
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fin_mkernel_main_l98_n7102:
	.asciz	"\nTesting (some) Memory: "
	.size	.Lstrglobal_fin_mkernel_main_l98_n7102, 25

	.type	.Lstrglobal_fin_mkernel_main_l110_n7142,@object # @strglobal_fin_mkernel_main_l110_n7142
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fin_mkernel_main_l110_n7142:
	.asciz	"Done, at least "
	.size	.Lstrglobal_fin_mkernel_main_l110_n7142, 16

	.type	.Lstrglobal_fin_mkernel_main_l112_n7150,@object # @strglobal_fin_mkernel_main_l112_n7150
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fin_mkernel_main_l112_n7150:
	.asciz	"b accessible off 'heap'"
	.size	.Lstrglobal_fin_mkernel_main_l112_n7150, 24

	.type	.Lstrglobal_fin_mkernel_main_l114_n7155,@object # @strglobal_fin_mkernel_main_l114_n7155
	.align	16
.Lstrglobal_fin_mkernel_main_l114_n7155:
	.asciz	"Installing IRQs: "
	.size	.Lstrglobal_fin_mkernel_main_l114_n7155, 18

	.type	.Lstrglobal_fin_mkernel_main_l118_n7162,@object # @strglobal_fin_mkernel_main_l118_n7162
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fin_mkernel_main_l118_n7162:
	.asciz	"Installed!"
	.size	.Lstrglobal_fin_mkernel_main_l118_n7162, 11

	.type	.Lstrglobal_fin_mkernel_main_l120_n7167,@object # @strglobal_fin_mkernel_main_l120_n7167
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fin_mkernel_main_l120_n7167:
	.asciz	"Mutiboot structure physaddr="
	.size	.Lstrglobal_fin_mkernel_main_l120_n7167, 29

	.type	.Lstrglobal_fin_mkernel_main_l122_n7176,@object # @strglobal_fin_mkernel_main_l122_n7176
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fin_mkernel_main_l122_n7176:
	.asciz	". vaddr?="
	.size	.Lstrglobal_fin_mkernel_main_l122_n7176, 10

	.type	.Lstrglobal_fin_mkernel_main_l125_n7192,@object # @strglobal_fin_mkernel_main_l125_n7192
.Lstrglobal_fin_mkernel_main_l125_n7192:
	.asciz	" OK\n"
	.size	.Lstrglobal_fin_mkernel_main_l125_n7192, 5

	.type	.Lstrglobal_fin_mkernel_main_l127_n7197,@object # @strglobal_fin_mkernel_main_l127_n7197
.Lstrglobal_fin_mkernel_main_l127_n7197:
	.asciz	" OUTSIDE MAP!"
	.size	.Lstrglobal_fin_mkernel_main_l127_n7197, 14

	.type	.Lstrglobal_fin_mkernel_main_l130_n7202,@object # @strglobal_fin_mkernel_main_l130_n7202
.Lstrglobal_fin_mkernel_main_l130_n7202:
	.asciz	"Heap ptr at "
	.size	.Lstrglobal_fin_mkernel_main_l130_n7202, 13

	.type	.Lstrglobal_fin_mkernel_main_l132_n7211,@object # @strglobal_fin_mkernel_main_l132_n7211
.Lstrglobal_fin_mkernel_main_l132_n7211:
	.asciz	" , heap pos at "
	.size	.Lstrglobal_fin_mkernel_main_l132_n7211, 16

	.type	.Lstrglobal_fin_mkernel_main_l134_n7220,@object # @strglobal_fin_mkernel_main_l134_n7220
.Lstrglobal_fin_mkernel_main_l134_n7220:
	.asciz	" ("
	.size	.Lstrglobal_fin_mkernel_main_l134_n7220, 3

	.type	.Lstrglobal_fin_mkernel_main_l136_n7232,@object # @strglobal_fin_mkernel_main_l136_n7232
.Lstrglobal_fin_mkernel_main_l136_n7232:
	.asciz	"b consumed)"
	.size	.Lstrglobal_fin_mkernel_main_l136_n7232, 12

	.type	.Lstrglobal_fin_mkernel_main_l138_n7237,@object # @strglobal_fin_mkernel_main_l138_n7237
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstrglobal_fin_mkernel_main_l138_n7237:
	.asciz	"BG Colors 0-16, FG Colors:"
	.size	.Lstrglobal_fin_mkernel_main_l138_n7237, 27

	.type	.Lstrglobal_fin_mkernel_main_l143_n7249,@object # @strglobal_fin_mkernel_main_l143_n7249
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrglobal_fin_mkernel_main_l143_n7249:
	.asciz	"."
	.size	.Lstrglobal_fin_mkernel_main_l143_n7249, 2

	.type	.Lstrglobal_fin_mkernel_main_l150_n7267,@object # @strglobal_fin_mkernel_main_l150_n7267
.Lstrglobal_fin_mkernel_main_l150_n7267:
	.asciz	"X"
	.size	.Lstrglobal_fin_mkernel_main_l150_n7267, 2

	.type	.Lstrglobal_fin_mkernel_main_l156_n7280,@object # @strglobal_fin_mkernel_main_l156_n7280
.Lstrglobal_fin_mkernel_main_l156_n7280:
	.asciz	"\n\nREADY"
	.size	.Lstrglobal_fin_mkernel_main_l156_n7280, 8


	.section	".note.GNU-stack","",@progbits
