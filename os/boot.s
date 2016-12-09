global _loader                          ; Make entry point visible to linker.
extern kernel_main                            ; _main is defined elsewhere
 
; setting up the Multiboot header - see GRUB docs for details
MODULEALIGN equ  1<<0             ; align loaded modules on page boundaries
MEMINFO     equ  1<<1             ; provide memory map
FLAGS       equ  MODULEALIGN | MEMINFO  ; this is the Multiboot 'flag' field
MAGIC       equ    0x1BADB002     ; 'magic number' lets bootloader find the header
CHECKSUM    equ -(MAGIC + FLAGS)  ; checksum required
 
; This is the virtual base address of kernel space. It must be used to convert virtual
; addresses into physical addresses until paging is enabled. Note that this is not
; the virtual address where the kernel image itself is loaded -- just the amount that must
; be subtracted from a virtual address to get a physical address.
KERNEL_VIRTUAL_BASE equ 0xC0000000                  ; 3GB
KERNEL_PAGE_NUMBER equ (KERNEL_VIRTUAL_BASE >> 22)  ; Page directory index of kernels 4MB PTE.
 
 
section .data
align 0x1000
BootPageDirectory:
    ; This page directory entry identity-maps the first 4MB of the 32-bit physical address space.
    ; All bits are clear except the following:
    ; bit 7: PS The kernel page is 4MB.
    ; bit 1: RW The kernel page is read/write.
    ; bit 0: P  The kernel page is present.
    ; This entry must be here -- otherwise the kernel will crash immediately after paging is
    ; enabled because it cant fetch the next instruction! Its ok to unmap this page later.
    dd 0x00000083
    times (KERNEL_PAGE_NUMBER - 1) dd 0                 ; Pages before kernel space.
    ; This page directory entry defines a 4MB page containing the kernel.
    dd 0x00000083
    times (1024 - KERNEL_PAGE_NUMBER - 1) dd 0  ; Pages after the kernel image.
 
 
section .text
align 4
MultiBootHeader:
    dd MAGIC
    dd FLAGS
    dd CHECKSUM
 
; reserve initial kernel stack space -- thats 16k.
STACKSIZE equ 0x4000
 
; setting up entry point for linker
loader equ (_loader - 0xC0000000)
global loader
 
_loader:
    cli
    ; NOTE: Until paging is set up, the code must be position-independent and use physical
    ; addresses, not virtual ones!
    mov ecx, (BootPageDirectory - KERNEL_VIRTUAL_BASE)
    mov cr3, ecx                                    ; Load Page Directory Base Register.
 
    mov ecx, cr4
    or ecx, 0x00000010                          ; Set PSE bit in CR4 to enable 4MB pages.
    mov cr4, ecx
 
    mov ecx, cr0
    or ecx, 0x80000000                          ; Set PG bit in CR0 to enable paging.
    mov cr0, ecx
 
    ; Start fetching instructions in kernel space.
    ; Since eip at this point holds the physical address of this command (approximately 0x00100000)
    ; we need to do a long jump to the correct virtual address of StartInHigherHalf which is
    ; approximately 0xC0100000.
    lea ecx, [StartInHigherHalf]
    jmp ecx                                                     ; NOTE: Must be absolute jump!
 
StartInHigherHalf:
    ; Unmap the identity-mapped first 4MB of physical address space. It should not be needed
    ; anymore.
    mov dword [BootPageDirectory], 0
    invlpg [0]
 
    ; NOTE: From now on, paging should be enabled. The first 4MB of physical address space is
    ; mapped starting at KERNEL_VIRTUAL_BASE. Everything is linked to this address, so no more
    ; position-independent code or funny business with virtual-to-physical address translation
    ; should be necessary. We now have a higher-half kernel.
    mov esp, stack+STACKSIZE           ; set up the stack
    ;push eax                           ; pass Multiboot magic number
 
 	push esp
    ; pass Multiboot info structure -- WARNING: This is a physical address and may not be
    ; in the first 4MB!
    ;push ebx
 
    call  kernel_main                  ; call kernel proper
    hlt                          ; halt machine should kernel return

global __kreadpb
__kreadpb:
	mov edx, [esp + 4]
	in al, dx	
	ret

global __kwritepb
__kwritepb:
	mov   edx, [esp + 4]    
	mov   al, [esp + 4 + 4]  
	out   dx, al  
	ret

extern __irq_keyboard_handler
keyboard_handler_irupt_internal:
    pushfd
    pushad
    call    __irq_keyboard_handler
    popad
    popfd
    iret

extern __irq_pagefault_handler
pagefault_handler_irupt_internal:
    pop eax ;Grab error code
    pushad
    pushfd
    push eax
    mov eax, cr2
    push eax
    call __irq_pagefault_handler
    popfd
    popad
    iret

global __kget_pf_handler_addr
__kget_pf_handler_addr:
    mov eax, pagefault_handler_irupt_internal
    ret

extern __irq_protectionfault_handler
gpf_handler_irupt_internal:
    pop eax ;Grab error code
    pushad
    pushfd
    push eax
    mov eax, cr2
    push eax
    call __irq_protectionfault_handler
    popfd
    popad
    iret

global __kget_gpf_handler_addr
__kget_gpf_handler_addr:
    mov eax, gpf_handler_irupt_internal
    ret

extern __irq_doublefault_handler
df_handler_irupt_internal:
    pop eax ;Grab error code
    pushad
    pushfd
    push eax
    mov eax, cr2
    push eax
    call __irq_doublefault_handler
    popfd
    popad
    iret

global __kget_df_handler_addr
__kget_df_handler_addr:
    mov eax, df_handler_irupt_internal
    ret

global __kget_keyboard_handler_addr
__kget_keyboard_handler_addr:
    mov eax, keyboard_handler_irupt_internal
    ret

global __klidt
__klidt:
    mov edx, [esp + 4]
    lidt [edx]
    sti
    ret

global __klgdt
__klgdt:
    mov edx, [esp + 4]
    lgdt [edx]
    jmp   0x08:__klgdt_newcs
__klgdt_newcs:
    mov   ax, 0x10
    mov   ds, ax
    mov   es, ax
    mov   fs, ax
    mov   gs, ax
    mov   ss, ax
    ret

global __khalt
__khalt:
    hlt
    jmp __khalt

global __kgetcs
__kgetcs:
    mov eax, cs
    ret

global __kgetds
__kgetds:
    mov eax, ds
    ret

global __kgetss
__kgetss:
    mov eax, ss
    ret

global __kgetes
__kgetes:
    mov eax, es
    ret

global __kgetfs
__kgetfs:
    mov eax, fs
    ret

global __kgetgs
__kgetgs:
    mov eax, gs
    ret

global __kgeteflags
__kgeteflags:
    pushfd
    pop eax
    ret
 
section .bss
align 32
stack:
    resb STACKSIZE      ; reserve 16k stack on a uint64_t boundary

heap:
	resb 1