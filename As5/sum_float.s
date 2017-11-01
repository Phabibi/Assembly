.globl sum_float
 
    # var map:
    #   %xmm0:  total
    #   %rdi:   F[n] (base pointer)
    #   %rsi:   n
    #   %rbp:   endptr
    #	%rdx:	top 
    #	%rcx: 	keeps track of the top of the stack (where %rbp is)
 	# 	%r10: 	scratch
 	#	%r11:	scratch
 	#	%xmm0: 	result
 	#	%xmm8:	scratch 0.0
 	#	%xmm9:	scratch 0.0
 	#	%xmm10: x
 	#	%xmm11: y


sum_float:
	
  push %rbp						#rsp+0 = rbp
  mov %rsp, %rcx 				#rcx points to the first thing on the stack 
  xorps %xmm0,%xmm0				#empty out the floating point registers 
  xorps %xmm8,%xmm8
  xorps %xmm9,%xmm9
  xorps %xmm10,%xmm10
  xorps %xmm11,%xmm11
  leaq (%rdi, %rsi, 4) , %rbp	#endpointer for F[n]

base:							#base cases for when n = 0 or n = 1

  cmp $0,%rsi 					# n = 0, return 0.0
  je empty_F

  cmp $1,%rsi 					# n = 1,  return F[0]
  je one_elem

  movss (%rdi),%xmm10			
  add $4,%rdi
  movss (%rdi),%xmm11
  add $4,%rdi
  addss %xmm10,%xmm11			#x + y
  movq %xmm11, %r10
  push %r10						#push x + y 
  mov %rsp,%rdx					#head == tail (f[0]+f[1] )
  xorps %xmm10,%xmm10
  xorps %xmm11,%xmm11

loop_for_x:
	cmp %rdx , %rsp
	jg x_from_F

	cmp %rdi, %rbp			#while (endpt >= f[i]) {
	jl x_from_Q_empty


	movss (%rdi),%xmm10		#F[head] -> xmm10
	movss (%rdx),%xmm11		#Q[head] -> xmm11
	ucomiss	%xmm10,%xmm11 	#compare to see which ones smaller
	jge x_from_F			#if Q[head] >= F[head] then x = F[head]
	jle x_from_Q				#else Q[head] < F[head] x = Q[head]




loop_for_y:
	
	cmp %rdi, %rbp			#while (endpt > f[i]) {
	jl y_from_Q_empty

	cmp %rdx,%rsp
	jg Y_from_F_empty

	movss (%rdi),%xmm10		#F[head] -> xmm10
	movss (%rdx),%xmm11		#Q[head] -> xmm11
	ucomiss	%xmm10,%xmm11 	#compare to see which ones smaller
	jge y_from_F			#if Q[head] >= F[head] then y = F[head]
	jl y_from_Q				#else Q[head] < F[head] y = Q[head]

 
x_from_Q: 					#takes x from Q
   	movss %xmm11, %xmm8
   	sub $8,%rdx
   	jmp loop_for_y
   	


y_from_Q:				 #takes y from Q
	movss %xmm10,%xmm9
	sub $8, %rdx
	jmp x_plu_y


x_from_F:					#takes x from F
	cmp %rdi, %rbp
	jl endloop
	movss %xmm10,%xmm8		# x = F[head]
	add $4, %rdi			# F[head] + 4
	cmp %rdx, %rsp			#if my Q is empty (Q[tail] > Q[head] , x = F[head]
	jg y_from_F
	jmp loop_for_y


y_from_F:					#take Y from F
	movss %xmm10,%xmm9
	add $4,%rdi
    jmp x_plu_y

x_from_F_empty:				#takes X from F if Q empty
	movss (%rdi) ,%xmm8
	add $4, %rdi
	jmp loop_for_y

y_from_Q_empty:				#takes y from Q if F empty
	movss (%rdx) ,%xmm9
	sub $8, %rdx
	jmp x_plu_y	

x_from_Q_empty:				#takes x  from F if Q empty
	
	cmp %rdx, %rsp
	jg endloop 				#if f(head) < then f(head) -> x 
   	movss (%rdx), %xmm8
   	sub $8,%rdx
   	jmp loop_for_y

Y_from_F_empty:				#takes y from F if Q empty

	cmp %rdi, %rbp
	jl sum_from_Q
	movss (%rdi),%xmm9
	addq $4,%rdi
	jmp  x_plu_y

sum_from_Q:					#if Q is not empty but 
	cmp %rdx , %rsp
	je endloop
	movss (%rdx),%xmm8
	movq %xmm8, %r10
	push %r10
	sub $8,%rbp
	cmp %rdx,%rsp
	je endloop
	movss (%rdx), %xmm9
	addss %xmm8, %xmm9
	movq %xmm9, %r10
	push %r10
	sub $8,%rbp
	jmp sum_from_Q



 x_plu_y:						#adds x+y and puts on the stack

  	addss %xmm8,%xmm9
  	movq %xmm9 , %r10
  	push %r10
  	xorps %xmm8,%xmm8			#empty registers
  	xorps %xmm9,%xmm9
  	xorps %xmm10,%xmm10
    xorps %xmm11,%xmm11
  	jmp loop_for_x  


endloop:						#points the head and tail to the same thing and ends the opertaion 
 	mov %rsp,%rdx
	movss (%rdx),%xmm0
	mov %rcx, %rsp				#puts Rsp where it was originally and returns the xmm0
	xor %rcx,%rcx

	pop %rbp 	
	ret

empty_F:						#base case for when array is empty, just retun 0.0
	pop %rbp
	ret

one_elem:					  	#there is only 1 thing in the F, ust return F[0]			
	movss (%rdi),%xmm0
	pop %rbp
	ret



