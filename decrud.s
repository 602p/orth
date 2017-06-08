main:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$.LC0, %edi  ;String in .rodata - not shown
	call	puts
	popq	%rbp
	ret
