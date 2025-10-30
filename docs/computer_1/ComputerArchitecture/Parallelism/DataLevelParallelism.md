# Data-Level Parallelism (DLP)

## What is DLP?
- Performing the **same operation** on **multiple data elements** at once.
- Key idea: **parallelism in data**, not instructions.

## Example Use Cases
- Image processing (e.g. apply filter to pixels)
- Audio processing (e.g. mix multiple samples)
- Physics simulations (e.g. apply gravity to many objects)

## How It's Achieved
- **SIMD (Single Instruction, Multiple Data)**:
  - One instruction handles multiple data values.
  - E.g., Add two 4-element vectors in one operation.
- **Vector Processors**:
  - Specialized for operations on arrays/vectors.
- **GPUs**:
  - Highly optimized for massive DLP (e.g., thousands of threads doing the same math).

## Hardware Support
- CPU SIMD Extensions: **SSE**, **AVX**, **NEON**, etc.
- GPUs: Designed for **massive data-parallel workloads**.

## Benefits
- Great for **bulk processing** (arrays, matrices, pixels).
- High throughput with less control logic.

## Challenges
- Requires **data alignment** and **uniform operations**.
- Less useful if data is highly irregular or control flow varies.

