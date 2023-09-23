section	.text
global	_ft_read

_ft_read:
            mov		rax, 0x2000003    ; read syscall param: rdi, rsi, rdx
			syscall                   ; call kernel return in rax
			ret
