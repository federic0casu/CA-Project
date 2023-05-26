	.file	"convolute_opt_3x3.cpp"
	.text
	.globl	_Z17convolute_opt_3x3Pv
	.type	_Z17convolute_opt_3x3Pv, @function
_Z17convolute_opt_3x3Pv:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, -32(%rbp)		# -32(%rbp) = __task
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)		# -24(%rbp) = output
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -16(%rbp)		# -16(%rbp) = input
	movq	-32(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -8(%rbp)		# -8(%rbp) = kernel
	movq	-32(%rbp), %rax
	movl	24(%rax), %eax
	movl	%eax, -52(%rbp)		# -52(%rbp) = start
	movq	-32(%rbp), %rax
	movl	28(%rax), %eax
	movl	%eax, -48(%rbp)		# -48(%rbp) = end
	movq	-32(%rbp), %rax
	movl	32(%rax), %eax
	movl	%eax, -44(%rbp)		# -44(%rbp) = out_size_y
	movq	-32(%rbp), %rax
	movl	36(%rax), %eax
	movl	%eax, -40(%rbp)		# -40(%rbp) = in_size_x
	movq	-32(%rbp), %rax
	movl	40(%rax), %eax
	movl	%eax, -36(%rbp)		# -36(%rbp) = kernel_size
	movl	$0, -68(%rbp)		# -68(%rbp) = convolute
	movl	-52(%rbp), %eax		
	movl	%eax, -64(%rbp)     # -64(%rbp) = x = start
	jmp	.L2
.L7:
	movl	$0, -60(%rbp)		# -60(%rbp) = y
	jmp	.L3
.L6:
	movl	$0, -56(%rbp)		# -56(%rbp) = kx
	jmp	.L4
.L5:
	movl	-64(%rbp), %edx		# %edx = x
	movl	-56(%rbp), %eax		# %eax = kx
	addl	%edx, %eax		    # %eax = x + kx
	imull	-40(%rbp), %eax		# %eax = (x + kx)*in_size_x
	movl	%eax, %edx			# %edx = (x + kx)*in_size_x
	movl	-60(%rbp), %eax		# %eax = y
	addl	%edx, %eax			# %eax = (x + kx)*in_size_x + (y + 0)
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-16(%rbp), %rax		# %rax = &input[0]
	addq	%rdx, %rax			# %rax = &input[(x + kx)*in_size_x + (y + 0)]
	movl	(%rax), %edx		# %edx = input[(x + kx)*in_size_x + (y + 0)]
	movl	-56(%rbp), %eax		# %eax = kx
	imull	-36(%rbp), %eax		# %eax = kx*kernel_size
	cltq
	leaq	0(,%rax,4), %rcx	
	movq	-8(%rbp), %rax		# %rax = &kernel[0]
	addq	%rcx, %rax			# %rax = &kernel[kx*kernel_size + 0]
	movl	(%rax), %eax		# %eax = kernel[kx*kernel_size + 0]
	imull	%edx, %eax			# %eax = input[(x + kx)*in_size_x + (y + 0)] * kernel[kx*kernel_size + 0]
	addl	%eax, -68(%rbp)		# convolute += input[(x + kx)*in_size_x + (y + 0)] * kernel[kx*kernel_size + 0]

	movl	-64(%rbp), %edx		# %edx = x
	movl	-56(%rbp), %eax		# %eax = kx
	addl	%edx, %eax			# %eax = x + kx
	imull	-40(%rbp), %eax		# %eax = (x + kx)*in_size_x
	movl	%eax, %edx			# %edx = (x + kx)*in_size_x
	movl	-60(%rbp), %eax		# %eax = y
	addl	$1, %eax			# %eax = y + 1
	addl	%edx, %eax			# %eax = (x + kx)*in_size_x + (y + 1)
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-16(%rbp), %rax		# %rax = &input[0]
	addq	%rdx, %rax			# %rax = &input[(x + kx)*in_size_x + (y + 1)]
	movl	(%rax), %edx		# %edx = input[(x + kx)*in_size_x + (y + 1)]
	movl	-56(%rbp), %eax		# %eax = kx
	imull	-36(%rbp), %eax		# %eax = kx*kernel_size
	cltq
	addq	$1, %rax			# %eax = kx*kernel_size + 1
	leaq	0(,%rax,4), %rcx
	movq	-8(%rbp), %rax		# %rax = &kernel[0]
	addq	%rcx, %rax			# %rax = &kernel[kx*kernel_size + 1]
	movl	(%rax), %eax		# %eax = kernel[kx*kernel_size + 1]
	imull	%edx, %eax			# %eax = input[(x + kx)*in_size_x + (y + 1)] * kernel[kx*kernel_size + 1]
	addl	%eax, -68(%rbp)		# convolute += input[(x + kx)*in_size_x + (y + 1)] * kernel[kx*kernel_size + 1]

	movl	-64(%rbp), %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	imull	-40(%rbp), %eax
	movl	%eax, %edx
	movl	-60(%rbp), %eax
	addl	$2, %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	-56(%rbp), %eax
	imull	-36(%rbp), %eax
	cltq
	addq	$2, %rax
	leaq	0(,%rax,4), %rcx
	movq	-8(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	imull	%edx, %eax
	addl	%eax, -68(%rbp)
	addl	$1, -56(%rbp)
.L4:
	movl	-56(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L5
	movl	-64(%rbp), %eax
	imull	-44(%rbp), %eax
	movl	%eax, %edx
	movl	-60(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-68(%rbp), %eax
	movl	%eax, (%rdx)
	movl	$0, -68(%rbp)
	addl	$1, -60(%rbp)
.L3:
	movl	-60(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jl	.L6
	addl	$1, -64(%rbp)
.L2:
	movl	-64(%rbp), %eax
	cmpl	-48(%rbp), %eax
	jl	.L7
	nop
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	_Z17convolute_opt_3x3Pv, .-_Z17convolute_opt_3x3Pv
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04.1) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
