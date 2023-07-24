#seven segment display:
#a = 8, b = 9, c = 10, d = 11, e = 12, f = 13, g = 2
# for each new input, please reset the code
# the code might have a minor delay(around 700 events)
addi x11, x0, -1 # contador
addi x16, x0, 16 # verificacao
addi x21, x0, 32 # verificacao 2(space)
addi x2, x0, 0 # stack pointer
addi x18, x0, 0 # multiplier
addi x1, x0, 0 # return address



input2:
lb x10, 1025(x0) # load do buffer
blt x10, x16, input2_end # verificacao
beq x10, x21, input2_end # verificacao2
addi x10, x10, -48 # char to num
addi x2, x2, -8
addi x11, x11, 1
sb x10, 0(x2)
beq x0, x0, input2



input2_end:
jal x1, stoi
beq x0, x0, main

main:
	addi x20, x0, 0
	addi x21, x0, 1
	addi x22, x0, 10
	addi x23, x0, 11
	addi x24, x0, 100
	addi x25, x0, 101
	addi x26, x0, 110
	addi x27, x0, 111
	addi x28, x0, 1000
	addi x29, x0, 1001
	addi x30, x0, 1111
	beq x15, x0, show0
	beq x15, x21, show1
	beq x15, x22, show2
	beq x15, x23, show3
	beq x15, x24, show4
	beq x15, x25, show5
	beq x15, x26, show6
	beq x15, x27, show7
	beq x15, x28, show8
	beq x15, x29, show9
	beq x15, x30, reset
	
	beq x0, x0, fim

mult: 
	add x20, x0, x0 # product

	mult_prin:
	addi x5, x0, 1 # usado no and
	and x5, x18, x5 # and entre e o mult
	beq x5, x0, nop # vai pro no operation

	add x20, x20, x19
	srli x18, x18, 1 # sr o multiplier
	slli x19, x19, 1 # sl o  multiplicand


	beq x18, x0, fim_mult
	beq x0, x0, mult_prin


	nop:
	srli x18, x18, 1 # sr o multiplier
	slli x19, x19, 1 # sl o  multiplicand
	beq x18, x0, fim_mult
	beq x0, x0, mult_prin

	fim_mult:
  	jalr x0, 0(x1)


stoi:
	addi x15, x0, 0 # res. integer
	addi x17, x0, 1 # 1, 10...

	stoi_loop:
	lb x10, 0(x2) # loads a number
	addi x2, x2, 8 # pop stack
	addi x11, x11, -1 # decrease count
	
	addi x19, x10, 0 # number as parameter
	addi x18, x17, 0 # passing parame
	addi x2, x2, -8
	sw x1, 0(x2)
	jal x1, mult
	lw x1, 0(x2)
	addi x2, x2, 8
	add x15, x20, x15 # saves product
	blt x11, x0, stoi_end
	addi x18, x0, 10 # passing parame
	addi x19, x17, 0 # x18 times 10
	addi x2, x2, -8
	sw x1, 0(x2)
	jal x1, mult
	lw x1, 0(x2)
	addi x2, x2, 8
	addi x17, x20, 0 # x18 = x18 * 10

	blt x11, x0, stoi_end
	beq x0, x0, stoi_loop

	stoi_end:
	jalr x0, 0(x1) 


show0:
	lw x10, num0
	sw x10, 1027(x0)
	sw x0, 1029(x0)
	beq x0, x0, fim

show1:
	lw x10, num1
	sw x10, 1027(x0)
	sw x0, 1029(x0)
	beq x0, x0, fim

show2:
	lw x10, num2
	sw x10, 1027(x0)
	lw x10, turnGon
	sw x10, 1029(x0)
	beq x0, x0, fim

show3:
	lw x10, num3
	sw x10, 1027(x0)
	lw x10, turnGon
	sw x10, 1029(x0)
	beq x0, x0, fim

show4:
	lw x10, num4
	sw x10, 1027(x0)
	lw x10, turnGon
	sw x10, 1029(x0)
	beq x0, x0, fim
	
show5:
	lw x10, num5
	sw x10, 1027(x0)
	lw x10, turnGon
	sw x10, 1029(x0)
	beq x0, x0, fim

show6:
	lw x10, num6
	sw x10, 1027(x0)
	lw x10, turnGon
	sw x10, 1029(x0)
	beq x0, x0, fim

show7:
	lw x10, num7
	sw x10, 1027(x0)
	sw x0, 1029(x0)
	beq x0, x0, fim

show8:
	lw x10, num8
	sw x10, 1027(x0)
	lw x10, turnGon
	sw x10, 1029(x0)
	beq x0, x0, fim

show9:
	lw x10, num9
	sw x10, 1027(x0)
	lw x10, turnGon
	sw x10, 1029(x0)
	beq x0, x0, fim

reset:
	lw x10, reset_num
	sw x10, 1027(x0)
	sw x10, 1029(x0)
	beq x0, x0, fim
	



fim:
	halt

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
reset_num: .byte 0
