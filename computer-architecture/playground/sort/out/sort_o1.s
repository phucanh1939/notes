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
	sxtw	x1, w1
LBB0_2:                                 ; =>This Inner Loop Header: Depth=1
	add	x8, x0, x1, lsl #2
	ldur	w8, [x8, #-4]
	cmp	w8, w2
	b.le	LBB0_6
; %bb.3:                                ;   in Loop: Header=BB0_2 Depth=1
	str	w8, [x0, x1, lsl #2]
	sub	x1, x1, #1
	add	x8, x1, #1
	cmp	x8, #1
	b.gt	LBB0_2
; %bb.4:
	mov	w1, #0
LBB0_5:
	str	w2, [x0, w1, sxtw #2]
	ret
LBB0_6:
                                        ; kill: def $w1 killed $w1 killed $x1 def $x1
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
	b.lt	LBB1_8
; %bb.1:
	mov	x8, #0
	mov	w9, w1
	mov	w10, #1
	b	LBB1_4
LBB1_2:                                 ;   in Loop: Header=BB1_4 Depth=1
	add	x12, x12, #1
LBB1_3:                                 ;   in Loop: Header=BB1_4 Depth=1
	sbfiz	x12, x12, #2, #32
	str	w11, [x0, x12]
	add	x10, x10, #1
	add	x8, x8, #1
	cmp	x10, x9
	b.eq	LBB1_8
LBB1_4:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_5 Depth 2
	ldr	w11, [x0, x10, lsl #2]
	mov	x12, x8
LBB1_5:                                 ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w13, [x0, x12, lsl #2]
	cmp	w13, w11
	b.le	LBB1_2
; %bb.6:                                ;   in Loop: Header=BB1_5 Depth=2
	add	x14, x0, x12, lsl #2
	str	w13, [x14, #4]
	add	x13, x12, #1
	sub	x12, x12, #1
	cmp	x13, #1
	b.gt	LBB1_5
; %bb.7:                                ;   in Loop: Header=BB1_4 Depth=1
	mov	x12, #0
	b	LBB1_3
LBB1_8:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
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
	mov	x8, #0
Lloh0:
	adrp	x9, ___stack_chk_guard@GOTPAGE
Lloh1:
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
Lloh2:
	ldr	x9, [x9]
	stur	x9, [x29, #-8]
Lloh3:
	adrp	x9, l___const.main.arr@PAGE
Lloh4:
	add	x9, x9, l___const.main.arr@PAGEOFF
	ldr	q0, [x9]
	str	q0, [sp]
	ldr	w9, [x9, #16]
	str	w9, [sp, #16]
	mov	w9, #1
	mov	x10, sp
	b	LBB2_3
LBB2_1:                                 ;   in Loop: Header=BB2_3 Depth=1
	add	x12, x12, #1
LBB2_2:                                 ;   in Loop: Header=BB2_3 Depth=1
	sbfiz	x12, x12, #2, #32
	str	w11, [x10, x12]
	add	x9, x9, #1
	add	x8, x8, #1
	cmp	x9, #5
	b.eq	LBB2_7
LBB2_3:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_4 Depth 2
	ldr	w11, [x10, x9, lsl #2]
	mov	x12, x8
LBB2_4:                                 ;   Parent Loop BB2_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w13, [x10, x12, lsl #2]
	cmp	w13, w11
	b.le	LBB2_1
; %bb.5:                                ;   in Loop: Header=BB2_4 Depth=2
	add	x14, x10, x12, lsl #2
	str	w13, [x14, #4]
	add	x13, x12, #1
	sub	x12, x12, #1
	cmp	x13, #1
	b.gt	LBB2_4
; %bb.6:                                ;   in Loop: Header=BB2_3 Depth=1
	mov	x12, #0
	b	LBB2_2
LBB2_7:
	ldur	x8, [x29, #-8]
Lloh5:
	adrp	x9, ___stack_chk_guard@GOTPAGE
Lloh6:
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
Lloh7:
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
	.loh AdrpAdd	Lloh3, Lloh4
	.loh AdrpLdrGotLdr	Lloh0, Lloh1, Lloh2
	.loh AdrpLdrGotLdr	Lloh5, Lloh6, Lloh7
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
