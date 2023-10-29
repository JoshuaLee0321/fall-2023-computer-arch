
.text
main:
    la s0, list
    add s1, x0, x0
    addi s2, x0, 12
.text
main:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	# lui	a5,%hi(.LC3)
	# ld	a5,%lo(.LC3)(a5)
	sd	a5,-24(s0)
	ld	a0,-24(s0)
	call	count_leading_zeros