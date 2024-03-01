section	.text
   global _start     ;must be declared for linker (ld)
_start:             ;tell linker entry point

   ;writing 'Hey, How are you? '
   mov	edx,length       ;message length
   mov	ecx, msg   ;message to write
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel

   mov	[msg],  dword 'HEY,'    ; Changed the first 4 bytes to uppercase

   ;writing 'HEY, How are you? '
   mov	edx,length       ;message length
   mov	ecx,msg    ;message to write
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel

   mov	eax,1       ;system call number (sys_exit)
   int	0x80        ;call kernel

section	.data
msg db 'Hey, How are you? ',0xA,0xD
length equ $-msg ;The length of the message