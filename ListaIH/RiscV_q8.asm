#seven segment display:
#a = 8, b = 9, c = 10, d = 11, e = 12, f = 13, g = 2
addi x11, x0, 1
addi x12, x0, 2
addi x13, x0, 3
addi x14, x0, 4
addi x15, x0, 5
addi x16, x0, 6
addi x17, x0, 7
addi x18, x0, 8
addi x19, x0, 9
loop:
	
	lb x10, 1025(x0)
	addi x10, x10, -48
	beq x10, x0, show0
	beq x10, x11, show1
	beq x10, x12, show2
	beq x10, x13, show3
	beq x10, x14, show4
	beq x10, x15, show5
	beq x10, x16, show6
	beq x10, x17, show7
	beq x10, x18, show8
	beq x10, x19, show9
	jal x0, loop

show0:
	lw x10, num0
	sw x10, 1027(x0)
	sw x0, 1029(x0)
	jal x0, loop

show1:
	lw x10, num1
	sw x10, 1027(x0)
	sw x0, 1029(x0)
	jal x0, loop

show2:
	lw x10, num2
	sw x10, 1027(x0)
	lw x10, turnGon
	sw x10, 1029(x0)
	jal x0, loop

show3:
	lw x10, num3
	sw x10, 1027(x0)
	lw x10, turnGon
	sw x10, 1029(x0)
	jal x0, loop

show4:
	lw x10, num4
	sw x10, 1027(x0)
	lw x10, turnGon
	sw x10, 1029(x0)
	jal x0, loop
	
show5:
	lw x10, num5
	sw x10, 1027(x0)
	lw x10, turnGon
	sw x10, 1029(x0)
	jal x0, loop

show6:
	lw x10, num6
	sw x10, 1027(x0)
	lw x10, turnGon
	sw x10, 1029(x0)
	jal x0, loop

show7:
	lw x10, num7
	sw x10, 1027(x0)
	sw x0, 1029(x0)
	jal x0, loop

show8:
	lw x10, num8
	sw x10, 1027(x0)
	lw x10, turnGon
	sw x10, 1029(x0)
	jal x0, loop

show9:
	lw x10, num9
	sw x10, 1027(x0)
	lw x10, turnGon
	sw x10, 1029(x0)
	jal x0, loop

reset:
	lw x10, reset
	sw x10, 1027(x0)
	sw x10, 1029(x0)
	jal x0, loop

num0: .byte b11111111
num1: .byte b00000110
num2: .byte b00011011 
num3: .byte b00001111
num4: .byte b00100110
num5: .byte b00101101
num6: .byte b00111101
num7: .byte b00000111
num8: .byte b00111111
num9: .byte b00101111
turnGon: .byte 1
reset: .byte 0


