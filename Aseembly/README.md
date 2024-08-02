## Just a little Note:

in order to be able to use -m32 in compiling:

    $ gcc sample.c -o sample -fno-stack-protector -z execstack -no-pie -m32


i had to isntall the following package in Ubuntu:

    $ sudo apt install glibc-source

#

the problem was that when we want to compile it we need a header called **wordsize.h** which was located in glibc-source for debian based linux-distributions

for rpm-based linux-distributions the **wordsize.h** is included in **glibc-headers** so we can easly use:

    $ sudo dnf install glibc-headers


    > This whole section is for the case that you want to learn from C-file


# How to compile the programs using NASM
    
    $ nasm -f elf32 sample.asm -o sample.o
    $ ld -m elf_i386 sample -o sample

## Just a liitle bit of explanation

with **-f** we specify the format ( in our case it's x86 which we write it as **elf32** )
to see all valid formats in nasm you can run:

    $ nasm -hf
