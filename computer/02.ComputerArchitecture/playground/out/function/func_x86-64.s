# This is x86-64 assembly code
# In x86-64,
# eax: Store return value of the function
# ecx: store 1st argument
# edx: store 2nd argument
# r8d: store 3rd argument
# r9d: store 4th argument


.file   "func.cpp"                            # Source file name
.text                                      # Begin text (code) section
.globl  _Z12do_somethingiiii                # Declare the function as global
.def    _Z12do_somethingiiii;                # Define the function symbol
.scl    2;                                  # Function symbol scope (2 = global)
.type   32;                                 # Function type (32 = function)
.endef                                      # End of function symbol definition
.seh_proc _Z12do_somethingiiii              # Begin SEH (Structured Exception Handling) for this function
_Z12do_somethingiiii:                       # Function label (name mangled for C++)
.LFB0:                                      # Local function label for debugging

    # Push the base pointer register's (%rbp) value on to stack before execute the function (to restore it after function execution)
    # This instruction will:
    #   - Allocate 8 bytes (64 bit / a word) on stack (to store the value of the base pointer) 
    #   - Set the value of this 8-bytes to the value of base pointer register `%rpb` = base pointer address
    # 
    # Base pointer register `rbp` is a register that store address of "Base Pointer"
    # 
    # Base pointer provides a stable reference point within the current stack frame.
    # It remains constant for the entire duration of the function.
    # Once set, you can reliably access local variables and function parameters using fixed offsets from %rbp
    #
    pushq   %rbp

    # The .seh_pushreg %rbp directive tells the assembler to generate metadata that 
    # indicates the %rbp register has been pushed onto the stack.
    #
    # This is used for exception handling purposes,
    # allowing the operating system to manage the stack and restore the state of the program if an exception occurs.
    .seh_pushreg %rbp
    
    # rbp = rsp
    # Copy value of rsp to rbp
    # movq = move quadword (64 bit)
    # Set base pointer to current stack pointer
    movq    %rsp, %rbp

    # directive indicates to the assembler that a new stack frame is being created for the current function
    # this new stack frame is at %rbp (0 is offset)
    .seh_setframe %rbp, 0
    
    # Allocate 16 bytes on stack for 4 parameters
    subq    $16, %rsp
    .seh_stackalloc 16                      # directive indicates to the assembler that 16 bytes has been allocated on the stack
    .seh_endprologue                        # End of the prologue for SEH
    
    # movl source, destination - move (copy) data from source to destination
    # Just like movq but for 32bits data
    movl    %ecx, 16(%rbp)
    movl    %edx, 24(%rbp)
    movl    %r8d, 32(%rbp)
    movl    %r9d, 40(%rbp)
    
    movl    16(%rbp), %edx                  # Load the first argument from the stack into %edx
    movl    24(%rbp), %eax                  # Load the second argument from the stack into %eax
    leal    (%rdx,%rax), %ecx               # Compute the sum of %edx and %eax and store in %ecx

    movl    32(%rbp), %edx                  # Load the third argument from the stack into %edx
    movl    40(%rbp), %eax                  # Load the fourth argument from the stack into %eax
    addl    %eax, %edx                      # Add the fourth argument to the third argument (%edx)

    movl    %ecx, %eax                      # Move the value in %ecx into %eax
    subl    %edx, %eax                      # Subtract the value in %edx from %eax
    movl    %eax, -4(%rbp)                  # Store the result at offset -4 from %rbp (local variable)

    movl    -4(%rbp), %eax                  # Load the value from -4(%rbp) back into %eax
    addq    $16, %rsp                       # Deallocate 16 bytes from the stack (cleanup)
    popq    %rbp                            # Restore the previous base pointer
    ret                                      # Return from the function
    .seh_endproc                            # End of the SEH for this function
    .ident  "GCC: (GNU) 12.4.0"             # Compiler identification
