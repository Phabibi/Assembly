	.file	"stats.c"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB4:
	.text
.LHOTB4:
	.p2align 4,,15
	.globl	min_max_avg
	.type	min_max_avg, @function
min_max_avg:
.LFB26:
	.cfi_startproc
	testl	%esi, %esi
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	56(%rsp), %r11
	jle	.L108
	leal	-1(%rsi), %eax
	leal	-1(%rdx), %ebp
	leaq	8(%rdi), %r12
	pxor	%xmm0, %xmm0
	shrl	%eax
	movss	.LC1(%rip), %xmm2
	salq	$4, %rax
	movss	.LC2(%rip), %xmm3
	leaq	24(%rdi,%rax), %r13
	movl	%ebp, %eax
	shrl	%eax
	leaq	12(,%rax,8), %r14
	.p2align 4,,10
	.p2align 3
.L13:
	testl	%edx, %edx
	jle	.L15
	movq	-8(%r12), %rbx
	movq	(%r12), %r10
	leaq	4(%rbx), %rax
	addq	%r14, %rbx
	.p2align 4,,10
	.p2align 3
.L12:
	movss	-4(%rax), %xmm1
	addq	$8, %rax
	addq	$8, %r10
	movaps	%xmm1, %xmm7
	movss	-8(%r10), %xmm5
	minss	%xmm3, %xmm7
	movss	-8(%rax), %xmm6
	movaps	%xmm6, %xmm4
	movaps	%xmm7, %xmm3
	movaps	%xmm5, %xmm7
	minss	%xmm3, %xmm7
	minss	%xmm7, %xmm4
	movaps	%xmm4, %xmm3
	movss	-4(%r10), %xmm4
	cmpq	%rax, %rbx
	movaps	%xmm4, %xmm7
	minss	%xmm3, %xmm7
	movaps	%xmm7, %xmm3
	movaps	%xmm1, %xmm7
	addss	%xmm0, %xmm1
	maxss	%xmm2, %xmm7
	movaps	%xmm7, %xmm2
	movaps	%xmm5, %xmm7
	maxss	%xmm2, %xmm7
	movaps	%xmm7, %xmm2
	movaps	%xmm6, %xmm7
	addss	%xmm1, %xmm6
	maxss	%xmm2, %xmm7
	movaps	%xmm6, %xmm0
	movaps	%xmm7, %xmm2
	movaps	%xmm4, %xmm7
	addss	%xmm5, %xmm0
	maxss	%xmm2, %xmm7
	addss	%xmm4, %xmm0
	movaps	%xmm7, %xmm2
	jne	.L12
.L15:
	addq	$16, %r12
	cmpq	%r12, %r13
	jne	.L13
	movl	%esi, %eax
	movss	%xmm3, (%rcx)
	imull	%edx, %eax
	movss	%xmm2, (%r8)
	testl	%eax, %eax
	jle	.L109
	pxor	%xmm1, %xmm1
	cvtsi2ss	%eax, %xmm1
	divss	%xmm1, %xmm0
	movss	%xmm0, (%r9)
.L64:
	movq	80(%rsp), %r9
	movq	88(%rsp), %r8
	leal	-6(%rdx), %ebx
	movq	96(%rsp), %rax
	xorl	%r12d, %r12d
	.p2align 4,,10
	.p2align 3
.L38:
	testl	%ebx, %ebx
	movl	$0x7f800000, (%r9)
	movl	$0xff800000, (%r8)
	movl	$0x00000000, (%rax)
	jle	.L76
	movq	(%rdi,%r12,8), %rcx
	xorl	%r10d, %r10d
	.p2align 4,,10
	.p2align 3
.L30:
	movss	(%rcx), %xmm3
	movss	(%r9), %xmm0
	ucomiss	%xmm3, %xmm0
	jbe	.L18
	movss	%xmm3, (%r9)
	movss	(%rcx), %xmm3
.L18:
	addss	(%rax), %xmm3
	movss	%xmm3, (%rax)
	movaps	%xmm3, %xmm1
	movss	4(%rcx), %xmm3
	ucomiss	(%r8), %xmm3
	jbe	.L20
	movss	%xmm3, (%r8)
	movss	(%rax), %xmm1
	movss	4(%rcx), %xmm3
.L20:
	addss	%xmm3, %xmm1
	movss	%xmm1, (%rax)
	movss	8(%rcx), %xmm2
	movss	(%r9), %xmm0
	ucomiss	%xmm2, %xmm0
	jbe	.L22
	movss	%xmm2, (%r9)
	movss	(%rax), %xmm1
	movss	8(%rcx), %xmm2
.L22:
	addss	%xmm2, %xmm1
	movss	%xmm1, (%rax)
	movaps	%xmm1, %xmm0
	movss	12(%rcx), %xmm1
	ucomiss	(%r8), %xmm1
	jbe	.L24
	movss	%xmm1, (%r8)
	movss	(%rax), %xmm0
	movss	12(%rcx), %xmm1
.L24:
	addss	%xmm0, %xmm1
	movss	%xmm1, (%rax)
	movss	16(%rcx), %xmm0
	movss	(%r9), %xmm2
	ucomiss	%xmm0, %xmm2
	jbe	.L26
	movss	%xmm0, (%r9)
	movss	(%rax), %xmm1
	movss	16(%rcx), %xmm0
.L26:
	addss	%xmm1, %xmm0
	movss	%xmm0, (%rax)
	movss	20(%rcx), %xmm1
	ucomiss	(%r8), %xmm1
	jbe	.L28
	movss	%xmm1, (%r8)
	movss	(%rax), %xmm0
	movss	20(%rcx), %xmm1
.L28:
	addss	%xmm1, %xmm0
	addl	$6, %r10d
	addq	$24, %rcx
	cmpl	%ebx, %r10d
	movss	%xmm0, (%rax)
	jl	.L30
.L17:
	cmpl	%r10d, %edx
	jle	.L110
	movl	%ebp, %r15d
	movq	(%rdi,%r12,8), %r13
	movslq	%r10d, %r14
	subl	%r10d, %r15d
	leaq	1(%r14,%r15), %r10
	leaq	0(%r13,%r14,4), %rcx
	leaq	0(%r13,%r10,4), %r10
	.p2align 4,,10
	.p2align 3
.L36:
	movss	(%rcx), %xmm0
	ucomiss	(%r8), %xmm0
	jbe	.L34
	movss	%xmm0, (%r8)
	movss	(%rcx), %xmm0
.L34:
	addss	(%rax), %xmm0
	addq	$4, %rcx
	cmpq	%r10, %rcx
	movss	%xmm0, (%rax)
	jne	.L36
.L33:
	pxor	%xmm1, %xmm1
	movss	(%rax), %xmm0
	cvtsi2ss	%edx, %xmm1
	divss	%xmm1, %xmm0
	movss	%xmm0, (%rax)
.L37:
	addq	$1, %r12
	addq	$4, %r9
	addq	$4, %r8
	addq	$4, %rax
	cmpl	%r12d, %esi
	jg	.L38
.L16:
	testl	%edx, %edx
	jle	.L1
	subl	$1, %edx
	movq	64(%rsp), %r8
	movq	72(%rsp), %rax
	leal	-6(%rsi), %ebp
	leaq	4(%r11,%rdx,4), %r12
	leal	-1(%rsi), %r13d
	movq	%r11, %r9
	.p2align 4,,10
	.p2align 3
.L62:
	movq	%r9, %rcx
	movl	$0x7f800000, (%r9)
	movl	$0xff800000, (%r8)
	subq	%r11, %rcx
	testl	%ebp, %ebp
	movl	$0x00000000, (%rax)
	jle	.L77
	movq	%rdi, %rdx
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L54:
	movq	%rcx, %r10
	addq	(%rdx), %r10
	movss	(%r9), %xmm1
	movss	(%r10), %xmm0
	ucomiss	%xmm0, %xmm1
	jbe	.L42
	movss	%xmm0, (%r9)
	movss	(%r10), %xmm0
.L42:
	movss	(%rax), %xmm1
	movq	%rcx, %r14
	addq	8(%rdx), %r14
	addss	%xmm0, %xmm1
	movss	%xmm1, (%rax)
	movss	(%r14), %xmm0
	ucomiss	(%r8), %xmm0
	jbe	.L44
	movss	%xmm0, (%r8)
	movss	(%rax), %xmm1
	movss	(%r14), %xmm0
.L44:
	addss	%xmm1, %xmm0
	movq	16(%rdx), %r14
	movss	%xmm0, (%rax)
	movss	(%r14,%rcx), %xmm1
	movss	(%r9), %xmm2
	ucomiss	%xmm1, %xmm2
	jbe	.L46
	movss	%xmm1, (%r9)
	movss	(%rax), %xmm0
.L46:
	addss	(%r10), %xmm0
	movq	24(%rdx), %r14
	movss	%xmm0, (%rax)
	movss	(%r14,%rcx), %xmm1
	ucomiss	(%r8), %xmm1
	jbe	.L48
	movss	%xmm1, (%r8)
	movss	(%rax), %xmm0
.L48:
	addss	(%r10), %xmm0
	movq	%rcx, %r10
	addq	32(%rdx), %r10
	movss	%xmm0, (%rax)
	movss	(%r10), %xmm1
	ucomiss	(%r8), %xmm1
	jbe	.L50
	movss	%xmm1, (%r8)
	movss	(%rax), %xmm0
	movss	(%r10), %xmm1
.L50:
	addss	%xmm1, %xmm0
	movq	%rcx, %r10
	addq	40(%rdx), %r10
	movss	%xmm0, (%rax)
	movss	(%r10), %xmm1
	ucomiss	(%r8), %xmm1
	jbe	.L52
	movss	%xmm1, (%r8)
	movss	(%rax), %xmm0
	movss	(%r10), %xmm1
.L52:
	addss	%xmm1, %xmm0
	addl	$6, %ebx
	addq	$48, %rdx
	cmpl	%ebp, %ebx
	movss	%xmm0, (%rax)
	jl	.L54
.L41:
	cmpl	%ebx, %esi
	jle	.L111
	movl	%r13d, %r15d
	movslq	%ebx, %r10
	subl	%ebx, %r15d
	leaq	(%rdi,%r10,8), %rdx
	leaq	1(%r10,%r15), %r10
	leaq	(%rdi,%r10,8), %rbx
	.p2align 4,,10
	.p2align 3
.L60:
	movq	%rcx, %r10
	addq	(%rdx), %r10
	movss	(%r9), %xmm1
	movss	(%r10), %xmm0
	ucomiss	%xmm0, %xmm1
	jbe	.L58
	movss	%xmm0, (%r9)
	movss	(%r10), %xmm0
.L58:
	addss	(%rax), %xmm0
	addq	$8, %rdx
	cmpq	%rdx, %rbx
	movss	%xmm0, (%rax)
	jne	.L60
.L57:
	pxor	%xmm1, %xmm1
	movss	(%rax), %xmm0
	cvtsi2ss	%esi, %xmm1
	divss	%xmm1, %xmm0
	movss	%xmm0, (%rax)
.L61:
	addq	$4, %r9
	addq	$4, %r8
	addq	$4, %rax
	cmpq	%r12, %r9
	jne	.L62
.L1:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L111:
	.cfi_restore_state
	testl	%esi, %esi
	jne	.L57
	movl	$0x7fc00000, (%rax)
	jmp	.L61
.L77:
	xorl	%ebx, %ebx
	jmp	.L41
.L110:
	testl	%edx, %edx
	jne	.L33
	movl	$0x7fc00000, (%rax)
	jmp	.L37
.L76:
	xorl	%r10d, %r10d
	jmp	.L17
.L109:
	movl	$0x7fc00000, (%r9)
	jmp	.L64
.L108:
	movl	%esi, %eax
	movl	$0x7f800000, (%rcx)
	movl	$0xff800000, (%r8)
	imull	%edx, %eax
	testl	%eax, %eax
	jg	.L112
	movl	$0x7fc00000, (%r9)
	jmp	.L16
.L112:
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2ss	%eax, %xmm0
	divss	%xmm0, %xmm1
	movss	%xmm1, (%r9)
	jmp	.L16
	.cfi_endproc
.LFE26:
	.size	min_max_avg, .-min_max_avg
	.section	.text.unlikely
.LCOLDE4:
	.text
.LHOTE4:
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC1:
	.long	4286578688
	.align 4
.LC2:
	.long	2139095040
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
