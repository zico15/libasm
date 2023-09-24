section .text
global _ft_list_remove_if
extern _free

;int ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(),
;      void (*free_fct)(void *));
_ft_list_remove_if:
    mov r10, rdi            ; r10 = begin_list
    mov r11, rsi            ; r11 = data_ref
    mov r12, rdx            ; r12 = cmp
    mov r13, rcx            ; r13 = free_fct
    mov r14, [r10]          ; rax = *begin_list
    xor r15, r15            ; r15 = NULL
    jmp loop
    ret

loop:
    cmp r14, 0              ; if (begin_list == NULL)
    je break                ;     break
    mov rax, [r14]          ; rax = begin_list->data
    mov rdi, rax            ; rdi = begin_list->data
    mov rsi, r11            ; rsi = data_ref
    call r12                ; cmp(begin_list->data, data_ref)
    cmp rax, 0              ; if (cmp(begin_list->data, data_ref) == 0)
    je free                 ; free(begin_list)
    mov r15, r14            ; r15 = begin_list
    mov r14, [r14 + 8]      ; r14 = begin_list->next
    jmp loop                ; loop

break:
    mov rax, -1
    ret

free_item:
    mov rdi, [r14]          ; rdi = begin_list->data
    call r13                ; free_fct(begin_list)
    mov rdi, r14            ; rdi = begin_list
    mov r14,  [r14 + 8]     ; r14 = begin_list->next
    call _free              ; free(begin_list)
    ret                     ; return  

set_head:
    mov rax,  [r14 + 8]
    mov [r10], rax          ; *begin_list = begin_list->next
    call free_item          ; free_item(begin_list)
    jmp loop                ; loop

free:
    cmp r15, 0              ; if (free_fct == NULL)
    je set_head             ; set_head(begin_list)
    mov rbx, [r14 + 8]      ; rax = begin_list->next
    mov [r15 + 8], rax      ; r15->next = begin_list->next
    call free_item          ; else free_item(begin_list)
    mov r14, rbx            ; r14 = r15->next
    jmp loop                ; loop
