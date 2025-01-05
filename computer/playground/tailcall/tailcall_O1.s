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
    ### check n == 0
    cbz	w0, LBB0_2                  # if n == 0

    ### Tail-call optimization applied 
    ### There is no need to save callee register in this case 

    ### Setup the stack frame
    stp	x29, x30, [sp, #-16]!       # Save FP & LR to [sp - 16] and allocate (sp = sp -16)
    mov	x29, sp                     # FP = sp
    
    ### Setup param for next call
    sub	w8, w0, #1                  # w8 = n -1
    mul	w1, w1, w0                  # w1 = n * acc
    mov	x0, x8                      # w0 = n -1

    ### Call the func
    bl	_factorial_helper

    ### Read the return value to x1
    mov	x1, x0

    # Deallocate & restore FP and LR
    ldp	x29, x30, [sp], #16

##### End function
LBB0_2:
    mov	x0, x1      # Store return value in x0
    ret             # Return

###################################################
# function: factorial_helper(int n, int acc)
###################################################
    .globl	_factorial_with_tail_call       ; -- Begin function factorial_with_tail_call
    .p2align	2
_factorial_with_tail_call:              ; @factorial_with_tail_call
    stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
    mov	x29, sp
    mov	w1, #1
    bl	_factorial_helper
    ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
    ret

###################################################
# function: int factorial_with_tail_call(int n)
###################################################
    .globl	_factorial_no_tail_call         ; -- Begin function factorial_no_tail_call
    .p2align	2
_factorial_no_tail_call:                ; @factorial_no_tail_call
    ### if (n == 0) return 1;
    cbz	w0, LBB2_2
    
    ### Not a tail-call function -> need to save callee-saved register
    ### Save callee-saved registers & allocate stack
    stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
    
    ### Save FP & LR
    stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
    
    ### Point FP to address of FP
    add	x29, sp, #16

    ### return n * factorial_no_tail_call(n - 1); 
    mov	x19, x0         # used x19 to store n
    sub	w0, w0, #1      # w0 = n - 1

    ### Call the function factorial_no_tail_call(n - 1)
    bl	_factorial_no_tail_call

    mul	w0, w0, w19     # w0 = w19 * w0 = n * factorial_no_tail_call(n - 1)
    
    ### Restore FP, LR
    ldp	x29, x30, [sp, #16]

    ### Restore callee-saved registers & deallocate
    ldp	x20, x19, [sp], #32

    ### return
    ret
##### Return for special case
LBB2_2:
    mov	w0, #1
    ret

###################################################
# function: int main()
###################################################
    .globl	_main                           ; -- Begin function main
    .p2align	2
_main:                                  ; @main
    stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
    mov	x29, sp
    mov	w0, #10
    bl	_factorial_no_tail_call
    mov	w0, #10
    mov	w1, #1
    bl	_factorial_helper
    mov	w0, #1
    ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
    ret
.subsections_via_symbols
