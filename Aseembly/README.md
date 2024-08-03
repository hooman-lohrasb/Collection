# How to compile the programs using NASM
    
    $ nasm -f elf32 sample.asm -o sample.o
    $ ld -m elf_i386 sample -o sample

## Just a little bit of explanation

with **-f** we specify the format ( in our case it's x86 which we write it as **elf32** )
to see all valid formats in nasm you can run:

    $ nasm -hf


# available system calls 

to see available system calls you can locate the header file via following command

    $ locale sys unistd_32.h

but for the sake of Simplification you can find the file content in **unistd_32_syscalls**


## Just a little Note:

> This whole section is for the case that you want to learn from C-file

in order to be able to use -m32 in compiling:

    $ gcc sample.c -o sample -fno-stack-protector -z execstack -no-pie -m32


i had to isntall the following package in Ubuntu:

    $ sudo apt install glibc-source

#

the problem was that when we want to compile it we need a header called **wordsize.h** which was located in glibc-source for debian based linux-distributions

for rpm-based linux-distributions the **wordsize.h** is included in **glibc-headers** so we can easly use:

    $ sudo dnf install glibc-headers

## Personal Document:

We probably already know that in case of using EAX as sys_calls, we would modify EBX as well but what are the values? and what do they mean?

    mov eax, 3      ; 3 is for reading from user
    mov ebx, 0      ; 0 ( stdin ), 1 ( stdout ), 2 ( std error ) 
