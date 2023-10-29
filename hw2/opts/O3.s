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
	addi	sp,sp,-160
	sd	ra,152(sp)
	sd	s0,144(sp)
	sd	s1,136(sp)
	sd	s2,128(sp)
	sd	s3,120(sp)
	sd	s4,112(sp)
	sd	s5,104(sp)
	sd	s6,96(sp)
	sd	s7,88(sp)
	sd	s8,80(sp)
	sd	s9,72(sp)
	sd	s10,64(sp)
	sd	s11,56(sp)
 #APP
# 9 "main.c" 1
	rdcycle a5
# 0 "" 2
 #NO_APP
	lui	s1,%hi(.LC3)
	li	a1,-1
	li	s0,12288
	srli	a1,a1,4
	addi	s0,s0,1383
	sd	a5,8(sp)
	addi	a0,s1,%lo(.LC3)
	li	a5,10
	sd	a5,40(sp)
	sd	a1,24(sp)
	sd	s0,32(sp)
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
	lui	a5,%hi(.LC0)
	ld	s5,%lo(.LC0)(a5)
	lui	a5,%hi(.LC1)
	ld	s6,%lo(.LC1)(a5)
	lui	a5,%hi(.LC2)
	ld	s4,%lo(.LC2)(a5)
	addi	s10,sp,24
	li	s7,0
	li	s11,0
	li	s9,0
	lui	s3,%hi(.LC5)
	li	s2,64
	li	s1,47
	li	s0,3
.L10:
	ld	a3,0(s10)
	mv	a1,s7
	addi	a0,s3,%lo(.LC5)
	srli	a5,a3,1
	or	a5,a5,a3
	srli	a3,a5,2
	or	a5,a5,a3
	srli	a3,a5,4
	or	a5,a5,a3
	srli	a3,a5,8
	or	a5,a5,a3
	srli	a3,a5,16
	or	a5,a5,a3
	srli	a3,a5,32
	or	a5,a5,a3
	srli	a3,a5,1
	and	a3,a3,s5
	sub	a5,a5,a3
	srli	a3,a5,2
	and	a3,a3,s6
	and	a5,a5,s6
	add	a5,a3,a5
	srli	s8,a5,4
	add	s8,s8,a5
	and	s8,s8,s4
	srli	a5,s8,8
	add	s8,s8,a5
	srli	a5,s8,16
	add	s8,s8,a5
	srli	a5,s8,32
	add	s8,s8,a5
	andi	s8,s8,127
	subw	s8,s2,s8
	slli	s8,s8,48
	srli	s8,s8,48
	mv	a2,s8
	call	printf
	addiw	a3,s9,16
	addiw	a5,s11,48
	bgtu	s8,s1,.L13
	li	a4,31
	addiw	a3,s9,32
	addiw	a5,s11,32
	addiw	s9,s9,64
	bgtu	s8,a4,.L13
	slli	s9,s9,48
	srli	s9,s9,48
.L8:
	addiw	s7,s7,1
	addi	s10,s10,8
	bne	s7,s0,.L10
	lui	a0,%hi(.LC6)
	mv	a1,s9
	addi	a0,a0,%lo(.LC6)
	call	printf
	lui	a0,%hi(.LC7)
	mv	a1,s11
	addi	a0,a0,%lo(.LC7)
	call	printf
 #APP
# 9 "main.c" 1
	rdcycle a1
# 0 "" 2
 #NO_APP
	ld	a5,8(sp)
	lui	a0,%hi(.LC8)
	addi	a0,a0,%lo(.LC8)
	subw	a1,a1,a5
	call	printf
	ld	ra,152(sp)
	ld	s0,144(sp)
	ld	s1,136(sp)
	ld	s2,128(sp)
	ld	s3,120(sp)
	ld	s4,112(sp)
	ld	s5,104(sp)
	ld	s6,96(sp)
	ld	s7,88(sp)
	ld	s8,80(sp)
	ld	s9,72(sp)
	ld	s10,64(sp)
	ld	s11,56(sp)
	li	a0,0
	addi	sp,sp,160
	jr	ra
.L13:
	slli	s9,a3,48
	slli	s11,a5,48
	srli	s9,s9,48
	srli	s11,s11,48
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
