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
	jg	.LBB0_2
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
	jg	.LBB1_3
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
	movaps	.L__const.main.arr(%rip), %xmm0
	movaps	%xmm0, (%rsp)
	movl	$6, 16(%rsp)
	movl	$1, %eax
	jmp	.LBB2_1
	.p2align	4, 0x90
.LBB2_4:                                #   in Loop: Header=BB2_1 Depth=1
	xorl	%edx, %edx
.LBB2_5:                                #   in Loop: Header=BB2_1 Depth=1
	movslq	%edx, %rdx
	movl	%ecx, (%rsp,%rdx,4)
	incq	%rax
	cmpq	$5, %rax
	je	.LBB2_6
.LBB2_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_2 Depth 2
	movl	(%rsp,%rax,4), %ecx
	movq	%rax, %rdx
	.p2align	4, 0x90
.LBB2_2:                                #   Parent Loop BB2_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-4(%rsp,%rdx,4), %r8d
	cmpl	%ecx, %r8d
	jle	.LBB2_5
# %bb.3:                                #   in Loop: Header=BB2_2 Depth=2
	movl	%r8d, (%rsp,%rdx,4)
	decq	%rdx
	leaq	1(%rdx), %r8
	cmpq	$1, %r8
	jg	.LBB2_2
	jmp	.LBB2_4
.LBB2_6:
	xorl	%eax, %eax
	addq	$24, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.section	.rdata,"dr"
	.p2align	4, 0x0                          # @__const.main.arr
.L__const.main.arr:
	.long	7                               # 0x7
	.long	4                               # 0x4
	.long	5                               # 0x5
	.long	2                               # 0x2
	.long	6                               # 0x6

	.addrsig
