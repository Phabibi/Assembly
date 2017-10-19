	.globl times
times:

    movl $1 , %ecx
    movl $0 , %eax
    movl %edi, %edx

base:
    cmpl $1 , %esi
    je endbase


loop:
    cmpl %ecx, %esi
    jbe endl
    addl  %edi , %edx
    incl %ecx
    movl %edx ,%eax
    jmp loop


endbase:
    movl %edi,%eax
    ret

endl:
     ret
