section .text
global ft_list_remove_if
extern free

;int ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(),
;      void (*free_fct)(void *));
ft_list_remove_if:
    cmp rdi, 0
    je break
    cmp rsi, 0
    je break
    cmp rdx, 0
    je break
    cmp rcx, 0
    je break
    mov r8, [rdi]
    ;mov rdi            ; rdi = begin_list
    ;mov rsi            ; rsi = data_ref
    ;mov rdx            ; rdx = cmp
    ;mov rcx            ; rcx = free_fct
    ;mov r14, [r10]          ; rax = *begin_list
    xor r15, r15            ; r15 = NULL preview
    jmp loop

loop:
    cmp r8, 0              ; if (begin_list == NULL)
    je break                ;     break
    call cmd                ; cmp(begin_list->data, data_ref)
    mov eax, eax
    cmp eax, 0              ; if (cmp(begin_list->data, data_ref) == 0)
    je free_item             ; free(begin_list)
    mov r15, r8             ; r15 = begin_list
    mov r8, [r14 + 8]       ; r14 = begin_list->next
    jmp loop                ; loop

cmd:
    push rdi
    push rsi
    push rdx
    push rcx
    push r8
    mov rdi, [r8]
    call rdx
    pop r8
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    ret

break:
    mov rax, -1
    ret

free_item:
    cmp r15, 0
        jmp set_head
    mov rdi, [r14]          ; rdi = begin_list->data
    call r13                ; free_fct(begin_list)
    mov rdi, r14            ; rdi = begin_list
    mov r14,  [r14 + 8]     ; r14 = begin_list->next
    call free              ; free(begin_list)
    ret                     ; return  

set_head:
    mov rax,  [r14 + 8]
    mov [r10], rax          ; *begin_list = begin_list->next
    call free_item          ; free_item(begin_list)
    jmp loop                ; loop

free:
   
