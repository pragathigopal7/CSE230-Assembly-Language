###########################################################
# Assignment #: 2
#  Name: Pragathi Gopal
#  ASU email: pgopal4@gmail.com
#  Course: CSE/EEE230, T/TH 3:00pm
#  Description: This program adds two integers and displays the sum and difference.
###########################################################
#data declartaions for the variable names, helps with storage allocation
	.data
	num1: .word 75301
	num2: .word 0xD5A
	num1_txt: .asciiz "num1 is: " #prints num1
	num2_txt: .asciiz "\nnum2 is: " #prints num2
	sum_txt: .asciiz "\nnum1+num2 = " #prints num1 +num2
	diff_txt: .asciiz "\nnum1-num2 = " #prints num1 - num2 

.text 
.globl    main 

# the program begins execution at main()
main:

	lw $t0, num1 #loads  num1 into $t0
	lw $t1, num2 #loads num2 into $t1

	la $a0, num1_txt #$a0 = address of num1
	li $v0, 4	#call print_string()
	syscall 	
	
	li $v0, 1  #prints the integer in the console
	lw $a0, num1 
	syscall
	
	la $a0, num2_txt #displays num2
	li $v0, 4 #call print_string()
	syscall

	li $v0, 1 #prints the integer in the console
	lw $a0, num2
	syscall
	
	add $t2, $t0, $t1 # $t2 = num1 + num2
	sub $t3, $t0, $t1 # $t3 = num1 - num2
	
	la $a0, sum_txt #displays num1 + num2
	li $v0, 4 #call print_string()
	syscall
	
	li $v0, 1 #prints the integer in the console
	move $a0, $t2
	syscall
	
	la $a0, diff_txt #displays num1 - num2
	li $v0, 4 #call print_string()
	syscall
	
	li $v0, 1 #prints the integer in the console
	move $a0, $t3 
	syscall

	li $v0, 10 #exits the program
	syscall