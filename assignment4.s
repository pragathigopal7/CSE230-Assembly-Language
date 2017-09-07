###########################################################
# Assignment #: 4
#  Name: Pragathi Gopal
#  ASU email: pgopal4@gmail.com
#  Course: CSE/EEE230, T/TH 3:00pm
#  Description: This program performs decisions using branch instructions in order to
#				calculate the cost of an electricity bill with the use of electiricity meter readings.
###########################################################
#data declartaions for the variable names, helps with storage allocation.data:
.data
	current_Meter: .word 4
	previous_Meter: .word 4
	month: .word 4
	payment: .word 4
	usedKWH: .word 4

	#print statements
	message1: .asciiz "Please enter the current electricity meter reading: \n" 
	message2: .asciiz "Please enter the previous electricity meter reading: \n"
	message3: .asciiz "Please enter a month to compute their electricity bill,\nUse an integer between 1 and 12 (1 for January,etc.): \n"
	message4: .asciiz "There is no bill to pay.\n"
	message5: .asciiz "Your total payment for this month: "
	message6: .asciiz " dollar(s) for "
	message7: .asciiz " KWH"
	
.text
.globl main

# the program begins execution at main()
main:

	#prints out the first message for current meter reading
	li $v0, 4
	la $a0, message1
	syscall

	#reads the user input of the current meter reading and saves it
	li $v0, 5
	syscall
	sw $v0, current_Meter

	#prints out the second message for previous meter reading
	li $v0, 4
	la $a0, message2
	syscall

	#reads the user input of the previous meter reading and saves it
	li $v0, 5
	syscall
	sw $v0, previous_Meter

	#prints out the third message for the month
	li $v0, 4
	la $a0, message3
	syscall

	#reads the user input of the month and saves it
	li $v0, 5
	syscall
	sw $v0, month

	#loop to calculate the electricity used, will be later accessed for other loops
	calculate_usedKWH:
	lw $t0, current_Meter
	lw $t1, previous_Meter
	sub $t2, $t0, $t1 #usedKWH = current_Meter - previousMeter
	sw $t2, usedKWH

	#loops for if (usedKWH <= 0)
	ble $t2, 0, no_usedKWH

	#if(usedKWH <=300), then payment = 20;
	li $t3, 20
	sw $t3, payment

	#loop for else if(usedKWH > 300 && month >= 5 && month <= 9)
	bgt $t2, 300, calculate_total

	#loop to print the payment if the conditions are not met
	b print_payment

	#loop that continues when the condition of if (usedKWH <= 0) is met 
	no_usedKWH:
	li $v0, 4
	la $a0, message4
	syscall
	
	b exit

	#loop that continues when the condition is else if(usedKWH > 300 && month >= 5 && month <= 9)
	calculate_total:
	lw $t1, usedKWH
	lw $t2, month
	sub $t1, $t1, 300 #usedKWH = usedKWH-300

	#if the electricity bill is between May and September
	blt $t2, 5, division_15 #compares if the month is less than May(5th month)
	bgt $t2, 9, division_15 #compares if the month is greater than September(9th month)

	#if the electricity bill is not between May and September
	div $t1, $t1, 20
	b electricity_payment
	division_15:
	div $t1,$t1,15

	#calculates the electricity payment for the month
	electricity_payment:
	lw $t0, payment
	add $t0, $t0, $t1
	sw $t0, payment #stores the value of the payment to be printed 

	#print the payment amount for the respective month
	print_payment:
	li $v0, 4
	la $a0, message5
	syscall
	
	#prints the payment amount that was calculated 
	li $v0, 1
	lw $a0, payment
	syscall
	
	li $v0, 4
	la $a0, message6
	syscall
	
	#prints the usedKWH
	li $v0, 1
	lw $a0, usedKWH
	syscall
	
	li $v0, 4
	la $a0, message7
	syscall
	
	#ends the program
	exit:
	li $v0, 10
	syscall