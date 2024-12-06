# Code to Execution (Java)

## Compile process

Java source files are compiled into `.class` files containing Java bytecodes by the Java compiler (`javac`).

`javac` then packages all the bytecode files, metadata, and resources into a JAR (Java Archive), which acts as a Java application package.

## Runing process

When the JAR file is run on a machine using `java -jar abc.jar` (or when a user opens an application on the OS, which in turn calls the JVM to run the JAR). Here is what happen step by step

1. **Class Loading**:
  - The **Java Class Loader** reads the bytecode files and metadata to locate the entry point (the main method or other designated starting point) and its dependencies.
  - The class loader then loads all the necessary bytecodes into memory. Each class's bytecode is stored as a structure with information such as the class name, bytecode instructions, fields, methods, and more.

2. **Bytecode Execution**:
  - The **Java Interpreter** begins executing bytecode instructions one by one from the entry point function.
  - If the bytecode instruction has been compiled by the JIT compiler previously, the JVM directly executes the native binary instructions associated with that bytecode.
  - If the bytecode instruction has not been JIT-compiled yet, the Java interpreter reads, parses, and executes the instruction. This may involve calling a specific function to handle the operation corresponding to the bytecode instruction.

3. **Just-In-Time Compilation (JIT)**:
  - During runing time of the java application, The **Just-In-Time (JIT) Compiler** compiles frequently executed Java bytecode into native machine instructions and stores the compiled binary instructions in memory.
  - This process helps to optimize performance by reducing the need to interpret the bytecode repeatedly.

4. **Other JVM Components**:
  - During the execution of the Java application, other parts of the JVM, such as **Garbage Collection (GC)**, may also be involved to manage memory and optimize performance.
