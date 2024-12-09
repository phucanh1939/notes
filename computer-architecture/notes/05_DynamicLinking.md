
# Dynamic Linking Process at Runtime

When a program is running and a call to a routine in a dynamic library occurs, the process is as follows:

1. **Initial Jump to a Stub (PLT Stub):**
   - The program does **not** directly jump to the actual code of the dynamic library routine because the library has not been loaded into memory yet.
   - Instead, the jump instruction (`X`) initially points to a *stub* or *dummy entry point* (typically in the **Procedure Linkage Table (PLT)**).
   - This stub contains code to handle the dynamic routine call indirectly.

2. **Stub Prepares the Call:**
   - The stub typically:
     - Saves a unique identifier (e.g., an offset or index) in a register or on the stack. This identifier indicates which dynamic library routine is needed.
     - Transfers control to the **dynamic linker/loader**.

3. **Dynamic Linker/Loader Resolves the Address:**
   - The dynamic linker/loader reads the identifier to determine the required routine.
   - It performs the following steps:
     - If the library is not yet loaded, it maps the dynamic library into memory.
     - Resolves the function symbol to its actual address in the library.
     - If necessary, performs **relocation** to ensure the function can be called directly.

4. **Relocation of the Jump Instruction:**
   - After resolving the address of the function, the dynamic linker/loader modifies the stub (or jump instruction `X`) to directly point to the resolved address of the function.
   - This ensures that subsequent calls bypass the stub and jump directly to the function.

5. **Subsequent Calls:**
   - Once the relocation is done, the jump instruction `X` points directly to the resolved function in memory.
   - This means that **indirect jumps only happen once**, during the first call.

6. **Benefits of Lazy Binding:**
   - This process is known as **lazy binding**, where functions are resolved only when called for the first time. This improves:
     - **Startup time** by deferring the resolution of unused symbols.
     - **Memory usage** by not loading the entire library unnecessarily.
   - After the first call, there is no additional overhead since all calls go directly to the resolved function.

## Improvements Over Early DLL Implementations

- Early implementations of dynamic libraries would load the entire library into memory and resolve all symbols at startup. This was inefficient because:
  - Large libraries with many unused functions would waste memory.
  - Startup times were significantly longer.
- Lazy binding solves these issues by resolving and loading functions on demand.

## Additional Notes

- Some systems allow **eager binding**, where all symbols are resolved at startup. This can be enabled (e.g., by setting `LD_BIND_NOW=1` on Linux).
- The dynamic linker/loader typically modifies the **PLT** (Procedure Linkage Table) and **GOT** (Global Offset Table) to perform relocation.
- Relocation ensures that calls bypass the stub after the first resolution.

## Summary

- **Indirect jumps only occur during the first call** to a dynamic library routine.
- Lazy binding improves performance by reducing memory usage and startup time, compared to early DLL implementations that loaded entire libraries upfront.
