	.file	"main.c"
	.text
	.globl	add_one
	.def	add_one;	.scl	2;	.type	32;	.endef
	.seh_proc	add_one
add_one:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	$1, -4(%rbp)
	movl	16(%rbp), %edx
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	subl	$20, %eax
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	add
	.def	add;	.scl	2;	.type	32;	.endef
	.seh_proc	add
add:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	16(%rbp), %edx
	movl	24(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %ecx
	call	add_one
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	subl	$20, %eax
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	recursive
	.def	recursive;	.scl	2;	.type	32;	.endef
	.seh_proc	recursive
recursive:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	cmpl	$0, 16(%rbp)
	jne	.L6
	movl	$1, %eax
	jmp	.L7
.L6:
	movl	16(%rbp), %eax
	subl	$1, %eax
	movl	%eax, %ecx
	call	recursive
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	addl	$1, %eax
.L7:
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	c_rerecursive
	.def	c_rerecursive;	.scl	2;	.type	32;	.endef
	.seh_proc	c_rerecursive
c_rerecursive:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	16(%rbp), %eax
	addl	$100, %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %ecx
	call	recursive
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$1200, %eax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	call	__main
	movl	$100, -4(%rbp)
	movl	$200, -8(%rbp)
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %eax
	movl	%eax, %ecx
	call	add
	movl	%eax, -12(%rbp)
	subl	$400, -12(%rbp)
	movl	$0, %eax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 12.4.0"
