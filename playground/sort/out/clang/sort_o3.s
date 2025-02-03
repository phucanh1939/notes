	.text
	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
.set @feat.00, 0
	.file	"sort.c"
	.def	insert_value;
	.scl	2;
	.type	32;
	.endef
	.globl	insert_value                    # -- Begin function insert_value
	.p2align	4, 0x90
insert_value:                           # @insert_value
# %bb.0:
                                        # kill: def $edx killed $edx def $rdx
	testl	%edx, %edx
	jle	.LBB0_5
# %bb.1:
	movl	%edx, %edx
	.p2align	4, 0x90
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	movl	-4(%rcx,%rdx,4), %eax
	cmpl	%r8d, %eax
	jle	.LBB0_5
# %bb.3:                                #   in Loop: Header=BB0_2 Depth=1
	movl	%eax, (%rcx,%rdx,4)
	decq	%rdx
	leaq	1(%rdx), %rax
	cmpq	$1, %rax
	ja	.LBB0_2
# %bb.4:
	xorl	%edx, %edx
.LBB0_5:
	movslq	%edx, %rax
	movl	%r8d, (%rcx,%rax,4)
	retq
                                        # -- End function
	.def	insertion_sort;
	.scl	2;
	.type	32;
	.endef
	.globl	insertion_sort                  # -- Begin function insertion_sort
	.p2align	4, 0x90
insertion_sort:                         # @insertion_sort
# %bb.0:
	cmpl	$2, %edx
	jl	.LBB1_7
# %bb.1:
	movl	%edx, %eax
	movl	$1, %edx
	jmp	.LBB1_2
	.p2align	4, 0x90
.LBB1_5:                                #   in Loop: Header=BB1_2 Depth=1
	xorl	%r9d, %r9d
.LBB1_6:                                #   in Loop: Header=BB1_2 Depth=1
	movslq	%r9d, %r9
	movl	%r8d, (%rcx,%r9,4)
	incq	%rdx
	cmpq	%rax, %rdx
	je	.LBB1_7
.LBB1_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_3 Depth 2
	movl	(%rcx,%rdx,4), %r8d
	movq	%rdx, %r9
	.p2align	4, 0x90
.LBB1_3:                                #   Parent Loop BB1_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-4(%rcx,%r9,4), %r10d
	cmpl	%r8d, %r10d
	jle	.LBB1_6
# %bb.4:                                #   in Loop: Header=BB1_3 Depth=2
	movl	%r10d, (%rcx,%r9,4)
	decq	%r9
	leaq	1(%r9), %r10
	cmpq	$1, %r10
	ja	.LBB1_3
	jmp	.LBB1_5
.LBB1_7:
	retq
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
	subq	$24, %rsp
	.seh_stackalloc 24
	.seh_endprologue
	movl	$4, (%rsp)
	movl	$7, 16(%rsp)
	movl	$5, 20(%rsp)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_1
# %bb.2:
	movl	$5, %eax
	movl	%eax, 16(%rsp)
	movl	(%rsp), %eax
	cmpl	$3, %eax
	jl	.LBB2_3
# %bb.4:
	movl	%eax, 20(%rsp)
	movq	%rsp, %rax
	jmp	.LBB2_5
.LBB2_1:
	leaq	16(%rsp), %rax
	jmp	.LBB2_5
.LBB2_3:
	leaq	20(%rsp), %rax
.LBB2_5:
	movl	$2, (%rax)
	xorl	%eax, %eax
	addq	$24, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.addrsig
