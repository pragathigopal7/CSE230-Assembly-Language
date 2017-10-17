###########################################################
# Assignment #: 7
#  Name: Pragathi Gopal
#  ASU email: pgopal4@gmail.com
#  Course: CSE/EEE230, T/TH 3:00pm
#  Description: This program asks a user to enter an integer for n and calls the 
#				function1 by passing the n value, then prints the result.
###########################################################
#data declartaions for the variable names, helps with storage allocation.data:.data
.data 
	message1: .asciiz "Enter an integer: \n"
	message2: .asciiz "The solution is: \n"
	test: .asciiz "\n"

.text
.globl main 

############################################################################
# Procedure main
# Description: The main calls function1 by entering an integer given by a user
# parameters: $a0 = address of array 
# return value: $v0 = integer entered
# registers to be used: $s1
############################################################################
#the program begins execution at main()
main:

	#Prints out the first message
	li $v0, 4
	la $a0, message1
	syscall

	#allows the user to input the integer
	li $v0, 5
	syscall
	move $a0, $v0

	#stores registers $sp and $ra 
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	#creates a jump and link function to the loop
	jal function1

	#loads register ra value	
	lw $ra, 0($sp)
	addi $sp, $sp, 4

	#save function1 return value
	move $s1, $v0

	#Displays the output of the program
	li $v0, 4
	la $a0, message2
	syscall

	#prints the answer
	move $a0, $s1
	li $v0, 1
	syscall


	############################################################################
	# Procedure function1
	# Description: The function1 is a recursive procedure defined by function1(n) = 2*n if n <=4
	# parameters: $a0 = input from the user, $ra = stack pointer space, $v0 = integer inputed by user 
	# return value: $v0
	# registers to be used: $t3,$t4, $s2
	############################################################################
	function1:

	slti $t0, $a0, 5 #if ($a0 <= 4)
	beq $t0, $zero, loop

	sll $v0, $a0, 1
	j exit

	loop:
	
	addi $sp, $sp, -12#stack pointer that makes moves down through the data
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	
	addi $a0, $a0, -2 
	
	jal function1

	lw $ra, 0($sp)
	lw $a0, 4($sp)
	addi $sp, $sp, 12

	mult $a0, $v0 #multiplies it by n
	mflo $v0

	addi $sp, $sp, -12 #stack pointer that makes moves down through the data
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	sw $v0, 8($sp)

	addi $a0, $a0, -3 #function1 ($a0 - 3)
	jal function1

	lw $ra, 0($sp) 
	lw $a0, 4($sp)
	
	move $t1, $v0 #places the value in the temp register
	
	lw $v0, 8($sp)
	addi $sp, $sp, 12

	add $v0, $t1, $v0
	add $v0, $v0, $a0 #n * function1(n-2) + function1(n-3) + n 

	exit:
	jr $ra