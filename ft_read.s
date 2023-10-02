section	.text
global	ft_read

ft_read:
            mov rax, 0   			  ; read syscall param: rdi, rsi, rdx
			syscall                   ; call kernel return in rax
			ret
