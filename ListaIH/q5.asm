# Para o input, separe os dois inteiros com um espaço na mesma linha
# Exemplo: 123 456
# Para cada novo input, reset o código
# Favor, colocar um clock mais alto. O código pode demorar cerca de 800 eventos para terminar

addi x11, x0, -1 # contador
addi x16, x0, 16 # verificacao
addi x21, x0, 32 # verificacao 2(space)
addi x2, x0, 0 # stack pointer
addi x18, x0, 0 # multiplier
addi x1, x0, 0 # return address


input1:
lb x10, 1025(x0) # load do buffer
blt x10, x16, input1_end # verificacao
beq x10, x21, input1_end # verificacao2
addi x10, x10, -48 # char to num
addi x2, x2, -8
addi x11, x11, 1
sb x10, 0(x2)
beq x0, x0, input1

input1_end:
jal x1, stoi
addi x14, x15, 0 # saves inp 1 in x14
addi x11, x0, -1 # reset counter
beq x0, x0, input2

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
	addi x18, x14, 0 # mov inp 1
	addi x19, x15, 0 # mov inp 2
	jal x1, mult
	addi x15, x20, 0 # mov prod to x15
	addi x19, x15, 0
	jal x1, int_to_string
	jal x1, print_num
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

print_num:
lb x10, 0(x2)
addi x2, x2, 8
addi x21, x21, -1
sb x10, 1024(x0)
bge x21, x0, print_num
jalr x0, 0(x1)


int_to_string:
addi x21, x0, -1 # init counter

its_loop:
addi x18, x0, 10 #divisor to 10
blt x19, x18, end_its
addi x2, x2, -8
sw x1, 0(x2)
jal x1, div
lw x1, 0(x2)
addi x2, x2, 8

addi x19, x19, 48 # num to char
addi x21, x21, 1 # inc counter
addi x2, x2, -8 
sb x19, 0(x2)
addi x19, x20, 0 # quotient to dividend
beq x0, x0, its_loop

end_its:
addi x19, x19, 48 # num to char
addi x21, x21, 1 # inc counter
addi x2, x2, -8 # inc sp
sb x19, 0(x2) # stores char
jalr x0, 0(x1)





div:
addi x20, x0, 0 # set quocient 0
addi x17, x18, 0 # save divisor val
blt x19, x18, end_div # if divisor > divid

div_init:
slli x18, x18, 1 # sl divisor 
blt x18, x19, div_init
beq x18, x19, div_init
srli x18, x18, 1 # undo

dividing:
blt x18, x17, end_div
blt x19, x18, nop_div # if divisor > dividend
sub x19, x19, x18 # if divisor < dividend
slli x20, x20, 1
addi x20, x20, 1 # like concat 1
srli x18, x18, 1 # sr divisor
beq x0, x0, dividing

nop_div:
srli x18, x18, 1 # sr divisor
slli x20, x20, 1 # concat quocient 0
beq x0, x0, dividing

end_div:
	jalr x0, 0(x1)	
	



fim:
	halt
