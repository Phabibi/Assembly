    .globl dot_prod
dot_prod:	
	xor %rax, %rax					#we mask XAR by itself to make it 0 so we could use %al
	mov $0 , %r9				    #initlize our k 
	mov $0 , %r10					#initlize our starting pointer in Matrix A to 0
	mov $0 , %r11					#initlize our starting pointer in Matrix AB to 0
	mov %rdx,%r10					#move n into our empty register so we can use it for computation  
	imul %rcx,%r10					#multiply n*i 
	add %rdi, %r10 					#add our base address A + n * i , this is where we want row we start our multiplication in A
	mov %r8, %r11					#we move j into empty register 
	add %rsi, %r11					#add the base address of B to it ( B + j), this is the column in B that we want to multply A to 
	mov $0, %rcx					#we empty the registers that originally contained i , j 
	mov $0, %r8b					#to be used in our loop, since we dont need them after initilization 

main_loop:							# calculates Aik * Bkj
	cmp %r9 , %rdx					#we compare our counter , k to n 
	jle endl						#if it was less than or equal to 0 we jump , other wise we move forward 
	mov (%r10) , %rcx				#we store the base addresses into  
	mov (%r11) , %r8w				#the empty registers for multplication 
	imulw %r8w ,%cx 				#we multiply their 16 bit registers (since theres no imulb), (Aik * Bjk)
	addb %cl, %al					#add them to our restulr %al (8 bit register), al+= (Aik * Bjk)
	add $1, %r10					#increment our base pointer to A by 1 
	add %rdx ,%r11					#increment our base pointer to B by n (since we have to move down the colomns)
	inc %r9							#increment our counter by 1 eachtime 
	jmp main_loop 					#jump back to loop and repeat the process 	

endl:
	ret

