# Virtual Memory

## What is Virtual Memory
Virtual memory is a memory management technique that provides an abstraction of physical memory, allowing programs to use a larger address space than what is physically available. The operating system (OS) manages virtual memory by mapping virtual addresses to physical memory locations using a process called **paging**.

## Why Virtual Memory Was Created
Virtual memory was created to solve the problem of programs requiring more memory than physically available. It also addresses the issue of managing multiple programs running at the same time without crashing or memory conflicts.

### Some programs that benefit from virtual memory:
- Programs like **large-scale applications** (e.g., video editing, 3D rendering, big data processing).
- **Gaming** and **simulation** programs that use massive memory (e.g., AAA games, scientific simulations).
- **Web browsers** that open multiple tabs consuming large amounts of memory.
- **Virtual Machines and Containers** running multiple instances can exceed physical memory.

### Too many programs running simultaneously can also cause RAM shortages and performance issues.

## How Virtual Memory Works

RAM acts as a cache for disk storage. The process works as follows:
1. When a program accesses a memory location, the OS checks if the page is in RAM.
2. If the page is not found, a **page fault** occurs, and the OS loads the page from disk into RAM.
3. If RAM is full, the OS swaps out an existing page to disk using a page replacement algorithm.
4. The page table is updated to reflect the new mapping.

### Compiler Assumptions:
When a program is compiled, the compiler assumes that the program has a **continuous block of memory**. It generates **virtual memory addresses** for the program based on this assumption.

### OS Memory Setup with Pages:
When the program is loaded into memory, the OS maps this **virtual memory** to **physical memory** through a system called **paging**. 
- **Virtual Memory** is divided into **pages**, typically 4KB or more in size.
- The OS divides **physical memory** into **page frames** that match the size of virtual memory pages.

### Paging & mapping virtual address to physical address
Paging is a technique that divides both virtual and physical memory into fixed-size blocks. The OS keeps track of the mapping between virtual pages and physical page frames using a **page table**.

- **Page**: A fixed-size block of virtual memory.
- **Page Frame**: A fixed-size block of physical memory.
- **Page Table**: A data structure that maps virtual pages to physical page frames.

### Page Faults and Swapping
When a process accesses a virtual memory address, the OS checks whether the corresponding page is in RAM:
- **Page Hit**: If the page is in RAM, it is accessed immediately.
- **Page Fault**: If the page is not in RAM, a page fault occurs, and the OS must load the page from disk into memory.

If RAM is full, the OS uses a **page replacement algorithm** to decide which page to evict (swap out to disk) to make room for the new page.

#### Page Replacement Algorithms
Common page replacement strategies include:
- **Least Recently Used (LRU)**: Replaces the page that has not been used for the longest time.
- **First-In-First-Out (FIFO)**: Replaces the oldest loaded page.
- **Optimal Page Replacement**: Replaces the page that will not be used for the longest future period (requires future knowledge).

## Performance Considerations
- **Page faults are slow**: Accessing data from disk is much slower than accessing RAM.
- **Thrashing**: If too many page faults occur, system performance degrades significantly as the OS spends most of its time swapping pages in and out.
- **Optimizations**: Techniques such as demand paging, prefetching, and increasing physical memory can improve performance.
