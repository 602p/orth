
section .text

irq0:
	push 0
	push 0
	jmp irqh_main

irq1:
	push 0
	push 1
	jmp irqh_main

irq2:
	push 0
	push 2
	jmp irqh_main

irq3:
	push 0
	push 3
	jmp irqh_main

irq4:
	push 0
	push 4
	jmp irqh_main

irq5:
	push 0
	push 5
	jmp irqh_main

irq6:
	push 0
	push 6
	jmp irqh_main

irq7:
	push 0
	push 7
	jmp irqh_main

irq8:
	push 8
	;CPU pushes 0
	jmp irqh_main

irq9:
	push 0
	push 9
	jmp irqh_main

irq10:
	push 10
	;CPU pushes error code
	jmp irqh_main

irq11:
	push 11
	;CPU pushes error code
	jmp irqh_main

irq12:
	push 12
	;CPU pushes error code
	jmp irqh_main

irq13:
	push 13
	;CPU pushes error code
	jmp irqh_main

irq14:
	push 14
	;CPU pushes error code
	jmp irqh_main

irq15:
	push 0
	push 15
	jmp irqh_main

irq16:
	push 0
	push 16
	jmp irqh_main

irq17:
	push 17
	;CPU pushes error code
	jmp irqh_main

irq18:
	push 0
	push 18
	jmp irqh_main

irq19:
	push 0
	push 19
	jmp irqh_main

irq20:
	push 0
	push 20
	jmp irqh_main

irq32:
	push 0
	push 32
	jmp irqh_main

irq33:
	push 0
	push 33
	jmp irqh_main

irq34:
	push 0
	push 34
	jmp irqh_main

irq35:
	push 0
	push 35
	jmp irqh_main

extern kirq_callback
irqh_main:
	mov eax, cr2
	push eax
	call kirq_callback
	pop eax
	pop eax
	pop eax
	iret

internal_irqh_table:
	dd 36
	dd irq0
	dd irq1
	dd irq2
	dd irq3
	dd irq4
	dd irq5
	dd irq6 
	dd irq7 
	dd irq8 
	dd irq9 
	dd irq10
	dd irq11
	dd irq12
	dd irq13
	dd irq14
	dd irq15
	dd irq16
	dd irq17
	dd irq18
	dd irq19
	dd irq20
	times 11 dd 0
	dd irq32
	dd irq33
	dd irq34
	dd irq35

global __kget_internal_irq_table
__kget_internal_irq_table:
	mov eax, internal_irqh_table
	ret

global __klidt
__klidt:
    mov edx, [esp + 4]
    lidt [edx]
    sti
    ret