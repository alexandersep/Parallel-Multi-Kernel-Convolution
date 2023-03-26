	.file	"conv-harness.c"
	.text
	.section	.rodata
.LC0:
	.string	"Outer dimension number %d\n"
.LC1:
	.string	"%d, "
.LC2:
	.string	"%d\n"
	.text
	.globl	write_out
	.type	write_out, @function
write_out:
.LFB4379:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	%edx, -32(%rbp)
	movl	%ecx, -36(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L2
.L7:
	movl	-12(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, -8(%rbp)
	jmp	.L3
.L6:
	movl	$0, -4(%rbp)
	jmp	.L4
.L5:
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	-8(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	-4(%rbp), %eax
	cltq
	addq	%rax, %rax
	addq	%rdx, %rax
	movzwl	(%rax), %eax
	cwtl
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -4(%rbp)
.L4:
	movl	-36(%rbp), %eax
	subl	$1, %eax
	cmpl	%eax, -4(%rbp)
	jl	.L5
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	-8(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	-36(%rbp), %eax
	cltq
	addq	%rax, %rax
	subq	$2, %rax
	addq	%rdx, %rax
	movzwl	(%rax), %eax
	cwtl
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -8(%rbp)
.L3:
	movl	-8(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L6
	addl	$1, -12(%rbp)
.L2:
	movl	-12(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L7
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4379:
	.size	write_out, .-write_out
	.globl	new_empty_4d_matrix_float
	.type	new_empty_4d_matrix_float, @function
new_empty_4d_matrix_float:
.LFB4380:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -52(%rbp)
	movl	%esi, -56(%rbp)
	movl	%edx, -60(%rbp)
	movl	%ecx, -64(%rbp)
	movl	-52(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -32(%rbp)
	movl	-52(%rbp), %eax
	imull	-56(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -24(%rbp)
	movl	-52(%rbp), %eax
	imull	-56(%rbp), %eax
	imull	-60(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -16(%rbp)
	movl	-52(%rbp), %eax
	imull	-56(%rbp), %eax
	imull	-60(%rbp), %eax
	imull	-64(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	movl	$0, -44(%rbp)
	jmp	.L9
.L14:
	movl	-44(%rbp), %eax
	imull	-56(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	movl	-44(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	movq	%rdx, (%rax)
	movl	$0, -40(%rbp)
	jmp	.L10
.L13:
	movl	-44(%rbp), %eax
	imull	-56(%rbp), %eax
	imull	-60(%rbp), %eax
	movl	%eax, %edx
	movl	-40(%rbp), %eax
	imull	-60(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rcx
	movl	-44(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	-40(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	%rdx, %rax
	movq	-16(%rbp), %rdx
	addq	%rcx, %rdx
	movq	%rdx, (%rax)
	movl	$0, -36(%rbp)
	jmp	.L11
.L12:
	movl	-44(%rbp), %eax
	imull	-56(%rbp), %eax
	imull	-60(%rbp), %eax
	imull	-64(%rbp), %eax
	movl	%eax, %edx
	movl	-40(%rbp), %eax
	imull	-60(%rbp), %eax
	imull	-64(%rbp), %eax
	addl	%eax, %edx
	movl	-36(%rbp), %eax
	imull	-64(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movl	-44(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	-40(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	-36(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	%rdx, %rax
	movq	-8(%rbp), %rdx
	addq	%rcx, %rdx
	movq	%rdx, (%rax)
	addl	$1, -36(%rbp)
.L11:
	movl	-36(%rbp), %eax
	cmpl	-60(%rbp), %eax
	jl	.L12
	addl	$1, -40(%rbp)
.L10:
	movl	-40(%rbp), %eax
	cmpl	-56(%rbp), %eax
	jl	.L13
	addl	$1, -44(%rbp)
.L9:
	movl	-44(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jl	.L14
	movq	-32(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4380:
	.size	new_empty_4d_matrix_float, .-new_empty_4d_matrix_float
	.globl	new_empty_3d_matrix_float
	.type	new_empty_3d_matrix_float, @function
new_empty_3d_matrix_float:
.LFB4381:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	%edx, -28(%rbp)
	movl	-28(%rbp), %ecx
	movl	-24(%rbp), %edx
	movl	-20(%rbp), %eax
	movl	%eax, %esi
	movl	$1, %edi
	call	new_empty_4d_matrix_float
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4381:
	.size	new_empty_3d_matrix_float, .-new_empty_3d_matrix_float
	.globl	new_empty_4d_matrix_int16
	.type	new_empty_4d_matrix_int16, @function
new_empty_4d_matrix_int16:
.LFB4382:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -52(%rbp)
	movl	%esi, -56(%rbp)
	movl	%edx, -60(%rbp)
	movl	%ecx, -64(%rbp)
	movl	-52(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -32(%rbp)
	movl	-52(%rbp), %eax
	imull	-56(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -24(%rbp)
	movl	-52(%rbp), %eax
	imull	-56(%rbp), %eax
	imull	-60(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -16(%rbp)
	movl	-52(%rbp), %eax
	imull	-56(%rbp), %eax
	imull	-60(%rbp), %eax
	imull	-64(%rbp), %eax
	cltq
	addq	%rax, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	movl	$0, -44(%rbp)
	jmp	.L19
.L24:
	movl	-44(%rbp), %eax
	imull	-56(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	movl	-44(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	movq	%rdx, (%rax)
	movl	$0, -40(%rbp)
	jmp	.L20
.L23:
	movl	-44(%rbp), %eax
	imull	-56(%rbp), %eax
	imull	-60(%rbp), %eax
	movl	%eax, %edx
	movl	-40(%rbp), %eax
	imull	-60(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rcx
	movl	-44(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	-40(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	%rdx, %rax
	movq	-16(%rbp), %rdx
	addq	%rcx, %rdx
	movq	%rdx, (%rax)
	movl	$0, -36(%rbp)
	jmp	.L21
.L22:
	movl	-44(%rbp), %eax
	imull	-56(%rbp), %eax
	imull	-60(%rbp), %eax
	imull	-64(%rbp), %eax
	movl	%eax, %edx
	movl	-40(%rbp), %eax
	imull	-60(%rbp), %eax
	imull	-64(%rbp), %eax
	addl	%eax, %edx
	movl	-36(%rbp), %eax
	imull	-64(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	(%rax,%rax), %rcx
	movl	-44(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	-40(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	-36(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	%rdx, %rax
	movq	-8(%rbp), %rdx
	addq	%rcx, %rdx
	movq	%rdx, (%rax)
	addl	$1, -36(%rbp)
.L21:
	movl	-36(%rbp), %eax
	cmpl	-60(%rbp), %eax
	jl	.L22
	addl	$1, -40(%rbp)
.L20:
	movl	-40(%rbp), %eax
	cmpl	-56(%rbp), %eax
	jl	.L23
	addl	$1, -44(%rbp)
.L19:
	movl	-44(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jl	.L24
	movq	-32(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4382:
	.size	new_empty_4d_matrix_int16, .-new_empty_4d_matrix_int16
	.globl	new_empty_3d_matrix_int16
	.type	new_empty_3d_matrix_int16, @function
new_empty_3d_matrix_int16:
.LFB4383:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	%edx, -28(%rbp)
	movl	-28(%rbp), %ecx
	movl	-24(%rbp), %edx
	movl	-20(%rbp), %eax
	movl	%eax, %esi
	movl	$1, %edi
	call	new_empty_4d_matrix_int16
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4383:
	.size	new_empty_3d_matrix_int16, .-new_empty_3d_matrix_int16
	.globl	copy_4d_matrix
	.type	copy_4d_matrix, @function
copy_4d_matrix:
.LFB4384:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movl	%esi, -44(%rbp)
	movl	%edx, -48(%rbp)
	movl	%ecx, -52(%rbp)
	movl	%r8d, -56(%rbp)
	movl	-56(%rbp), %ecx
	movl	-52(%rbp), %edx
	movl	-48(%rbp), %esi
	movl	-44(%rbp), %eax
	movl	%eax, %edi
	call	new_empty_4d_matrix_int16
	movq	%rax, -8(%rbp)
	movl	$0, -24(%rbp)
	jmp	.L29
.L36:
	movl	$0, -20(%rbp)
	jmp	.L30
.L35:
	movl	$0, -16(%rbp)
	jmp	.L31
.L34:
	movl	$0, -12(%rbp)
	jmp	.L32
.L33:
	movl	-24(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	-20(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	-16(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	-12(%rbp), %eax
	cltq
	addq	%rax, %rax
	addq	%rdx, %rax
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-8(%rbp), %rdx
	addq	%rcx, %rdx
	movq	(%rdx), %rcx
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rcx, %rdx
	movq	(%rdx), %rcx
	movl	-16(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rcx, %rdx
	movq	(%rdx), %rcx
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	addq	%rdx, %rdx
	addq	%rcx, %rdx
	movzwl	(%rax), %eax
	movw	%ax, (%rdx)
	addl	$1, -12(%rbp)
.L32:
	movl	-12(%rbp), %eax
	cmpl	-56(%rbp), %eax
	jl	.L33
	addl	$1, -16(%rbp)
.L31:
	movl	-16(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jl	.L34
	addl	$1, -20(%rbp)
.L30:
	movl	-20(%rbp), %eax
	cmpl	-48(%rbp), %eax
	jl	.L35
	addl	$1, -24(%rbp)
.L29:
	movl	-24(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jl	.L36
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4384:
	.size	copy_4d_matrix, .-copy_4d_matrix
	.globl	gen_random_4d_matrix_int16
	.type	gen_random_4d_matrix_int16, @function
gen_random_4d_matrix_int16:
.LFB4385:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movl	%edi, -84(%rbp)
	movl	%esi, -88(%rbp)
	movl	%edx, -92(%rbp)
	movl	%ecx, -96(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	-96(%rbp), %ecx
	movl	-92(%rbp), %edx
	movl	-88(%rbp), %esi
	movl	-84(%rbp), %eax
	movl	%eax, %edi
	call	new_empty_4d_matrix_int16
	movq	%rax, -48(%rbp)
	leaq	-32(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	gettimeofday@PLT
	movq	-24(%rbp), %rax
	movl	%eax, -60(%rbp)
	movl	-60(%rbp), %eax
	movl	%eax, %edi
	call	srandom@PLT
	movl	$1024, -56(%rbp)
	movl	$0, -76(%rbp)
	jmp	.L39
.L46:
	movl	$0, -72(%rbp)
	jmp	.L40
.L45:
	movl	$0, -68(%rbp)
	jmp	.L41
.L44:
	movl	$0, -64(%rbp)
	jmp	.L42
.L43:
	call	random@PLT
	movq	%rax, -40(%rbp)
	movl	-56(%rbp), %eax
	movslq	%eax, %rcx
	movq	-40(%rbp), %rax
	cqto
	idivq	%rcx
	movq	%rdx, %rax
	movl	%eax, -52(%rbp)
	movl	-76(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	-72(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	-68(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	-64(%rbp), %eax
	cltq
	addq	%rax, %rax
	addq	%rdx, %rax
	movl	-52(%rbp), %edx
	movw	%dx, (%rax)
	addl	$1, -64(%rbp)
.L42:
	movl	-64(%rbp), %eax
	cmpl	-96(%rbp), %eax
	jl	.L43
	addl	$1, -68(%rbp)
.L41:
	movl	-68(%rbp), %eax
	cmpl	-92(%rbp), %eax
	jl	.L44
	addl	$1, -72(%rbp)
.L40:
	movl	-72(%rbp), %eax
	cmpl	-88(%rbp), %eax
	jl	.L45
	addl	$1, -76(%rbp)
.L39:
	movl	-76(%rbp), %eax
	cmpl	-84(%rbp), %eax
	jl	.L46
	movq	-48(%rbp), %rax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L48
	call	__stack_chk_fail@PLT
.L48:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4385:
	.size	gen_random_4d_matrix_int16, .-gen_random_4d_matrix_int16
	.globl	gen_random_4d_matrix_float
	.type	gen_random_4d_matrix_float, @function
gen_random_4d_matrix_float:
.LFB4386:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movl	%edi, -84(%rbp)
	movl	%esi, -88(%rbp)
	movl	%edx, -92(%rbp)
	movl	%ecx, -96(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	-96(%rbp), %ecx
	movl	-92(%rbp), %edx
	movl	-88(%rbp), %esi
	movl	-84(%rbp), %eax
	movl	%eax, %edi
	call	new_empty_4d_matrix_float
	movq	%rax, -48(%rbp)
	leaq	-32(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	gettimeofday@PLT
	movq	-24(%rbp), %rax
	movl	%eax, -64(%rbp)
	movl	-64(%rbp), %eax
	movl	%eax, %edi
	call	srandom@PLT
	movl	$4096, -60(%rbp)
	movl	$1024, -56(%rbp)
	movl	$0, -80(%rbp)
	jmp	.L50
.L57:
	movl	$0, -76(%rbp)
	jmp	.L51
.L56:
	movl	$0, -72(%rbp)
	jmp	.L52
.L55:
	movl	$0, -68(%rbp)
	jmp	.L53
.L54:
	call	random@PLT
	movq	%rax, -40(%rbp)
	movl	-60(%rbp), %eax
	movslq	%eax, %rcx
	movq	-40(%rbp), %rax
	cqto
	idivq	%rcx
	movq	%rdx, %rax
	movl	%eax, -52(%rbp)
	movl	-52(%rbp), %edx
	movl	-56(%rbp), %eax
	leal	(%rdx,%rax), %ecx
	movl	-80(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	-76(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	-72(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	-68(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	pxor	%xmm0, %xmm0
	cvtsi2ssl	%ecx, %xmm0
	movss	%xmm0, (%rax)
	addl	$1, -68(%rbp)
.L53:
	movl	-68(%rbp), %eax
	cmpl	-96(%rbp), %eax
	jl	.L54
	addl	$1, -72(%rbp)
.L52:
	movl	-72(%rbp), %eax
	cmpl	-92(%rbp), %eax
	jl	.L55
	addl	$1, -76(%rbp)
.L51:
	movl	-76(%rbp), %eax
	cmpl	-88(%rbp), %eax
	jl	.L56
	addl	$1, -80(%rbp)
.L50:
	movl	-80(%rbp), %eax
	cmpl	-84(%rbp), %eax
	jl	.L57
	movq	-48(%rbp), %rax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L59
	call	__stack_chk_fail@PLT
.L59:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4386:
	.size	gen_random_4d_matrix_float, .-gen_random_4d_matrix_float
	.globl	gen_random_3d_matrix_float
	.type	gen_random_3d_matrix_float, @function
gen_random_3d_matrix_float:
.LFB4387:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	%edx, -28(%rbp)
	movl	-28(%rbp), %ecx
	movl	-24(%rbp), %edx
	movl	-20(%rbp), %eax
	movl	%eax, %esi
	movl	$1, %edi
	call	gen_random_4d_matrix_float
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4387:
	.size	gen_random_3d_matrix_float, .-gen_random_3d_matrix_float
	.globl	gen_random_3d_matrix_int16
	.type	gen_random_3d_matrix_int16, @function
gen_random_3d_matrix_int16:
.LFB4388:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	%edx, -28(%rbp)
	movl	-28(%rbp), %ecx
	movl	-24(%rbp), %edx
	movl	-20(%rbp), %eax
	movl	%eax, %esi
	movl	$1, %edi
	call	gen_random_4d_matrix_int16
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4388:
	.size	gen_random_3d_matrix_int16, .-gen_random_3d_matrix_int16
	.section	.rodata
.LC6:
	.string	"conv-harness.c"
.LC7:
	.string	"diff >= 0.0"
.LC8:
	.string	"\033[31mWARNING: "
	.align 8
.LC9:
	.string	"\033[0msum of absolute differences "
.LC10:
	.string	"\033[31m(%f) "
.LC11:
	.string	"\033[0m> EPSILON (%f)\n"
.LC12:
	.string	"\033[32mCOMMENT: "
.LC13:
	.string	"\033[32m(%f) "
	.align 8
.LC14:
	.string	"\033[0mwithin acceptable range (%f)\n"
	.text
	.globl	check_result
	.type	check_result, @function
check_result:
.LFB4389:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movl	%edx, -68(%rbp)
	movl	%ecx, -72(%rbp)
	movl	%r8d, -76(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -24(%rbp)
	movsd	.LC4(%rip), %xmm0
	movsd	%xmm0, -16(%rbp)
	movl	$0, -36(%rbp)
	jmp	.L65
.L71:
	movl	$0, -32(%rbp)
	jmp	.L66
.L70:
	movl	$0, -28(%rbp)
	jmp	.L67
.L69:
	movl	-36(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	-32(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	-28(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	movl	-36(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	-32(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	-28(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	subss	%xmm1, %xmm0
	movss	.LC5(%rip), %xmm1
	andps	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm0
	movsd	%xmm0, -8(%rbp)
	movsd	-8(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	comisd	%xmm1, %xmm0
	jnb	.L68
	leaq	__PRETTY_FUNCTION__.0(%rip), %rax
	movq	%rax, %rcx
	movl	$290, %edx
	leaq	.LC6(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L68:
	movsd	-24(%rbp), %xmm0
	addsd	-8(%rbp), %xmm0
	movsd	%xmm0, -24(%rbp)
	addl	$1, -28(%rbp)
.L67:
	movl	-28(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jl	.L69
	addl	$1, -32(%rbp)
.L66:
	movl	-32(%rbp), %eax
	cmpl	-72(%rbp), %eax
	jl	.L70
	addl	$1, -36(%rbp)
.L65:
	movl	-36(%rbp), %eax
	cmpl	-68(%rbp), %eax
	jl	.L71
	movsd	-24(%rbp), %xmm0
	comisd	-16(%rbp), %xmm0
	jbe	.L76
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$14, %edx
	movl	$1, %esi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$32, %edx
	movl	$1, %esi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movq	stderr(%rip), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, %xmm0
	leaq	.LC10(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$1, %eax
	call	fprintf@PLT
	movq	stderr(%rip), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %xmm0
	leaq	.LC11(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$1, %eax
	call	fprintf@PLT
	jmp	.L77
.L76:
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-24(%rbp), %rax
	movq	%rax, %xmm0
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movq	-16(%rbp), %rax
	movq	%rax, %xmm0
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
.L77:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4389:
	.size	check_result, .-check_result
	.globl	multichannel_conv
	.type	multichannel_conv, @function
multichannel_conv:
.LFB4390:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movl	%ecx, -60(%rbp)
	movl	%r8d, -64(%rbp)
	movl	%r9d, -68(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L79
.L90:
	movl	$0, -28(%rbp)
	jmp	.L80
.L89:
	movl	$0, -32(%rbp)
	jmp	.L81
.L88:
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -8(%rbp)
	movl	$0, -16(%rbp)
	jmp	.L82
.L87:
	movl	$0, -24(%rbp)
	jmp	.L83
.L86:
	movl	$0, -20(%rbp)
	jmp	.L84
.L85:
	movl	-28(%rbp), %edx
	movl	-24(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	-32(%rbp), %ecx
	movl	-20(%rbp), %eax
	addl	%ecx, %eax
	cltq
	salq	$3, %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	-16(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	-16(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	-24(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	-20(%rbp), %eax
	cltq
	addq	%rax, %rax
	addq	%rdx, %rax
	movzwl	(%rax), %eax
	cwtl
	pxor	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	mulss	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm0
	movsd	-8(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	addl	$1, -20(%rbp)
.L84:
	movl	-20(%rbp), %eax
	cmpl	24(%rbp), %eax
	jl	.L85
	addl	$1, -24(%rbp)
.L83:
	movl	-24(%rbp), %eax
	cmpl	24(%rbp), %eax
	jl	.L86
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	-28(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	-32(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	pxor	%xmm0, %xmm0
	cvtsd2ss	-8(%rbp), %xmm0
	movss	%xmm0, (%rax)
	addl	$1, -16(%rbp)
.L82:
	movl	-16(%rbp), %eax
	cmpl	-68(%rbp), %eax
	jl	.L87
	addl	$1, -32(%rbp)
.L81:
	movl	-32(%rbp), %eax
	cmpl	-64(%rbp), %eax
	jl	.L88
	addl	$1, -28(%rbp)
.L80:
	movl	-28(%rbp), %eax
	cmpl	-60(%rbp), %eax
	jl	.L89
	addl	$1, -12(%rbp)
.L79:
	movl	-12(%rbp), %eax
	cmpl	16(%rbp), %eax
	jl	.L90
	nop
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4390:
	.size	multichannel_conv, .-multichannel_conv
	.globl	student_conv
	.type	student_conv, @function
student_conv:
.LFB4392:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$240, %rsp
	movq	%rdi, -200(%rbp)
	movq	%rsi, -208(%rbp)
	movq	%rdx, -216(%rbp)
	movl	%ecx, -220(%rbp)
	movl	%r8d, -224(%rbp)
	movl	%r9d, -228(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-200(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, -136(%rbp)
	movq	-208(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, -128(%rbp)
	movl	24(%rbp), %eax
	imull	%eax, %eax
	movl	%eax, -188(%rbp)
	movl	-224(%rbp), %edx
	movl	24(%rbp), %eax
	addl	%eax, %edx
	movl	-228(%rbp), %eax
	imull	%edx, %eax
	movl	%eax, -184(%rbp)
	movl	-228(%rbp), %eax
	imull	-188(%rbp), %eax
	movl	%eax, -180(%rbp)
	movl	-188(%rbp), %eax
	sall	$3, %eax
	movl	%eax, -176(%rbp)
	movl	-176(%rbp), %eax
	movl	%eax, -28(%rbp)
	movl	-180(%rbp), %eax
	movl	%eax, -32(%rbp)
	movl	-184(%rbp), %eax
	movl	%eax, -36(%rbp)
	movl	-188(%rbp), %eax
	movl	%eax, -40(%rbp)
	movq	-128(%rbp), %rax
	movq	%rax, -96(%rbp)
	movq	-136(%rbp), %rax
	movq	%rax, -104(%rbp)
	movl	24(%rbp), %eax
	movl	%eax, -64(%rbp)
	movl	16(%rbp), %eax
	movl	%eax, -68(%rbp)
	movl	-228(%rbp), %eax
	movl	%eax, -72(%rbp)
	movl	-224(%rbp), %eax
	movl	%eax, -76(%rbp)
	movl	-220(%rbp), %eax
	movl	%eax, -80(%rbp)
	movq	-216(%rbp), %rax
	movq	%rax, -112(%rbp)
	movsd	-120(%rbp), %xmm0
	movsd	%xmm0, -88(%rbp)
	movl	-172(%rbp), %eax
	movl	%eax, -60(%rbp)
	movl	-168(%rbp), %eax
	movl	%eax, -56(%rbp)
	movl	-164(%rbp), %eax
	movl	%eax, -52(%rbp)
	movl	-160(%rbp), %eax
	movl	%eax, -48(%rbp)
	movl	-156(%rbp), %eax
	movl	%eax, -44(%rbp)
	movl	-152(%rbp), %eax
	movl	%eax, -24(%rbp)
	movl	-148(%rbp), %eax
	movl	%eax, -20(%rbp)
	movl	-144(%rbp), %eax
	movl	%eax, -16(%rbp)
	movl	-140(%rbp), %eax
	movl	%eax, -12(%rbp)
	leaq	-112(%rbp), %rax
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	leaq	student_conv._omp_fn.0(%rip), %rax
	movq	%rax, %rdi
	call	GOMP_parallel@PLT
	movsd	-88(%rbp), %xmm0
	movsd	%xmm0, -120(%rbp)
	movl	-60(%rbp), %eax
	movl	%eax, -172(%rbp)
	movl	-56(%rbp), %eax
	movl	%eax, -168(%rbp)
	movl	-52(%rbp), %eax
	movl	%eax, -164(%rbp)
	movl	-48(%rbp), %eax
	movl	%eax, -160(%rbp)
	movl	-44(%rbp), %eax
	movl	%eax, -156(%rbp)
	movl	-24(%rbp), %eax
	movl	%eax, -152(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, -148(%rbp)
	movl	-16(%rbp), %eax
	movl	%eax, -144(%rbp)
	movl	-12(%rbp), %eax
	movl	%eax, -140(%rbp)
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L92
	call	__stack_chk_fail@PLT
.L92:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4392:
	.size	student_conv, .-student_conv
	.section	.rodata
	.align 8
.LC15:
	.string	"Usage: conv-harness <image_width> <image_height> <kernel_order> <number of channels> <number of kernels>\n"
	.align 8
.LC16:
	.string	"FATAL: kernel_order must be 1, 3, 5 or 7, not %d\n"
.LC17:
	.string	"\033[36mDavid conv time: "
.LC18:
	.string	"\033[33m%lld microseconds\n"
.LC19:
	.string	"\033[34mStudent conv time: "
.LC20:
	.string	"\033[0mThe "
.LC21:
	.string	"\033[32mtotal speed up time "
.LC22:
	.string	"\033[0mwas "
.LC23:
	.string	"\033[35m%.2fx "
.LC24:
	.string	"\033[0mand "
.LC25:
	.string	"\033[33m%lld microseconds "
.LC26:
	.string	"\033[0mless"
	.text
	.globl	main
	.type	main, @function
main:
.LFB4393:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$144, %rsp
	movl	%edi, -132(%rbp)
	movq	%rsi, -144(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	cmpl	$6, -132(%rbp)
	je	.L94
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$105, %edx
	movl	$1, %esi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$1, %edi
	call	exit@PLT
.L94:
	movq	-144(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -124(%rbp)
	movq	-144(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -120(%rbp)
	movq	-144(%rbp), %rax
	addq	$24, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -116(%rbp)
	movq	-144(%rbp), %rax
	addq	$32, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -112(%rbp)
	movq	-144(%rbp), %rax
	addq	$40, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -108(%rbp)
	movl	-116(%rbp), %eax
	cmpl	$7, %eax
	seta	%dl
	testb	%dl, %dl
	jne	.L95
	movl	$170, %edx
	movl	%eax, %ecx
	shrq	%cl, %rdx
	movq	%rdx, %rax
	andl	$1, %eax
	testq	%rax, %rax
	setne	%al
	testb	%al, %al
	jne	.L100
.L95:
	movq	stderr(%rip), %rax
	movl	-116(%rbp), %edx
	leaq	.LC16(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$1, %edi
	call	exit@PLT
.L100:
	nop
	movl	-120(%rbp), %edx
	movl	-116(%rbp), %eax
	leal	(%rdx,%rax), %esi
	movl	-124(%rbp), %edx
	movl	-116(%rbp), %eax
	leal	(%rdx,%rax), %ecx
	movl	-112(%rbp), %eax
	movl	%eax, %edx
	movl	%ecx, %edi
	call	gen_random_3d_matrix_float
	movq	%rax, -104(%rbp)
	movl	-116(%rbp), %ecx
	movl	-116(%rbp), %edx
	movl	-112(%rbp), %esi
	movl	-108(%rbp), %eax
	movl	%eax, %edi
	call	gen_random_4d_matrix_int16
	movq	%rax, -96(%rbp)
	movl	-120(%rbp), %edx
	movl	-124(%rbp), %ecx
	movl	-108(%rbp), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	new_empty_3d_matrix_float
	movq	%rax, -88(%rbp)
	movl	-120(%rbp), %edx
	movl	-124(%rbp), %ecx
	movl	-108(%rbp), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	new_empty_3d_matrix_float
	movq	%rax, -80(%rbp)
	leaq	-48(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	gettimeofday@PLT
	movl	-112(%rbp), %r9d
	movl	-120(%rbp), %r8d
	movl	-124(%rbp), %ecx
	movq	-80(%rbp), %rdx
	movq	-96(%rbp), %rsi
	movq	-104(%rbp), %rax
	movl	-116(%rbp), %edi
	pushq	%rdi
	movl	-108(%rbp), %edi
	pushq	%rdi
	movq	%rax, %rdi
	call	multichannel_conv
	addq	$16, %rsp
	leaq	-32(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	gettimeofday@PLT
	movq	-32(%rbp), %rax
	movq	-48(%rbp), %rdx
	subq	%rdx, %rax
	imulq	$1000000, %rax, %rdx
	movq	-24(%rbp), %rax
	movq	-40(%rbp), %rcx
	subq	%rcx, %rax
	addq	%rdx, %rax
	movq	%rax, -72(%rbp)
	leaq	-48(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	gettimeofday@PLT
	movl	-112(%rbp), %r9d
	movl	-120(%rbp), %r8d
	movl	-124(%rbp), %ecx
	movq	-88(%rbp), %rdx
	movq	-96(%rbp), %rsi
	movq	-104(%rbp), %rax
	movl	-116(%rbp), %edi
	pushq	%rdi
	movl	-108(%rbp), %edi
	pushq	%rdi
	movq	%rax, %rdi
	call	student_conv
	addq	$16, %rsp
	leaq	-32(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	gettimeofday@PLT
	movq	-32(%rbp), %rax
	movq	-48(%rbp), %rdx
	subq	%rdx, %rax
	imulq	$1000000, %rax, %rdx
	movq	-24(%rbp), %rax
	movq	-40(%rbp), %rcx
	subq	%rcx, %rax
	addq	%rdx, %rax
	movq	%rax, -64(%rbp)
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-72(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-64(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	pxor	%xmm0, %xmm0
	cvtsi2sdq	-72(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdq	-64(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -56(%rbp)
	leaq	.LC20(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC21(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC22(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-56(%rbp), %rax
	movq	%rax, %xmm0
	leaq	.LC23(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	leaq	.LC24(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-72(%rbp), %rax
	subq	-64(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC25(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC26(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	-120(%rbp), %edi
	movl	-124(%rbp), %ecx
	movl	-108(%rbp), %edx
	movq	-80(%rbp), %rsi
	movq	-88(%rbp), %rax
	movl	%edi, %r8d
	movq	%rax, %rdi
	call	check_result
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L98
	call	__stack_chk_fail@PLT
.L98:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4393:
	.size	main, .-main
	.section	.rodata
	.align 8
	.type	__PRETTY_FUNCTION__.0, @object
	.size	__PRETTY_FUNCTION__.0, 13
__PRETTY_FUNCTION__.0:
	.string	"check_result"
	.text
	.type	student_conv._omp_fn.0, @function
student_conv._omp_fn.0:
.LFB4394:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$80, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -88(%rbp)
	movq	-88(%rbp), %rax
	movl	84(%rax), %eax
	movl	%eax, -76(%rbp)
	movq	-88(%rbp), %rax
	movl	80(%rax), %eax
	movl	%eax, -72(%rbp)
	movq	-88(%rbp), %rax
	movl	76(%rax), %eax
	movl	%eax, -68(%rbp)
	movq	-88(%rbp), %rax
	movl	72(%rax), %eax
	movl	%eax, -64(%rbp)
	movq	-88(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -40(%rbp)
	movq	-88(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	-88(%rbp), %rax
	movl	48(%rax), %eax
	movl	%eax, -60(%rbp)
	movq	-88(%rbp), %rax
	movl	44(%rax), %eax
	movl	%eax, -56(%rbp)
	movq	-88(%rbp), %rax
	movl	40(%rax), %eax
	movl	%eax, -52(%rbp)
	movq	-88(%rbp), %rax
	movl	36(%rax), %eax
	movl	%eax, -48(%rbp)
	movq	-88(%rbp), %rax
	movl	32(%rax), %eax
	movl	%eax, -44(%rbp)
	movq	-88(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	movl	-56(%rbp), %ebx
	call	omp_get_num_threads@PLT
	movl	%eax, %r12d
	call	omp_get_thread_num@PLT
	movl	%eax, %esi
	movl	%ebx, %eax
	cltd
	idivl	%r12d
	movl	%eax, %ecx
	movl	%ebx, %eax
	cltd
	idivl	%r12d
	movl	%edx, %eax
	cmpl	%eax, %esi
	jl	.L102
.L115:
	movl	%esi, %edx
	imull	%ecx, %edx
	addl	%edx, %eax
	leal	(%rax,%rcx), %edx
	cmpl	%edx, %eax
	jge	.L116
	movl	%eax, -80(%rbp)
.L105:
	movq	-88(%rbp), %rax
	movl	$0, 56(%rax)
	nop
.L107:
	movq	-88(%rbp), %rax
	movl	56(%rax), %eax
	cmpl	-44(%rbp), %eax
	jl	.L104
	addl	$1, -80(%rbp)
	cmpl	%edx, -80(%rbp)
	jl	.L105
	jmp	.L116
.L104:
	movq	-88(%rbp), %rax
	movl	$0, 52(%rax)
	nop
.L109:
	movq	-88(%rbp), %rax
	movl	52(%rax), %eax
	cmpl	-48(%rbp), %eax
	jl	.L106
	movq	-88(%rbp), %rax
	movl	56(%rax), %eax
	leal	1(%rax), %ecx
	movq	-88(%rbp), %rax
	movl	%ecx, 56(%rax)
	jmp	.L107
.L106:
	movq	-88(%rbp), %rax
	pxor	%xmm0, %xmm0
	movsd	%xmm0, 24(%rax)
	movq	-88(%rbp), %rax
	movl	$0, 60(%rax)
	nop
.L111:
	movq	-88(%rbp), %rax
	movl	60(%rax), %eax
	cmpl	-60(%rbp), %eax
	jl	.L108
	movl	-80(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movq	(%rax), %rcx
	movq	-88(%rbp), %rax
	movl	56(%rax), %eax
	cltq
	salq	$3, %rax
	addq	%rcx, %rax
	movq	(%rax), %rcx
	movq	-88(%rbp), %rax
	movl	52(%rax), %eax
	cltq
	salq	$2, %rax
	addq	%rax, %rcx
	movq	-88(%rbp), %rax
	movsd	24(%rax), %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, (%rcx)
	movq	-88(%rbp), %rax
	movl	52(%rax), %eax
	leal	1(%rax), %ecx
	movq	-88(%rbp), %rax
	movl	%ecx, 52(%rax)
	jmp	.L109
.L108:
	movq	-88(%rbp), %rax
	movl	60(%rax), %ecx
	movq	-88(%rbp), %rax
	movl	56(%rax), %eax
	addl	%ecx, %eax
	imull	-68(%rbp), %eax
	movl	%eax, %ecx
	movq	-88(%rbp), %rax
	movl	%ecx, 88(%rax)
	movl	-80(%rbp), %eax
	imull	-72(%rbp), %eax
	movl	%eax, %ecx
	movq	-88(%rbp), %rax
	movl	60(%rax), %eax
	imull	-60(%rbp), %eax
	addl	%eax, %ecx
	movq	-88(%rbp), %rax
	movl	%ecx, 92(%rax)
	movq	-88(%rbp), %rax
	movl	$0, 64(%rax)
	nop
.L113:
	movq	-88(%rbp), %rax
	movl	64(%rax), %eax
	cmpl	-60(%rbp), %eax
	jl	.L110
	movq	-88(%rbp), %rax
	movl	60(%rax), %eax
	leal	1(%rax), %ecx
	movq	-88(%rbp), %rax
	movl	%ecx, 60(%rax)
	jmp	.L111
.L110:
	movq	-88(%rbp), %rax
	movl	64(%rax), %ecx
	movq	-88(%rbp), %rax
	movl	52(%rax), %eax
	addl	%ecx, %eax
	imull	-52(%rbp), %eax
	movl	%eax, %ecx
	movq	-88(%rbp), %rax
	movl	88(%rax), %eax
	addl	%eax, %ecx
	movq	-88(%rbp), %rax
	movl	%ecx, 96(%rax)
	movq	-88(%rbp), %rax
	movl	64(%rax), %ecx
	movq	-88(%rbp), %rax
	movl	92(%rax), %eax
	addl	%eax, %ecx
	movq	-88(%rbp), %rax
	movl	%ecx, 100(%rax)
	movq	-88(%rbp), %rax
	movl	$0, 68(%rax)
	nop
.L114:
	movq	-88(%rbp), %rax
	movl	68(%rax), %eax
	cmpl	-52(%rbp), %eax
	jl	.L112
	movq	-88(%rbp), %rax
	movl	64(%rax), %eax
	leal	1(%rax), %ecx
	movq	-88(%rbp), %rax
	movl	%ecx, 64(%rax)
	jmp	.L113
.L112:
	movq	-88(%rbp), %rax
	movl	96(%rax), %eax
	leal	1(%rax), %esi
	movq	-88(%rbp), %rcx
	movl	%esi, 96(%rcx)
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm1
	movq	-88(%rbp), %rax
	movl	100(%rax), %eax
	cltq
	leaq	(%rax,%rax), %rcx
	movq	-40(%rbp), %rax
	addq	%rcx, %rax
	movzwl	(%rax), %eax
	cwtl
	pxor	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	mulss	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	%xmm0, %xmm1
	movq	-88(%rbp), %rax
	movsd	24(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movq	-88(%rbp), %rax
	movsd	%xmm0, 24(%rax)
	movq	-88(%rbp), %rax
	movl	96(%rax), %eax
	leal	1(%rax), %esi
	movq	-88(%rbp), %rcx
	movl	%esi, 96(%rcx)
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm1
	movq	-88(%rbp), %rax
	movl	100(%rax), %ecx
	movl	-64(%rbp), %eax
	addl	%ecx, %eax
	cltq
	leaq	(%rax,%rax), %rcx
	movq	-40(%rbp), %rax
	addq	%rcx, %rax
	movzwl	(%rax), %eax
	cwtl
	pxor	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	mulss	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	%xmm0, %xmm1
	movq	-88(%rbp), %rax
	movsd	24(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movq	-88(%rbp), %rax
	movsd	%xmm0, 24(%rax)
	movq	-88(%rbp), %rax
	movl	96(%rax), %eax
	leal	1(%rax), %esi
	movq	-88(%rbp), %rcx
	movl	%esi, 96(%rcx)
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm1
	movl	-64(%rbp), %eax
	leal	(%rax,%rax), %ecx
	movq	-88(%rbp), %rax
	movl	100(%rax), %eax
	addl	%ecx, %eax
	cltq
	leaq	(%rax,%rax), %rcx
	movq	-40(%rbp), %rax
	addq	%rcx, %rax
	movzwl	(%rax), %eax
	cwtl
	pxor	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	mulss	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	%xmm0, %xmm1
	movq	-88(%rbp), %rax
	movsd	24(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movq	-88(%rbp), %rax
	movsd	%xmm0, 24(%rax)
	movq	-88(%rbp), %rax
	movl	96(%rax), %eax
	leal	1(%rax), %esi
	movq	-88(%rbp), %rcx
	movl	%esi, 96(%rcx)
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm1
	movl	-64(%rbp), %ecx
	movl	%ecx, %eax
	addl	%eax, %eax
	addl	%eax, %ecx
	movq	-88(%rbp), %rax
	movl	100(%rax), %eax
	addl	%ecx, %eax
	cltq
	leaq	(%rax,%rax), %rcx
	movq	-40(%rbp), %rax
	addq	%rcx, %rax
	movzwl	(%rax), %eax
	cwtl
	pxor	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	mulss	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	%xmm0, %xmm1
	movq	-88(%rbp), %rax
	movsd	24(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movq	-88(%rbp), %rax
	movsd	%xmm0, 24(%rax)
	movq	-88(%rbp), %rax
	movl	96(%rax), %eax
	leal	1(%rax), %esi
	movq	-88(%rbp), %rcx
	movl	%esi, 96(%rcx)
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm1
	movl	-64(%rbp), %eax
	leal	0(,%rax,4), %ecx
	movq	-88(%rbp), %rax
	movl	100(%rax), %eax
	addl	%ecx, %eax
	cltq
	leaq	(%rax,%rax), %rcx
	movq	-40(%rbp), %rax
	addq	%rcx, %rax
	movzwl	(%rax), %eax
	cwtl
	pxor	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	mulss	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	%xmm0, %xmm1
	movq	-88(%rbp), %rax
	movsd	24(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movq	-88(%rbp), %rax
	movsd	%xmm0, 24(%rax)
	movq	-88(%rbp), %rax
	movl	96(%rax), %eax
	leal	1(%rax), %esi
	movq	-88(%rbp), %rcx
	movl	%esi, 96(%rcx)
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm1
	movl	-64(%rbp), %ecx
	movl	%ecx, %eax
	sall	$2, %eax
	addl	%eax, %ecx
	movq	-88(%rbp), %rax
	movl	100(%rax), %eax
	addl	%ecx, %eax
	cltq
	leaq	(%rax,%rax), %rcx
	movq	-40(%rbp), %rax
	addq	%rcx, %rax
	movzwl	(%rax), %eax
	cwtl
	pxor	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	mulss	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	%xmm0, %xmm1
	movq	-88(%rbp), %rax
	movsd	24(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movq	-88(%rbp), %rax
	movsd	%xmm0, 24(%rax)
	movq	-88(%rbp), %rax
	movl	96(%rax), %eax
	leal	1(%rax), %esi
	movq	-88(%rbp), %rcx
	movl	%esi, 96(%rcx)
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm1
	movl	-64(%rbp), %ecx
	movl	%ecx, %eax
	addl	%eax, %eax
	addl	%ecx, %eax
	addl	%eax, %eax
	movl	%eax, %ecx
	movq	-88(%rbp), %rax
	movl	100(%rax), %eax
	addl	%ecx, %eax
	cltq
	leaq	(%rax,%rax), %rcx
	movq	-40(%rbp), %rax
	addq	%rcx, %rax
	movzwl	(%rax), %eax
	cwtl
	pxor	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	mulss	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	%xmm0, %xmm1
	movq	-88(%rbp), %rax
	movsd	24(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movq	-88(%rbp), %rax
	movsd	%xmm0, 24(%rax)
	movq	-88(%rbp), %rax
	movl	96(%rax), %eax
	leal	1(%rax), %esi
	movq	-88(%rbp), %rcx
	movl	%esi, 96(%rcx)
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm1
	movl	-64(%rbp), %ecx
	movl	%ecx, %eax
	sall	$3, %eax
	subl	%ecx, %eax
	movl	%eax, %esi
	movq	-88(%rbp), %rax
	movl	100(%rax), %eax
	addl	%esi, %eax
	cltq
	leaq	(%rax,%rax), %rcx
	movq	-40(%rbp), %rax
	addq	%rcx, %rax
	movzwl	(%rax), %eax
	cwtl
	pxor	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	mulss	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	%xmm0, %xmm1
	movq	-88(%rbp), %rax
	movsd	24(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movq	-88(%rbp), %rax
	movsd	%xmm0, 24(%rax)
	movq	-88(%rbp), %rax
	movl	100(%rax), %ecx
	movl	-76(%rbp), %eax
	addl	%eax, %ecx
	movq	-88(%rbp), %rax
	movl	%ecx, 100(%rax)
	movq	-88(%rbp), %rax
	movl	68(%rax), %eax
	leal	8(%rax), %ecx
	movq	-88(%rbp), %rax
	movl	%ecx, 68(%rax)
	jmp	.L114
.L102:
	movl	$0, %eax
	addl	$1, %ecx
	jmp	.L115
.L116:
	nop
	addq	$80, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4394:
	.size	student_conv._omp_fn.0, .-student_conv._omp_fn.0
	.section	.rodata
	.align 8
.LC4:
	.long	0
	.long	1068498944
	.align 16
.LC5:
	.long	2147483647
	.long	0
	.long	0
	.long	0
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
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
