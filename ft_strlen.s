section	.text
global	_ft_strlen

_ft_strlen:
			mov		rax, 0			; set rax to 0
			jmp		loop

loop:
			cmp		BYTE [rdi + rax], 0	;  BYTE[rax] == 0
			je		done	            ; if so, return
            inc		rax	                ; rax++
            jmp     loop
done:
            ret

