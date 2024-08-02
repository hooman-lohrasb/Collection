Just a little Note:

in order to be able to use -m32 in compiling:

'gcc -S sample.c -o sample -fno-stack-protector -z execstack -no-pie -m32'


i had to isntall the following package in Ubuntu:
    'sudo apt install glibc-source'