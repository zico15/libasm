section	.text
global	ft_strcpy

ft_strcpy:
    xor     rax, rax
    jmp     loop

loop:
    mov     dl, [rsi + rax]
    mov     byte [rdi + rax], dl
    cmp     dl, 0
    je      done
    inc     rax
    jmp     loop

done:
    mov     rax, rdi
    ret

