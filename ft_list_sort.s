section .text
global _ft_list_sort

;void ft_list_sort(t_list **begin_list, int (*cmp)());
_ft_list_sort:
    xor rax, rax        ; rax = 0
    mov r8, rdi         ; r8 = t_list **begin_list
    mov r9, rsi         ; r9 = int (*cmp)();
    mov r10, [r8]       ; r10 = t_list *begin_list 
    jmp loop

loop:
    cmp r10, 0          ; if (begin_list == 0)
    je break            ;     return ;
    mov r11, [r10 + 8]  ; r11 = begin_list->next
    cmp r11, 0          ; if (begin_list->next == 0)
    je break  
    mov rdi, [r10]      ; rdi = begin_list->data
    mov rsi, [r11]      ; rsi = begin_list->next->data
    push r8             ; save begin_list
    push r9
    push r10            ; save begin_list
    push r11            ; save begin_list->next
    call r9             ; cmp(begin_list->data, begin_list->next->data)
    pop r11
    pop r10
    pop r9
    pop r8
    cmp rax, 1          ; < 1
    jl next             ;     next
    mov [r10], rsi      ; begin_list->data = begin_list->next->data
    mov [r11], rdi      ; begin_list->next->data = begin_list->data
    mov r10, [r8] 
    jmp loop            ; loop

next:
    mov r10, r11        ; r10 = begin_list->next
    jmp loop            ; loop

break:
    ret
