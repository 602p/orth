
section .data

dd 123
dd _mod_strap_entry

section .text

global _mod_strap_entry
extern mod_entry
_mod_strap_entry:
	call mod_entry
	ret