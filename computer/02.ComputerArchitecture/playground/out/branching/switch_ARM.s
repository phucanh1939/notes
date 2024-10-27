	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	; Allocate 32 bytes on stack for local variable
	; Why 32? we need allocate for 5 int variable (each int is 4 bytes) => total bytes needed = 20
	; stack allocate memories in 16-bytes blocks (in ARM), so we need 2 block => 2x16 = 32 bytes 
	sub	sp, sp, #32

	; Debug info
	.cfi_def_cfa_offset 32
	
	; Bytes from 28th of 32 allocated bytes will not be used and will be set to 0
	; Why from 28 not from 20 (we only need 20 bytes for 5 variable)????
	; #28 - #31: not used and set to 0 (avoid accidental read of uninitialized values)
	; #24 - #27: number - variable
	; #20 - #23: value - variable
	; #16 - #19: x - variable
	; #12 - #15: y - variable
	; #8 - #11: z - variable
	; #4 - #7: temp storage for "number" - variable value that is used for comparasion in switch case block (this temp storage is used for faster accessing the value of "number")
	; #0 - #3: not used, but no need to set to 0 (this address can not be reached)
	str	wzr, [sp, #28]

	; "number" is stored at sp[24] and init with value 4
	mov	w8, #4
	str	w8, [sp, #24]

	; "value" is stored at sp[20] and init with value -1
	mov	w8, #-1
	str	w8, [sp, #20]

	; "x" is stored at sp[16] with value 1000
	mov	w8, #1000
	str	w8, [sp, #16]

	; "y" is stored at sp[12] with value 2000
	mov	w8, #2000
	str	w8, [sp, #12]

	; "z" is stored at sp[8] with value 3000
	mov	w8, #3000
	str	w8, [sp, #8]

	; w8 = sp[24] = number
	ldr	w8, [sp, #24]

	; sp[4] = w8 = number 
	; Store the value of register w8 to sp[4]
	; this sp[4] will used as a temporary storage of number (will be used to compare in switch case)
	; Accessing the value of number from [sp, #4] is faster than from [sp, #24]
	str	w8, [sp, #4]                    ; 4-byte Folded Spill

	; w8 = w8 - 1
	; compare w8 with 1
	subs	w8, w8, #1
	
	; set w8 to 1 if w8 == 1
	cset	w8, eq

	; if 0th bit of w8 is NOT 0 (w8 == 1) jump to LBB0_3
	tbnz	w8, #0, LBB0_3

	; jump to LBB0_1
	b	LBB0_1

; compare value with 2 to jump the case value == 2 block
LBB0_1:
	; w8 = sp[4]
	ldr	w8, [sp, #4]                    ; 4-byte Folded Reload
	
	; compare w8 with 2
	subs	w8, w8, #2

	; w8 = 1 if w8 == 2, otherwise w8 = 0
	cset	w8, eq

	; if 0th bit of w8 is NOT 0 (w8 == 2), jump to LBB4
	tbnz	w8, #0, LBB0_4

	; otherwise jump to LBB0_2
	b	LBB0_2

; compare value with 3 to jump to LBB0_6 block (case value == 3 block)
LBB0_2:
	; w8 = sp[4]
	ldr	w8, [sp, #4]                    ; 4-byte Folded Reload
	
	; compare w8 with 3
	subs	w8, w8, #3

	; w8 = 1 if w8 == 3, else w8 = 0
	cset	w8, eq

	; if 0th bit of w8 is NOT 0 (value == 3) jump to LBB0_5
	tbnz	w8, #0, LBB0_5

	; jump to default case block
	b	LBB0_6

; Block of case value == 1
LBB0_3:
	mov	w8, #100
	str	w8, [sp, #20]
	b	LBB0_7

; Block of case value == 2
LBB0_4:
	mov	w8, #200
	str	w8, [sp, #20]
	b	LBB0_7

; Block of case value == 3
LBB0_5:
	mov	w8, #300
	str	w8, [sp, #20]
	b	LBB0_7

; default case block
LBB0_6:
	; w8 = -1939
	mov	w8, #-1939

	; sp[20] = value = -1939
	str	w8, [sp, #20]

	; jump to return block
	b	LBB0_7

; return block
LBB0_7:
	; w0 = 1 = return value of the main function
	mov	w0, #1

	; deallocate from stack
	add	sp, sp, #32

	; return
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
