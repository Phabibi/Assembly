	.globl sqrt

	#Author : Parsa Habibi
	#Date : Sept 28th 2017
sqrt:
	movl $0, %eax 
	movl $0x8000, %ecx
	mov $0 , %esi


main_loop:
	
	xor  %ecx , %esi
	movl %esi , %eax 
	imul %esi , %esi
	cmp  %esi , %edi 
	jl its_too_big_loop 
	movl %eax , %esi 
	shr $1 , %ecx 
	cmp $0 , %ecx 
	je endl
	jmp main_loop

its_too_big_loop:
	
	movl %eax , %esi
	xor %ecx , %esi
	movl %esi , %eax 
	shr $1, %ecx 
	cmp $0, %ecx 
	je endl
	jmp main_loop



endl:
	ret
