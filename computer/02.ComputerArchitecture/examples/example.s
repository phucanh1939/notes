	.file	"example.c"
 # GNU C17 (GCC) version 12.4.0 (x86_64-pc-cygwin)
 #	compiled by GNU C version 12.4.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.27-GMP

 # GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 # options passed: -mtune=generic -march=x86-64
	.text
	.def	__main;	.scl	2;	.type	32;	.endef
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp	 #
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 #,
	.seh_setframe	%rbp, 0
	subq	$48, %rsp	 #,
	.seh_stackalloc	48
	.seh_endprologue
 # example.c:2: int main() {
	call	__main	 #
 # example.c:3:     int x = 1;
	movl	$1, -4(%rbp)	 #, x
 # example.c:4:     int y = x + 1000000000000;
	movl	-4(%rbp), %eax	 # x, x.0_1
	subl	$727379968, %eax	 #, _2
 # example.c:4:     int y = x + 1000000000000;
	movl	%eax, -8(%rbp)	 # _2, y
 # example.c:5:     return 0;
	movl	$0, %eax	 #, _5
 # example.c:6: }
	addq	$48, %rsp	 #,
	popq	%rbp	 #
	ret	
	.seh_endproc
	.ident	"GCC: (GNU) 12.4.0"
