section .text
global _ft_list_push_front
extern	_malloc

;void ft_list_push_front(t_list **begin_list, void *data);
_ft_list_push_front:
    mov rax, 16             ; sizeof(t_list)
    call malloc
    ret

malloc:
    push	rdi				; save begin
    push	rsi				; save data
    mov		rdi, rax
    call	_malloc			; malloc(sizeof(t_list)
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