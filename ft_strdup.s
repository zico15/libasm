section	.text
global	ft_strdup

extern ft_strlen, malloc

ft_strdup:
    call ft_strlen
    inc rax
    jmp ft_malloc

ft_malloc:
        push	rdi						; save src
        mov		rdi, rax
        call	malloc					; rax = malloc(length)
        pop		rdi						; restore src
        cmp		rax, 0
        jz		error
        mov     rcx, 0
        jmp     loop_copy

loop_copy:
    mov     dl, byte[rdi + rcx]
    mov     byte[rax + rcx], dl
    cmp     dl, 0
    je      done
    inc     rcx
    jmp     loop_copy

error:
    xor     rax, rax
    sub    rcx, 1
    ret

done:
    ret

