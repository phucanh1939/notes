# Instruction Level Parallelism (ILP)

Instruction Level Parallelism (ILP) refers to the ability of a processor to execute multiple instructions simultaneously. The goal is to increase performance by overlapping instruction execution.

There are two primary methods for increasing the potential amount of instruction-level parallelism:

1. **Deep Pipelining** - Increasing the depth of the pipeline to allow more instructions to overlap in execution.
2. **Multiple Issue** - Replicating internal components of the processor to enable multiple instructions to be issued in every pipeline stage.

## Static Multiple Issue

Static multiple issue, also known as **VLIW (Very Long Instruction Word)**, relies on the compiler to determine which instructions can be issued in parallel. The compiler schedules instructions at compile time to avoid hazards and maximize parallel execution.

### Characteristics of Static Multiple Issue:
- The compiler handles instruction scheduling.
- No hardware-based dynamic scheduling.
- Simpler control logic, but requires sophisticated compiler techniques.
- Works best with predictable instruction dependencies.

## Dynamic Multiple Issue

Dynamic multiple issue, also known as **Superscalar Execution**, allows the processor to decide at runtime which instructions can be issued simultaneously. The hardware dynamically schedules instruction execution, reducing the burden on the compiler.

### Characteristics of Dynamic Multiple Issue:
- The processor determines instruction scheduling dynamically.
- More complex control logic, requiring mechanisms like register renaming and dependency checking.
- Better performance in unpredictable workloads compared to static multiple issue.

### Dynamic Pipeline Scheduling

Dynamic pipeline scheduling is a key feature of dynamic multiple issue processors. It allows out-of-order execution, where instructions can be reordered to maximize parallelism while maintaining program correctness.

#### Key Components of Dynamic Pipeline Scheduling:
- **Instruction Window**: Holds a set of instructions waiting to be scheduled.
- **Reorder Buffer (ROB)**: Ensures instructions commit in program order to maintain correctness.
- **Reservation Stations**: Store instructions waiting for operands, allowing execution as soon as dependencies are resolved.
- **Register Renaming**: Eliminates false dependencies (write-after-read and write-after-write hazards).

By combining deep pipelining with multiple issue techniques, modern processors achieve high levels of instruction-level parallelism, significantly improving performance.
