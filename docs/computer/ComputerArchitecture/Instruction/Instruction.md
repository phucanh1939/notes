# Instruction

## What is an Instruction?

An instruction is a (binary) command that can executed by computer processor

**Types of Instructions**:
- Data Transfer Instructions: Move data between memory, registers, and I/O. (LOAD, STORE, MOV)
- Arithmetic Instructions: Perform mathematical operations. (ADD, SUB, MUL, DIV)
- Logical Instructions: Perform bitwise operations. (AND, OR, NOT. XOR)
- Control Instructions: Alter the flow of execution (JUMP, CALL, RET, BRANCH)
- Comparison Instructions: Compare values and set flags/register value based on the result. (CMP, TEST)
- I/O Instructions: Facilitate communication with input/output devices. (IN, OUT)

--------------------------------------------------------------------------------------------------------------------------------------------

## Instruction Structure

An instruction typically consists of the following fields:
- Opcode (Operation Code): Specifies the operation to be performed (e.g., ADD, SUB, LOAD).
- Operands: 
  - Source Operands: Data or addresses required for the operation.
  - Destination Operand: Where the result is stored.

Example (in a 32-bit R-type instruction in MIPS):
opcode (6 bits) | rs (5 bits) | rt (5 bits) | rd (5 bits) | shamt (5 bits) | funct (6 bits)

--------------------------------------------------------------------------------------------------------------------------------------------

## Handle Large Immediate and Addresses

Instructions are limited to a fixed length (ex. 32 bit). However, some operands, such as immediate values or addresses, require more than number of bits used in instruction to represent these value (ex. 16 bits of 32 bits used for immediate value, but some value need more than 16bit to represent)

### Immediate Operands

To handle large immediate values, breaks them into smaller parts and reassembles them into registers.

Example:
```asm
# Load `0000 0000 0011 1101 0000 1001 0000 0000` into register `$s0`
lui $s0, 61 # Load upper 16 bits: 0000 0000 0011 1101
ori $s0, $s0, 2304 # Insert lower 16 bits: 0000 1001 0000 0000
```

### Address Operands

There are different ways to represent address in instructions (different addressing modes):

- Immediate Addressing: Address is a immediate value. Ex: `j 242424 # Jump to the address 242424`
- Register Addressing: The address is the value stored in a register. Ex: `lw $t0, 0($t1) # Load word from memory address stored in $t1 into $t0`
- Base or Displacement Addressing: The address is the sum of a register's value and a constant (displacement). Ex: `lw $t0, 4($t1) # Load word from the memory address ($t1 + 4) into $t0`
- PC-Relative Addressing: The address is calculated by adding a constant to the current program counter (PC). Ex: `beq $t0, $t1, 100 # Branch to (PC + 1 + 100)th word/instruction if $t0 equals $t1`

--------------------------------------------------------------------------------------------------------------------------------------------

## Instructions that support for synchronization in parallelism tasks

To ensure parallelism tasks cooperate without interference, synchronization mechanisms are typically implemented using hardware primitives that allow for atomic operations, meaning that a read and write to a memory location happen without interruption.

This ensures that no other task can modify the data between the read and write operations.

### Atomic Exchange and Synchronization Primitives

One basic synchronization operation is the atomic exchange (swap), where a value in a register is exchanged with a value in memory. This operation helps to manage locks in parallel systems, where a value of 0 indicates that a lock is free and 1 indicates the lock is unavailable.

Example of Atomic Exchange:
- A processor tries to claim a lock by exchanging a 1 from a register with the lock in memory.
- If the lock was already set (1), the processor will see the old value and know it failed to acquire the lock.
- If the lock was free (0), the processor sets it to 1 and acquires the lock, preventing other processors from simultaneously acquiring it.
- Simultaneous attempts to acquire the lock by multiple processors are handled atomically, ensuring that only one processor successfully acquires the lock.

### Hardware Primitives in MIPS for Synchronization

In MIPS architecture, the load linked (ll) and store conditional (sc) instructions are used together to create atomic operations

- Load Linked (ll): Loads the value from memory to register and marks the memory location as "linked" to track changes (set the value of Linked Register to the address).
- Store Conditional (sc): Attempts to store a new value from register to the same memory location. It succeeds only if the memory content has not changed since the ll instruction (still linked). If it succeeds, the value in the register is updated (the linked mark is removed); if it fails, the operation must be retried.

```asm
again:
    ; Load value at memory address (stored in $s1) into $t1, mark this address "linked"
    ll $t1, 0($s1)

    ; Do some calculation of the value t1 = t1 + 1
    addi $t1, $t1, 1        

    ; Try to store value from t1 the the same memory, 
    ; if this memory address is still linked (not changed), then store value and set t1 to 1, orther wise t1 will be 0
    sc $t1, 0($s1) 
    
    ; If sc failed, try again
    beq $t1, $zero, again   ; If sc fails (lock already set), retry

    ; sc success, continue the program
    add $s4, $zero, $t1     
```
