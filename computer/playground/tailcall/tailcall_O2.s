	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4                               ; -- Begin function factorial_helper
lCPI0_0:
	.long	0                               ; 0x0
	.long	4294967295                      ; 0xffffffff
	.long	4294967294                      ; 0xfffffffe
	.long	4294967293                      ; 0xfffffffd
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_factorial_helper
	.p2align	2
_factorial_helper:                      ; @factorial_helper
	.cfi_startproc
; %bb.0:
	cbz	w0, LBB0_7
; %bb.1:
	cmp	w0, #16
	b.hs	LBB0_3
; %bb.2:
	mov	x8, x0
	b	LBB0_6
LBB0_3:
	movi.4s	v0, #1
	movi.4s	v1, #1
	mov.s	v1[0], w1
	dup.4s	v2, w0
Lloh0:
	adrp	x8, lCPI0_0@PAGE
Lloh1:
	ldr	q3, [x8, lCPI0_0@PAGEOFF]
	add.4s	v2, v2, v3
	and	w9, w0, #0xfffffff0
	and	w8, w0, #0xf
	mvni.4s	v3, #3
	mvni.4s	v4, #7
	mvni.4s	v5, #11
	mvni.4s	v6, #15
	mov	x10, x9
	movi.4s	v7, #1
	movi.4s	v16, #1
LBB0_4:                                 ; =>This Inner Loop Header: Depth=1
	add.4s	v17, v2, v3
	add.4s	v18, v2, v4
	add.4s	v19, v2, v5
	mul.4s	v1, v1, v2
	mul.4s	v0, v0, v17
	mul.4s	v7, v7, v18
	mul.4s	v16, v16, v19
	add.4s	v2, v2, v6
	subs	w10, w10, #16
	b.ne	LBB0_4
; %bb.5:
	mul.4s	v0, v0, v1
	mul.4s	v0, v7, v0
	mul.4s	v0, v16, v0
	ext.16b	v1, v0, v0, #8
	mul.2s	v0, v0, v1
	fmov	w10, s0
	mov.s	w11, v0[1]
	mul	w1, w10, w11
	cmp	w9, w0
	b.eq	LBB0_7
LBB0_6:                                 ; =>This Inner Loop Header: Depth=1
	mul	w1, w1, w8
	subs	w8, w8, #1
	b.ne	LBB0_6
LBB0_7:
	mov	x0, x1
	ret
	.loh AdrpLdr	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4                               ; -- Begin function factorial_with_tail_call
lCPI1_0:
	.long	0                               ; 0x0
	.long	4294967295                      ; 0xffffffff
	.long	4294967294                      ; 0xfffffffe
	.long	4294967293                      ; 0xfffffffd
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_factorial_with_tail_call
	.p2align	2
_factorial_with_tail_call:              ; @factorial_with_tail_call
	.cfi_startproc
; %bb.0:
	cbz	w0, LBB1_3
; %bb.1:
	cmp	w0, #16
	b.hs	LBB1_4
; %bb.2:
	mov	w8, #1
	mov	x9, x0
	b	LBB1_7
LBB1_3:
	mov	w0, #1
	ret
LBB1_4:
	dup.4s	v0, w0
Lloh2:
	adrp	x8, lCPI1_0@PAGE
Lloh3:
	ldr	q1, [x8, lCPI1_0@PAGEOFF]
	add.4s	v1, v0, v1
	movi.4s	v0, #1
	mvni.4s	v2, #3
	and	w10, w0, #0xfffffff0
	and	w9, w0, #0xf
	mvni.4s	v3, #7
	mvni.4s	v4, #11
	mvni.4s	v5, #15
	mov	x8, x10
	movi.4s	v6, #1
	movi.4s	v7, #1
	movi.4s	v16, #1
LBB1_5:                                 ; =>This Inner Loop Header: Depth=1
	add.4s	v17, v1, v2
	add.4s	v18, v1, v3
	add.4s	v19, v1, v4
	mul.4s	v0, v1, v0
	mul.4s	v6, v17, v6
	mul.4s	v7, v18, v7
	mul.4s	v16, v19, v16
	add.4s	v1, v1, v5
	subs	w8, w8, #16
	b.ne	LBB1_5
; %bb.6:
	mul.4s	v0, v6, v0
	mul.4s	v0, v7, v0
	mul.4s	v0, v16, v0
	ext.16b	v1, v0, v0, #8
	mul.2s	v0, v0, v1
	fmov	w8, s0
	mov.s	w11, v0[1]
	mul	w8, w8, w11
	cmp	w10, w0
	b.eq	LBB1_8
LBB1_7:                                 ; =>This Inner Loop Header: Depth=1
	mul	w8, w9, w8
	subs	w9, w9, #1
	b.ne	LBB1_7
LBB1_8:
	mov	x0, x8
	ret
	.loh AdrpLdr	Lloh2, Lloh3
	.cfi_endproc

###################################################
# function: int factorial_with_tail_call(int n)
###################################################
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4                               ; -- Begin function factorial_no_tail_call
lCPI2_0:
	.long	0                               ; 0x0
	.long	4294967295                      ; 0xffffffff
	.long	4294967294                      ; 0xfffffffe
	.long	4294967293                      ; 0xfffffffd
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_factorial_no_tail_call
	.p2align	2
_factorial_no_tail_call:                ; @factorial_no_tail_call
	cbz	w0, LBB2_3
	cmp	w0, #16
	b.hs	LBB2_4
	mov	w8, #1
	mov	x9, x0
	b	LBB2_7
LBB2_3:
	mov	w0, #1
	ret
LBB2_4:
	dup.4s	v0, w0
Lloh4:
	adrp	x8, lCPI2_0@PAGE
Lloh5:
	ldr	q1, [x8, lCPI2_0@PAGEOFF]
	add.4s	v1, v0, v1
	movi.4s	v0, #1
	mvni.4s	v2, #3
	and	w10, w0, #0xfffffff0
	and	w9, w0, #0xf
	mvni.4s	v3, #7
	mvni.4s	v4, #11
	mvni.4s	v5, #15
	mov	x8, x10
	movi.4s	v6, #1
	movi.4s	v7, #1
	movi.4s	v16, #1
LBB2_5:                                 ; =>This Inner Loop Header: Depth=1
	add.4s	v17, v1, v2
	add.4s	v18, v1, v3
	add.4s	v19, v1, v4
	mul.4s	v0, v1, v0
	mul.4s	v6, v17, v6
	mul.4s	v7, v18, v7
	mul.4s	v16, v19, v16
	add.4s	v1, v1, v5
	subs	w8, w8, #16
	b.ne	LBB2_5
; %bb.6:
	mul.4s	v0, v6, v0
	mul.4s	v0, v7, v0
	mul.4s	v0, v16, v0
	ext.16b	v1, v0, v0, #8
	mul.2s	v0, v0, v1
	fmov	w8, s0
	mov.s	w11, v0[1]
	mul	w8, w8, w11
	cmp	w10, w0
	b.eq	LBB2_8
LBB2_7:                                 ; =>This Inner Loop Header: Depth=1
	mul	w8, w9, w8
	subs	w9, w9, #1
	b.ne	LBB2_7
LBB2_8:
	mov	x0, x8
	ret
	.loh AdrpLdr	Lloh4, Lloh5
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	mov	w0, #1
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
