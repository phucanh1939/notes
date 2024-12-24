	.text
	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
.set @feat.00, 0
	.file	"test.c"
	.def	test;
	.scl	2;
	.type	32;
	.endef
	.globl	test                            # -- Begin function test
	.p2align	4, 0x90
test:                                   # @test
.seh_proc test
# %bb.0:
	subq	$16, %rsp
	.seh_stackalloc 16
	.seh_endprologue
	movl	56(%rsp), %eax
	movl	%r9d, 12(%rsp)
	movl	%r8d, 8(%rsp)
	movl	%edx, 4(%rsp)
	movl	%ecx, (%rsp)
	movl	(%rsp), %eax
	addl	4(%rsp), %eax
	subl	8(%rsp), %eax
	subl	12(%rsp), %eax
	addl	56(%rsp), %eax
	addq	$16, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	main;
	.scl	2;
	.type	32;
	.endef
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
main:                                   # @main
.seh_proc main
# %bb.0:
	subq	$72, %rsp
	.seh_stackalloc 72
	.seh_endprologue
	movl	$0, 68(%rsp)
	movl	$11, 64(%rsp)
	movl	$22, 60(%rsp)
	movl	$33, 56(%rsp)
	movl	$44, 52(%rsp)
	movl	$55, 48(%rsp)
	movl	48(%rsp), %eax
	movl	52(%rsp), %r9d
	movl	56(%rsp), %r8d
	movl	60(%rsp), %edx
	movl	64(%rsp), %ecx
	movl	%eax, 32(%rsp)
	callq	test
	xorl	%eax, %eax
	addq	$72, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.addrsig
	.addrsig_sym test
