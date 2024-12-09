@echo off

:: ######################### CL #########################

:: doc: https://learn.microsoft.com/en-us/cpp/build/reference/compiling-a-c-cpp-program?view=msvc-170

:: Clean
del /Q /F out\cl\*

:: Build and link
cl src\sort.c /Fo:out\cl\sort.obj /link /out:out\cl\sort.exe

:: Compile to assembly with different optimization options
cl /Od /FA /Faout\cl\sort_o0.asm src\sort.c
cl /O1 /FA /Faout\cl\sort_o1.asm src\sort.c
cl /O2 /FA /Faout\cl\sort_o2.asm src\sort.c

:: ######################################################

