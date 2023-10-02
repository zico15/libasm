section .text
global ft_list_push_front
extern	malloc

;void ft_list_push_front(t_list **begin_list, void *data);
ft_list_push_front:
    cmp rdi, 0
    je error
    cmp rsi, 0
    je error
    mov rax, 16             ; sizeof(t_list)
    call ft_malloc
    ret

ft_malloc:
    push	rdi				; save begin
    push	rsi				; save data
    mov		rdi, rax
    call	malloc			; malloc(sizeof(t_list))
    pop		rsi
    pop		rdi
    test	rax, rax
    jz		error
    mov		[rax], rsi      ; rax->data = data
    mov		rcx, [rdi]
	mov		[rax + 8], rcx	; rax->next = begin
    mov		[rdi], rax		; *begin = new
    ret

error:
    ret