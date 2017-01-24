#Edgar Ruiz
#CS 264
#July 20, 2015

.data
welcome:	
	.asciiz "Enter a number to pick your selection:
	1. Area of a circle
	2. Circumference of a circle.
	3. Area of a rectangle.
	4. Perimeter of a rectangle.
	5. Exit\n"

opt1:
	.asciiz "Enter radius of the circle: "

opt2:	
	.asciiz "Enter length of the rectangle: "

opt3:
	.asciiz "Enter width of the rectangle: "

opt4:
	.asciiz "Area of the circle is: "

opt5:
	.asciiz "Circumference of the circle is: "

opt6:
	.asciiz "Area of the rectangle is: "

opt7:
	.asciiz "Perimeter of the rectangle is: "

space:
	.asciiz "\n\n"

pi: .float 3.1415926535897924

twoCal: .float 2.0

twoRec: .double 2.0

zero: .double 0.0
	

.text

main:	addi $t1, $0, 1
		addi $t2, $0, 2
		addi $t3, $0, 3
		addi $t4, $0, 4
		addi $t5, $0, 5
		li $v0, 4	
		lui $a0, 0x1001
		syscall
		li $v0, 5 
		syscall
		add $s0, $0, $v0 
		beq $s0, $t1, one
		beq $s0, $t2, two
		beq $s0, $t3, three
		beq $s0, $t4, four
		beq $s0, $t5, five
		j main

one:	li $v0, 4
		la $a0, opt1
		syscall
		li $v0, 6
		syscall 
		mul.s $f20, $f0, $f0 
		l.s $f22, pi 
		mul.s $f12, $f20, $f22 
		la $a0, opt4
		li $v0, 4
		syscall
		li $v0, 2
		syscall
		la $a0, space
		li $v0, 4
		syscall
		j main

two:    li $v0, 4
		la $a0, opt1
		syscall
		li $v0, 6
		syscall 
		l.s $f4, twoCal
		mul.s $f20, $f0, $f4 
		l.s $f22, pi
		mul.s $f12, $f20, $f22 
		la $a0, opt5
		li $v0, 4
		syscall
		li $v0, 2
		syscall
		la $a0, space
		li $v0, 4
		syscall
		j main

three:  li $v0, 4
		la $a0, opt2 
		syscall
		li $v0, 7
		syscall 
		l.d $f20, zero
		add.d $f22, $f20, $f0 
		li $v0, 4
		la $a0, opt3 
		syscall
		li $v0, 7
		syscall 
		mul.d $f12, $f22, $f0 
		la $a0, opt6
		li $v0, 4
		syscall
		li $v0, 3
		syscall
		la $a0, space
		li $v0, 4
		syscall
		j main

four:   li $v0, 4
		la $a0, opt2 
		syscall
		li $v0, 7
		syscall 
		l.d $f20, twoRec
		mul.d $f22, $f0, $f20 
		li $v0, 4
		la $a0, opt3 
		syscall
		li $v0, 7
		syscall 
		mul.d $f24, $f0, $f20 
		add.d $f12, $f24, $f22 
		la $a0, opt7
		li $v0, 4
		syscall
		li $v0, 3
		syscall
		la $a0, space
		li $v0, 4
		syscall
		j main		

five:   li $v0, 10
		syscall




