#!/bin/bash

# Shows the raw binary content of the object file in hexadecimal
# -C: show both hex and ASCII
hexdump -C ./out/main.o

# View the usage of otool
# otool is used to view content of object file in macOS
# You can use objdump (objdump not fully support file format mach-o arm64)
otool
objdump

# header (mach-o type header)
otool -h ./out/main.o
objdump -x ./out/main.o

# load commands
otool -l ./out/main.o
objdump -x ./out/main.o

# -s <segname> <sectname> print contents of section
# <segname> segment name
# <sectname> section name
otool -s __TEXT __text ./out/main.o
objdump -j __text -d ./out/main.o

#  -t print the text section (disassemble with -v)
#  -x print all text sections (disassemble with -v)
otool -t ./out/main.o
otool -tv ./out/main.o
otool -x ./out/main.o
otool -xv ./out/main.o
objdump -d ./out/main.o

# -r print the relocation entries in all sections
otool -r ./out/main.o
objdump --reloc ./out/main.o

# Symbol Table
# otool not support print symbol table
nm ./out/main.o
objdump --syms ./out/main.o

