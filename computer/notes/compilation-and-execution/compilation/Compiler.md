# Compiler

A compiler is a program that translates high-level programming code into machine code (executable program).

## Front end

The front end is responsible for analyzing the source code and converting it into an intermediate representation (IR).

Front end is lanaguage dependent

Main task:
- Lexical Analysis: Breaking the source code into tokens (keywords, operators, identifiers, etc.).
- Syntax & Semantic Analysis (Parsing): Analyzes the sequence of tokens to build an abstract syntax tree (AST), which represents the grammatical structure of the code. Check for syntax & semantic errors.
- Code Generation: Generate Intermediate Representation (IR) from the AST. IR is 

## Middle End

The middle end focuses on optimizing IR without changing program logic. This could include optimizations like loop unrolling, inlining, constant folding, and dead code elimination.

## Back End

The back end is responsible for translating the IR into machine code, generate object file for each source file

