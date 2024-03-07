SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1

section .data
    end_l db "", 0xA,0xD
    end_l_len equ $- end_l

section	.bss
    num resb 1
    ecx_save resb 1

section	.text
    global _start        ;must be declared for using gcc

_start:	                ;tell linker entry point
    mov ecx, 78
    mov eax, '1'

loop1:
    mov [num], eax  ; moving eax to num
    mov eax, SYS_WRITE
    mov ebx, STDOUT
;    push ecx ; pushing ecx to stack -> not supported by 64 arch
    mov [ecx_save], ecx

    mov ecx, num ; moving num to ecx
    mov edx, 1  ; moving 1 to edx
    int 0x80

    mov eax, [num]
    sub eax, '0'    ; subtracting ascii '0' to convert it into a decimal number
    inc eax         ; increment eax
    add eax, '0'    ; adding '0' to to convert the sum from decimal to ASCII
;    pop ecx ; pushing ecx from stack -> not supported by 64 arch
    mov ecx, [ecx_save]

    loop loop1

    ;return line
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, end_l
    mov edx, end_l_len
    int 0x80

exit:
    mov eax,1             ;system call number (sys_exit)
    int 0x80              ;call kernel