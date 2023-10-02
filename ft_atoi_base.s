section .text
global ft_atoi_base

ft_atoi_base:
    cmp rdi, 0
    je error
    cmp rsi, 0
    je error
    mov r8, 0                  ; number
    mov r9, -1                 ; size_base
    mov r15, 1                 ; signo  
    mov r10, -1                ; index rdi (string)
    call check_base            ; return size_base
    call loop_remove_space     ; remove space
    call loop_signo            ; check signo (r15)
    call loop_get_number       ; return number (r8)
    imul r8, r15               ; r8 = r8 * r15 (number * signo)
    mov  rax, r8               ; return r8
    ret

loop_remove_space:
    inc r10
    mov dl, byte[rdi + r10]     ; rdi = string
    cmp dl, 32
        je loop_remove_space    ; dl == ' '
    cmp dl, 9
        jl break                ; dl < 9
    cmp dl, 13
        jg break                ; dl > 13
    jmp loop_remove_space

loop_signo:
    mov dl, byte[rdi + r10]
    cmp dl, '-'
        je less                 ; dl == '-'
    cmp dl, '+'
        je more                 ; dl == '+'
    ret

less:
    imul r15, -1                ; r15 = r15 * -1
    inc r10                     ; r10++
    jmp loop_signo

more:
    imul r15, 1                 ; r15 = r15 * 1
    inc r10                     ; r10++
    jmp loop_signo

check_base:
    inc r9                      ; r9++
    mov dl, byte[rsi + r9]
    cmp dl, 32
        je error                ; dl == ' '
    cmp dl, 9
        je error                ; dl == '\t'
    cmp dl, 10
        je error                ; dl == '\n'
    cmp dl, 11
        je error                ; dl == '\v'
    cmp dl, 12
        je error                ; dl == '\f'
    cmp dl, 13
        je error                ; dl == '\r'
    cmp dl, 43
        je error                ; dl == '+'
    cmp dl, 45
        je error                ; dl == '-'
    cmp dl, 0
        je break                ; dl == '\0'
    jmp check_base

break:
    ret

loop_get_pos:   
    mov al, byte[rsi + r11]     ; rsi = base
    cmp al, 0                   ; 
        je error                ; al == '\0'
    cmp al, dl
        je break                ; al == dl
    inc r11                     ; rax++
    jmp loop_get_pos

loop_get_number:
    mov dl, byte[rdi + r10]     ; rdi = string
    cmp dl, 0
        je break                ; dl == '\0'
    mov r11, 0                  ; r11 = 0
    call loop_get_pos           ; return index
    imul r8, r9                 ; r8 = r8 * r9
    add  r8, r11                ; r8 = r8 + rax
    inc r10                     ; r10++
    jmp loop_get_number

error:
    xor rax, rax                ; return 0
    ret