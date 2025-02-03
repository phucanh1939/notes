@echo off

:: ######################################################################################################################

:: # Compier: CL 
:: - doc: https://learn.microsoft.com/en-us/cpp/build/reference/compiling-a-c-cpp-program?view=msvc-170

:: del /Q /F out\cl\*
cl src\sort.c /Fo:out\cl\sort.obj /link /out:out\cl\sort.exe
cl /Od /FAs /Faout\cl\sort_o0.asm src\sort.c
cl /O1 /FAs /Faout\cl\sort_o1.asm src\sort.c
cl /O2 /FAs /Faout\cl\sort_o2.asm src\sort.c

:: ######################################################################################################################

:: # Compiler: CLANG 

clang -S -O0 ./src/sort.c -o ./out/clang/sort_o0.s
clang -S -O1 ./src/sort.c -o ./out/clang/sort_o1.s
clang -S -O2 ./src/sort.c -o ./out/clang/sort_o2.s
clang -S -O3 ./src/sort.c -o ./out/clang/sort_o3.s

:: ######################################################################################################################
