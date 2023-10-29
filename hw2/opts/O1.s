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
 #APP
# 9 "main.c" 1
	rdcycle a0
# 0 "" 2
 #NO_APP
	ret
	.size	read_cycles, .-read_cycles
	.align	1
	.globl	count_leading_zeros
	.type	count_leading_zeros, @function
count_leading_zeros:
	srli	a5,a0,1
	or	a0,a5,a0
	srli	a5,a0,2
	or	a5,a5,a0
	srli	a0,a5,4
	or	a0,a0,a5
	srli	a5,a0,8
	or	a5,a5,a0
	srli	a4,a5,16
	or	a4,a4,a5
	srli	a5,a4,32
	or	a5,a5,a4
	srli	a4,a5,1
	lui	a3,%hi(.LC0)
	ld	a3,%lo(.LC0)(a3)
	and	a4,a4,a3
	sub	a5,a5,a4
	srli	a4,a5,2
	lui	a3,%hi(.LC1)
	ld	a3,%lo(.LC1)(a3)
	and	a4,a4,a3
	and	a5,a5,a3
	add	a4,a4,a5
	srli	a5,a4,4
	add	a5,a5,a4
	lui	a4,%hi(.LC2)
	ld	a4,%lo(.LC2)(a4)
	and	a5,a5,a4
	srli	a4,a5,8
	add	a5,a4,a5
	srli	a4,a5,16
	add	a4,a4,a5
	srli	a5,a4,32
	add	a5,a5,a4
	andi	a5,a5,127
	li	a0,64
	subw	a0,a0,a5
	slli	a0,a0,48
	srli	a0,a0,48
	ret
	.size	count_leading_zeros, .-count_leading_zeros
	.align	1
	.globl	cvrt_uint32
	.type	cvrt_uint32, @function
cvrt_uint32:
	sext.w	a0,a0
	ret
	.size	cvrt_uint32, .-cvrt_uint32
	.align	1
	.globl	cvrt_uint16
	.type	cvrt_uint16, @function
cvrt_uint16:
	slli	a0,a0,48
	srli	a0,a0,48
	ret
	.size	cvrt_uint16, .-cvrt_uint16
	.section	.rodata.str1.8,"aMS",@progbits,1
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
	addi	sp,sp,-128
	sd	ra,120(sp)
	sd	s0,112(sp)
	sd	s1,104(sp)
	sd	s2,96(sp)
	sd	s3,88(sp)
	sd	s4,80(sp)
	sd	s5,72(sp)
	sd	s6,64(sp)
	sd	s7,56(sp)
	sd	s8,48(sp)
	sd	s9,40(sp)
	sd	s10,32(sp)
 #APP
# 9 "main.c" 1
	rdcycle s9
# 0 "" 2
 #NO_APP
	li	a1,-1
	srli	a1,a1,4
	sd	a1,8(sp)
	li	s0,12288
	addi	s0,s0,1383
	sd	s0,16(sp)
	li	a5,10
	sd	a5,24(sp)
	lui	s1,%hi(.LC3)
	addi	a0,s1,%lo(.LC3)
	call	printf
	mv	a1,s0
	addi	a0,s1,%lo(.LC3)
	call	printf
	li	a1,10
	addi	a0,s1,%lo(.LC3)
	call	printf
	li	a1,192
	lui	a0,%hi(.LC4)
	addi	a0,a0,%lo(.LC4)
	call	printf
	addi	s4,sp,8
	li	s2,0
	li	s3,0
	li	s1,0
	lui	s7,%hi(.LC5)
	li	s6,47
	li	s8,31
	li	s5,3
	j	.L9
.L6:
	sext.w	s0,s0
	bleu	s0,s8,.L8
	addiw	s1,s1,32
	slli	s1,s1,48
	srli	s1,s1,48
	addiw	s3,s3,32
	slli	s3,s3,48
	srli	s3,s3,48
.L7:
	addiw	s2,s2,1
	addi	s4,s4,8
	beq	s2,s5,.L12
.L9:
	ld	a0,0(s4)
	call	count_leading_zeros
	mv	s0,a0
	sext.w	s10,a0
	mv	a2,s10
	mv	a1,s2
	addi	a0,s7,%lo(.LC5)
	call	printf
	bleu	s10,s6,.L6
	addiw	s1,s1,16
	slli	s1,s1,48
	srli	s1,s1,48
	addiw	s3,s3,48
	slli	s3,s3,48
	srli	s3,s3,48
	j	.L7
.L8:
	addiw	s1,s1,64
	slli	s1,s1,48
	srli	s1,s1,48
	j	.L7
.L12:
	mv	a1,s1
	lui	a0,%hi(.LC6)
	addi	a0,a0,%lo(.LC6)
	call	printf
	mv	a1,s3
	lui	a0,%hi(.LC7)
	addi	a0,a0,%lo(.LC7)
	call	printf
 #APP
# 9 "main.c" 1
	rdcycle a1
# 0 "" 2
 #NO_APP
	subw	a1,a1,s9
	lui	a0,%hi(.LC8)
	addi	a0,a0,%lo(.LC8)
	call	printf
	li	a0,0
	ld	ra,120(sp)
	ld	s0,112(sp)
	ld	s1,104(sp)
	ld	s2,96(sp)
	ld	s3,88(sp)
	ld	s4,80(sp)
	ld	s5,72(sp)
	ld	s6,64(sp)
	ld	s7,56(sp)
	ld	s8,48(sp)
	ld	s9,40(sp)
	ld	s10,32(sp)
	addi	sp,sp,128
	jr	ra
	.size	main, .-main
	.section	.srodata.cst8,"aM",@progbits,8
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
