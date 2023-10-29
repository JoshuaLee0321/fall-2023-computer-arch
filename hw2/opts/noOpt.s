	.file	"main.c"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	read_cycles
	.type	read_cycles, @function
read_cycles:
	addi	sp,sp,-32
	sd	s0,24(sp)
	addi	s0,sp,32
 #APP
# 9 "main.c" 1
	rdcycle a5
# 0 "" 2
 #NO_APP
	sd	a5,-24(s0)
	ld	a5,-24(s0)
	mv	a0,a5
	ld	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	read_cycles, .-read_cycles
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
	.align	1
	.globl	cvrt_uint32
	.type	cvrt_uint32, @function
cvrt_uint32:
	addi	sp,sp,-32
	sd	s0,24(sp)
	addi	s0,sp,32
	sd	a0,-24(s0)
	ld	a5,-24(s0)
	sext.w	a5,a5
	mv	a0,a5
	ld	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	cvrt_uint32, .-cvrt_uint32
	.align	1
	.globl	cvrt_uint16
	.type	cvrt_uint16, @function
cvrt_uint16:
	addi	sp,sp,-32
	sd	s0,24(sp)
	addi	s0,sp,32
	sd	a0,-24(s0)
	ld	a5,-24(s0)
	slli	a5,a5,48
	srli	a5,a5,48
	mv	a0,a5
	ld	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	cvrt_uint16, .-cvrt_uint16
	.section	.rodata
	.align	3
.LC3:
	.string	"%llu\n"
	.align	3
.LC4:
	.string	"original bit count: %hu\n"
	.align	3
.LC5:
	.string	"leading zeros of test data[%d]: %hu\n"
	.align	3
.LC6:
	.string	"bit count after compressed: %hu\n"
	.align	3
.LC7:
	.string	"bit reduced after compressed: %hu\n"
	.align	3
.LC8:
	.string	"cycle count: %u\n"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-96
	sd	ra,88(sp)
	sd	s0,80(sp)
	addi	s0,sp,96
	call	read_cycles
	sd	a0,-40(s0)
	li	a5,-1
	srli	a5,a5,4
	sd	a5,-88(s0)
	li	a5,12288
	addi	a5,a5,1383
	sd	a5,-80(s0)
	li	a5,10
	sd	a5,-72(s0)
	li	a5,192
	sh	a5,-18(s0)
	sh	zero,-20(s0)
	sw	zero,-24(s0)
	j	.L10
.L11:
	lw	a5,-24(s0)
	slli	a5,a5,3
	addi	a5,a5,-16
	add	a5,a5,s0
	ld	a5,-72(a5)
	mv	a1,a5
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	printf
	lw	a5,-24(s0)
	addiw	a5,a5,1
	sw	a5,-24(s0)
.L10:
	lw	a5,-24(s0)
	sext.w	a4,a5
	li	a5,2
	ble	a4,a5,.L11
	lhu	a5,-18(s0)
	sext.w	a5,a5
	mv	a1,a5
	lui	a5,%hi(.LC4)
	addi	a0,a5,%lo(.LC4)
	call	printf
	sh	zero,-18(s0)
	sw	zero,-28(s0)
	j	.L12
.L16:
	lw	a5,-28(s0)
	slli	a5,a5,3
	addi	a5,a5,-16
	add	a5,a5,s0
	ld	a5,-72(a5)
	mv	a0,a5
	call	count_leading_zeros
	mv	a5,a0
	sh	a5,-50(s0)
	lhu	a5,-50(s0)
	sext.w	a4,a5
	lw	a5,-28(s0)
	mv	a2,a4
	mv	a1,a5
	lui	a5,%hi(.LC5)
	addi	a0,a5,%lo(.LC5)
	call	printf
	lhu	a5,-50(s0)
	sext.w	a4,a5
	li	a5,47
	bleu	a4,a5,.L13
	lw	a5,-28(s0)
	slli	a5,a5,3
	addi	a5,a5,-16
	add	a5,a5,s0
	ld	a5,-72(a5)
	mv	a0,a5
	call	cvrt_uint16
	mv	a5,a0
	sh	a5,-58(s0)
	lhu	a5,-18(s0)
	addiw	a5,a5,16
	sh	a5,-18(s0)
	lhu	a5,-20(s0)
	addiw	a5,a5,48
	sh	a5,-20(s0)
	j	.L14
.L13:
	lhu	a5,-50(s0)
	sext.w	a4,a5
	li	a5,31
	bleu	a4,a5,.L15
	lw	a5,-28(s0)
	slli	a5,a5,3
	addi	a5,a5,-16
	add	a5,a5,s0
	ld	a5,-72(a5)
	mv	a0,a5
	call	cvrt_uint32
	mv	a5,a0
	sw	a5,-56(s0)
	lhu	a5,-18(s0)
	addiw	a5,a5,32
	sh	a5,-18(s0)
	lhu	a5,-20(s0)
	addiw	a5,a5,32
	sh	a5,-20(s0)
	j	.L14
.L15:
	lhu	a5,-18(s0)
	addiw	a5,a5,64
	sh	a5,-18(s0)
.L14:
	lw	a5,-28(s0)
	addiw	a5,a5,1
	sw	a5,-28(s0)
.L12:
	lw	a5,-28(s0)
	sext.w	a4,a5
	li	a5,2
	ble	a4,a5,.L16
	lhu	a5,-18(s0)
	sext.w	a5,a5
	mv	a1,a5
	lui	a5,%hi(.LC6)
	addi	a0,a5,%lo(.LC6)
	call	printf
	lhu	a5,-20(s0)
	sext.w	a5,a5
	mv	a1,a5
	lui	a5,%hi(.LC7)
	addi	a0,a5,%lo(.LC7)
	call	printf
	call	read_cycles
	mv	a4,a0
	ld	a5,-40(s0)
	sub	a5,a4,a5
	sd	a5,-48(s0)
	ld	a5,-48(s0)
	sext.w	a5,a5
	mv	a1,a5
	lui	a5,%hi(.LC8)
	addi	a0,a5,%lo(.LC8)
	call	printf
	li	a5,0
	mv	a0,a5
	ld	ra,88(sp)
	ld	s0,80(sp)
	addi	sp,sp,96
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
	.ident	"GCC: (g2ee5e430018) 12.2.0"
