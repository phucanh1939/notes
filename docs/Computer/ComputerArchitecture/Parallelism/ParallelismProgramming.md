# Writting program to use parallelism hardware

## 1. Task Decomposition
- Hard to split some problems into independent parts.
- Not all tasks are parallelizable.

## 2. Load Balancing
- Uneven workload causes bottlenecks.
- All threads/cores must stay busy for efficiency.

## 3. Data Sharing & Synchronization
- Shared data needs careful handling.
- Risk of race conditions, deadlocks, and data corruption.
- Requires locks, mutexes, or atomic operations.

