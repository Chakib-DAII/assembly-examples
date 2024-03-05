SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1

segment .data
    user_msg db 'Please enter 2 numbers: ' ;Ask the user to enter numbers
    len_user_msg equ $-user_msg             ;The length of the message

    instructions_msg db 'Results of logical instructions (OR, XOR, NOT):',0xA,0xD ; logical instructions message
    len_instructions_msg equ $-instructions_msg             ;The length of the message

    even_msg  db  '1st number is : Even Number!',0xA,0xD  ;message showing even number
    len1  equ  $ - even_msg

    odd_msg db  '1st number is : Odd Number!',0xA,0xD   ;message showing odd number
    len2  equ  $ - odd_msg

    num_len equ 2

    end_l db "", 0xA,0xD
    end_l_len equ $- end_l

segment .bss        ;Uninitialized data
    num resb num_len
    num1 resb num_len
    result resb num_len

section .text
    global _start            ;must be declared for using gcc

_start:                     ;tell linker entry point

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, user_msg
    mov edx, len_user_msg
    int 0x80

    ;Read and store the user input
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, num
    mov edx, num_len         ;10 bytes
    int 0x80

    ;Read and store the user input
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, num1
    mov edx, num_len         ;10 bytes
    int 0x80

even_or_odd:
    mov   al, [num]          ;getting 1st number in the al
    and   al, 1              ;and ax with 1
;    test   al, 1              ; TEST instruction works same as the AND operation, but unlike AND instruction, it does not change the first operand
    jz    even_number

    mov   eax, SYS_WRITE     ;system call number (sys_write)
    mov   ebx, STDOUT        ;file descriptor (stdout)
    mov   ecx, odd_msg       ;message to write
    mov   edx, len2          ;length of message
    int   0x80               ;call kernel
    jmp   instructions

even_number:
    mov   eax, SYS_WRITE     ;system call number (sys_write)
    mov   ebx, STDOUT        ;file descriptor (stdout)
    mov   ecx, even_msg      ;message to write
    mov   edx, len1          ;length of message
    int   0x80               ;call kernel

instructions:
    mov   eax, SYS_WRITE                ;system call number (sys_write)
    mov   ebx, STDOUT                   ;file descriptor (stdout)
    mov   ecx, instructions_msg         ;message to write
    mov   edx, len_instructions_msg     ;length of message
    int   0x80                          ;call kernel

    ; or instruction
    mov   al, [num]         ;getting 1st number in the al
    mov   bl, [num1]        ;getting 2nd number in the bl
    or    al, bl            ;or al and bl registers
    add   al, byte '0'      ;converting decimal to ascii

    mov    [result],  al

    mov   eax, SYS_WRITE     ;system call number (sys_write)
    mov   ebx, STDOUT        ;file descriptor (stdout)
    mov   ecx, result        ;message to write
    mov   edx, num_len       ;length of message
    int   0x80               ;call kernel

    ;return line
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, end_l
    mov edx, end_l_len
    int 0x80

    ; xor instruction
    mov   al, [num]         ;getting 1st number in the al
    mov   bl, [num1]        ;getting 2nd number in the bl
    xor   al, bl            ;or al and bl registers
    add   al, byte '0'      ;converting decimal to ascii

    mov    [result],  al

    mov   eax, SYS_WRITE     ;system call number (sys_write)
    mov   ebx, STDOUT        ;file descriptor (stdout)
    mov   ecx, result        ;message to write
    mov   edx, num_len       ;length of message
    int   0x80               ;call kernel

    ;return line
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, end_l
    mov edx, end_l_len
    int 0x80

    ; xor instruction
    mov   al, [num]         ;getting 1st number in the al
    mov   bl, [num1]        ;getting 2nd number in the bl
    not   al                ; not al register
    not   bl                ; not bl register
    add   al, byte '0'      ;converting decimal to ascii
    add   bl, byte '0'      ;converting decimal to ascii

    mov    [result],  al

    mov   eax, SYS_WRITE     ;system call number (sys_write)
    mov   ebx, STDOUT        ;file descriptor (stdout)
    mov   ecx, result        ;message to write
    mov   edx, num_len       ;length of message
    int   0x80               ;call kernel

    ;return line
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, end_l
    mov edx, end_l_len
    int 0x80

    mov    [result],  bl

    mov   eax, SYS_WRITE     ;system call number (sys_write)
    mov   ebx, STDOUT        ;file descriptor (stdout)
    mov   ecx, result        ;message to write
    mov   edx, num_len       ;length of message
    int   0x80               ;call kernel

    ;return line
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, end_l
    mov edx, end_l_len
    int 0x80

exit:
   mov   eax,1              ;system call number (sys_exit)
   int   0x80               ;call kernel

;AND	AND operand1, operand2
;OR	OR operand1, operand2
;XOR	XOR operand1, operand2
;TEST	TEST operand1, operand2
;NOT	NOT operand1