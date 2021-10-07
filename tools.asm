.att_syntax noprefix

.ifdef _LINUX_

	.set par1,    rdi
	.set par1.32, edi
	.set par1.16, di
	.set par1.8,  dil
	.set par2,    rsi
	.set par2.32, esi
	.set par2.16, si
	.set par2.8,  sil
	.set par3,    rdx
	.set par3.32, edx
	.set par3.16, dx
	.set par3.8,  dl
	.set par4,    rcx
	.set par4.32, ecx
	.set par4.16, cx
	.set par4.8,  cl
	.set par5,    r8
	.set par5.32, r8d
	.set par5.16, r8w
	.set par5.8,  r8b
	.set par6,    r9
	.set par6.32, r9d
	.set par6.16, r9w
	.set par6.8,  r9b
	
	.macro START
		.global main
		main:
		mov rsp, rbp
		sub $1024, rsp
		and $-16, rsp
	.endm

	.macro EXIT
		mov $0, dil
		mov $60, eax
		syscall
	.endm

.else

	.set par1,    rcx
	.set par1.32, ecx
	.set par1.16, cx
	.set par1.8,  cl
	.set par2,    rdx
	.set par2.32, edx
	.set par2.16, dx
	.set par2.8,  dl
	.set par3,    r8
	.set par3.32, r8d
	.set par3.16, r8w
	.set par3.8,  r8b
	.set par4,    r9
	.set par4.32, r9d
	.set par4.16, r9w
	.set par4.8,  r9b
	# .set par5,    32(rsp)
	# .set par5.32, 32(rsp)
	# .set par5.16, 32(rsp)
	# .set par5.8,  32(rsp)
	# .set par6,    40(rsp)
	# .set par6.32, 40(rsp)
	# .set par6.16, 40(rsp)
	# .set par6.8,  40(rsp)

	.macro START
		.global main
		main:
		mov rsp, rbp
		sub $1024, rsp
		and $-16, rsp
	.endm

	.macro EXIT
		xor par1.32,par1.32
		call ExitProcess
	.endm

.endif
