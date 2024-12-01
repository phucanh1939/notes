# Code to Execution

This note explains how a program written in a high-level language is converted into an executable file and how this file is loaded and run on a computer. While the exact process may differ between programming languages and platforms, the general concepts remain consistent.

## Compilation

Each source code file is compiled separately into assembly by the compiler. The compilation process typically involves the following stages:

1. Preprocessing:
- Handles directives such as `#include,` `#define`, and `macros` in languages like `C/C++`.
- Expands macros, includes header files, and produces a preprocessed source file.

2. Lexical Analysis:
- Converts the source code into a sequence of tokens, such as keywords, identifiers, and symbols.
- Removes comments and whitespaces that aren't syntactically significant.

Example the code: 

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

## Assember

## Linker

## Loader

------------------------------------------------------------------------------------------------

## Example.

We have these files: `math.c` and `main.c`

```c
// math.h
// This is a header guard to make sure this header in not include more than 1 time in any other file
#ifndef MATH_H
#define MATH_H

#define PI 3.14f

// Function declarations
int sum_to_n(int n);
float circle_area(float r);
float circle_circumference(float r);

#endif // MATH_H
```

```c
// math.c
#include "math.h"

int sum_to_n(int n) {
    return (n <= 0) ? 0 : (n * (n + 1)) >> 1;
}

float circle_area(float r) {
    return r * r * PI;
}

float circle_circumference(float r) {
    return 2.0f * r * PI;
}

```

```c
// main.c
#include "math.h"

int main() {
    int n = 100;
    int sum = sum_to_n(100);
    int x = sum * 1939;
    return 0;
}
```

### Compilation

Each source file (`.c` file) is compiled separately into assembly by the compiler with following steps

#### 1. Preprocessing

To view the output of the preprocessing step for a file we can use `gcc` or `clang` with `-E` option:

```sh
gcc -E ./src/main.c

clang -E ./src/main.c
```

Here is the output of `clang -E` for our 2 source file

```c
// main.c
// These lines act like a log of what the preprocessor has done during the preprocessing phase 
# 1 "./src/main.c"  // Start processing the file `./src/main.c` from line 1.
# 1 "<built-in>" 1  // Start processing built-in definitions (e.g., predefined macros).
# 1 "<built-in>" 3  // Enter a special state (state 3) for built-in macros.
# 414 "<built-in>" 3  // Continue processing built-in macros at line 414.
# 1 "<command line>" 1  // Process macros or flags provided via the command line.
# 1 "<built-in>" 2  // Return to the built-in definitions to finalize setup.
# 1 "./src/main.c" 2  // Return to `./src/main.c` after setting up built-ins.
# 1 "./src/math.h" 1  // Start processing the included header file `./src/math.h`.







int sum_to_n(int n);
float circle_area(float r);
float circle_circumference(float r);
# 2 "./src/main.c" 2  // Return to `./src/main.c` after including the contents of `./src/math.h`. 
                      // The `2` indicates the preprocessor is resuming after processing an `#include`.

int main() {
    int n = 100;
    int sum = sum_to_n(100);
    int x = sum * 1939;
    return 0;
}
```
```c
// math.c
# 1 "./src/math.c"  // Start processing the file `./src/math.c` from line 1.
# 1 "<built-in>" 1  // Start processing built-in definitions (e.g., predefined macros).
# 1 "<built-in>" 3  // Enter a special state (state 3) for built-in macros.
# 414 "<built-in>" 3  // Continue processing built-in macros at line 414.
# 1 "<command line>" 1  // Process macros or flags provided via the command line.
# 1 "<built-in>" 2  // Return to the built-in definitions to finalize setup.
# 1 "./src/math.c" 2  // Return to `./src/math.c` after setting up built-ins.
# 1 "./src/math.h" 1  // Start processing the included header file `./src/math.h`.







int sum_to_n(int n);
float circle_area(float r);
float circle_circumference(float r);
# 2 "./src/math.c" 2  // Return to `./src/math.c` after including the contents of `./src/math.h`. 
                      // The `2` indicates the preprocessor is resuming after processing an `#include`.

int sum_to_n(int n) {
    return (n <= 0) ? 0 : (n * (n + 1)) >> 1;
}

float circle_area(float r) {
    return r * r * 3.14f;
}

float circle_circumference(float r) {
    return 2.0f * r * 3.14f;
}

```

#### 2.Lexical Analysis

The output of preprocessing stage will be go through this lexical analysis stage to convert code into tokens.

We can use `clang -fsyntax-only -Xclang -dump-tokens main.c` to see the output of this stage.

Here is the raw output of our 2 source files: 

```sh
# main.c
int 'int'	 [StartOfLine]	Loc=<./src/math.h:8:1>
identifier 'sum_to_n'	 [LeadingSpace]	Loc=<./src/math.h:8:5>
l_paren '('		Loc=<./src/math.h:8:13>
int 'int'		Loc=<./src/math.h:8:14>
identifier 'n'	 [LeadingSpace]	Loc=<./src/math.h:8:18>
r_paren ')'		Loc=<./src/math.h:8:19>
semi ';'		Loc=<./src/math.h:8:20>
float 'float'	 [StartOfLine]	Loc=<./src/math.h:9:1>
identifier 'circle_area'	 [LeadingSpace]	Loc=<./src/math.h:9:7>
l_paren '('		Loc=<./src/math.h:9:18>
float 'float'		Loc=<./src/math.h:9:19>
identifier 'r'	 [LeadingSpace]	Loc=<./src/math.h:9:25>
r_paren ')'		Loc=<./src/math.h:9:26>
semi ';'		Loc=<./src/math.h:9:27>
float 'float'	 [StartOfLine]	Loc=<./src/math.h:10:1>
identifier 'circle_circumference'	 [LeadingSpace]	Loc=<./src/math.h:10:7>
l_paren '('		Loc=<./src/math.h:10:27>
float 'float'		Loc=<./src/math.h:10:28>
identifier 'r'	 [LeadingSpace]	Loc=<./src/math.h:10:34>
r_paren ')'		Loc=<./src/math.h:10:35>
semi ';'		Loc=<./src/math.h:10:36>
int 'int'	 [StartOfLine]	Loc=<./src/main.c:3:1>
identifier 'main'	 [LeadingSpace]	Loc=<./src/main.c:3:5>
l_paren '('		Loc=<./src/main.c:3:9>
r_paren ')'		Loc=<./src/main.c:3:10>
l_brace '{'	 [LeadingSpace]	Loc=<./src/main.c:3:12>
int 'int'	 [StartOfLine] [LeadingSpace]	Loc=<./src/main.c:4:5>
identifier 'n'	 [LeadingSpace]	Loc=<./src/main.c:4:9>
equal '='	 [LeadingSpace]	Loc=<./src/main.c:4:11>
numeric_constant '100'	 [LeadingSpace]	Loc=<./src/main.c:4:13>
semi ';'		Loc=<./src/main.c:4:16>
int 'int'	 [StartOfLine] [LeadingSpace]	Loc=<./src/main.c:5:5>
identifier 'sum'	 [LeadingSpace]	Loc=<./src/main.c:5:9>
equal '='	 [LeadingSpace]	Loc=<./src/main.c:5:13>
identifier 'sum_to_n'	 [LeadingSpace]	Loc=<./src/main.c:5:15>
l_paren '('		Loc=<./src/main.c:5:23>
numeric_constant '100'		Loc=<./src/main.c:5:24>
r_paren ')'		Loc=<./src/main.c:5:27>
semi ';'		Loc=<./src/main.c:5:28>
int 'int'	 [StartOfLine] [LeadingSpace]	Loc=<./src/main.c:6:5>
identifier 'x'	 [LeadingSpace]	Loc=<./src/main.c:6:9>
equal '='	 [LeadingSpace]	Loc=<./src/main.c:6:11>
identifier 'sum'	 [LeadingSpace]	Loc=<./src/main.c:6:13>
star '*'	 [LeadingSpace]	Loc=<./src/main.c:6:17>
numeric_constant '1939'	 [LeadingSpace]	Loc=<./src/main.c:6:19>
semi ';'		Loc=<./src/main.c:6:23>
return 'return'	 [StartOfLine] [LeadingSpace]	Loc=<./src/main.c:7:5>
numeric_constant '0'	 [LeadingSpace]	Loc=<./src/main.c:7:12>
semi ';'		Loc=<./src/main.c:7:13>
r_brace '}'	 [StartOfLine]	Loc=<./src/main.c:8:1>
eof ''		Loc=<./src/main.c:8:2>
```
```sh
# math.c
int 'int'	 [StartOfLine]	Loc=<./src/math.h:8:1>
identifier 'sum_to_n'	 [LeadingSpace]	Loc=<./src/math.h:8:5>
l_paren '('		Loc=<./src/math.h:8:13>
int 'int'		Loc=<./src/math.h:8:14>
identifier 'n'	 [LeadingSpace]	Loc=<./src/math.h:8:18>
r_paren ')'		Loc=<./src/math.h:8:19>
semi ';'		Loc=<./src/math.h:8:20>
float 'float'	 [StartOfLine]	Loc=<./src/math.h:9:1>
identifier 'circle_area'	 [LeadingSpace]	Loc=<./src/math.h:9:7>
l_paren '('		Loc=<./src/math.h:9:18>
float 'float'		Loc=<./src/math.h:9:19>
identifier 'r'	 [LeadingSpace]	Loc=<./src/math.h:9:25>
r_paren ')'		Loc=<./src/math.h:9:26>
semi ';'		Loc=<./src/math.h:9:27>
float 'float'	 [StartOfLine]	Loc=<./src/math.h:10:1>
identifier 'circle_circumference'	 [LeadingSpace]	Loc=<./src/math.h:10:7>
l_paren '('		Loc=<./src/math.h:10:27>
float 'float'		Loc=<./src/math.h:10:28>
identifier 'r'	 [LeadingSpace]	Loc=<./src/math.h:10:34>
r_paren ')'		Loc=<./src/math.h:10:35>
semi ';'		Loc=<./src/math.h:10:36>
int 'int'	 [StartOfLine]	Loc=<./src/math.c:3:1>
identifier 'sum_to_n'	 [LeadingSpace]	Loc=<./src/math.c:3:5>
l_paren '('		Loc=<./src/math.c:3:13>
int 'int'		Loc=<./src/math.c:3:14>
identifier 'n'	 [LeadingSpace]	Loc=<./src/math.c:3:18>
r_paren ')'		Loc=<./src/math.c:3:19>
l_brace '{'	 [LeadingSpace]	Loc=<./src/math.c:3:21>
return 'return'	 [StartOfLine] [LeadingSpace]	Loc=<./src/math.c:4:5>
l_paren '('	 [LeadingSpace]	Loc=<./src/math.c:4:12>
identifier 'n'		Loc=<./src/math.c:4:13>
lessequal '<='	 [LeadingSpace]	Loc=<./src/math.c:4:15>
numeric_constant '0'	 [LeadingSpace]	Loc=<./src/math.c:4:18>
r_paren ')'		Loc=<./src/math.c:4:19>
question '?'	 [LeadingSpace]	Loc=<./src/math.c:4:21>
numeric_constant '0'	 [LeadingSpace]	Loc=<./src/math.c:4:23>
colon ':'	 [LeadingSpace]	Loc=<./src/math.c:4:25>
l_paren '('	 [LeadingSpace]	Loc=<./src/math.c:4:27>
identifier 'n'		Loc=<./src/math.c:4:28>
star '*'	 [LeadingSpace]	Loc=<./src/math.c:4:30>
l_paren '('	 [LeadingSpace]	Loc=<./src/math.c:4:32>
identifier 'n'		Loc=<./src/math.c:4:33>
plus '+'	 [LeadingSpace]	Loc=<./src/math.c:4:35>
numeric_constant '1'	 [LeadingSpace]	Loc=<./src/math.c:4:37>
r_paren ')'		Loc=<./src/math.c:4:38>
r_paren ')'		Loc=<./src/math.c:4:39>
greatergreater '>>'	 [LeadingSpace]	Loc=<./src/math.c:4:41>
numeric_constant '1'	 [LeadingSpace]	Loc=<./src/math.c:4:44>
semi ';'		Loc=<./src/math.c:4:45>
r_brace '}'	 [StartOfLine]	Loc=<./src/math.c:5:1>
float 'float'	 [StartOfLine]	Loc=<./src/math.c:7:1>
identifier 'circle_area'	 [LeadingSpace]	Loc=<./src/math.c:7:7>
l_paren '('		Loc=<./src/math.c:7:18>
float 'float'		Loc=<./src/math.c:7:19>
identifier 'r'	 [LeadingSpace]	Loc=<./src/math.c:7:25>
r_paren ')'		Loc=<./src/math.c:7:26>
l_brace '{'	 [LeadingSpace]	Loc=<./src/math.c:7:28>
return 'return'	 [StartOfLine] [LeadingSpace]	Loc=<./src/math.c:8:5>
identifier 'r'	 [LeadingSpace]	Loc=<./src/math.c:8:12>
star '*'	 [LeadingSpace]	Loc=<./src/math.c:8:14>
identifier 'r'	 [LeadingSpace]	Loc=<./src/math.c:8:16>
star '*'	 [LeadingSpace]	Loc=<./src/math.c:8:18>
numeric_constant '3.14f'	 [LeadingSpace]	Loc=<./src/math.c:8:20 <Spelling=./src/math.h:5:12>>
semi ';'		Loc=<./src/math.c:8:22>
r_brace '}'	 [StartOfLine]	Loc=<./src/math.c:9:1>
float 'float'	 [StartOfLine]	Loc=<./src/math.c:11:1>
identifier 'circle_circumference'	 [LeadingSpace]	Loc=<./src/math.c:11:7>
l_paren '('		Loc=<./src/math.c:11:27>
float 'float'		Loc=<./src/math.c:11:28>
identifier 'r'	 [LeadingSpace]	Loc=<./src/math.c:11:34>
r_paren ')'		Loc=<./src/math.c:11:35>
l_brace '{'	 [LeadingSpace]	Loc=<./src/math.c:11:37>
return 'return'	 [StartOfLine] [LeadingSpace]	Loc=<./src/math.c:12:5>
numeric_constant '2.0f'	 [LeadingSpace]	Loc=<./src/math.c:12:12>
star '*'	 [LeadingSpace]	Loc=<./src/math.c:12:17>
identifier 'r'	 [LeadingSpace]	Loc=<./src/math.c:12:19>
star '*'	 [LeadingSpace]	Loc=<./src/math.c:12:21>
numeric_constant '3.14f'	 [LeadingSpace]	Loc=<./src/math.c:12:23 <Spelling=./src/math.h:5:12>>
semi ';'		Loc=<./src/math.c:12:25>
r_brace '}'	 [StartOfLine]	Loc=<./src/math.c:13:1>
eof ''		Loc=<./src/math.c:13:2>
```

- `StartOfLine`: Marks tokens that appear at the very beginning of a line, often helping to determine the start of a new statement or block.

- `LeadingSpace`: Marks tokens that appear after some spaces or tabs (typically used for indentation or separating tokens).

Here is the formatted output for easier to read

```markdown
# main.c
| Token Type        | Token                 | Location                       |
|-------------------|-----------------------|--------------------------------|
| int               | int                   | ./src/math.h:8:1               |
| identifier        | sum_to_n              | ./src/math.h:8:5               |
| l_paren           | (                     | ./src/math.h:8:13              |
| int               | int                   | ./src/math.h:8:14              |
| identifier        | n                     | ./src/math.h:8:18              |
| r_paren           | )                     | ./src/math.h:8:19              |
| semi              | ;                     | ./src/math.h:8:20              |
| float             | float                 | ./src/math.h:9:1               |
| identifier        | circle_area           | ./src/math.h:9:7               |
| l_paren           | (                     | ./src/math.h:9:18              |
| float             | float                 | ./src/math.h:9:19              |
| identifier        | r                     | ./src/math.h:9:25              |
| r_paren           | )                     | ./src/math.h:9:26              |
| semi              | ;                     | ./src/math.h:9:27              |
| float             | float                 | ./src/math.h:10:1              |
| identifier        | circle_circumference  | ./src/math.h:10:7              |
| l_paren           | (                     | ./src/math.h:10:27             |
| float             | float                 | ./src/math.h:10:28             |
| identifier        | r                     | ./src/math.h:10:34             |
| r_paren           | )                     | ./src/math.h:10:35             |
| semi              | ;                     | ./src/math.h:10:36             |
| int               | int                   | ./src/math.c:3:1               |
| identifier        | sum_to_n              | ./src/math.c:3:5               |
| l_paren           | (                     | ./src/math.c:3:13              |
| int               | int                   | ./src/math.c:3:14              |
| identifier        | n                     | ./src/math.c:3:18              |
| r_paren           | )                     | ./src/math.c:3:19              |
| l_brace           | {                     | ./src/math.c:3:21              |
| return            | return                | ./src/math.c:4:5               |
| l_paren           | (                     | ./src/math.c:4:12              |
| identifier        | n                     | ./src/math.c:4:13              |
| lessequal         | <=                    | ./src/math.c:4:15              |
| numeric_constant  | 0                     | ./src/math.c:4:18              |
| r_paren           | )                     | ./src/math.c:4:19              |
| question          | ?                     | ./src/math.c:4:21              |
| numeric_constant  | 0                     | ./src/math.c:4:23              |
| colon             | :                     | ./src/math.c:4:25              |
| l_paren           | (                     | ./src/math.c:4:27              |
| identifier        | n                     | ./src/math.c:4:28              |
| star              | *                     | ./src/math.c:4:30              |
| l_paren           | (                     | ./src/math.c:4:32              |
| identifier        | n                     | ./src/math.c:4:33              |
| plus              | +                     | ./src/math.c:4:35              |
| numeric_constant  | 1                     | ./src/math.c:4:37              |
| r_paren           | )                     | ./src/math.c:4:38              |
| r_paren           | )                     | ./src/math.c:4:39              |
| greatergreater    | >>                    | ./src/math.c:4:41              |
| numeric_constant  | 1                     | ./src/math.c:4:44              |
| semi              | ;                     | ./src/math.c:4:45              |
| r_brace           | }                     | ./src/math.c:5:1               |
| float             | float                 | ./src/math.c:7:1               |
| identifier        | circle_area           | ./src/math.c:7:7               |
| l_paren           | (                     | ./src/math.c:7:18              |
| float             | float                 | ./src/math.c:7:19              |
| identifier        | r                     | ./src/math.c:7:25              |
| r_paren           | )                     | ./src/math.c:7:26              |
| l_brace           | {                     | ./src/math.c:7:28              |
| return            | return                | ./src/math.c:8:5               |
| identifier        | r                     | ./src/math.c:8:12              |
| star              | *                     | ./src/math.c:8:14              |
| identifier        | r                     | ./src/math.c:8:16              |
| star              | *                     | ./src/math.c:8:18              |
| numeric_constant  | 3.14f                 | ./src/math.c:8:20              |
| semi              | ;                     | ./src/math.c:8:22              |
| r_brace           | }                     | ./src/math.c:9:1               |
| float             | float                 | ./src/math.c:11:1              |
| identifier        | circle_circumference  | ./src/math.c:11:7              |
| l_paren           | (                     | ./src/math.c:11:27             |
| float             | float                 | ./src/math.c:11:28             |
| identifier        | r                     | ./src/math.c:11:34             |
| r_paren           | )                     | ./src/math.c:11:35             |
| l_brace           | {                     | ./src/math.c:11:37             |
| return            | return                | ./src/math.c:12:5              |
| numeric_constant  | 2.0f                  | ./src/math.c:12:12             |
| star              | *                     | ./src/math.c:12:17             |
| identifier        | r                     | ./src/math.c:12:19             |
| star              | *                     | ./src/math.c:12:21             |
| numeric_constant  | 3.14f                 | ./src/math.c:12:23             |
| semi              | ;                     | ./src/math.c:12:25             |
| r_brace           | }                     | ./src/math.c:13:1              |
| eof               |                       | ./src/math.c:13:2              |
```