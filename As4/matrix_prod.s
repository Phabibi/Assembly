
.globl matrix_prod
matrix_prod:            # void matrix_prod(void *A, void *B, void *C, int n);
 
    mov $0, %r10
    mov $0 , %r11
    push %rdi           #rsp+24
    push %rsi           #rsp+16
    push %rdx           #rsp+8
    push %rcx           #rsp+0
    xor %rdx,%rdx
    mov %rcx, %rdx      # rdx = n  
    xor %rcx, %rcx      #emppu rcx
 
 
outter_loop:
    cmp %r10, (%rsp)             # for i = 0 ; i <= n ; i++
    jl endl
    mov $0 , %r11                # sets j to 0 everytime j >= n 
 	
inner_loop:						#for j=0 ; j <= n ; j++
    mov %r10 , %rcx             #i -> rcx
    cmp %r11, (%rsp)
    jl inner_loop_inc			#if j >= n we are out of range 
    mov %r11, %r8
    xor %rax, %rax	
    inc %r11					
    call dot_prod				#we follow function porotacl (*A->rdi,*B->rsi,n->rdx,i->rdx,j->r8)
    xor %rsi, %rsi
    xor %rdi, %rdi
    mov $17, %rsi				#empty the registers after used, 17->rsi and rax->rsi (resuls to be rax mod 17)
    mov %rax, %rdi
    call mod
    xor %rdx, %rdx				#reset rdx since its used by mod
    mov 8(%rsp), %rdx			#stsore its orig value back 
    push %r10
    imul 8(%rsp) ,%r10      	#i*n
    dec %r11
    add %r11, %r10          	#i*n+j
    add %r10,%rdx				# base adress + i*n+j
    mov %rax,(%rdx)				# rax is now in corrrect pos in C
    mov %rdx, %rax				#return C in rax 			
    pop %r10
    mov (%rsp) , %rdx			#store the registers back and start over if j <= n
    mov 24(%rsp) , %rdi
    mov 16(%rsp) , %rsi
    inc %r11
    jmp inner_loop 
   
inner_loop_inc:					#will only hit if j>= n 
	inc %r10					#inc i 
	jmp outter_loop				#jump back to the first loop to reset j to 0
endl:	
	pop %rcx					#store the registers back and ret the result 			
	pop %rdx
	pop %rsi
	pop %rdi

	ret
