section .text
global ft_list_size

;int ft_list_size(t_list *begin_list);
ft_list_size:
    mov rax, -1

loop:
    inc rax
    cmp rdi, 0
    je done
    mov rdi, [rdi + 8]
    jmp loop

done:
    ret
  