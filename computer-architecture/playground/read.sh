#!/bin/bash

# Shows the raw binary content of the object file in hexadecimal
# -C: show both hex and ASCII
hexdump -C ./out/main.o

# List all section
# objdump: Primarily designed for Linux and other Unix-like systems, works with ELF (Executable and Linkable Format) files
# otool: Primarily designed for macOS, work with Mach-O format files
objdump -h ./out/main.o
otool -l ./out/main.o

# View the header section
objdump -f ./out/main.o
otool -h ./out/main.o

# Disassembles .text section (contains instructions)
objdump -d ./out/main.o
otool -tV ./out/main.o

# View the Symbol Table
objdump -t ./out/main.o
otool -I -v ./out/main.o


