#please, insert inputs of both players in the first 2 lines in the keyboard

addi x11, x0, 0 #this reg will receive player1's points
addi x12, x0, 0 #this reg will receive player2's points
addi x8, x0, 16 #used to check if string has finished
addi x15, x0, 0 #used to compare char
addi x10, x0, 0 #used to store generic points of getPoints function
start:
	jal x1, getpoints #get points of p1
	add x11, x0, x10
	jal x1, showp1 #show points of p1
	addi x10, x0, 0
	jal x1, getpoints #get points of p2
	add x12, x0, x10
	jal x1, showp2 #show points of p2
	beq x11, x12, draw 
	blt x11, x12, p2win
	blt x12, x11, p1win
	halt 
getpoints:
	lb x5, 1025(x0) #obtain char from keyboard
	blt x5, x8, return
	jal x0, compare1
	
	

	



return:
	
	jalr x0, 0(x1)

compare1:
	addi x15, x0, 65
	beq x5, x15, add1
	addi x15, x0, 69
	beq x5, x15, add1
	addi x15, x0, 73
	beq x5, x15, add1
	addi x15, x0, 79
	beq x5, x15, add1
	addi x15, x0, 85
	beq x5, x15, add1
	
compare3:
	addi x15, x0, 68
	beq x5, x15, add3
	addi x15, x0, 71
	beq x5, x15, add3
	addi x15, x0, 84
	beq x5, x15, add3

compare5:
	addi x15, x0, 66
	beq x5, x15, add5
	addi x15, x0, 67
	beq x5, x15, add5
	addi x15, x0, 77
	beq x5, x15, add5
	addi x15, x0, 78
	beq x5, x15, add5
	addi x15, x0, 80
	beq x5, x15, add5

compare4:
	addi x15, x0, 70
	beq x5, x15, add4
	addi x15, x0, 72
	beq x5, x15, add4
	addi x15, x0, 86
	beq x5, x15, add4
	addi x15, x0, 87
	beq x5, x15, add4
	addi x15, x0, 89
	beq x5, x15, add4

compare2:
	addi x15, x0, 75
	beq x5, x15, add2
	addi x15, x0, 82
	beq x5, x15, add2
	addi x15, x0, 83
	beq x5, x15, add2

compare6:
	addi x15, x0, 74
	beq x5, x15, add6
	addi x15, x0, 76
	beq x5, x15, add6
	addi x15, x0, 88
	beq x5, x15, add6

compare9:
	addi x15, x0, 81
	beq x5, x15, add9
	addi x15, x0, 90
	beq x5, x15, add9

add1:
	addi x10, x10, 1
	jal x0, getpoints
add3:
	addi x10, x10, 3
	jal x0, getpoints
add5:
	addi x10, x10, 5
	jal x0, getpoints
add4:
	addi x10, x10, 4
	jal x0, getpoints
add2:
	addi x10, x10, 2
	jal x0, getpoints
add6:
	addi x10, x10, 6
	jal x0, getpoints
add9:
	addi x10, x10, 9
	jal x0, getpoints


showp1:
	add x5, x0, x11
	jal x2, getdez
	addi x6, x6, 48
	addi x7, x7, 48
	addi x15, x0, 80
	sb x15, 1024(x0)
	addi x15, x0, 49
	sb x15, 1024(x0)
	addi x15, x0, 58
	sb x15, 1024(x0)
	addi x15, x0, 32
	sb x15, 1024(x0)
	sb x6, 1024(x0)
	sb x7, 1024(x0)
	addi x15, x0, 10
	sb x15, 1024(x0)
	addi x6, x0, 0
	addi x7, x0, 0
	jalr x0, 0(x1)

showp2:
	add x5, x0, x12
	jal x2, getdez
	addi x6, x6, 48
	addi x7, x7, 48
	addi x15, x0, 80
	sb x15, 1024(x0)
	addi x15, x0, 50
	sb x15, 1024(x0)
	addi x15, x0, 58
	sb x15, 1024(x0)
	addi x15, x0, 32
	sb x15, 1024(x0)
	sb x6, 1024(x0)
	sb x7, 1024(x0)
	addi x15, x0, 10
	sb x15, 1024(x0)
	addi x6, x0, 0
	addi x7, x0, 0
	jalr x0, 0(x1)
	jalr x0, 0(x1)
draw:
	
	

	addi x15, x0, 68
	sb x15, 1024(x0)
	addi x15, x0, 82
	sb x15, 1024(x0)
	addi x15, x0, 65
	sb x15, 1024(x0)
	addi x15, x0, 87
	sb x15, 1024(x0)
	 
	halt 

p2win:
	addi x15, x0, 80
	sb x15, 1024(x0)
	addi x15, x0, 50
	sb x15, 1024(x0)
	addi x15, x0, 32
	sb x15, 1024(x0)
	addi x15, x0, 87
	sb x15, 1024(x0)
	addi x15, x0, 73
	sb x15, 1024(x0)
	addi x15, x0, 78
	sb x15, 1024(x0)
	addi x15, x0, 83
	sb x15, 1024(x0)
	addi x15, x0, 10
	sb x15, 1024(x0)
	halt 

p1win:
	addi x15, x0, 80
	sb x15, 1024(x0)
	addi x15, x0, 49
	sb x15, 1024(x0)
	addi x15, x0, 32
	sb x15, 1024(x0)
	addi x15, x0, 87
	sb x15, 1024(x0)
	addi x15, x0, 73
	sb x15, 1024(x0)
	addi x15, x0, 78
	sb x15, 1024(x0)
	addi x15, x0, 83
	sb x15, 1024(x0)
	addi x15, x0, 10
	sb x15, 1024(x0)
	halt

getdez:
	addi x5, x5, -10
	blt x5, x0, getun
	addi x6, x6, 1
	jal x0, getdez
getun:
	addi x5, x5, 10
	add x7, x7, x5
	jalr x0, 0(x2)
