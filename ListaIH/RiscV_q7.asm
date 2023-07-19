#each led change has a minor delay 
#temperature sensor has to be on A0
#Left red: 3 
#Right red: 9
#Left yellow: 5
#Right yellow: 10
#Left green: 6
#Right green: 11
lb x10, 0(x0)
sb x10, 1030(x0)
addi x3, x0, 307
addi x4, x0, 410
addi x5, x0, 512
addi x6, x0, 614
addi x7, x0, 717
addi x15, x0, 250
addi x16, x0, 1
addi x17, x0, 1
addi x18, x0, 1
addi x19, x0, 1
addi x20, x0, 1
addi x21, x0, 1

loop:
	
	lh x10, 1031(x0)
	blt x10, x3, case1
	blt x10, x4, case2
	blt x10, x5, case3
	blt x10, x6, case4
	blt x10, x7, case5
	jal x0, case6  
	

case1:
	beq x16, x0, loop 
	addi x11, x0, 3
	
	sb x0, 1033(x0)
	sb x0, 1034(x0)
	sb x11, 1033(x0)
	sb x15, 1034(x0)
	addi x16, x0, 0
	addi x17, x0, 1
	addi x18, x0, 1
	addi x19, x0, 1
	addi x20, x0, 1
	addi x21, x0, 1
	jal x0, loop

case2:
	beq x17, x0, loop
	addi x11, x0, 5
	
	sb x0, 1033(x0)
	sb x0, 1034(x0)
	sb x11, 1033(x0)
	sb x15, 1034(x0)
	addi x16, x0, 1
	addi x17, x0, 0
	addi x18, x0, 1
	addi x19, x0, 1
	addi x20, x0, 1
	addi x21, x0, 1
	jal x0, loop

case3:
	beq x20, x0, loop
	addi x11, x0, 10
	
	sb x0, 1033(x0)
	sb x0, 1034(x0)
	sb x11, 1033(x0)
	sb x15, 1034(x0)
	addi x16, x0, 1
	addi x17, x0, 1
	addi x18, x0, 1
	addi x19, x0, 1
	addi x20, x0, 0
	addi x21, x0, 1
	jal x0, loop

case4:
	beq x18, x0, loop
	addi x11, x0, 6
	
	sb x0, 1033(x0)
	sb x0, 1034(x0)
	sb x11, 1033(x0)
	sb x15, 1034(x0)
	addi x16, x0, 1
	addi x17, x0, 1
	addi x18, x0, 0
	addi x19, x0, 1
	addi x20, x0, 1
	addi x21, x0, 1
	jal x0, loop

case5:
	beq x21, x0, loop
	addi x11, x0, 11
	
	sb x0, 1033(x0)
	sb x0, 1034(x0)
	sb x11, 1033(x0)
	sb x15, 1034(x0)
	addi x16, x0, 1
	addi x17, x0, 1
	addi x18, x0, 1
	addi x19, x0, 1
	addi x20, x0, 1
	addi x21, x0, 0
	jal x0, loop

case6:
	beq x19, x0, loop
	addi x11, x0, 9
	
	sb x0, 1033(x0)
	sb x0, 1034(x0) 
	sb x11, 1033(x0)
	sb x15, 1034(x0)
	addi x16, x0, 1
	addi x17, x0, 1
	addi x18, x0, 1
	addi x19, x0, 0
	addi x20, x0, 1
	addi x21, x0, 1
	jal x0, loop
	

