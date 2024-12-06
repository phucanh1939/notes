# Code to Execution (C#)

### Compilation Process:

- Each **C# source file** (`.cs`) is compiled by the **C# compiler (`csc`)** into **Intermediate Language (IL)** code.
- Dependencies between files are resolved, and all IL code is combined into a single **assembly** (`.exe` or `.dll`), containing:
  - **IL Code**: The compiled application code.
  - **Metadata**: Type, method, and reference information.
  - **Resources**: Additional data like images or strings.

   #### Note
   - IL code is stored in binary format in the assembly, similar to how CPU instructions are stored.
   - This `exe` file will have info in header to tell the OS this is a file built from C#, contains IL code and need CLR to run (not like exe built from C contains binary instructions to run directly)


### Running the Application:

1. **Executing the Assembly:**
   - The **OS** loads the **executable (`.exe`)** or **library (`.dll`)** as a **Portable Executable (PE)** file.
   - The OS identifies it as a managed application and passes control to the **CLR** (Common Language Runtime).

2. **CLR Initialization:**
   - The **CLR** loads the IL code into memory and prepares the runtime environment, including memory management and security.

3. **Entry Point Execution:**
   - The CLR finds the **entry point** (usually the `Main` method) and begins execution.

4. **Executing IL Code:**
   - The CLR executes IL code step by step. If an instruction has been **JIT-compiled**, the CLR runs the machine code. Otherwise, it **Just-In-Time (JIT) compiles** the IL code into machine code then execute

