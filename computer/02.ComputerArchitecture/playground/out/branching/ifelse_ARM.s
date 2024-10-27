    .section	__TEXT,__text,regular,pure_instructions
    .build_version macos, 13, 0	sdk_version 13, 3
    .globl	_main                           ; -- Begin function main
    .p2align	2
_main:                                  ; @main
    .cfi_startproc
; %bb.0:

    ; sp is the register contains the pointer that point to the top of the stack
    ; Stack is a part of RAM that is used for managing function calls and local variables
    ; This instruction substract the stack pointer by 16 bytes (point to a lower address)
    ; This action will allocate 16 bytes on stack for local variables
    ; We only have 3 int (x, y, z) with total 12 bytes needed but the CPU allocate 16 bytes on stack . The reason is:
    ; Many CPU architectures, including ARM, require data to be aligned to certain boundaries for performance reasons
    ; The stack pointer is often aligned to 16 bytes to ensure that data access is efficient.
    ; 16 bytes allignment mean allocation will be in a block of 16x (e.g 16, 32, etc.)
    ; Allocating 16 bytes ensures this allignment
    ; x: 8th - 11th bytes
    ; y: 4th - 7th bytes
    ; z: 0th - 3th bytes
    ; 12th - 16th bytes will be filled with zero
    sub	sp, sp, #16

    ; This is not an instruction, this line contains the info metadata for debugger
    .cfi_def_cfa_offset 16

    ; str - store register: Store data from register to memory
    ; Load value 0 from write-zero-register (wzr) to stack memory with address sp + 12 (sp point to the top of the stack)
    ; So 4 bytes (12th - 16th) will be filled with zero
    str	wzr, [sp, #12]

    ; Load value 10 to register w8
    mov	w8, #10

    ; Load value from register w8 to stack memory with offset 8 (8 bytes from the top of the stack) (init x)
    ; 8th - 11th bytes will be filled with value 10
    str	w8, [sp, #8]

    ; Load value 12 to register w8
    mov	w8, #12

    ; Load value from register w8 to stack memory with offset 4 (init y)
    ; 4th - 7th bytes will be filled with value 12
    str	w8, [sp, #4]

    ; Load value 8 to register w8
    mov	w8, #8

    ; Load value from register w8 to stack memory with offset 0 (init z)
    ; 0th - 3th bytes will be filled with value 8
    str	w8, [sp]

    ; ldr - "load register": Load data from memory to register
    ; Load data store at stack with offset 8 (top_of_stack + 8) (x) to register w8
    ; w8 = x
    ldr	w8, [sp, #8]

    ; Load data store at stack with offset 4 (y) to register w9
    ; w9 = y
    ldr	w9, [sp, #4]

    ; w8 = x - y
    ; Then Updates the condition flags in the processor status register follow the subtraction result
    ; - Negative (N): Set if the result is negative.
    ; - Zero (Z): Set if the result is zero.
    ; - Carry (C): Set if there was no borrow in the subtraction (i.e., if the first operand was greater than or equal to the second).
    ; - Overflow (V): Set if the subtraction resulted in an overflow condition.
    subs	w8, w8, w9
    
    ; cset - "condition set":  set the value of a register based on the current state of the condition flags
    ; Set w8 value to 1 if the condtion flags is 'lt' less than (Negative N) (x < y)
    ; Otherwise w8 value will be 0
    cset	w8, lt

    ; tbnz - Test Bit and Branch if Not Zero
    ; tbnz <register>, <bit_position>, <label>
    ; Test bit 0 of w8; if it is not zero, branch to LBB0_2
    ; bit 0 of w8 is zero when (x < y)
    ; Therefor, this instruction means if x < y then jump to LBB0_2 (else block)
    tbnz	w8, #0, LBB0_2

    ; Unconditionally branch to the label LBB0_1
    ; Means jum to if block in case x >= y
    b	LBB0_1

LBB0_1: ; IF BLOCK
    ; Load value 100 to register w8
    ; w8 = 100
    mov	w8, #100
    ; Store value w8 into stack with offset 0 (z variable)
    ; z = w8
    str	w8, [sp]
    ; Jump to LBB0_3 (return block)
    b	LBB0_3
LBB0_2: ; ELSE block
    ; Load value 200 to register w8
    ; w8 = 200
    mov	w8, #200
    ; Store value w8 into stack with offset 0 (z variable)
    ; z = w8
    str	w8, [sp]
    ; Jump to LBB0_3 (return block)
    b	LBB0_3
LBB0_3: ; return block

    # Set the value of register w0 to 0
    # In the context of a function, w0 is typically used to store the return value.
    # the main function return 0, so w0 store 0 as the return value of the main function
    mov	w0, #0

    ; Deallocate 16 bytes from the stack (which allocated for local variable in the main function at the start of the function)
    add	sp, sp, #16
    
    ; return from the function
    ret

    ; Indicate the end of the function for debugging information
    ; Not an instruction
    .cfi_endproc
                                        ; -- End function
.subsections_via_symbols
