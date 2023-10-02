section	.text
global	ft_write

ft_write:
		mov rax, 1             ; syscall number for sys_write (1)
		mov rdi, rdi           ; file descriptor (passed in rdi)
		mov rsi, rsi           ; pointer to buffer (passed in rsi)
		mov rdx, rdx           ; buffer size (passed in rdx)
		syscall                ; invoke the syscall
		mov rax, rdx
		ret