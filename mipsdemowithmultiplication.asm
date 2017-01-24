
# declare global so programmer can see actual addresses.
.globl welcome
.globl prompt
.globl sumText

#  Data Area
.data

# Question 1 What are welcome: prompt: and sumText: classified as in MIPS assembly language?
welcome:
	.asciiz " This program multiplies two numbers \n\n" # QUESTION 2 How many characters are located in the quotations? what is this value in hex?

prompt:
	.asciiz " Enter an integer: "	# QUESTION 3 How many characters are located in the quotations? what is this value in hex?

sumText: 
	.asciiz " \n Product = "		# QUESTION 4 How many characters are located in quotations? what is this value in hex?

#Text Area (i.e. instructions)
.text

main:
#Question 5 How does syscall work in this example below?  
#Hint open SPIM.PDF go to pg 8 read section 1.5 and look at table 1
#Hint Look at $v0 and $a0 when you are stepping through the program and the instructions are executed
	ori     $v0, $0, 4			
	lui     $a0, 0x1001	#hint look at Appendix B-57 and look at the data tab in QTSPIM and scroll all the way to the top
	ori     $a0, $a0,0
	syscall

#Question 6 How does syscall work in this example below?  
#Hint open SPIM.PDF go to pg 8 read section 1.5 and look at table 1
#Hint Look at $v0 and $a0 when you are stepping through the program and the instructions are executed
	ori     $v0, $0, 4			
	lui     $a0, 0x1001
	ori     $a0, $a0,0x29
	syscall
#Question 7 How does syscall work in this example below?  
#Hint open SPIM.PDF go to pg 8 read section 1.5 and look at table 1
#Hint Look at $v0 and $a0 when you are stepping through the program and the instructions are executed
	# Read 1st integer
	ori     $v0, $0, 5
	syscall

#Question 8 What does the following instruction do? Is there a way we could eliminate this instruction?
#Hint look at the addu instruction and use the register table on pg 121 in your book to see if we can eliminate using the ori instruction below to optimize.
	# Clear $s0 for the sum
	ori     $s0, $0, 0
	addi	$s0, $0, 1	

	# Multiply 1st integer to sum 
	mul    $s0, $v0, $s0
	
	# Display prompt
	ori     $v0, $0, 4			
	lui     $a0, 0x1001
	ori     $a0, $a0,0x29
	syscall

	# Read 2nd integer 
	ori	$v0, $0, 5			
	syscall
	# $v0 now has the value of the second integer
	
	# Multiply 2nd integer to sum
	mul    $s0, $v0, $s0 

	# Display the sum text
	ori     $v0, $0, 4			
	lui     $a0, 0x1001
	ori     $a0, $a0,0x3F
	syscall

#Question 9 How does syscall work in this example below?  
#Hint open SPIM.PDF go to pg 8 read section 1.5 and look at table 1
#Hint Look at $v0 and $a0 when you are stepping through the program and the instructions are executed	
	# Display the sum
	ori     $v0, $0, 1			
	add 	$a0, $s0, $0	 
	syscall
	
#Question 10 How does syscall work in this example below?  
#Hint open SPIM.PDF go to pg 8 read section 1.5 and look at table 1
#Hint Look at $v0 and $a0 when you are stepping through the program and the instructions are executed
	# Exit
	ori     $v0, $0, 10
	syscall
