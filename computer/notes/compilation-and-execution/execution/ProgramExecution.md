# Program execution

## 1. **Loading**
   - The operating system (OS) loads the program's executable file into memory.
   - Necessary resources (e.g., shared libraries, data) are also loaded into memory.

## 2. **Linking**
   - If the program uses dynamic linking, unresolved references to shared libraries are resolved at this stage.
   - This is sometimes called **runtime linking**.

## 3. **Initialization**
   - The runtime environment prepares the program for execution:
     - Sets up the execution context (e.g., stack, heap, global variables).
     - Allocates resources needed by the program.
   - Control is handed over to the program’s entry point (e.g., `main()` in C/C++).

## 4. **Execution**
   - The CPU begins executing the instructions loaded into memory.
   - The program performs its intended tasks until completion.
