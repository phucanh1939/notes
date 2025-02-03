#!/bin/bash

######################### CLANG #########################

# Compile and link
clang ./src/sort.c -o ./out/sort.a.out

# Compile to assembly with optimization options
clang -S -O0 ./src/sort.c -o ./out/sort_o0.s
clang -S -O1 ./src/sort.c -o ./out/sort_o1.s
clang -S -O2 ./src/sort.c -o ./out/sort_o2.s
clang -S -O3 ./src/sort.c -o ./out/sort_o3.s

#########################################################
