	.file	"CS21_Set2_Q35.c"
	.text
	.section	.rodata
.LC0:
	.string	"Value at index %d is %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB15:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	$0, -28(%rbp)
	movl	$16, %edi
	call	malloc@PLT
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rax
	movl	-28(%rbp), %edx
	movl	%edx, (%rax)
	movl	$1, -28(%rbp)
.L3:
	cmpl	$3, -28(%rbp)
	jg	.L2
	movl	$16, %edi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movl	-28(%rbp), %edx
	movl	%edx, (%rax)
	movq	-8(%rbp), %rax
	movq	%rax, -24(%rbp)
	addl	$1, -28(%rbp)
	jmp	.L3
.L2:
	movl	$0, -28(%rbp)
.L5:
	cmpl	$2, -28(%rbp)
	jg	.L4
	movq	-16(%rbp), %rax
	movl	(%rax), %edx
	movl	-28(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	movl	-28(%rbp), %edx
	leal	1(%rdx), %ecx
	movl	%eax, %edx
	movl	%ecx, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -28(%rbp)
	jmp	.L5
.L4:
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
