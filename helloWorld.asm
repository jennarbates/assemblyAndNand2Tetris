; helloWorld.asm gets compiled to an object file which is then use linker to convert into executable file
section .text                               ; section with actual code

        global _start                       ; keyword to inform kernal where execution start (linker uses this)

_start:                                     ; tells the linker where the main extry point is and the instructions the kernel must follow
        mov edx, len                        ; stores the length of the message in the edx register
        mov ecx, msg                        ; stores the message in the ecx register
        mov ebx, 1                          ; file descriptor 1 is used for stdout and stored in the ebx register
        mov eax, 4                          ; system call number 4 (sys_write) in eax register
        int 0x80                            ; calls the kernel
        mov eax, 1                          ; system call number 1 (sys_exit)
        int 0x80                            ; calls the kernel again
section .data:
        msg db "hello, world!", 0xa         ; db = define bytes, msg = name of variable, 0xa = new line (can also use 10) because char(0xa) is '\n'
        len equ $ - msg
