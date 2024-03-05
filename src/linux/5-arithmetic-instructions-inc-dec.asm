segment .data
   count dw  0
   value db  15

section .text
   global _start         ;must be declared for using gcc

_start:	                 ;tell linker entry point
   inc word [count]
   dec byte [value]

   mov ebx, count
   inc word [ebx]

   mov esi, value
   dec byte [esi]