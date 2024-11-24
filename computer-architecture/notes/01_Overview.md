# Overview

## What is a Computer?

Computer is an electronic device designed to process data, performance tasks (defined by instructions).

## Computer Components

- Central Processing Unit (CPU): interacts with memory and I/O devices to execute instructions, includes:
  - Data Path: manages the flow of data between registers, ALU and memory
  - Control Path: directs the operation of the data path and coordinates the execution of instructions
- Memory: stores data and instructions (programs)
- I/O Devices: write/read data to/from memory

## Types of Computers

- Personal Computers (PCs)
- Servers
- Supercomputers
- Embedded Computers
- Personal mobile devices (PMDs)
- Cloud

## Performance

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

## Timeline

### Past

- Before 1800s: Mechanical Calculators
- 1800s - Early 1900s: Mechanical Computers
- 1930s - 1940s: Early Electronic Computers (with vacuum tubes)
- 1947: Transistors
- 1958: Integrated Circuits
- 1970s - 1980s: Personal Computers
- 1990s: The Internet
- 2000s - Present: Mobile computers, Cloud, AI

As processors become faster and more powerful, they consume significantly more energy.
Traditionally, higher clock speeds and smaller transistors helped improve performance, but they also led to increased power usage and heat dissipation issues.
=> The shift to multiprocessors has become more prevalent

### Present

Multi-core processors enhance performance while maintaining energy efficiency. To fully utilize multiple processors, programs must be designed for parallel execution. However, this introduces challenges such as synchronization, data sharing, and workload distribution.

#### Limitations of Multi-Core Processors

- As the number of cores increases, the performance gain reduces due to synchronization overhead and non-parallelizable tasks
- Multiple cores sharing the same memory can lead to contention, reducing efficiency.
- Adding more cores also increases power consumption and heat generation
- Most software is not optimized for parallel execution, leaving many cores underutilized.
- Data exchange between cores introduces latency and can become a bottleneck in certain applications.

### Future

- Heterogeneous Computing: Combining CPUs, GPUs, and specialized processors for task-specific performance optimization
- Quantum Computing: Harnessing quantum mechanics for exponential performance
- Neuromorphic Computing: Mimicking  the human brain’s architecture to achieve energy-efficient, AI-driven performance
- Photonic Processors: Using light instead of electricity for faster data transmission and lower energy consumption.
- 3D Chip Stacking: Vertical integration of processor layers to increase density and reduce latency
- Edge and Cloud Integration: Distributed computing paradigms that combine local and remote resources for optimal performance and scalability.


