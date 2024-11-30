# Instructions

## What is an Instruction?

An instruction is a (binary) command that can executed by computer processor

## Instruction Structure

An instruction typically consists of the following fields:
- Opcode (Operation Code): Specifies the operation to be performed (e.g., ADD, SUB, LOAD).
- Operands: 
  - Source Operands: Data or addresses required for the operation.
  - Destination Operand: Where the result is stored.

Example (in a 32-bit instruction):
| Opcode (8 bits) | Source 1 (8 bits) | Source 2 (8 bits) | Destination (8 bits) |

## Types of Instructions

- Data Transfer Instructions: Move data between memory, registers, and I/O. (LOAD, STORE, MOV)
- Arithmetic Instructions: Perform mathematical operations. (ADD, SUB, MUL, DIV)
- Logical Instructions: Perform bitwise operations. (AND, OR, NOT. XOR)
- Control Instructions: Alter the flow of execution (JUMP, CALL, RET, BRANCH)
- Comparison Instructions: Compare values and set flags/register value based on the result. (CMP, TEST)
- I/O Instructions: Facilitate communication with input/output devices. (IN, OUT)
