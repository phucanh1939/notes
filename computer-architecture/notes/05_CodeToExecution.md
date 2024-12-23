# Code to Execution

This note explains how a program written in a high-level language is converted into an executable file and how this file is loaded and run on a computer. While the exact process may differ between programming languages and platforms, the general concepts remain consistent.

## Compilation process

### Compiler

Each source code file is compiled separately into assembly by the compiler. The compilation process typically involves the following stages:

1. Preprocessing:
- Handles directives such as `#include,` `#define`, and `macros` in languages like `C/C++`.
- Expands macros, includes header files, and produces a preprocessed source file.

2. Lexical Analysis:
- Converts the source code into a sequence of tokens, such as keywords, identifiers, and symbols.
- Removes comments and whitespaces that aren't syntactically significant.

3. Syntax Analysis:
- Analyzes the sequence of tokens to build a syntax tree, which represents the grammatical structure of the code.

4. Semantic Analysis:
- Ensures the syntax tree adheres to language rules, such as type checking and verifying variable declarations.

5. Intermediate Code Generation:
- Transforms the syntax tree into an intermediate representation (IR), which is platform-independent.

6. Code Optimization:
- Refines the IR for better performance by removing redundant instructions, improving memory usage, and other optimizations.

7. Code Generation:
- Converts the optimized IR into assembly language specific to the target architecture.

### Assembler

The assembler converts assembly code into machine instructions and generates an object file that contains: **Binary instructions** and **Metadata for linking** (Symbols, Relocation information)

#### General Object File Structure

An object file stores machine language instructions, data and information needed to place instructions properly in memory.

##### 1. Header
- Provides basic information about the file.
- Includes:
  - File format/type (e.g., ELF, Mach-O, PE/COFF).
  - Machine architecture (e.g., x86, ARM).
  - Endianness.
  - Versioning.
  - High-level structural metadata (e.g., offsets to tables like the symbol table, relocation sections).

##### 2. Segments
- High-level groups of **sections**.
- Represent logical regions such as:
  - Code.
  - Data.
  - Dynamic linking information.
- Examples:
  - In **ELF**, segments are defined in the **program header table**.
  - In **Mach-O**, segments are defined in **load commands** (this is a part of the object file come after the header).

##### 3. Sections
- Contain the actual data (e.g., binary instructions, variables, constants).
- Examples:
  - `.text` → Code (binary instructions).
  - `.data` → Initialized global variables.
  - `.bss` → Uninitialized global variables.
  - `.rodata` → Read-only data.

##### 4. Relocation Entries
- Defined in a special section **relocation sections** (e.g., `.rel.text` in ELF).
- Specify what needs to be adjusted (e.g., symbol addresses, offsets).
- Guide the linker on address adjustments when combining object files.

##### 5. Symbol Table
- Lists all symbols in the file, including: Functions. Global variables. External references.
- Used by the linker to resolve references between object files.
- Typically stored in a dedicated section (e.g., `.symtab` in ELF or the COFF symbol table).

##### 6. The debugging information 
- Contains a concise description of how the modules were compiled so that a debugger can associate machine instructions with C source files and make data structures readable

### Linker

The **linker** combines object files to create an executable program. The linking proces:

- Combine Instructions: merges machine instructions and data from multiple object files into a single binary.

- Resolve Symbols: Matches and resolves references to symbols (e.g., functions, variables) across object files.

- Relocate Addresses: Adjusts symbol addresses and offsets to map correctly into the program's **virtual address space** (This virtual address space is where the operating system loads the program during execution).

## Runing the executable

### Loader

The **loader** is a part (a component) of OS responsible for preparing a program for execution. Its tasks include:

- Read the Executable: extract its structure, dependencies, and memory layout requirements.

- Setup the Virtual Space: 
    - Allocates and configures the program's virtual memory
    - Map program sections to specific regins in virtual memory

- Load the Program into Memory: 
    - Copies the program's instructions and initialized data into their designated virtual memory locations
    - Resolves addresses and performs any necessary relocations.

- Prepare for Execution:
    - Sets up the program's environment, including the stack and any arguments passed to the program:
        - Copies the parameters (if any) to the main program onto the stack.
        - Initializes the machine registers and sets the stack pointer to the first free location
    - Transfers control to the program's entry point (e.g., `_start` or `main`) to begin execution.

-----------------------------------------------------------------------------------------------------------------------

## References

### Git repos
- clang: https://github.com/llvm/llvm-project.git
- gcc: git://gcc.gnu.org/git/gcc.git
- glibc(used to load dynamic linking libs on linux): git://sourceware.org/git/glibc.git 
- linux kernel(includes execve - program loader): https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 

### Clang commands

- **Print Preprocessing Output**:  
  `clang -E <file.c>`

- **Print Tokens Generated by Lexer**:  
  `clang -Xclang -dump-tokens <file.c>`

- **Print AST**:  
  `clang -Xclang -ast-dump <file.c>`

- **Print IR**:  
  `clang -S -emit-llvm <file.c> -o <output.ll>`

- **Print Optimized IR**:  
  `clang -S -emit-llvm -O3 <file.c> -o <output.ll>`

- **Print Assembly**:  
  `clang -S <file.c> -o <output.s>`

- **Generate Object File**:  
  `clang -c <file.c> -o <output.o>`

- **View Raw Content of Object File**:  
  `xxd <file.o>`

- **Link Object Files**:  
  `clang file1.o file2.o -o my_program`

- **Compile and Link**:  
  `clang file1.c file2.c -o my_program`


