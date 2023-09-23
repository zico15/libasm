section	.text
global	_ft_strdup

extern _ft_strlen, _malloc

_ft_strdup:
    call _ft_strlen
    inc rax
    jmp ft_malloc

ft_malloc:
        push	rdi						; save src
        mov		rdi, rax
        call	_malloc					; rax = _malloc(length)
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

