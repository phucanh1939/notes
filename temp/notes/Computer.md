# Computer

## Computer

### What Is a Computer?

Computer is an electronic device designed to process data, performance tasks (defined by instructions).

### Basic Components of a Computer

- Memory: stores data and instructions (programs)
- I/O Devices: write/read data to/from memory
- Central Processing Unit (CPU): interacts with memory and I/O devices to execute instructions

### Types of Computers

- Personal Computers (PCs)
- Servers
- Supercomputers
- Embedded Computers
- Personal mobile devices (PMDs)
- Cloud

### Performance of a Computer

Performance is how efficiently it can execute tasks, often measured by how quickly it can complete a given workload.
The most important metric is **CPU execution time**.

**CPU execution time** is the time the CPU spends computing for a specific task

```c
// CPU_EXECUTION_TIME: CPU execution time for a program
// NUMBER_OF_CLOCK_CYCLE: total number of clock cycles of this program
// CLOCK_CYCLE_TIME: Time of a clock cycle of the CPU
CPU_EXECUTION_TIME = NUMBER_OF_CLOCK_CYCLES * CLOCK_CYCLE_TIME;

// NUMBER_OF_INSTRUCTION: total number of instructions of this program
// CPI: Average number of clock cycles per instruction (each type of instruction has different clock cycles needed to execute)
NUMBER_OF_CLOCK_CYCLES = NUMBER_OF_INSTRUCTION * CPI;
```

### Computer History

- Before 1800s: Mechanical Calculators
- 1800s - Early 1900s: Mechanical Computers
- 1930s - 1940s: Early Electronic Computers (with vacuum tubes)
- 1947: Transistors
- 1958: Integrated Circuits
- 1970s - 1980s: Personal Computers
- 1990s: The Internet
- 2000s - Present: Mobile computers, Cloud, AI

As processors become faster and more powerful, they consume significantly more energy.
Traditionally, higher clock speeds (smaller time to execute task) and smaller transistors (more transistors = more computational units) helped improve performance, but they also led to increased power usage and heat dissipation issues.

=> The shift to multiprocessors has become more prevalent.

Multi-core processors enhance performance while maintaining energy efficiency. To fully utilize multiple processors, programs must be designed for parallel execution. However, this introduces challenges such as synchronization, data sharing, and workload distribution.

-----

## Program

### What is a Program

A program is a set of binary instructions that a computer follows to perform a specific task

### How a Program is Created

- Programmer writes code in high-level programming language using an `INPUT DEVICE` (like keyboard) and a `TEXT EDITOR`.
- Code files will be saved/stored in computer `STORAGE`.
- `COMPILER` will compile these code files to an executable program (also stored in storage)

```
                                        +------------------------------+
                                        |  STORAGE                     |
                                        |                              |
+------------------------------+        |  +-----------------------+   |         +------------+
|  INPUT DEVICE + TEXT EDITOR  |--------|->|    Code Files         |---|-------->|  COMPILER  |
+------------------------------+        |  +-----------------------+   |         +------------+
                                        |                              |               |
                                        |  +-----------------------+   |               |
                                        |  |  Executable Program   |<--|---------------*
                                        |  +-----------------------+   |
                                        +------------------------------+ 
```

### How Computer Execute a Program

- `OS PROGRAM LOADER` load the executable program stored in `STORAGE` onto `MEMORY` and setup memory, needed enviroment for program to execute.
- `OS` transfer control to `PROCESSOR` to start executing the program
- `PROCESSOR` fetch instructions from `MEMORY` to execute one by one
- The output of the program will be showed to human through an `OUTPUT DEVICE`

```
+------------------------------+                                         +------------------+                   +------------------+
|  STORAGE                     |                                         |  MEMORY          |                   |  PROCESSOR       |
|                              |                                         |  +-----------+   |       fetch       |                  |
|  +-----------------------+   |         +---------------------+         |  |           |<--|-------------------|   execute        |    output    +-----------------+
|  |  Executable Program   |---|-------->|  OS PROGRAM LOADER  |---------|->|  Program  |   |                   |   instructions   |------------->|  OUTPUT DEVICE  |
|  +-----------------------+   |         +---------------------+         |  |           |---|------------------>|                  |              +-----------------+
|                              |                                         |  +-----------+   |    instructions   |                  |
+------------------------------+                                         +------------------+                   +------------------+
```
-----

## Questions

1. How was first text editor created?

2. How was first compiler/assembler created?
