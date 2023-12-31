section .text
global ft_list_sort

;void ft_list_sort(t_list **begin_list, int (*cmp)());
ft_list_sort:
    mov r8, [rdi]           ;   (*list)  
    mov r13, [rdi]  
    jmp ft_loop

ft_loop:
    xor rax, rax
    cmp r8, 0
    je break
    mov r9, [r8 + 8]        ;   (*list->next)
    cmp r9, 0
    je break
    call ft_cmp
    mov eax, eax ;
    cmp eax, 1
    jl ft_next
    mov r14, [r8]
    mov r15, [r9]
    mov [r8], r15
    mov [r9], r14
    mov r8, [rdi]
    jmp ft_loop

ft_cmp:
    push rdi
    push rsi
    push r8
    push r9
    mov r10, rsi            ;   cmp
    mov rdi, [r8]
    mov rsi, [r9]
    call r10
    pop r9
    pop r8
    pop rsi
    pop rdi
    ret
    

ft_next:
    mov r8, r9
    jmp ft_loop

break:
    ret

tes:
    mov rax, 7
    ret
