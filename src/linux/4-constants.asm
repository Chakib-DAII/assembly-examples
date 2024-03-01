
;defining constants
SYS_EXIT  equ 1
SYS_FORK  equ 2
SYS_READ  equ 3
SYS_WRITE equ 4
SYS_OPEN equ 5
SYS_CLOSE equ 6

STDIN     equ 0
STDOUT    equ 1

section	 .data ;Data segment
userMsg db 'Please your name: ' ;Ask the user to enter a number
lenUserMsg equ $-userMsg        ;The length of the message

msg1 db	'Hello '
len1 equ $ - msg1

msg2 db 0xA, 'Welcome to the world of,', 0xA,0xD
len2 equ $ - msg2

msg3 db 'Linux assembly programming! ', 0xA
len3 equ $- msg3

name_len equ 10

section .bss           ;Uninitialized data
   name resb name_len

section	 .text
   global _start    ;must be declared for using gcc

_start:             ;tell linker entry point
   mov eax, SYS_WRITE
   mov ebx, STDOUT
   mov ecx, userMsg
   mov edx, lenUserMsg
   int 0x80

   ;Read and store the user input
   mov eax, SYS_READ
   mov ebx, STDIN
   mov ecx, name
   mov edx, name_len         ;10 bytes
   int 0x80

   mov eax, SYS_WRITE
   mov ebx, STDOUT
   mov ecx, msg1
   mov edx, len1
   int 0x80

   ;Output the name entered
   mov eax, SYS_WRITE
   mov ebx, STDOUT
   mov ecx, name
   mov edx, name_len
   int 0x80

   mov eax, SYS_WRITE
   mov ebx, STDOUT
   mov ecx, msg2
   mov edx, len2
   int 0x80

   mov eax, SYS_WRITE
   mov ebx, STDOUT
   mov ecx, msg3
   mov edx, len3
   int 0x80

   mov eax,SYS_EXIT    ;system call number (sys_exit)
   int 0x80            ;call kernel
