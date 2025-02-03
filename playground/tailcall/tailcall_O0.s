###################################################
# Header
###################################################
    .section	__TEXT,__text,regular,pure_instructions
    .build_version macos, 13, 0	sdk_version 13, 3

###################################################
# function: factorial_helper(int n, int acc)
###################################################
    .globl	_factorial_helper
    .p2align	2
_factorial_helper:
    ### Setup stack frame
    sub	sp, sp, #32
    stp	x29, x30, [sp, #16]
    add	x29, sp, #16

    ### Store params on stack
    str	w0, [sp, #8]            # sp[8] = w0 = n
    str	w1, [sp, #4]            # sp[4] = w1 = acc

    ### Load first param to calculate (n)
    ldr	w8, [sp, #8]            # w8 = sp[8] = n

    ### if (n == 0) return acc;
    subs	w8, w8, #0          # w8 = n - 0
    cset	w8, ne              # w8 = 1 if w8 != 0 (n != 0, Z flag clear) 
    tbnz	w8, #0, LBB0_2      # branch to LBB0_2 if 0th bit of w8 not zero (w8 != 0) (n != 0)
    b	LBB0_1                  # branch to LBB0_1 (n = 0)

##### Block: if (n == 0) return acc;
LBB0_1:
    ldr	w8, [sp, #4]            # Load acc (2nd param) from stack to w8
    stur w8, [x29, #-4]         # Store w8 (as return value) to [FP-4]
    b	LBB0_3                  # Branch to end function block

##### Block: return factorial_helper(n - 1, n * acc);
LBB0_2:
    ### Setup param 1 for next function call (n-1)
    ldr	w8, [sp, #8]            # Load n (param) from stack
    subs w0, w8, #1             # Setup next call param (n-1) on w0
    
    ### Setup param 2 for next function call (n * acc)
    ldr	w8, [sp, #8]            # w8 = sp[8] = n
    ldr	w9, [sp, #4]            # w9 = sp[4] = acc
    mul	w1, w8, w9              # w1 = w8 * w9 = n * acc

    ### Call the function
    bl	_factorial_helper

    ### End function
    stur	w0, [x29, #-4]      # Take return value [from FP-4]
    b	LBB0_3                  # Jump to end block

##### Block: end function
LBB0_3:
    ldur w0, [x29, #-4]         # Load return value from stack to w0
    ldp	x29, x30, [sp, #16]     # Restore saved registers (FP, LR)
    add	sp, sp, #32             # Deallocate
    ret                         # Jump to return address


###################################################
# function: int factorial_with_tail_call(int n)
###################################################
    .globl	_factorial_with_tail_call
    .p2align	2
_factorial_with_tail_call:
    ### Allocate, setup stack frame, save register
    sub	sp, sp, #32
    stp	x29, x30, [sp, #16]
    add	x29, sp, #16

    ### Save the w0 (n) to stack (using FP), before calling a function
    stur	w0, [x29, #-4]

    ### Setup function params
    ldur w0, [x29, #-4] # First param (n)
    mov	w1, #1          # Second param (1)

    ### Call the helper function
    ### This function will write return value to w0, no need to change anything after that, just need to jump back with LR
    bl	_factorial_helper

    ### Restore register values, deallocate
    ldp	x29, x30, [sp, #16]
    add	sp, sp, #32

    ### Return
    ret

###################################################
# function: int factorial_no_tail_call(int n)
###################################################
    .globl	_factorial_no_tail_call
    .p2align	2
_factorial_no_tail_call:
    # ------------------------------------------
    # SETUP STACK FRAME

    # Allocate 32 bytes on stacks for
    # - Saved FP and LR (last 16 bytes)
    # - Local variable (16 bytes)
    sub	sp, sp, #32             # sp = sp + 32
    stp	x29, x30, [sp, #16]     # sp[16] = x29, sp[24] = x30
    add	x29, sp, #16            # x29 = sp + 16

    # Read the argument
    str	w0, [sp, #8]            # sp[8] = w0 = n: store the param on stack
    ldr	w8, [sp, #8]            # w8 = sp[8] = n

    # if (n == 0) return 1;
    subs	w8, w8, #0          # w8 = w8 - 0 (and update condition flag)
    cset	w8, ne              # w8 = 1 if Z flag is clear (the result of the last operation was non-zero, or w8 != 0, n != 0)
    tbnz	w8, #0, LBB2_2      # Test w8 0th bit (rightmost bit). if not zero, branch to LBB2_2 (if w8 != 0, branch to LBB2_2)
    b	LBB2_1                  # Otherwise branch to LBB2_1 (which is return 1)

### return 1;
LBB2_1:
    mov	w8, #1                  # w8 = 1
    stur w8, [x29, #-4]         # sp[12-15] = w8 = 1
    b	LBB2_3                  # branch to LBB2_3 (end function block)

### return n * factorial_no_tail_call(n - 1); 
LBB2_2:
    ### --- Save param register values onto stack before calling another function
    ldr	w8, [sp, #8]               # w8 = sp[8] = n, read the param from stack
    str	w8, [sp, #4]               # sp[4] = w8 = n, saved it on stack before calling another function

    ### ---- Calculate and setup the param for next function call
    ldr	w8, [sp, #8]               # w8 = sp[8] = n
    subs w0, w8, #1                # w0 = w8 - 1 = n - 1, param for next call factorial_no_tail_call(n - 1)

    ### ---- Call the func
    bl	_factorial_no_tail_call

    ### ---- Restore the saved param value from stack
    ldr	w8, [sp, #4]               # w8 = sp[4] = n

    ### ---- Calculate final result factorial_no_tail_call(n - 1)
    ### ---- w0 now store result of above call 
    mul	w8, w8, w0                  # w8 = w8 * w0 = n * factorial_no_tail_call(n - 1)
    stur w8, [x29, #-4]             # Store return value to stack (FP - 4)
    b	LBB2_3                      # End function

### end function
LBB2_3:
    ldur w0, [x29, #-4]         # w0 = sp[12-14] = 1
    ldp	x29, x30, [sp, #16]     # Load saved FP and LR back from stack
    add	sp, sp, #32             # Deallocate
    ret                         # Return (jump to LR)

###################################################
# function: int main()
###################################################
    .globl	_main
    .p2align	2
_main:
    # ------------------------------------------
    # SETUP THE STACK FRAME

    # Allocate 32 bytes on stack: 
    # - 0-16th bytes will be used for local variable
    # - 16-31 bytes will be used to save value of FP and LR
    sub sp, sp, #32

    # Save value of FP and LR on stack (to store latter)
    # SP[16-23] = FP and SP[24-31] = LR
    stp x29, x30, [sp, #16]

    # FP = SP + 16 (Addess of saved FP)
    # FP points to saved FP
    # -----> WHY ?????
    # This mark the end of frame for this function
    # The variables/address on stack frame of this function will be pointed by FP - x
    # Ex. FP - 4 => 4 bytes before FP used to store return value of function on stack
    add x29, sp, #16                    

    # SP[12-15] = 0
    # Zero 4 bytes before FP
    # ------> WHY ?????
    # sp[12-15] is used to store the return value of a function (on stack) before it is loaded to w0 (return value register)
    # See _factorial_no_tail_call for example
    # All branch in _factorial_no_tail_call will store return value in this sp[12-15]
    # Then at the return block, sp[12-15] value will be loaded to w0 before the function exit
    stur wzr, [x29, #-4]

    # ------------------------------------------
    # FUNCTION CONTENT

    # w8 = 10 (n = 10)
    mov	w8, #10

    # sp[8-11] = w8 ( = n = 10 )
    str	w8, [sp, #8]

    # w0 = sp[8-11] = n = 10
    # Setup argument for function _factorial_no_tail_call
    ldr	w0, [sp, #8]

    # Branch and link to _factorial_no_tail_call
    # And store return address in x30
    bl	_factorial_no_tail_call

    # sp[4-7] = w0
    # w0 store return value of above function call
    # x = return_value_of _factorial_no_tail_call
    str	w0, [sp, #4]

    # w0 = sp[8-11] = n
    # Setup argument for function call _factorial_with_tail_call
    ldr	w0, [sp, #8]
    
    # Branch and link to _factorial_with_tail_call
    # And store return address in x30
    bl	_factorial_with_tail_call

    # sp[0-3] = w0
    # y = return value of _factorial_with_tail_call
    str	w0, [sp]

    # w0 = 1
    # Return value of main
    mov	w0, #1

    # ------------------------------------------
    # CLEAR STACK FRAME
    ldp	x29, x30, [sp, #16]             # Load back the saved value of FP and LR
    add	sp, sp, #32                     # Deallocate 32 bytes on stack

    # ------------------------------------------
    # return of main
    ret
.subsections_via_symbols
