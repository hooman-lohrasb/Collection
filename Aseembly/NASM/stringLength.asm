section .data
    msg db "Sample Text", 0xA

section .text
global _start
_start:

    mov eax, msg        ; set EAX to msgs register  ; eax:  0x804a00e
    mov ebx, eax        ; samething for ebx         ; ebx:  0x804a00e

loop:
    cmp byte [eax], 0   ; check each byte of pointer to see if there is a 0 or not
    jz end              ; if there was a 0 jump to end function
    inc eax             ; otherwise increase by one 
    jmp loop            ; jump to the start of loop
end:
    sub eax, ebx        ; subtract ebx from eax and set the value to eax
    mov edx, eax        ; set the result to edx ( edx is for length )
    mov eax, 4          ; sys_write system calls 
    mov ebx, 1          ; with file descriptor 1 ( stdout )
    mov ecx, msg        ; write the msg it self
    int 0x80            ; calling the kernel

    ; exiting the program
    mov eax, 1          
    mov ebx, 0
    int 0x80