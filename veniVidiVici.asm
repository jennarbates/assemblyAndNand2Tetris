
section .text
        global _start   ; declared for linker


_start:                 ;linker entry
        mov eax, 4      ;system call number 4 (sys_write) stored in register eax
        mov ebx, 1      ;file descriptor 1 (stdout) stored in register ebx
        mov ecx, msg    ; pointer to msg variable in .data, stored in register ecx
        mov edx, len    ; pointer to variable len in .data, stored in register edx
        int 0x80        ; calls kernel

        mov eax, 1      ; system call number (sys_exit)
        int 0x80        ; calls kernel

section .data

msg db "I came,", 0xa, "I saw,", 0xa, "I conquered.", 0xa               ; string to be printed with 0xa representing \n

len equ $ - msg                                                         ; len equals current offset - msg
