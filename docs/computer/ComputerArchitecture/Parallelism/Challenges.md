# Difficulty of Creating Parallel Processing Programs

## 1. Data Sharing & Synchronization
- Shared data needs careful handling.
- Risk of race conditions, deadlocks, and data corruption.
- Requires locks, mutexes, or atomic operations.

## 2. Task Decomposition
- Hard to split some problems into independent parts.
- Not all tasks are parallelizable.

## 3. Load Balancing
- Uneven workload causes bottlenecks.
- All threads/cores must stay busy for efficiency.

## 4. Debugging & Testing
- Bugs can be non-deterministic (random).
- Harder to trace and fix compared to single-threaded code.

## 5. Performance Overhead
- Thread creation, synchronization, and context switching cost time.
- Too much parallelism can reduce performance.

## 6. Hardware Constraints
- Memory bandwidth and cache sharing limit performance.
- NUMA and core layout affect access speed.
