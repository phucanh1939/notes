# Cache Memory

## What is a Cache?
A cache is a small, high-speed memory located inside the CPU that stores frequently accessed data and instructions. It helps reduce the time needed to fetch data from the slower main memory (RAM).

#### Inputs and Outputs:
- **Inputs:** Address from the CPU, Read/Write control signals, Data (for writes)
- **Outputs:** Data (for reads), Hit/Miss signal (indicates if data is in cache)

## Why Was Cache Created?
Caches were created to bridge the speed gap between the CPU and RAM. CPUs operate much faster than RAM, so frequent memory access would slow down execution. Cache reduces this latency by storing frequently used data closer to the CPU, improving performance significantly.

The only problem cache solves is reducing the memory access time!!!

## How Does Cache Work?
### Structure
A cache is typically organized into multiple levels:
- **L1 Cache:** Smallest, fastest, closest to the CPU core (focus on reduce access time when cache hit)
- **L2 Cache:** Larger, slower than L1, may be shared between cores (focus on reduce cache miss rate)
- **L3 Cache:** Largest, slowest, shared across all CPU cores (focus on reduce cache miss rate)

The only problem cache solves is reducing the memory access time!!!
This structure serves this purpose also: reduce miss rate => improve accessing time
Why not 4, 5 or n level of cache instead of 3? => Balance betwwen miss rate and miss penalty

#### Cache Block Organization
Each cache is divided into sets, and each set contains multiple blocks. A block is a fixed-size unit that stores data fetched from memory. Each block is built from SRAM (Static RAM) cells, which are constructed using flip-flops for fast access. Each block consists of:
- **Tag:** Identifies which memory address range the block corresponds to.
- **Data:** A chunk of memory fetched from RAM (not just the requested word, but an entire block for spatial locality).
- **Valid Bit:** Indicates whether the data in the block is valid.
- **Dirty Bit:** Used in write-back caches to track modified data that needs to be written to RAM.

The only problem cache solves is reducing the memory access time!!!
This set/blocks architecture serves this purpose also: 
- 1 main memory block address will map to a set and can be in any blocks in this set. (Ex address 10 always be store in set 1)
- If only 1 block per set we will have a direct-mapped cache where 1 address in memory always map to only 1 block, more miss may happens due to the replace will happen more
- If only 1 set contains all blocks, an address can be in any block will reduce the replace time but increase the time needed to search for the target block, and the cost to implement hardware to do all the search at the same time (reduce search time) is too high for common use.
- There for dividing cache into sets each set contains blocks with a tunning set size and block size allow better performance while still keep the cost pratical

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
=> The tag is just the upper bits of the memory address
=> Compare by directly compare bit by bit 
=> Tag is upper bits of memory address not the data

- Which component check and handle cache miss, send request to lower level to fetch data to  cache, it happens in multiple cycles? when the final data available in cache, what happen to the data path and pipeline of the processor when a cache missing is handling (does it keep stall untils the data arrive)
=> cache controller is responsible for:
   - Detecting the miss (by comparing the tag in the cache).
   - Sending a request to the next memory hierarchy level (L2 cache, L3 cache, or main memory).
   - Fetching the requested data and placing it into the cache.
   - Forwarding the data to the processor once it's available.
=> A cache miss typically takes multiple cycles
=> What Happens to the Processor (Pipeline) During a Cache Miss
   - In a simple processor (like in-order execution):The CPU stalls (waits) until the data is available.
   - In modern processors (with out-of-order execution):
      - The processor tries to execute independent instructions while waiting for data.
      - The instruction that caused the miss is put in a load buffer.
      - Once the data arrives, the load instruction is resumed.

- What is a write miss, why a write can even miss
=> A miss is when the target memory address tag is not found in cache (no matter read or write)

- How a cache contains data about time a block is loaded to (to use to select block that unused in longest time) - how it represent time with least of bits
=> Full LRU (Counter-based) → Each block has a log₂(N)-bit counter, updated on access. Accurate but costly.
=> LRU Stack (Shift Register) → Blocks are reordered on access. Efficient but still costly for large caches.
=> Approximate LRU (2-bit per block) → Each block gets a small counter (00 to 11) to track usage. Simple & space-efficient.
=> Pseudo-LRU (Tree-based) → Uses a binary tree (N-1 bits per set) to approximate LRU. Best for large caches (8-way, 16-way).


- Why 3 level of cache needed instead of 1 (or 1 of the size of 3), compare the performance improvement when use 3 level of caches in stead of 1 or 1 with size of 3
=> Time to access main memory (RAM) is really long compare to the clock cycle time, if there are fews levels between 1 cache and main memory to reduce main memory miss rate a little bit it will increase the memory access time a lot, the number 3 may be a practical number balance the cost and other factors
=> Each level focus on 1 thing: Level 1 focus on minimize the hit time, Level 2 & 3 focus on minimize the miss rate, ...

=> Single large cache is slow → Bigger size increases hit time (latency).
=> 3 levels balance speed & efficiency:
   - L1 → Small, very fast (low hit time).
   - L2 → Medium, balances speed & size.
   - L3 → Large, reduces main memory accesses.
=> More than 3 levels? → Higher levels increase access time with diminishing returns.
=> Conclusion: 3-level cache is a practical trade-off between performance, cost, and power efficiency. 🚀


- How to program to use cache optimal (load data into cache and process that data repeatedly til before replace it with other on the cache to reduce cache miss) -> Example simple program

Cache-Optimal Programming Strategy
To optimize cache usage, the key idea is:
- Load data into cache.
- Process it repeatedly while it stays in cache.
- Avoid unnecessary memory accesses that cause cache misses.


- How to see/debug/view cache value when runing a program (in general), and runing a game (unity)


The performance challenge for algorithms is that the memory hierarchy 
varies  between  different  implementations  of  the  same  architecture  in  cache  size,  
associativity,  block  size,  and  number  of  caches. To  cope  with  such  variability,  some  
recent numerical libraries parameterize their algorithms and then search the parameter 
space at runtime to fi nd the best combination for a particular computer. This approach 
is called autotuning

In this section, we focused on four topics: cache performance, using associativity to 
reduce miss rates, the use of multilevel cache hierarchies to reduce miss penalties, 
and soft ware optimizations to improve eff ectiveness of caches

Th e  memory  system  has  a  signifi cant  eff ect  on  program  execution  time.  Th e 
number of memory-stall cycles depends on both the miss rate and the miss penalty. 
Th e challenge, as we will see in Section 5.8, is to reduce one of these factors without 
signifi cantly aff ecting other critical factors in the memory hierarchy