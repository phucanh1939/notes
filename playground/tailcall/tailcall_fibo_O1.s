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
	cbz	w0, LBB0_3
; %bb.1:
	subs	w0, w19, #1
	b.eq	LBB0_3
; %bb.2:
	bl	_fibonacci_no_tail_call
	mov	x20, x0
	sub	w0, w19, #2
	bl	_fibonacci_no_tail_call
	add	w19, w0, w20
LBB0_3:
	mov	x0, x19
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
	cbz	w0, LBB1_4
; %bb.1:
	subs	w0, w0, #1
	b.ne	LBB1_3
; %bb.2:
	mov	x0, x2
	ret
LBB1_3:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 16
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	add	w8, w2, w1
	mov	x1, x2
	mov	x2, x8
	bl	_fibonacci_tail_call_helper
	mov	x1, x0
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
LBB1_4:
	.cfi_def_cfa wsp, 0
	.cfi_same_value w30
	.cfi_same_value w29
	mov	x0, x1
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_fibonacci_tail_call            ; -- Begin function fibonacci_tail_call
	.p2align	2
_fibonacci_tail_call:                   ; @fibonacci_tail_call
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 16
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w1, #0
	mov	w2, #1
	bl	_fibonacci_tail_call_helper
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
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
	mov	w0, #10
	mov	w1, #0
	mov	w2, #1
	bl	_fibonacci_tail_call_helper
	mov	w0, #1
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
