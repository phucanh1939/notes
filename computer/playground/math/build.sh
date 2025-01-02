#!/bin/bash

# In macOS, gcc will call clang

# Create the output directory if it doesn't exist
mkdir -p ./out

# -S: compile to assembly
gcc -S ./src/main.c -o ./out/main.s
gcc -S ./src/math.c -o ./out/math.s

# -c: compile to object file
gcc -c ./src/main.c -o ./out/main.o
gcc -c ./src/math.c -o ./out/math.o

# link object files to generate executable
gcc ./out/main.o ./out/math.o -o ./out/program.a.out
