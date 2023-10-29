	
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	count_leading_zeros
	.type	count_leading_zeros, @function
count_leading_zeros:
	addi	sp,sp,-32
	sd	s0,24(sp)
	addi	s0,sp,32
	sd	a0,-24(s0)
	ld	a5,-24(s0)
	srli	a5,a5,1
	ld	a4,-24(s0)
	or	a5,a4,a5
	sd	a5,-24(s0)
	ld	a5,-24(s0)
	srli	a5,a5,2
	ld	a4,-24(s0)
	or	a5,a4,a5
	sd	a5,-24(s0)
	ld	a5,-24(s0)
	srli	a5,a5,4
	ld	a4,-24(s0)
	or	a5,a4,a5
	sd	a5,-24(s0)
	ld	a5,-24(s0)
	srli	a5,a5,8
	ld	a4,-24(s0)
	or	a5,a4,a5
	sd	a5,-24(s0)
	ld	a5,-24(s0)
	srli	a5,a5,16
	ld	a4,-24(s0)
	or	a5,a4,a5
	sd	a5,-24(s0)
	ld	a5,-24(s0)
	srli	a5,a5,32
	ld	a4,-24(s0)
	or	a5,a4,a5
	sd	a5,-24(s0)
	ld	a5,-24(s0)
	srli	a4,a5,1
	lui	a5,%hi(.LC0)
	ld	a5,%lo(.LC0)(a5)
	and	a5,a4,a5
	ld	a4,-24(s0)
	sub	a5,a4,a5
	sd	a5,-24(s0)
	ld	a5,-24(s0)
	srli	a4,a5,2
	lui	a5,%hi(.LC1)
	ld	a5,%lo(.LC1)(a5)
	and	a4,a4,a5
	ld	a3,-24(s0)
	lui	a5,%hi(.LC1)
	ld	a5,%lo(.LC1)(a5)
	and	a5,a3,a5
	add	a5,a4,a5
	sd	a5,-24(s0)
	ld	a5,-24(s0)
	srli	a4,a5,4
	ld	a5,-24(s0)
	add	a4,a4,a5
	lui	a5,%hi(.LC2)
	ld	a5,%lo(.LC2)(a5)
	and	a5,a4,a5
	sd	a5,-24(s0)
	ld	a5,-24(s0)
	srli	a5,a5,8
	ld	a4,-24(s0)
	add	a5,a4,a5
	sd	a5,-24(s0)
	ld	a5,-24(s0)
	srli	a5,a5,16
	ld	a4,-24(s0)
	add	a5,a4,a5
	sd	a5,-24(s0)
	ld	a5,-24(s0)
	srli	a5,a5,32
	ld	a4,-24(s0)
	add	a5,a4,a5
	sd	a5,-24(s0)
	ld	a5,-24(s0)
	slli	a5,a5,48
	srli	a5,a5,48
	andi	a5,a5,127
	slli	a5,a5,48
	srli	a5,a5,48
	li	a4,64
	subw	a5,a4,a5
	slli	a5,a5,48
	srli	a5,a5,48
	mv	a0,a5
	ld	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	count_leading_zeros, .-count_leading_zeros
	.section	.rodata
	.align	3
.LC4:
	.string	"%hd\n"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	lui	a5,%hi(.LC3)
	ld	a5,%lo(.LC3)(a5)
	sd	a5,-24(s0)
	ld	a0,-24(s0)
	call	count_leading_zeros
	mv	a5,a0
	sh	a5,-26(s0)
	lhu	a5,-26(s0)
	sext.w	a5,a5
	mv	a1,a5
	lui	a5,%hi(.LC4)
	addi	a0,a5,%lo(.LC4)
	call	printf
	li	a5,0
	mv	a0,a5
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	main, .-main
	.section	.rodata
	.align	3
.LC0:
	.dword	6148914691236517205
	.align	3
.LC1:
	.dword	3689348814741910323
	.align	3
.LC2:
	.dword	1085102592571150095
	.align	3
.LC3:
	.dword	458084031987722
	.ident	"GCC: (g2ee5e430018) 12.2.0"
