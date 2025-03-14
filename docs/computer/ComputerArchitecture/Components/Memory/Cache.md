# Cache Memory

## What is a Cache?
A cache is a small, high-speed memory located inside the CPU that stores frequently accessed data and instructions. It helps reduce the time needed to fetch data from the slower main memory (RAM).

#### Inputs and Outputs:
- **Inputs:** Address from the CPU, Read/Write control signals, Data (for writes)
- **Outputs:** Data (for reads), Hit/Miss signal (indicates if data is in cache)

## Why Was Cache Created?
Caches were created to bridge the speed gap between the CPU and RAM. CPUs operate much faster than RAM, so frequent memory access would slow down execution. Cache reduces this latency by storing frequently used data closer to the CPU, improving performance significantly.

## How Does Cache Work?
### Structure
A cache is typically organized into multiple levels:
- **L1 Cache:** Smallest, fastest, closest to the CPU core
- **L2 Cache:** Larger, slower than L1, may be shared between cores
- **L3 Cache:** Largest, slowest, shared across all CPU cores

#### Cache Block Organization
Each cache is divided into sets, and each set contains multiple blocks. A block is a fixed-size unit that stores data fetched from memory. Each block is built from SRAM (Static RAM) cells, which are constructed using flip-flops for fast access. Each block consists of:
- **Tag:** Identifies which memory address range the block corresponds to.
- **Data:** A chunk of memory fetched from RAM (not just the requested word, but an entire block for spatial locality).
- **Valid Bit:** Indicates whether the data in the block is valid.
- **Dirty Bit:** Used in write-back caches to track modified data that needs to be written to RAM.

#### Address Breakdown
When accessing data, the memory address is divided into:
- **Index:** Used to locate a specific set in the cache (set's index).
- **Tag:** Compared against the tags stored in the blocks within the selected set.
- **Offset:** Specifies the exact byte/word inside the block.

### Read/Write Operations and CPU Interaction
#### Cache Lookup Process
1. **CPU Generates a Memory Request:** The CPU issues a read or write request along with a memory address.
2. **Index Lookup:** The cache controller extracts the **index** bits to locate the corresponding **set**.
3. **Tag Comparison:** Within the selected set, the **tags** of all blocks are compared to the requested tag.
4. **Hit or Miss:**
   - If a match is found (**cache hit**), the requested data is retrieved from the block.
   - If no match (**cache miss**), an entire block of data is fetched from RAM and stored in an available block in the set.

#### Read Operation:
1. **Cache Hit:**
   - The cache controller detects a tag match.
   - The block's offset is used to select the exact word.
   - Data is sent to the CPU.
2. **Cache Miss:**
   - The request is forwarded to RAM.
   - A **whole block** of memory is loaded into the cache.
   - The block is stored in the set with its new tag.
   - The CPU receives the requested data.

#### Write Operation:
1. **Write Hit:**
   - The block in the cache is updated.
   - Based on the **write policy**:
     - **Write-Through:** Data is immediately written to RAM.
     - **Write-Back:** Data is marked dirty and written later.
2. **Write Miss:**
   - Data is written to RAM and may be loaded into the cache (depending on policy).

### Cache Replacement Policies
When a cache miss occurs and the cache set is full, the cache must replace an existing block with the new data. The selection of which block to evict depends on the **replacement policy**:
1. **Least Recently Used (LRU):** Replaces the block that has not been used for the longest time.
2. **First-In, First-Out (FIFO):** Replaces the oldest block in the set, regardless of usage.
3. **Random Replacement:** Selects a block randomly for replacement.
4. **Least Frequently Used (LFU):** Replaces the block that has been accessed the least number of times.

These policies help optimize cache efficiency by ensuring frequently accessed data remains in cache while infrequently used data is evicted. 

#### Configurability of Cache Replacement Policies
Cache replacement policies can be **fixed or configurable**:
- **Fixed Policies (Most Common):** Many CPUs have a pre-determined replacement policy (e.g., LRU or FIFO) that is hardwired into the cache controller.
- **Configurable Policies:** Some modern CPUs allow the OS or firmware to adjust the replacement policy based on workload behavior. This flexibility optimizes cache performance dynamically.


## Question
- How the tag is calculated and compared, is the tag based on the data inside it or independen
- Which component check and handle cache miss, send request to lower level to fetch data to  cache, it happens in multiple cycles? when the final data available in cache, what happen to the data path and pipeline of the processor when a cache missing is handling (does it keep stall untils the data arrive)
- What is a write miss, why a write can even miss