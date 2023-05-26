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
    pushq   %r12
    pushq   %r13
    pushq   %r14
    pushq   %r15
    pushq   %rbx
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	(%rdi), %rbx  		# %rbx = output
	movq	8(%rdi), %rax
	movq	%rax, -16(%rbp)		# -16(%rbp) = input
	movq	16(%rdi), %rax
	movq	%rax, %rsi		    # %rsi = kernel
	movl	24(%rdi), %eax
	movl	%eax, -52(%rbp)		# -52(%rbp) = start
	movl	28(%rdi), %eax
	movl	%eax, -48(%rbp)		# -48(%rbp) = end
	movl	32(%rdi), %eax
	movl	%eax, -44(%rbp)		# -44(%rbp) = out_size_y
	movl	36(%rdi), %eax
	movl	%eax, %r14d         # %r14d = in_size_x
	movl	40(%rdi), %eax
	movl	%eax, %r15d         # %r15d = kernel_size
    movq    -16(%rbp), %rdi     # %rdi = input
# ####################################################################
#   %r10d = x
#   %r11d = convolute
#   %r12d = y
#   %r13d = kx
#   %r14d = in_size_x
#   %r15d = kernel_size
#   %rdi  = &input[0]
#   %rsi  = &kernel[0]
#   %rbx  = &output[0]
# ####################################################################
	xor	    %r11d, %r11d        # %r11d = convolute = 0	
    xor     %r10d, %r10d	
	movl	-52(%rbp), %r10d    # %r10d = x = start
	jmp	.L2
.L7:
	xor 	%r12d, %r12d	    # %r12d = y = 0
	jmp	.L3
.L6:
	xor 	%r13d, %r13d	    # %r13d = kx = 0
	jmp	.L4
.L5:
# #####################################################################
#   %r8 = &input[(x + kx)*in_size_x + (y + 0)]
#   %r9 = &kernel[kx*kernel_size + 0]
# #####################################################################
	movl	%r10d, %eax		    # %eax = x
	addl	%r13d, %eax	    	# %eax = x + kx
	imull	%r14d, %eax		    # %eax = (x + kx)*in_size_x
	addl	%r12d, %eax		    # %eax = (x + kx)*in_size_x + (y + 0)
	cltq
	leaq	0(,%rax,4), %rdx
	movq	%rdi, %rax  		# %rax = &input[0]
	addq	%rdx, %rax			# %rax = &input[(x + kx)*in_size_x + (y + 0)]
    movq    %rax, %r8           # %r8 = &input[(x + kx)*in_size_x + (y + 0)]
	movl	(%rax), %edx		# %edx = input[(x + kx)*in_size_x + (y + 0)]
	movl	%r13d, %eax	    	# %eax = kx
	imull	%r15d, %eax		    # %eax = kx*kernel_size
	cltq
	leaq	0(,%rax,4), %rcx	
	movq	%rsi, %rax  		# %rax = &kernel[0]
	addq	%rcx, %rax			# %rax = &kernel[kx*kernel_size + 0]
    movq    %rax, %r9           # %r9 = &kernel[kx*kernel_size + 0]
	movl	(%rax), %eax		# %eax = kernel[kx*kernel_size + 0]
	imull	%edx, %eax			# %eax = input[(x + kx)*in_size_x + (y + 0)] * kernel[kx*kernel_size + 0]
	addl	%eax, %r11d		    # convolute += input[(x + kx)*in_size_x + (y + 0)] * kernel[kx*kernel_size + 0]
    xor     %rcx, %rcx
    addq    $1, %rcx
	movl	(%r8,%rcx,4), %edx	# %edx = input[(x + kx)*in_size_x + (y + 1)]
	movl	(%r9,%rcx,4), %eax	# %eax = kernel[kx*kernel_size + 1]
	imull	%edx, %eax			# %eax = input[(x + kx)*in_size_x + (y + 1)] * kernel[kx*kernel_size + 1]
	addl	%eax, %r11d		    # convolute += input[(x + kx)*in_size_x + (y + 1)] * kernel[kx*kernel_size + 1]
    addq    $1, %rcx
    movl	(%r8,%rcx,4), %edx	# %edx = input[(x + kx)*in_size_x + (y + 2)]
	movl	(%r9,%rcx,4), %eax	# %eax = kernel[kx*kernel_size + 2]
	imull	%edx, %eax			# %eax = input[(x + kx)*in_size_x + (y + 2)] * kernel[kx*kernel_size + 2]
	addl	%eax, %r11d		    # convolute += input[(x + kx)*in_size_x + (y + 2)] * kernel[kx*kernel_size + 2]
	addl	$1, %r13d           # kx++
.L4:
	cmpl	%r15d, %r13d        # kx < kernel_size
	jl	.L5
	movl	%r10d, %eax
	imull	-44(%rbp), %eax
	movl	%eax, %edx
	movl	%r12d, %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	%rbx, %rax          # %rax = &output[0]
	addq	%rax, %rdx          # %rdx = &output[x*out_size_y + y]
	movl	%r11d, %eax
	movl	%eax, (%rdx)
	movl	$0, %r11d
	addl	$1, %r12d
.L3:
	cmpl	-44(%rbp), %r12d
	jl	.L6
	addl	$1, %r10d
.L2:
	cmpl	-48(%rbp), %r10d
	jl	.L7
	nop
	nop
    popq    %rbx
    popq    %r15
    popq    %r14
    popq    %r13
    popq    %r12
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
