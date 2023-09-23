section .text
global _ft_atoi_base

extern _ft_write, _ft_strlen

_ft_atoi_base:
    mov r15, 1                 ; signo  
    mov r8, 0                  ; number
    push rdi                   ; save rdi
    mov rdi, rsi               ; rdi = param 2 base
    call _ft_strlen
    pop rdi                    ; restore rdi
    mov r9, rax                ; base
    mov r10, -1                ; index
    jmp loop_remove_space

loop_remove_space:
    inc r10
    mov dl, byte[rdi + r10]
    cmp dl, 32
        je loop_remove_space ; if
    cmp dl, 9
        je loop_remove_space ; if
    cmp dl, 10
        je loop_remove_space ; if
    cmp dl, 11
        je loop_remove_space ; if
    cmp dl, 12
        je loop_remove_space ; if
    cmp dl, 13
        je loop_remove_space ; if
    jmp loop_signo

loop_signo:
    mov dl, byte[rdi + r10]
    cmp dl, '-'
        je less              ; if
    cmp dl, '+'
        je more             ; if
    jmp loop_base

less:
    imul r15, -1
    inc r10
    jmp loop_signo

more:
    imul r15, 1
    inc r10
    jmp loop_signo

loop_get_pos:
    mov al, byte[rsi + r16]
    cmp al, 0
        je erro             ; if
    cmp al, dl
        je convert
    inc r16
    jmp loop_get_pos

loop_base:
    mov r16, 0
    mov dl, byte[rdi + r10]
    cmp dl, 0
        je done             ; if
    jmp loop_get_pos

convert:
    imul r8, r9             ;
   ; mov rax, r7           ; rax = dl
    ;cqo                     ; prepare for idiv

    ;sub rax, 48            ; rax = rax - 48
    ; convert char to int

   ;mov dl, byte[rsi + rax]       ; number = *base
    ;movzx rax, dl
    ;sub rax, 48   
    add r8, r16            ; number = number + rax
    inc r10
    jmp loop_base

erro:
    xor rax, rax
    ret

done:
    imul r8, r15            ; r8 = r8 * r15 (number * signo)
    mov  rax, r8            ; return r8
    ret