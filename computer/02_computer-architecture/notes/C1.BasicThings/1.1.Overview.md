# Overview

## Basic functions of a computer

The underlying hardware in any computer performs the same basic functions:
  - inputting data
  - outputting data
  - processing data
  - storing data

## Basic components of a computer

Five basic components of a computer
    - Input: Write data to memory (Ex. keyboard, touch screen, micorphone)
    - Output: Read data from memory (Ex. displays, speaker)
    - Memory: Store running "program" (list of instructions) and other data needed by the program
    - Control: determine the operations of the datapath, memory, input, and output to do the "instruction" of the program
    - Data path: 
        + Executes arithmetic and logic operations
        + Moves data between CPU registers, memory, and I/O devices

The last 2 components combined and called "processor"

## Instruction set architecture (ISA)

The Instruction Set Architecture (ISA) is the set of basic commands and operations a CPU can understand and execute.
It defines how software instructs the processor to perform tasks, including the types of instructions, how data is handled, and how memory is accessed. Essentially, it serves as the interface between software and hardware.

Examples of ISAs
    - x86: An ISA used by Intel and AMD processors for desktop and server computers.
    - ARM: An ISA used in many mobile devices and embedded systems.
    - MIPS: An ISA used in various academic and industrial processors.

## Application Binary Interface (ABI)

ABI (Application Binary Interface): Encompasses the ISA, OS conventions, and additional standards that define how binary code interfaces with the hardware and OS.
It includes:
    - Calling Conventions: How functions receive parameters and return results.
    - Data Layout: How data is organized and aligned in memory.
    - System Call Interfaces: How software requests services from the OS.
    - Binary Formats: Structure of executable files and shared libraries.

### Example: x86 Architecture

- **ISA**: x86 (32-bit) – Defines the instruction set and hardware capabilities.

#### Different Operating Systems and ABIs:

1. **Windows x86 ABI**:
   - **ABI**: Microsoft x86 ABI
   - **Calling Conventions**: Specific rules for function calls, parameter passing, and return values.
   - **System Calls**: Windows-specific methods for interacting with the OS.

2. **Linux x86 ABI**:
   - **ABI**: System V i386 ABI
   - **Calling Conventions**: Different from Windows, with its own set of rules for function calls.
   - **System Calls**: Linux-specific methods for interacting with the OS.

#### Key Differences:
- **Calling Conventions**: How parameters are passed and how functions are called differs between the two ABIs.
- **System Call Interfaces**: The methods for making system calls to the OS differ between Windows and Linux, even though both use the same ISA.

Despite using the same x86 ISA, programs compiled for Windows with the Microsoft x86 ABI are not directly compatible with Linux running the System V i386 ABI without modification or recompilation. The differences in ABI define how software interacts with the OS and hardware, leading to compatibility variations.

Ex. A C program would need to be compiled separately for each ABI to run on Linux and Windows on the same x86 architecture. (2 different compiled binary for 2 ABI with the same ISA)

C program

```c
#include <stdio.h>

int add(int a, int b) {
    return a + b;
}

int main() {
    int result = add(5, 7);
    printf("Result: %d\n", result);
    return 0;
}
```

Linux (System V i386 ABI)

```assembly
; Function add
add:
    mov eax, [esp+4]    ; Load first parameter (a) into EAX from the stack
    add eax, [esp+8]    ; Add second parameter (b) from the stack to EAX
    ret                 ; Return with result in EAX

; Main function
main:
    push 7              ; Push second parameter (b) onto the stack
    push 5              ; Push first parameter (a) onto the stack
    call add            ; Call the function
    ; Result is in EAX
    ; Print result (using Linux system calls)
    ; Exit (using Linux system calls)

```

Windows (Microsoft x86 ABI)
```
; Function add
add:
    mov eax, ecx        ; Load first parameter (a) from ECX
    add eax, edx        ; Add second parameter (b) from EDX to EAX
    ret                 ; Return with result in EAX

; Main function
main:
    mov ecx, 5          ; Load first parameter (a) into ECX
    mov edx, 7          ; Load second parameter (b) into EDX
    call add            ; Call the function
    ; Result is in EAX
    ; Print result (using Windows API)
    ; Exit (using Windows API)
```

These 2 assembly program is use the same ISA but, it different due to the ABI different (different ways to do things)

- Linux: Uses the stack for parameter passing. (`push 7`)
- Windows: Uses registers for parameter passing (`mov edx, 7`)

Note: Both `push` and `mov` is a part of ISA, Windows and Linux are just using different ways of doing things (different ABI)