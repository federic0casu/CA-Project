# Optimizations:
# __task will not be used before the inizialization of variables
#       - output, input, kernel
#       - start, end
#       - out_size_y, in_size_x, kernel_size
# Also, we can use registers to hold variables (instead of allocating stack memory):
#       - %ebx = convolute     
#       - %e12 = x
#       - %e13 = y
#       - %e14 = kx
#       - %e15 = ky

_Z13convolute_optPv:                # void* convolute_opt(void*)
.LFB2422:
        .cfi_startproc
        endbr64
        pushq	%rbp
        .cfi_def_cfa_offset 16
        .cfi_offset 6, -16
        movq	%rsp, %rbp
        subq    $0x80, %rsp         # Stack must be aligned at 16 bytes
        .cfi_def_cfa_register 6
        movq	(%rdi), %rax
        movq	%rax, -24(%rbp)     # -24(%rbp) = &output[0]
        movq	16(%rdi), %rax
        movq	%rax, -16(%rbp)     # -16(%rbp) = &kernel[0]
        movq	8(%rdi), %rax
        movq	%rax, -8(%rbp)      # -8(%rbp) = &input[0]
        movl	24(%rdi), %eax
        movl	%eax, -52(%rbp)     # -52(%rbp) = start
        movl	28(%rdi), %eax
        movl	%eax, -48(%rbp)     # -48(%rbp) = end
        movl	32(%rdi), %eax
        movl	%eax, -44(%rbp)     # -44(%rbp) = out_size_y 
        movl	36(%rdi), %eax
        movl	%eax, -40(%rbp)     # -40(%rbp) = in_size_x    
        movl	40(%rdi), %eax
        movl	%eax, -36(%rbp)     # -36(%rbp) = kernel_size
        push    %rbx                # Saving %rbx (%rbx is a callee-saved register)
        push    %r12                # Saving %r12 (%r12 is a callee-saved register)
        push    %r13                # Saving %r13 (%r13 is a callee-saved register)
        push    %r14                # Saving %r14 (%r14 is a callee-saved register)
        push    %r15                # Saving %r15 (%r15 is a callee-saved register)
        xor 	%rbx, %rbx          # %rbx = convolute = 0
        movl	-52(%rbp), %eax	    # %eax = start
        cltq                        
	movq	%rax, %r12          # %r12 = x = start
	jmp	.L5
.L12:    
        xor     %r13, %r13          # %r13 = y = 0
        jmp .L6
.L11:
        xor     %r14, %r14          # %r14 = kx = 0
        jmp	.L7
.L10:
	xor     %r15, %r15          # %r15 = ky = 0
        jmp .L8
.L9:
        movq    %r12, %rcx          # %rcx = x 
	add     %r14, %rcx          # %rcx = x + kx
        movl    -40(%rbp), %eax     # %eax = in_size_x
        cltq
        imul	%rcx, %rax          # %rax = (x + kx) * in_size_x
	movq	%r13, %rcx          # %rcx = y
        movq	%r15, %rdx          # %rdx = ky
        addq	%rcx, %rdx	    # %rdx = y + ky
        addq	%rdx, %rax	    # %rax = (x + kx) * in_size_x + (y + ky)
        leaq	0(,%rax,4), %rdx    # %rdx = %rax * 4
	movq	-8(%rbp), %rax	    # %rax = &input[0]
        addq	%rdx, %rax          # %rax = &input[(x + kx) * in_size_x + (y + ky)]
	movl	(%rax), %edx	    # %edx = input[(x + kx) * in_size_x + (y + ky)]
	movq	%r14, %rcx	    # %rcx = kx
        movl    -36(%rbp), %eax     # %eax = kernel_size
        cltq
	imul	%rcx, %rax          # %rax = kx * kernel_size
	movq	%rax, %rcx	    # %rcx = kx * kernel_size
	movq	%r15, %rax  	    # %rax = ky
	addq	%rcx, %rax	    # %rax = kx * kernel_size + ky
	leaq	0(,%rax,4), %rcx    # rcx = %rax * 4
	movq	-16(%rbp), %rax	    # %rax = &kernel[0]
	addq	%rcx, %rax	    # %rax = &kernel[kx * kernel_size + ky]
	movl	(%rax), %eax	    # %eax = kernel[kx * kernel_size + ky]
        imull	%edx, %eax          # %eax = input[(x + kx) * in_size_x + (y + ky)] * kernel[kx * kernel_size + ky]
	addl	%eax, %ebx          # %ebx += %eax (convolute += %eax)
	addq    $1, %r15            # ky++
.L8:
        movl    -36(%rbp), %eax
        cltq
	cmpq	%rax, %r15  	    # ky < kernel_size
	jl	.L9 
        addq	$1, %r14    	    # kx++
.L7:
        movl    -36(%rbp), %eax
        cltq
	cmpq	%rax, %r14	    # kx < kernel_size
        jl	.L10
        movq	%r12, %rax  	    # %rax = x
        movslq  -44(%rbp), %rcx     # %rcx out_size_y
	imulq	%rcx, %rax	    # %rax = x * out_size_y
        movq	%rax, %rdx	    # %rdx = x * out_size_y
	movq	%r13, %rax  	    # %rax = y
        addq	%rdx, %rax	    # %rax = x * out_size_y + y	
        leaq	0(,%rax,4), %rdx    # %rdx = %rax * 4
	movq	-24(%rbp), %rax	    # %rax = &output[0]
        addq	%rax, %rdx	    # %rdx = &output[x * out_size_y + y]
	movl	%ebx, (%rdx)	    # output[x * out_size_y + y] = convolute;
	xorl    %ebx, %ebx          # convolute = 0
	addq	$1, %r13    	    # y++
.L6:
        movl    -44(%rbp), %eax     # %eax = out_size_y
        cltq
	cmpq	%rax, %r13  	    # y < out_size_y
	jl      .L11
	addq	$1, %r12    	    # x++
.L5:
        movl    -48(%rbp), %eax     # %eax = end
        cltq
	cmpq	%rax, %r12          # x < end
	jl	.L12
        popq %r15
        popq %r14
        popq %r13
	popq %r12
	popq %rbx
        movq %rbp, %rsp 
	popq %rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
