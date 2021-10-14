.file	"hashtable.c"
	.text
	.globl	max
	.data
	.align 4
	.type	max, @object
	.size	max, 4
max:
	.long	4
	.globl	size
	.bss
	.align 4
	.type	size, @object
	.size	size, 4
size:
	.zero	4
	.comm	array,8,8
	.text
	.globl	hashcode
	.type	hashcode, @function
hashcode:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	max(%rip), %ecx
	movl	-4(%rbp), %eax
	cltd
	idivl	%ecx
	movl	%edx, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	hashcode, .-hashcode
	.section	.rodata
	.align 8
.LC0:
	.string	"Inserting %d(key) and %d(value)\n"
	.align 8
.LC1:
	.string	"Inserting %d(key) and %d(value) \n"
	.text
	.globl	add
	.type	add, @function
add:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	movl	%esi, -40(%rbp)
	movl	-36(%rbp), %eax
	movl	%eax, %edi
	call	hashcode
	movl	%eax, -28(%rbp)
	movq	array(%rip), %rax
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	-36(%rbp), %edx
	movl	%edx, (%rax)
	movq	-16(%rbp), %rax
	movl	-40(%rbp), %edx
	movl	%edx, 4(%rax)
	movq	-16(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-16(%rbp), %rax
	movq	$0, 16(%rax)
	cmpq	$0, -24(%rbp)
	jne	.L4
	movl	-40(%rbp), %edx
	movl	-36(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	array(%rip), %rax
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rax, (%rdx)
	movl	size(%rip), %eax
	addl	$1, %eax
	movl	%eax, size(%rip)
	jmp	.L7
.L4:
	movl	-36(%rbp), %edx
	movq	-24(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	find
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L6
	movl	-40(%rbp), %edx
	movl	-36(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	insert_element
	movl	size(%rip), %eax
	addl	$1, %eax
	movl	%eax, size(%rip)
	jmp	.L7
.L6:
	movq	-8(%rbp), %rax
	movl	-40(%rbp), %edx
	movl	%edx, 4(%rax)
.L7:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	add, .-add
	.globl	find
	.type	find, @function
find:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L9
	movl	$0, %eax
	jmp	.L10
.L9:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, -12(%rbp)
	jne	.L11
	movq	-8(%rbp), %rax
	jmp	.L10
.L11:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, -12(%rbp)
	jge	.L12
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movl	-12(%rbp), %edx
	movl	%edx, %esi
	movq	%rax, %rdi
	call	find
	jmp	.L10
.L12:
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movl	-12(%rbp), %edx
	movl	%edx, %esi
	movq	%rax, %rdi
	call	find
.L10:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	find, .-find
	.globl	insert_element
	.type	insert_element, @function
insert_element:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	(%rax), %edx
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jge	.L14
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L15
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, 8(%rax)
	jmp	.L13
.L15:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	insert_element
	jmp	.L13
.L14:
	movq	-16(%rbp), %rax
	movl	(%rax), %edx
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jle	.L13
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	.L17
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, 16(%rax)
	jmp	.L13
.L17:
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	insert_element
	nop
.L13:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	insert_element, .-insert_element
	.section	.rodata
.LC2:
	.string	"\n array[%d] has no elements \n"
.LC3:
	.string	"\n array[%d] has elements \t"
	.text
	.globl	display
	.type	display, @function
display:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, -12(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L19
.L22:
	movq	array(%rip), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L20
	movl	-12(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L21
.L20:
	movl	-12(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	display_tree
.L21:
	addl	$1, -12(%rbp)
.L19:
	movl	max(%rip), %eax
	cmpl	%eax, -12(%rbp)
	jl	.L22
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	display, .-display
	.section	.rodata
.LC4:
	.string	"key=%d,value=%d \t"
	.text
	.globl	display_tree
	.type	display_tree, @function
display_tree:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L27
	movq	-8(%rbp), %rax
	movl	4(%rax), %edx
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L26
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	display_tree
.L26:
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L23
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	display_tree
	jmp	.L23
.L27:
	nop
.L23:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	display_tree, .-display_tree
	.globl	init
	.type	init, @function
init:
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$0, -4(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L29
.L30:
	movq	array(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	$0, (%rax)
	addl	$1, -4(%rbp)
.L29:
	movl	max(%rip), %eax
	cmpl	%eax, -4(%rbp)
	jl	.L30
	nop
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	init, .-init
	.globl	size_of_hashtable
	.type	size_of_hashtable, @function
size_of_hashtable:
.LFB13:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	size(%rip), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	size_of_hashtable, .-size_of_hashtable
	.section	.rodata
.LC5:
	.string	"\n %d Key not present \n"
.LC6:
	.string	"%d Key not present."
	.align 8
.LC7:
	.string	"%d has been removed form the hash table\n"
	.text
	.globl	delete
	.type	delete, @function
delete:
.LFB14:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	movl	-36(%rbp), %eax
	movl	%eax, %edi
	call	hashcode
	movl	%eax, -20(%rbp)
	movq	array(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L34
	movl	-36(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L37
.L34:
	movl	-36(%rbp), %edx
	movq	-16(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	find
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L36
	movl	-36(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L37
.L36:
	movl	-36(%rbp), %edx
	movq	-16(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	remove_element
	movq	%rax, -16(%rbp)
	movl	-36(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC7(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L37:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	delete, .-delete
	.globl	remove_element
	.type	remove_element, @function
remove_element:
.LFB15:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L39
	movl	$0, %eax
	jmp	.L40
.L39:
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, -28(%rbp)
	jge	.L41
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movl	-28(%rbp), %edx
	movl	%edx, %esi
	movq	%rax, %rdi
	call	remove_element
	movq	-24(%rbp), %rdx
	movq	%rax, 8(%rdx)
	movq	-24(%rbp), %rax
	jmp	.L40
.L41:
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, -28(%rbp)
	jle	.L42
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movl	-28(%rbp), %edx
	movl	%edx, %esi
	movq	%rax, %rdi
	call	remove_element
	movq	-24(%rbp), %rdx
	movq	%rax, 16(%rdx)
	movq	-24(%rbp), %rax
	jmp	.L40
.L42:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L43
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	.L43
	movl	size(%rip), %eax
	subl	$1, %eax
	movl	%eax, size(%rip)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	jmp	.L40
.L43:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L44
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	.L44
	movl	size(%rip), %eax
	subl	$1, %eax
	movl	%eax, size(%rip)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	jmp	.L40
.L44:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L45
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L45
	movl	size(%rip), %eax
	subl	$1, %eax
	movl	%eax, size(%rip)
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	jmp	.L40
.L45:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L46
.L47:
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -8(%rbp)
.L46:
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	.L47
	movq	-8(%rbp), %rax
	movl	(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, (%rax)
	movq	-8(%rbp), %rax
	movl	4(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, 4(%rax)
	movq	-24(%rbp), %rax
	movl	(%rax), %edx
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	remove_element
	movq	-24(%rbp), %rdx
	movq	%rax, 8(%rdx)
	movq	-24(%rbp), %rax
.L40:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	remove_element, .-remove_element
	.section	.rodata
	.align 8
.LC8:
	.string	"Implementation of Hash Table in C chaining with Binary Trees\n"
	.align 8
.LC9:
	.string	"MENU-: \n1.Insert an item in the Hash Table\n2.delete an item from the Hash Table\n3.get the size of Hash Table\n4.Display the contents of Hash Table\n\n Please enter your choice-:"
.LC10:
	.string	"%d"
	.align 8
.LC11:
	.string	"Inserting element in Hash Table"
.LC12:
	.string	"Enter key and value-:\t"
.LC13:
	.string	"%d %d"
	.align 8
.LC14:
	.string	"Deleting item from Hash Table \n Enter the key to delete-:"
.LC15:
	.string	"Size of Hash Table is-:%d\n"
.LC16:
	.string	"Wrong Input"
	.align 8
.LC17:
	.string	"\n Do you want to continue-: (press 1 for yes/0 for no) \t"
	.text
	.globl	main
	.type	main, @function
main:
.LFB16:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	max(%rip), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, array(%rip)
	movl	$0, %eax
	call	init
.L55:
	leaq	.LC8(%rip), %rdi
	call	puts@PLT
	leaq	.LC9(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-28(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC10(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-28(%rbp), %eax
	cmpl	$4, %eax
	je	.L49
	cmpl	$4, %eax
	jg	.L50
	cmpl	$3, %eax
	je	.L51
	cmpl	$3, %eax
	jg	.L50
	cmpl	$1, %eax
	je	.L52
	cmpl	$2, %eax
	je	.L53
	jmp	.L50
.L52:
	leaq	.LC11(%rip), %rdi
	call	puts@PLT
	leaq	.LC12(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-20(%rbp), %rdx
	leaq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-20(%rbp), %edx
	movl	-24(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	add
	jmp	.L54
.L53:
	leaq	.LC14(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC10(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-24(%rbp), %eax
	movl	%eax, %edi
	call	delete
	jmp	.L54
.L51:
	movl	$0, %eax
	call	size_of_hashtable
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC15(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L54
.L49:
	movl	$0, %eax
	call	display
	jmp	.L54
.L50:
	leaq	.LC16(%rip), %rdi
	call	puts@PLT
.L54:
	leaq	.LC17(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC10(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-16(%rbp), %eax
	testl	%eax, %eax
	jne	.L55
	movl	$0, %eax
	call	getch@PLT
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L56
	call	__stack_chk_fail@PLT
.L56:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
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
