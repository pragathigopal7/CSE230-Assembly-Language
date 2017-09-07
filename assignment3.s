###########################################################
# Assignment #: 2
#  Name: Pragathi Gopal
#  ASU email: pgopal4@gmail.com
#  Course: CSE/EEE230, T/TH 3:00pm
#  Description: This program takes four numbers inputted by the user and 
#				displays a set of arthmetic operations using the inputted values.
###########################################################
#data declartaions for the variable names, helps with storage allocation
	.data
	
	num1: .word 0
	num2: .word 0
	num3: .word 0
	num4 :.word 0
	
	ans1: .word 0
	ans2: .word 0
	ans3: .word 0
	ans4: .word 0
	ans5: .word 0
	ans6: .word 0

	message1: .asciiz "Enter a value: " #prints the value entered
	message2: .asciiz "\nEnter another value: " #prints the value entered 
	message3: .asciiz "\nEnter one more value: " #prints the value entered 
	message4: .asciiz "\nEnter one more value: " #prints the value entered 
	sum_txt: .asciiz "\nnum2+num3= " #prints num2 +num3
	diff_txt: .asciiz "\nnum3-num4= " #prints num3 - num4 
	mult_txt: .asciiz "\nnum3*num1= " #prints num3*num1
	div_txt: .asciiz "\nnum2/num4= " #prints num2/num4
	mod_txt: .asciiz "\nnum4 mod num3= " #prints num4 mod num3	
	combined_txt: .asciiz "\nnum2-(((num4 + num1 mod 3)*2)/num3)= " #prints num2-(((num4 + num1 mod 3)*2)/num3)
	
.text 
.globl    main 

# the program begins execution at main()
main:

	
	li $v0, 4 
	la $a0, message1
	syscall 
	
	li $v0, 5	
	syscall 
	
	lw $t1,num1
	sw $v0,0($t1)
	
	li $v0, 4 
	la $a0, message2
	syscall 
	
	li $v0, 5	
	syscall 
	
	lw $t1,num2
	sw $v0,0($t1)
	
	li $v0, 4 
	la $a0, message3
	syscall 
	
	li $v0, 5	
	syscall 
	
	lw $t1,num3
	sw $v0,0($t1)
	
	
	li $v0, 4 
	la $a0, message4
	syscall 
	
	li $v0, 5	
	syscall 
	
	lw $t1,num4
	sw $v0,0($t1)
	
	lw $t0, num1 
	lw $t1, num2
	lw $t2, num3
	lw $t3, num4 
	
	add $t4, $t1, $t2 # $t2 = num2 + num3
	sub $t5, $t2, $t3 # $t3 = num3 - num4
	
	la $a0, sum_txt #displays num2 + num3
	li $v0, 4 #call print_string()
	syscall
	
	li $v0, 1 #prints the integer in the console
	move $a0, $t4
	syscall
	
	la $a0, diff_txt #displays num1 - num2
	li $v0, 4 #call print_string()
	syscall
	
	li $v0, 1 #prints the integer in the console
	move $a0, $t5 
	syscall

	li $v0, 10 #exits the program
	syscall