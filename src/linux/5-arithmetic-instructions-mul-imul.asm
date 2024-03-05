SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1

section .data
    msg db "The result is:", 0xA,0xD
    len equ $- msg

    end_l db 0xA,"", 0xA,0xD
    end_l_len equ $- end_l

segment .bss
    res resb 1

section	.text
   global _start    ;must be declared for using gcc

_start:             ;tell linker entry point

   ; moving the first number to al register and second number to bl
   ; and subtracting ascii '0' to convert it into a decimal number
   mov	al, '3'
   sub  al, '0'

   mov 	bl, '2'
   sub  bl, '0'

   mul 	bl ; multiply bl to al
   add	al, '0' ; subtracting ascii '0' to convert it into a decimal number

   mov 	[res], al ; moving al value to res

   mov	ecx, msg
   mov	edx, len
   mov	ebx,STDOUT	;file descriptor (stdout)
   mov	eax,SYS_WRITE	;system call number (sys_write)
   int	0x80	;call kernel

   mov	ecx,res
   mov	edx, 1
   mov	ebx,STDOUT	;file descriptor (stdout)
   mov	eax,SYS_WRITE	;system call number (sys_write)
   int	0x80	;call kernel

   ;return line
   mov eax, SYS_WRITE
   mov ebx, STDOUT
   mov ecx, end_l
   mov edx, end_l_len
   int 0x80
exit:
   mov	eax,SYS_EXIT	;system call number (sys_exit)
   int	0x80	;call kernel
