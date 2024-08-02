section .data           ; store variables
    string dw "Hello, World!", 0xA  ; 0xA cause a new line
    string_len equ $-string         ; get the lenght

    ; computer bytes look like this:
    ; 0x6c6c6548    0x57202c6f    0x646c726f    0x000a0021  
    ;    l l e H       W   , o       d l r o        \n   !

    ; string db "Hello, World!", 0xA  ; 0xA cause a new line

    ; in this case with "db" computer bytes look like this:
    ; 0x6c6c6548    0x57202c6f    0x646c726f    0x00000a21  
    ;    l l e H       W   , o       d l r o          \n !


section .text           ; actual code
global _start

_start:
    ; write the Hello World
    mov eax, 4          ; sys_wirte system call
    mov ebx, 1          ; file descriptor 1 ( stdout )
    mov ecx, string     ; pointer to the string
    mov edx, string_len ; length of the string ( if not given can cause "Undefine Behavior", "Possible Crashes" or "Garbage Data")
    int 0x80            ; invoke syscalls ( sys_write ) 

    ; exit the program    
    mov eax, 1          ; sys_exit
    mov ebx, 0          ; return value
    int 0x80            ; invoke syscalls ( sys_exit )