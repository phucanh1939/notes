# Synchronize Instructions

To support parallelism in multi-processor systems, hardware must provide mechanisms for task synchronization.
Synchronization ensures that processors coordinate their reads and writes to shared memory locations without interference, preventing race conditions.

In the MIPS architecture, the **Load Linked (LL)** and **Store Conditional (SC)** instructions are designed to implement atomic operations.
These instructions allow you to perform a read-modify-write sequence on shared memory locations safely, ensuring that no other processor or thread can interfere during the operation.

---

### **Example: Atomic Increment**

Assume `shared_var` is stored at memory address `X`, and register `$t0` holds this address.

```asm
atomic_increment:
        ll $t1, 0($t0)                  # Load linked: load the current value of shared_var into $t1,
                                        # ark the address X as "linked."
        addi $t1, $t1, 1                # Increment the value in $t1.
        sc $t1, 0($t0)                  # Store conditional: attempt to store the new value to shared_var.
                                        # - If the value at address X has NOT CHANGED since the LL, the SC succeeds:
                                        #   -> Store $t1 to X and set $t1 to 1.
                                        # - If the value at address X has CHANGED since the LL, the SC fails:
                                        #   -> Leave memory unchanged and set $t1 to 0.
        beqz $t1, atomic_increment      # If SC failed ($t1 = 0), retry the operation.
