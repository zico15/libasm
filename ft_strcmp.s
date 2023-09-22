section	.text
global	_ft_strcmp

_ft_strcmp:
			xor     rax, rax
			jmp		loop
loop:
            mov     dl, [rdi + rax]     ; s1
            cmp     dl, [rsi + rax]
            je      done
            ;cmp     al, 0
            ;je      done
            inc     rax
            jmp     loop

compare:
            mov     al, [rdi]           ; s1
            mov     dl, [rsi]          ; s2
            cmp     al, dl
            je      loop
            ;cmp		rdi, rcx	;  BYTE[rax] == 0
            ;je      loop			; if equal,
            ;mov     rax , 
            ret                ; return rax

done:
            mov rcx, [rsi + rax]
            mov rax, [rdi + rax]
            sub rax, rcx
            cmp rax, 0
            jg maior
            jl menor
            ret

maior:
            mov rax, -1
            ret

menor:
            mov rax, 1
            ret
