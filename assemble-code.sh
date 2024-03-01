#!/bin/bash

# this script is used to generate executable from asm code
# created by Chakib DAII

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
  echo "Usage: ${0##*/} SOURCE-DIRECTORY SOURCE ARCHITECTURE
        \n SOURCE-DIRECTORY (source file directory)
        \n SOURCE (source file without extension)
        \n ARCHITECTURE (32 or 64)"
  exit 1
fi

echo generating executable from $1/$2 in $3 architecture

if [ $3 = 32 ]; then
  nasm -f elf $1/$2.asm -o $1/object-files/$2.o
else
  nasm -f elf64 $1/$2.asm -o $1/object-files/$2.o
fi

ld $1/object-files/$2.o -o $1/executables/$2