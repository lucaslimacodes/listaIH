start:
    sw x0, x
    lw x5, a
    lw x6, b
    lw x7, c
    addi x10, x0, 62
    addi x11, x0, 15
    addi x12, x0, 1
    bge x5, x0, comp1
    halt 

comp1:
    bge x10, x6, comp2
    halt

comp2:
    blt x11, x7, change
    halt

change:
    sw x12, x
	lw x13, x #gets the value of X
    halt

a: .word 1
b: .word 2
c: .word 16
x: .word 4
