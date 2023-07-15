# A, B and C has to be in a range between 0 and 99
addi x7, x0, 48 #used to obtain int number from character
addi x8, x0, 15 #used to check if the number has finished
addi x2, x0, 0
addi x9, x0, 2 #comparator with flag 


addi x6, x0, -1 #flag that indicates the number of digits
start:
	jal x1, getnum
	add x15, x15, x5 #x15 will recieve number A
	jal x1, getnum
	add x16, x16, x5 #x16 will recieve number B
	jal x1, getnum
	add x17, x17, x5 #x17 will recieve number C
	addi x5, x0, 62 #x5 will now recieve 62
	addi x6, x0, 15 #x6 will now recieve 15
	addi x14, x0, 0 #x14 will recieve value of x
	blt x15, x0, end
	blt x5, x16 , end
	bge x6, x17, end
	addi x14, x14, 1
	addi x14, x14, 48
	sb x14, 1024(x0)
	halt
	




	halt  
#put the number's digits in stack
getnum:
	lb x5, 1025(x0) #obtain number from keyboard
	sub x5, x5, x7 #obtain int number 
	addi x2, x2, -8# decrease stack pointer
	sb x5, 0(x2) #put number in stack
	add x5, x5, x7 #get char value again
	addi x6, x6, 1
	bge x5, x8, getnum


	
savenum:
	addi x2, x2, 8
	lb x10, 0(x2) #load un in x10
	addi x2, x2, 8
	lb x11, 0(x2) #load dez in
	addi x5, x0, 0
	addi x2, x0, 0
	addi x6, x0, -1
	add x5, x5, x10
	addi x11, x11, -1
	beq x6, x9, savedez

savedez:
	addi x5, x5, 10
	addi x11, x11, -1
	bge x11, x0, savedez
	jalr x0, 0(x1)

end:
	addi x14, x14, 48
	sb x14, 1024(x0)
	
	halt
