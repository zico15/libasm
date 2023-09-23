section	.text
global	_ft_strcmp

_ft_strcmp:
			xor     rax, rax
            mov     r9, 0
			jmp		loop

loop:
            movzx     rax, byte[rdi + r9]     ; s1
            movzx     rcx, byte[rsi + r9]     ; s2
            cmp     rax, rcx                  ; s1 == s2
            jne      done                     ; else return rax
            cmp     rax, 0                    ; s1 == 0
            je      done
            cmp     rcx, 0                    ; s2 == 0
            je      done
            inc     r9
            jmp     loop

done:
            sub rax, rcx
            cmp rax, 0
            jg more
            jl less
            ret

more:
            mov rax, 1
            ret

less:
            mov rax, -1
            ret
