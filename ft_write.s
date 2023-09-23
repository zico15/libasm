section	.text
global	_ft_write

_ft_write:
            mov		rax, 0x2000004    ; write syscall param: rdi, rsi, rdx
			syscall                   ; call kernel return in rax
			ret
