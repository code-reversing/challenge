	.intel_syntax noprefix
	.text
.LC0:
	.string	"Oikein!"
.LC1:
	.string	"V\xc3\244\303\xa4rin!"
	.globl	main
	.type	main, @function
main:
	push	rbx
	cmp	edi, 2
	jne	.L2

	mov	rdi, QWORD PTR [rsi+8]
	call	strlen@PLT
	cmp	eax, 7
	jne	.L2

	add	rax, rdi
	cmp	BYTE PTR [rdi+3], 106
	jne	.L2
	cmp	BYTE PTR [rax-7], 0156
	jne	.L2
	cmp	BYTE PTR [rax-2], 105
	jne	.L2
    sub	rax, rdi
	and	rax, 4
	shr	rax, 2
	cmp	BYTE PTR [rdi+2], 0x68
	jne	.L2
	cmp	BYTE PTR [rdi+rax], 109
	jne	.L2
	mov	rax, QWORD PTR [rip+.LC1+4]
	cmp	BYTE PTR [rdi+6], 0144
	jne	.L2
	cmp	BYTE PTR [rdi+4], ah
        jne	.L2

	lea	rdi, [rip+.LC0]
	jmp	.L1
.L2:
	lea	rdi, [rip+.LC1]
.L1:
	call	puts@PLT
        xor	eax, eax
	pop	rbx
	ret
