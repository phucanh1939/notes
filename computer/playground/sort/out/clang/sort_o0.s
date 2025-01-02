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
.seh_proc insert_value
# %bb.0:
	subq	$24, %rsp
	.seh_stackalloc 24
	.seh_endprologue
	movl	%r8d, 20(%rsp)				# [rsp + 20] = r8d = value
	movl	%edx, 16(%rsp)				# [rsp + 16] = edx = n
	movq	%rcx, 8(%rsp)				# [rsp + 8] = rcx = arr
	movl	16(%rsp), %eax				# eax = [rsp + 16] = n
	subl	$1, %eax					# eax = eax - 1 = n - 1 = i
	movl	%eax, 4(%rsp)				# [rsp + 4] = i
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	xorl	%eax, %eax					# eax = 0, ZF = 1 (zero flag)
                                        # kill: def $al killed $al killed $eax
	cmpl	$0, 4(%rsp)
	movb	%al, 3(%rsp)                    # 1-byte Spill
	jl	.LBB0_3
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movq	8(%rsp), %rax
	movslq	4(%rsp), %rcx
	movl	(%rax,%rcx,4), %eax
	cmpl	20(%rsp), %eax
	setg	%al
	movb	%al, 3(%rsp)                    # 1-byte Spill
.LBB0_3:                                #   in Loop: Header=BB0_1 Depth=1
	movb	3(%rsp), %al                    # 1-byte Reload
	testb	$1, %al
	jne	.LBB0_4
	jmp	.LBB0_5
.LBB0_4:                                #   in Loop: Header=BB0_1 Depth=1
	movq	8(%rsp), %rax
	movslq	4(%rsp), %rcx
	movl	(%rax,%rcx,4), %edx
	movq	8(%rsp), %rax
	movl	4(%rsp), %ecx
	addl	$1, %ecx
	movslq	%ecx, %rcx
	movl	%edx, (%rax,%rcx,4)
	movl	4(%rsp), %eax
	addl	$-1, %eax
	movl	%eax, 4(%rsp)
	jmp	.LBB0_1
.LBB0_5:
	movl	20(%rsp), %edx
	movq	8(%rsp), %rax
	movl	4(%rsp), %ecx
	addl	$1, %ecx
	movslq	%ecx, %rcx
	movl	%edx, (%rax,%rcx,4)
	addq	$24, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	insertion_sort;
	.scl	2;
	.type	32;
	.endef
	.globl	insertion_sort                  # -- Begin function insertion_sort
	.p2align	4, 0x90
insertion_sort:                         # @insertion_sort

# rcx = arr
# edx = length

.seh_proc insertion_sort
# %bb.0:
	subq	$56, %rsp
	.seh_stackalloc 56
	.seh_endprologue
	movl	%edx, 52(%rsp)				# [rsp + 52] = edx
	movq	%rcx, 40(%rsp)				# [rsp + 40] = rcx
	movl	$1, 36(%rsp)
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	movl	36(%rsp), %eax
	cmpl	52(%rsp), %eax
	jge	.LBB1_4
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	movq	40(%rsp), %rax
	movslq	36(%rsp), %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, 32(%rsp)
	movl	32(%rsp), %r8d
	movl	36(%rsp), %edx
	movq	40(%rsp), %rcx
	callq	insert_value
# %bb.3:                                #   in Loop: Header=BB1_1 Depth=1
	movl	36(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 36(%rsp)
	jmp	.LBB1_1
.LBB1_4:
	addq	$56, %rsp
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
	movq	.L__const.main.arr(%rip), %rax	
	movq	%rax, 48(%rsp)
	movq	.L__const.main.arr+8(%rip), %rax
	movq	%rax, 56(%rsp)
	movl	.L__const.main.arr+16(%rip), %eax
	movl	%eax, 64(%rsp)
	movl	$5, 44(%rsp)
	movl	44(%rsp), %edx
	leaq	48(%rsp), %rcx
	callq	insertion_sort
	xorl	%eax, %eax
	addq	$72, %rsp
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
	.addrsig_sym insert_value
	.addrsig_sym insertion_sort
