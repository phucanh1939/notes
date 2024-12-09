	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_insert_value                   ; -- Begin function insert_value
	.p2align	2
_insert_value:                          ; @insert_value
	.cfi_startproc
; %bb.0:
                                        ; kill: def $w1 killed $w1 def $x1
	cmp	w1, #1
	b.lt	LBB0_5
; %bb.1:
	mov	w1, w1
LBB0_2:                                 ; =>This Inner Loop Header: Depth=1
	sub	x8, x1, #1
	ldr	w9, [x0, w8, uxtw #2]
	cmp	w9, w2
	b.le	LBB0_5
; %bb.3:                                ;   in Loop: Header=BB0_2 Depth=1
	str	w9, [x0, x1, lsl #2]
	add	x9, x8, #1
	mov	x1, x8
	cmp	x9, #1
	b.hi	LBB0_2
; %bb.4:
	mov	w1, #0
LBB0_5:
	str	w2, [x0, w1, sxtw #2]
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_insertion_sort                 ; -- Begin function insertion_sort
	.p2align	2
_insertion_sort:                        ; @insertion_sort
	.cfi_startproc
; %bb.0:
	cmp	w1, #2
	b.lt	LBB1_7
; %bb.1:
	mov	w8, w1
	mov	w9, #1
	b	LBB1_3
LBB1_2:                                 ;   in Loop: Header=BB1_3 Depth=1
	sbfiz	x11, x11, #2, #32
	str	w10, [x0, x11]
	add	x9, x9, #1
	cmp	x9, x8
	b.eq	LBB1_7
LBB1_3:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_4 Depth 2
	ldr	w10, [x0, x9, lsl #2]
	mov	x11, x9
LBB1_4:                                 ;   Parent Loop BB1_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	sub	x12, x11, #1
	ldr	w13, [x0, w12, uxtw #2]
	cmp	w13, w10
	b.le	LBB1_2
; %bb.5:                                ;   in Loop: Header=BB1_4 Depth=2
	str	w13, [x0, x11, lsl #2]
	add	x13, x12, #1
	mov	x11, x12
	cmp	x13, #1
	b.hi	LBB1_4
; %bb.6:                                ;   in Loop: Header=BB1_3 Depth=1
	mov	x11, #0
	b	LBB1_2
LBB1_7:
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3                               ; -- Begin function main
lCPI2_0:
	.long	4                               ; 0x4
	.long	5                               ; 0x5
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Lloh0:
	adrp	x8, ___stack_chk_guard@GOTPAGE
Lloh1:
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
Lloh2:
	ldr	x8, [x8]
Lloh3:
	adrp	x9, l___const.main.arr@PAGE
Lloh4:
	add	x9, x9, l___const.main.arr@PAGEOFF
	stur	x8, [x29, #-8]
	ldr	q0, [x9]
	str	q0, [sp]
	ldr	w8, [x9, #16]
	mov	w9, #7
	str	w8, [sp, #16]
	str	w9, [sp, #8]
Lloh5:
	adrp	x8, lCPI2_0@PAGE
Lloh6:
	ldr	d0, [x8, lCPI2_0@PAGEOFF]
	str	d0, [sp]
	ldr	w8, [sp, #12]
	cmp	w8, #6
	b.gt	LBB2_4
; %bb.1:
	str	w9, [sp, #12]
	ldr	w9, [sp, #4]
	cmp	w9, w8
	b.le	LBB2_5
; %bb.2:
	str	w9, [sp, #8]
	ldr	w10, [sp]
	cmp	w10, w8
	b.le	LBB2_6
; %bb.3:
	mov	x9, #0
	str	w10, [sp, #4]
	b	LBB2_7
LBB2_4:
	mov	w9, #3
	b	LBB2_7
LBB2_5:
	mov	w9, #2
	b	LBB2_7
LBB2_6:
	mov	w9, #1
LBB2_7:
	mov	x10, sp
	bfi	x10, x9, #2, #2
	str	w8, [x10]
	ldur	x8, [x29, #-8]
Lloh7:
	adrp	x9, ___stack_chk_guard@GOTPAGE
Lloh8:
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
Lloh9:
	ldr	x9, [x9]
	cmp	x9, x8
	b.ne	LBB2_9
; %bb.8:
	mov	w0, #0
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
LBB2_9:
	bl	___stack_chk_fail
	.loh AdrpLdr	Lloh5, Lloh6
	.loh AdrpAdd	Lloh3, Lloh4
	.loh AdrpLdrGotLdr	Lloh0, Lloh1, Lloh2
	.loh AdrpLdrGotLdr	Lloh7, Lloh8, Lloh9
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__const
	.p2align	2                               ; @__const.main.arr
l___const.main.arr:
	.long	7                               ; 0x7
	.long	4                               ; 0x4
	.long	5                               ; 0x5
	.long	2                               ; 0x2
	.long	6                               ; 0x6

.subsections_via_symbols
