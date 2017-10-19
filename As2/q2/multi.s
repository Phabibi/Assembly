.globl multi 

multi: 
	
	movl $0 , %ecx 

	leal 2(,%edi,2),%edi
	leal 1(%edi , %edi ,8),%eax
	ret
