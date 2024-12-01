	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_sum_to_n                       ; -- Begin function sum_to_n
	.p2align	2
_sum_to_n:                              ; @sum_to_n
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	w0, [sp, #12]
	ldr	w8, [sp, #12]
	subs	w8, w8, #0
	cset	w8, gt
	tbnz	w8, #0, LBB0_2
	b	LBB0_1
LBB0_1:
	mov	w8, #0
	str	w8, [sp, #8]                    ; 4-byte Folded Spill
	b	LBB0_3
LBB0_2:
	ldr	w8, [sp, #12]
	ldr	w9, [sp, #12]
	add	w9, w9, #1
	mul	w8, w8, w9
	asr	w8, w8, #1
	str	w8, [sp, #8]                    ; 4-byte Folded Spill
	b	LBB0_3
LBB0_3:
	ldr	w0, [sp, #8]                    ; 4-byte Folded Reload
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
