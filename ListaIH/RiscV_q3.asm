addi x10, x0, 0 #counter of consonants
addi x8, x0, 16 #used to check if string has finished
addi x15, x0, 0 #used to compare letter's ascii value
addi x11, x0, 0 
getstring:
	lb x5, 1025(x0)
	#checking if string has finished
	blt x5, x8, getdez
	#checking lowercase vowals
	addi x15, x0, 97 #letter A
	beq x5, x15, getstring
	addi x15, x0, 101 #letter E
	beq x5, x15, getstring
	addi x15, x0, 105 #letter I
	beq x5, x15, getstring
	addi x15, x0, 111 #letter O
	beq x5, x15, getstring
	addi x15, x0, 117 #letter U
	beq x5, x15, getstring
	#checking uppercase vowals
	addi x15, x0, 65 #letter A
	beq x5, x15, getstring
	addi x15, x0, 69 #letter E
	beq x5, x15, getstring
	addi x15, x0, 73 #letter I
	beq x5, x15, getstring
	addi x15, x0, 79 #letter O
	beq x5, x15, getstring
	addi x15, x0, 85 #letter U
	beq x5, x15, getstring
	addi x10, x10, 1
	jal x0, getstring

getdez:
	addi x10, x10, -10
	blt x10, x0, getun
	addi x11, x11, 1
	jal x0, getdez
getun:
	addi x10, x10, 10
	add x12, x0, x10
	jal x0, end
end:
	addi x11, x11, 48
	addi x12, x12, 48
	sb x11, 1024(x0)
	sb x12, 1024(x0)
	halt 

	
	
