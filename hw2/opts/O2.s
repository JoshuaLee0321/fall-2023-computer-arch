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
	lui	a2,%hi(.LC0)
	ld	a2,%lo(.LC0)(a2)
	srli	a5,a4,32
	or	a5,a5,a4
	srli	a4,a5,1
	lui	a3,%hi(.LC1)
	ld	a3,%lo(.LC1)(a3)
	and	a4,a4,a2
	sub	a5,a5,a4
	srli	a4,a5,2
	and	a4,a4,a3
	and	a5,a5,a3
	add	a4,a4,a5
	srli	a5,a4,4
	add	a5,a5,a4
	lui	a4,%hi(.LC2)
	ld	a4,%lo(.LC2)(a4)
	li	a0,64
	and	a5,a5,a4
	srli	a4,a5,8
	add	a5,a4,a5
	srli	a4,a5,16
	add	a4,a4,a5
	srli	a5,a4,32
	add	a5,a5,a4
	andi	a5,a5,127
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
	.section	.text.startup,"ax",@progbits
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
 #APP
# 9 "main.c" 1
	rdcycle s5
# 0 "" 2
 #NO_APP
	lui	s1,%hi(.LC3)
	li	a1,-1
	li	s0,12288
	li	a5,10
	srli	a1,a1,4
	addi	s0,s0,1383
	addi	a0,s1,%lo(.LC3)
	sd	a5,24(sp)
	sd	a1,8(sp)
	sd	s0,16(sp)
	call	printf
	mv	a1,s0
	addi	a0,s1,%lo(.LC3)
	call	printf
	li	a1,10
	addi	a0,s1,%lo(.LC3)
	call	printf
	lui	a0,%hi(.LC4)
	li	a1,192
	addi	a0,a0,%lo(.LC4)
	call	printf
	addi	s3,sp,8
	li	s2,0
	li	s4,0
	li	s1,0
	lui	s8,%hi(.LC5)
	li	s7,47
	li	s9,31
	li	s6,3
.L10:
	ld	a0,0(s3)
	call	count_leading_zeros
	sext.w	s0,a0
	mv	a1,s2
	mv	a2,s0
	addi	a0,s8,%lo(.LC5)
	call	printf
	addiw	a4,s1,16
	addiw	a5,s4,48
	bgtu	s0,s7,.L13
	addiw	a4,s1,32
	addiw	a5,s4,32
	addiw	s1,s1,64
	bgtu	s0,s9,.L13
	slli	s1,s1,48
	srli	s1,s1,48
.L8:
	addiw	s2,s2,1
	addi	s3,s3,8
	bne	s2,s6,.L10
	lui	a0,%hi(.LC6)
	mv	a1,s1
	addi	a0,a0,%lo(.LC6)
	call	printf
	lui	a0,%hi(.LC7)
	mv	a1,s4
	addi	a0,a0,%lo(.LC7)
	call	printf
 #APP
# 9 "main.c" 1
	rdcycle a1
# 0 "" 2
 #NO_APP
	lui	a0,%hi(.LC8)
	subw	a1,a1,s5
	addi	a0,a0,%lo(.LC8)
	call	printf
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
	li	a0,0
	addi	sp,sp,128
	jr	ra
.L13:
	slli	s1,a4,48
	slli	s4,a5,48
	srli	s1,s1,48
	srli	s4,s4,48
	j	.L8
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
