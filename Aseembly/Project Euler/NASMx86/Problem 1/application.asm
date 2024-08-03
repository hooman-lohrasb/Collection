section .data
    msg db "The result is: ", 0
    len equ $-msg           ; Get the length of the text message
    sum db 0                ; Variable to store the sum
    cnt db 0                ; Counter variable

section .bss
    buffer resb 100         ; Reserve 100 bytes for buffer
    bufferPointer resb 4    ; Reserve 4 bytes for buffer pointer (32-bit)

section .text
global _start

_start:
    ; Print the initial message
    mov eax, 4              ; Syscall number for sys_write
    mov ebx, 1              ; File descriptor 1 (stdout)
    mov ecx, msg            ; Pointer to message
    mov edx, len            ; Length of message
    int 0x80                ; Make syscall to write message

    mov ebx, 0              ; Initialize sum holder in ebx to 0

loop:
    ; Increment cnt and check if it's 1000
    mov edi, [cnt]          ; Load cnt into edi
    inc edi                 ; Increment edi
    mov [cnt], edi          ; Store updated edi back to cnt
    cmp edi, 1000000        ; Compare edi with 1000
    je end                  ; If cnt is 1000, jump to end

    ; Check if cnt is divisible by 3
    mov eax, [cnt]          ; Load cnt into eax
    mov ecx, 3              ; Set divisor to 3
    mov edx, 0              ; Clear edx for division
    div ecx                 ; Divide eax by ecx
    cmp edx, 0              ; Check remainder
    je add_sum              ; If remainder is 0, jump to add_sum

    ; Check if cnt is divisible by 5
    mov eax, [cnt]          ; Load cnt into eax
    mov ecx, 5              ; Set divisor to 5
    mov edx, 0              ; Clear edx for division
    div ecx                 ; Divide eax by ecx
    cmp edx, 0              ; Check remainder
    je add_sum              ; If remainder is 0, jump to add_sum

    ; If cnt is not divisible by 3 or 5, continue loop
    jmp loop

add_sum:
    ; Add cnt to sum
    add ebx, [cnt]          ; Add cnt to sum (stored in ebx)
    jmp loop                ; Continue loop

end:
    ; Store the final sum and print it
    mov [sum], ebx          ; Store sum in memory
    mov eax, [sum]          ; Load sum into eax
    call _printEAX          ; Call print function

    ; Exit the program
    mov eax, 1              ; Syscall number for exit
    xor ebx, ebx            ; Exit code 0
    int 0x80                ; Make syscall

_printEAX:
    ; Initialize buffer for printing
    mov ecx, buffer         ; Pointer to the start of buffer
    mov edx, 0xA            ; Newline character
    mov [ecx], edx          ; Store newline at start of buffer
    inc ecx                 ; Increment buffer pointer
    mov [bufferPointer], ecx; Store updated pointer

_printEAXLoop:
    ; Convert eax to string in reverse order
    mov edx, 0              ; Clear edx for division
    mov ebx, 10             ; Set divisor to 10 (base 10)
    div ebx                 ; Divide eax by 10
    add edx, 48             ; Convert remainder to ASCII

    mov ecx, [bufferPointer]; Load current buffer pointer
    mov [ecx], dl           ; Store ASCII character in buffer
    inc ecx                 ; Increment buffer pointer
    mov [bufferPointer], ecx; Store updated pointer

    cmp eax, 0              ; Check if eax is 0
    jne _printEAXLoop       ; If not, continue loop

_printEAXLoopResult:
    ; Print the string in buffer
    mov ecx, [bufferPointer]; Load current buffer pointer

    mov eax, 4              ; Syscall number for sys_write
    mov ebx, 1              ; File descriptor 1 (stdout)
    mov edx, 1              ; Length of 1 character
    int 0x80                ; Make syscall

    dec ecx                 ; Decrement buffer pointer
    mov [bufferPointer], ecx; Store updated pointer

    cmp ecx, buffer         ; Check if pointer has reached start of buffer
    jge _printEAXLoopResult ; If not, continue printing

    ret                     ; Return to end