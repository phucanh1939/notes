# Processor

## What is a Processor?
**A processor (CPU - Central Processing Unit)** is the main computing unit of a computer that **fetches**, **decodes**, and **executes instructions**. It acts as the **brain of the computer**.

Most consumer computers (laptops, desktops) have one processor (CPU).

## How a Processor Work

### Structure of a Processor
Modern processor can has a collection of multiple cores and some shared components.

#### Core
A core is an andividual processing unit inside a processor that execute instructions. It has its own:
- Instruction Fetch & Decode Unit - Fetch and Decode instructions
- CU (Control Unit) – Controls execution within that core.
- ALU (Arithmetic Logic Unit) – Performs arithmetics.
- Registers – Stores small, fast-access data.

#### Shared Components
- Cache Memory (L2/L3 Cache) – Shared between cores for fast data access.
- Memory Controller – Manages communication with RAM.
- Bus Interface – Connects to external components.

### Instruction Execution Flow
Instruction execution of a processor core follows the **Instruction Cycle**, which consists of three main stages:
- Fetch → Get instruction from memory.
- Decode → Figure out what the instruction does.
- Execute → Perform the operation. 

#### Optimizations in Modern CPUs
- Pipelining → Overlapping Fetch, Decode, and Execute for multiple instructions.
- Out-of-Order Execution → Executing independent instructions in parallel.
- Branch Prediction → Guessing the next instruction to avoid delays.

## How to build a Processor
`Transistors` → `Logic Gates (AND, OR, NOT, XOR)` → `Functional Units (Decoder, MUX, ALU, etc.)` → `Components (Core, Registers, etc.)` → `Processor`

In reality, a processor is manufactured alongside other components like GPU, memory controllers, and I/O interfaces as part of the complete chip manufacturing process.
