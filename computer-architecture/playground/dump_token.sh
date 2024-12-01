#!/bin/bash

# This script is used to dump tokens after lexical analysis stages of compiling process

# using clang
clang -cc1 -dump-tokens ./src/math.c

# using gcc
gcc -fdump-tree-original ./src/math.c
