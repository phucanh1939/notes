	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_fibonacci_no_tail_call         ; -- Begin function fibonacci_no_tail_call
	.p2align	2
_fibonacci_no_tail_call:                ; @fibonacci_no_tail_call
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	cmp	w0, #2
	b.hs	LBB0_2
; %bb.1:
	mov	w20, #0
	b	LBB0_4
LBB0_2:
	mov	w20, #0
LBB0_3:                                 ; =>This Inner Loop Header: Depth=1
	sub	w0, w19, #1
	bl	_fibonacci_no_tail_call
	sub	w19, w19, #2
	add	w20, w0, w20
	cmp	w19, #1
	b.hi	LBB0_3
LBB0_4:
	add	w0, w19, w20
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_fibonacci_tail_call_helper     ; -- Begin function fibonacci_tail_call_helper
	.p2align	2
_fibonacci_tail_call_helper:            ; @fibonacci_tail_call_helper
	.cfi_startproc
; %bb.0:
	cbz	w0, LBB1_3
LBB1_1:                                 ; =>This Inner Loop Header: Depth=1
	subs	w0, w0, #1
	b.eq	LBB1_4
; %bb.2:                                ;   in Loop: Header=BB1_1 Depth=1
	add	w8, w2, w1
	mov	x1, x2
	mov	x2, x8
	cbnz	w0, LBB1_1
LBB1_3:
	mov	x2, x1
LBB1_4:
	mov	x0, x2
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_fibonacci_tail_call            ; -- Begin function fibonacci_tail_call
	.p2align	2
_fibonacci_tail_call:                   ; @fibonacci_tail_call
	.cfi_startproc
; %bb.0:
	mov	x8, x0
	mov	w0, #0
	mov	w9, #1
	cbz	w8, LBB2_3
LBB2_1:                                 ; =>This Inner Loop Header: Depth=1
	subs	w8, w8, #1
	b.eq	LBB2_4
; %bb.2:                                ;   in Loop: Header=BB2_1 Depth=1
	add	w10, w9, w0
	mov	x0, x9
	mov	x9, x10
	cbnz	w8, LBB2_1
LBB2_3:
	ret
LBB2_4:
	mov	x0, x9
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 16
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w0, #10
	bl	_fibonacci_no_tail_call
	mov	w0, #1
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
