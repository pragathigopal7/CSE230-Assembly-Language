###########################################################
# Assignment #: 5
#  Name: Pragathi Gopal
#  ASU email: pgopal4@gmail.com
#  Course: CSE/EEE230, T/TH 3:00pm
#  Description: This program allows the user to enter one integer and it filters all the integers
#				in the array that are less than, greater than, or equal to the integer entered.
###########################################################
#data declartaions for the variable names, helps with storage allocation.data:
.data

	numbers_len:         .word     12 #given from the assignment
	numbers:             .word     -42, 11, 24, 3, -6, 14, -18, 45, 12, -27, 35, -28 #given from the assignment

	message1: .asciiz "Enter an integer:\n" #Prints out the message for the user to enter the integers
	createsNewLine: .asciiz "\n" # creates a newline for numbers that will be displayed 

.text
.globl main

#the program begins execution at main()
main:

	#Prints out the first message
	li $v0, 4
	la $a0, message1
	syscall

	#allows the user to input the integer
	li $v0, 5
	syscall
	move $t0, $v0

	#loads the values into $a0 and $a1 and initializes $t1 and $t2
	lw $a0, numbers_len 
	la $a1, numbers 
	li $t1, 0
	li $t2, 0

	#creates a loops to re-arrange the values in the array 
	rearrange:
	beq $t1, $a0, finalArray #compares the values in the registers 
	lw $t3, 0($a1) #loads the value into the register
	blt $t3, $t0, flip #checks if the array value is less than the integer entered
	addi $t1, $t1, 1 #moves to the next array element
	addi $a1, $a1, 4
	j rearrange
	
	#swaps the values in the array
	flip:
	add $t5, $t2, $t2 #gets the index of the array
	add $t5, $t5, $t5
	la $t4, numbers #loads in the base address of the array
	add $t6, $t4, $t5
	lw $t7, 0($t6)
	sw $t3, 0($t6) #inserts the element that is located in $t3
	li $t5, 0 #temporary registers used to initialize the values 
	li $t6, 0
	add $t5, $t1, $t1 #finds the index
	add $t5, $t5, $t5
	add $t6, $t4, $t5 #finds the address 
	sw $t7, 0($t6) #stores the element of the array
	addi $t1, $t1,1 #increments the register
	addi $t2, $t2, 1 #increments the register
	addi $a1, $a1, 4 #moves to the next element 
	j rearrange

	#prints the final array
	finalArray:
	la $a1, numbers #loads the base address of the array
	lw $t0, numbers_len #numver of elements loaded
	li $t1, 0 #initialized $t1 to 0

	loop2:
	beq $t1, $t0, exit #compares the values and exits if the values are equal
	lw $a0, 0($a1) #loads the current array element
	li $v0,1 #prints the array 
	syscall

	#prints each value on a new line
	la $a0, createsNewLine
	li $v0, 4 #prints the value 
	syscall
	addi $a1, $a1, 4 #moves to the next array element
	addi $t1, $t1, 1
	j loop2

	#ends the program
	exit:
	li $v0, 10
	syscall