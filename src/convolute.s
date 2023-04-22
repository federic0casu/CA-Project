#
# struct task {			// offset
#	int *output;		// 0
#   int *input;			// +8	
# 	int *kernel;		// +16
#   int start_row;		// +24
#	int end_row;		// +28
#	int output_columns;	// +32
#   int input_rows;		// +36
#	int kernel_size;	// +40
# };
#

_Z9convolutePv:
.LFB2422:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6

	movq	%rdi, -88(%rbp)
	movq	-88(%rbp), %rax	
	movq	%rax, -32(%rbp)		# struct task *__task = (struct task *)argument; 

	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)		# auto output = __task->output;

	movq	-32(%rbp), %rax		
	movq	16(%rax), %rax
	movq	%rax, -16(%rbp)		# auto kernel = __task->kernel;

	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)		# auto input = __task->input;

	movq	-32(%rbp), %rax
	movl	24(%rax), %eax
	movl	%eax, -52(%rbp)		# auto start = __task->start_row;

	movq	-32(%rbp), %rax
	movl	28(%rax), %eax
	movl	%eax, -48(%rbp)		# auto end = __task->end_row;

	movq	-32(%rbp), %rax
	movl	32(%rax), %eax
	movl	%eax, -44(%rbp)		# auto out_size_y  = __task->output_columns;

	movq	-32(%rbp), %rax
	movl	36(%rax), %eax
	movl	%eax, -40(%rbp)		# auto in_size_x   = __task->input_rows;

	movq	-32(%rbp), %rax
	movl	40(%rax), %eax
	movl	%eax, -36(%rbp)		# auto kernel_size = __task->kernel_size;

	movl	$0, -72(%rbp)		# int convolute = 0;

	movl	-52(%rbp), %eax		# %eax = start
	movl	%eax, -68(%rbp)		# auto x = start;	// Counter 'x' used by for(auto x = start; x < end; x++)
	jmp	.L5
.L12:
	movl	$0, -64(%rbp)		# auto y = 0;		// Counter 'y' used by for(auto y = 0; y < out_size_y; y+++)
	jmp	.L6
.L11:
	movl	$0, -60(%rbp)		# auto kx = 0;		// Counter 'kx' used by for(auto kx = 0; kx < kernel_size; kx++)
	jmp	.L7
.L10:
	movl	$0, -56(%rbp)		# auto ky = 0;		// Counter 'ky' used by for(auto ky = 0; ky < kernel_size; ky++)
	jmp	.L8
.L9:
	movl	-68(%rbp), %edx		# %edx = x
	movl	-60(%rbp), %eax		# %eax = kx
	addl	%edx, %eax			# %eax = x + kx
	imull	-40(%rbp), %eax		# %eax = (x + kx) * in_size_x
	movl	-64(%rbp), %ecx		# %ecx = y
	movl	-56(%rbp), %edx		# %edx = ky
	addl	%ecx, %edx			# %edx = y + ky
	addl	%edx, %eax			# %eax = (x + kx) * in_size_x + (y +ky)
	cltq						# %rax = convert long to quad %eax

	leaq	0(,%rax,4), %rdx	# %rdx = %rax * 4	// We can "interpret" this instruction as
								#					// the following: ((x + kx) * in_size_x + (y + ky)) * sizeof(int)	

	movq	-8(%rbp), %rax		# %rax = &input[0]  // Since input is a pointer, this instruction 
								#               	// is effectively loading the address of the 
								#               	// 1-st element of the input image.
	
	addq	%rdx, %rax			# %rax = &input[0] + ((x + kx) * in_size_x + (y + ky)) * sizeof(int)
	movl	(%rax), %edx		# %edx = *(&input[0] + ((x + kx) * in_size_x + (y + ky)) * sizeof(int)) = input[(x + kx) * in_size_x + (y + ky)]
	
	movl	-60(%rbp), %eax		# %eax = kx
	imull	-36(%rbp), %eax		# %eax = kx * kernel_size
	movl	%eax, %ecx			# %ecx = kx * kernel_size
	movl	-56(%rbp), %eax		# %eax = ky
	addl	%ecx, %eax			# %eax = kx * kernel_size + ky
	cltq						# %rax = convert long to quad %eax
	leaq	0(,%rax,4), %rcx	# rcx = %rax * 4	// Same as above: (kx * kernel_size + ky) * sizeof(int)
	movq	-16(%rbp), %rax		# %rax = &kernel[0]
	addq	%rcx, %rax			# %rax = &kernel[0] + (kx * kernel_size + ky) * sizeof(int)
	movl	(%rax), %eax		# %eax = *(&kernel[0] + (kx * kernel_size + ky) * sizeof(int)) = kernel[kx * kernel_size + ky]
	
	imull	%edx, %eax			# %eax = input[(x + kx) * in_size_x + (y + ky)] * kernel[kx * kernel_size + ky]
	addl	%eax, -72(%rbp)		# convolute += (input[(x + kx) * in_size_x + (y + ky)] * kernel[kx * kernel_size + ky]);
	
	addl	$1, -56(%rbp)		# ky++
.L8:
	movl	-56(%rbp), %eax		# %eax = ky
	cmpl	-36(%rbp), %eax		# ky < kernel_size
	jl	.L9
	addl	$1, -60(%rbp)		# kx++
.L7:
	movl	-60(%rbp), %eax		# %eax = kx
	cmpl	-36(%rbp), %eax		# kx < kernel_size
	jl	.L10
	movl	-68(%rbp), %eax		# %eax = x
	imull	-44(%rbp), %eax		# %eax = x * out_size_y
	movl	%eax, %edx			# %edx = x * out_size_y
	movl	-64(%rbp), %eax		# %eax = y
	addl	%edx, %eax			# %eax = x * out_size_y + y
	cltq						# %rax = convert long to quad %eax
	leaq	0(,%rax,4), %rdx	# %rdx = (x * out_size_y + y) * sizeof(int)
	movq	-24(%rbp), %rax		# %rax = &output[0]
	addq	%rax, %rdx			# %rdx = &output[0] + (x * out_size_y + y) * sizeof(int)
	movl	-72(%rbp), %eax		# %eax = convolute
	movl	%eax, (%rdx)		# output[x * out_size_y + y] = convolute;
	movl	$0, -72(%rbp)		# convolute = 0;
	addl	$1, -64(%rbp)		# y++
.L6:
	movl	-64(%rbp), %eax		# %eax = y
	cmpl	-44(%rbp), %eax		# y < out_size_y
	jl	.L11
	addl	$1, -68(%rbp)		# x++
.L5:
	movl	-68(%rbp), %eax		# %eax = x
	cmpl	-48(%rbp), %eax     # x < end
	jl	.L12
	nop
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc