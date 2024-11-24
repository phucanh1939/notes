	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	; Allocate 16 bytes in stack for local variables
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16

	; store value 0 from register wzr to stack with offset 12
	; we have 3 local variable as ints (i, sum, length) so the last part of 16 bytes allocated will NOT be used
	; and set to 0 here
	str	wzr, [sp, #12]

	; set value 100 to register w8
	mov	w8, #100

	; store value from register w8 to stack with offset 8 (length = 100)
	str	w8, [sp, #8]

	; store value 0 from register wzr to stack with offset 4 (sum)
	str	wzr, [sp, #4]

	; store value 0 from register wzr to stack with offset 0 (i)
	str	wzr, [sp]

	; jump to LBB0_1
	b	LBB0_1

; This block is checking to enter/exit inner for loop block
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
	; load value from stack pointer to register w8
	; w8 = i
	ldr	w8, [sp]

	; load value from stack with offset 8 to register w9 (sp[8] is length )
	; w9 = length
	ldr	w9, [sp, #8]

	; w8 = w8 - w9
	; Set condition flags base on the subtraction result (result of compare w8 with w9)
	subs	w8, w8, w9

	; Set w8 value to 1 if w8 >= w9 (ge = greater or equal)
	cset	w8, ge

	; test bit 0 of w8, if it not zero (w8 >= w9) jump to LBB04
	; Exit the loop if (i >= length)
	tbnz	w8, #0, LBB0_4

	; Otherwise (i < length), enter the loop
	; jump to LBB0_2
	b	LBB0_2

; This block is the content inside the loop (calculate the sum)
LBB0_2:                                 ;   in Loop: Header=BB0_1 Depth=1
	; load value from sp[4] (sum) to register w8
	; w8 = sum
	ldr	w8, [sp, #4]

	; load value from sp[0] to register w9
	; w9 = i
	ldr	w9, [sp]

	; add
	; sum = sum + i
	add	w8, w8, w9

	; Load value from w8 to sp[4] (load result to sum)
	str	w8, [sp, #4]

	; Jump to next block
	b	LBB0_3

; This block is increasing i after a for loop execution
; i++
LBB0_3:                                 ;   in Loop: Header=BB0_1 Depth=1
	; w8 = i (Load value from sp[0] to w8)
	ldr	w8, [sp]

	; w8 = w8 + 1;
	add	w8, w8, #1

	; i = w8 (load value from w8 to sp[0])
	str	w8, [sp]

	; Jump to the block that checking for enter/exit the loop
	b	LBB0_1

; This block is after the loop
LBB0_4:
	; w0 = 0 (w0 contains return value of the main function which is 0)
	mov	w0, #0

	; Deallocate 16 bytes that allocated for local variables from the begin of main function
	add	sp, sp, #16

	; Return
	ret

	; Debug info (not an instruction)
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
