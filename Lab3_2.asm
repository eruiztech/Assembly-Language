#Edgar Ruiz
#CS 264
#July 20, 2015

.data

welcome:
	.asciiz "Welcome to the car crash alert program\n"

opta: 
	.asciiz "car acel\n"

optb: 
	.asciiz "car brak\n"

optc:
	.asciiz "car crash\n"

airBagOne:
	.asciiz "Airbag no deploy\n"

airBagTwo:
	.asciiz "Airbags deployed\n"

airBagThree:
	.asciiz "Airbags deploy Ambulance no alert\n"

airBagFour:
	.asciiz "Airbags deploy Ambulance alerted!\n"

speed:
	.word 0

.text
main:	la $a0, welcome
		li $v0, 4
		syscall
		addi $t2, $zero, 65 #ASCII value for A
		addi $t3, $zero, 66 #ASCII value for B
		addi $t4, $zero, 67 #ASCII value for C
		addi $t5, $zero, 83 #ASCII value for S
		addi $s0, $zero, 15 #speed 15
		addi $s1, $zero, 45 #speed 45
		li $v0, 12
		syscall
		add $s2, $zero, $v0
		beq $s2, $t2, opt1
		beq $s2, $t3, opt2
		beq $s2, $t4, opt3
		beq $s2, $t5, opt4

poll:	li $t0, 0xFFFF0000
		andi $t0, $t0, 1
		beqz $t0, poll
		li $t1, 0xFFFF0004
		andi $t1, $t1, 0xFF

mon:	li $t0, 0xFFFF0008
		andi $t0, $t0, 1
		beqz $t0, mon
		sw $t1, 0xFFFF000C
		j poll

opt1:	la $a0, opta
		li $v0, 4
		syscall
		j main

opt2:	la $a0, optb
		li $v0, 4
		syscall
		j main

opt3:	la $a0, optc
		li $v0, 4
		syscall
		la $t6, speed
		ble $t6, $s0, opt3a #equal to or below 15 mph
		bgt $t6, $s0, opt3b #above 15 mph
		j main

opt3a:  la $a0, optc1
		li $v0, 4
		syscall
		j main

opt3b:  blt $t6, $s1, opt3b2 #below 45 mph
		bge $t6, $s1, opt3c #equal to or above 45 mph
		j main

opt3b2: la $a0, optc2
		li $v0, 4
		syscall
		j main




