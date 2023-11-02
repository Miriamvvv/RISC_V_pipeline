main:
	lui t0, 0x10010
	addi t1,t1,1
	
	sw t1, 0(t0)
	lw t2, 0(t0)
	
	beq t1,t2,beq_test
	addi zero,zero, 0
	
beq_test:
	bne t1,zero, jal_test
	addi zero,zero,0
	
jal_test:
	lui t2, 0x00400
	jalr t1,t2,0x2c
	addi zero,zero,0

end:
	add zero,zero,zero
	