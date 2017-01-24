#Edgar Ruiz
#CS 264
#July 8, 2015

.data
welcome:	
	.asciiz "Enter option number:
	1. Add two numbers
	2. Multiply four numbers
	3. Character frequency and reverse string
	4. Fibonacci sequence to a certain number
	5. Exit\n"

opt1: 
	.asciiz "Option 1: Adding two numbers\n"

opt2:
	.asciiz "Option 2: Multiplying four numbers\n"

opt3:
	.asciiz "Option 3: Counting characters and reversing string\n"

opt4:
	.asciiz "Option 4: Fibonacci sequence\n"

opt5:
	.asciiz "Option 5: Exiting Program\n"

num1:
	.asciiz "Enter the first number: "

num2:	
	.asciiz "Enter the second number: "

num3:
	.asciiz "Enter the third number: "

num4:
	.asciiz "Enter the fourth number: "

sum:
	.asciiz "The sum is: "

product:
	.asciiz "The product is: "

str:
	.asciiz "Enter a string: "

inputstr:
	.space 15

inputpassword:
	.space 12	

reversedstr:
	.asciiz  "Reversed string: "

charcount:
	.asciiz "Char count: "

fibp:
	.asciiz "Enter a number for fibonacci sequence: "

newline:
	.asciiz "\n"

error:
	.asciiz "Error, invalid input\n"

identity:
	.asciiz "edgarruiz"	

password:
	.asciiz "Davarpanah"	

secretquestion:
	.asciiz "Input 264?"

memall:
	.asciiz "The memory was allocated at address 0x30000000"

inheap:
	.asciiz "Identity in HEAP"

bta:
	.asciiz "Number of bytes to allocate?"		

.text

main:	addi $t1, $0, 1
	addi $t2, $0, 2
	addi $t3, $0, 3
	addi $t4, $0, 4
	addi $t5, $0, 5
	addi $t6, $0, 264
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
	beq $s0, $t6, tsf

err:	
	li $v0, 4
	la $a0, error
	syscall
	jr main

one:
	li $v0, 4
	la $a0, opt1
	syscall
	la $a0, num1
	syscall
	ori $v0, $0, 5
	syscall
	add $s1, $v0, $zero
	li $v0, 4 
	la $a0, num2
	syscall
	ori $v0, $0, 5 
	syscall
	add $s1, $s1, $v0
	li $v0, 4
	la $a0, sum 
	syscall
	li $v0, 1 
	add $a0, $s1, $zero
	syscall
	li $v0, 4
	la $a0, newline
	syscall 
	jr main
	
two:
	li $v0, 4
	la $a0, opt2
	syscall
	la $a0, num1
	syscall
	ori $v0, $0, 5
	syscall
	add $s1, $v0, $zero
	li $v0, 4 
	la $a0, num2
	syscall
	ori $v0, $0, 5 
	syscall
	mul $s1, $s1, $v0
	li $v0, 4 
	la $a0, num3
	syscall
	ori $v0, $0, 5 
	syscall
	mul $s1, $s1, $v0 
	li $v0, 4 
	la $a0, num4
	syscall
	ori $v0, $0, 5 
	syscall
	mul $s1, $s1, $v0
	li $v0, 4
	la $a0, product 
	syscall
	li $v0, 1 
	add $a0, $s1, $zero 
	syscall 
	li $v0, 4
	la $a0, newline
	syscall
	jr main

three:	
	li $v0, 4
	la $a0, opt3
	syscall
	la $a0, str
	syscall
	li $v0, 8
	la $a0, inputstr
	li $a1, 15
	syscall
	li $v0, 4
	la $a0, charcount
	syscall
	la $a0, newline
	syscall
	la $a0, reversedstr
	syscall
	li $t0, 0
	addi $sp, $sp -4
	sw $t0, ($sp)
	li $t1, 0

strreversal: 
	lb $t0, inputstr($t1)
	beqz $t0, strend		 
	addi $sp, $sp, -4
	sw $t0, ($sp)
	addi $t1, $t1, 1
	j strreversal		 

strend:	
	li $t1, 0

pop:		
	lw $t0, ($sp)
	addi $sp, $sp, 4
	beqz $t0, done
	sb $t0, inputstr($t1)
	addi $t1, $t1, 1
	j pop
	
done:
	li $v0, 4
	la $a0, inputstr	
	syscall
	la $a0, newline
	syscall
	jr main

four: 	
	li $v0, 4
	la $a0, opt4
	syscall 
     	la $a0, fibp
	syscall
	li $v0, 5
	syscall
	move $a0, $v0 
	jal fib
	move $a0, $v0
	j main

fib:        
	addi $sp, $sp, -12         
        sw $s0, 0($sp)          
        sw $s1, 4($sp)          
        sw $ra, 8($sp)          
        add $s0, $a0, $zero      
        addi $t0, $zero, 2      
        bge $a0, $t0, else
	j exit
              
else:    
	addi $a0, $s0, -1         
        jal fib                 
        addi $s1, $v0, 0          
        addi $a0, $s0, -2
        jal fib                
        add $v0, $s1, $v0      

exit:
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	addi $sp, $sp, 0xC
	jr $ra

five:	
	li $v0, 4
	la $a0, opt5
	syscall
	li $v0, 10
	syscall

tsf:	
	li $v0, 4
	la $a0, secretquestion
	syscall
	li $v0, 8
	la $a0, inputpassword
	syscall
	la $a1, password
	jal compare

compare: 
	add $t0, $a0, $zero
	add $t1, $a1, $zero 
	lb $t2($t0) 
	lb $t3($t1) 
	beqz $t2, checknext 
	seq $t4, $t3, $t2 
	beqz $t4, notmatch
	j heap 

notmatch: 
	j err

checknext: 	
	bnez $t4, notmatch 
	j err

continue:	
	addi $t1, $t1, 1
	addi $t2, $t2, 1
	j compare	 
				
heap:
	li $v0, 4
	la $a0, bta
	syscall
	li $v0, 5
	syscall
	addi $s4, $a0, 0
	li $v0, 4
	la $a0, memall
	syscall 
	la $a0, newline
	syscall
	la $a0, inheap
	syscall
	li $v0, 10
	syscall


