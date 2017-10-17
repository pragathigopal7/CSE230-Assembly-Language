###########################################################
# Assignment #: 6
#  Name: Pragathi Gopal
#  ASU email: pgopal4@gmail.com
#  Course: CSE/EEE230, T/TH 3:00pm
#  Description: This program allows the user to remove an even or odd number from an array
#				and input the size of the desired array(with a max of eight).
###########################################################
#data declartaions for the variable names, helps with storage allocation.data:
	.data
	num:.word 9 #sets the max of the array size
	values:.word 1, 2, 3, 4, 5, 6, 7, 8, 9 #includes all the values possible
	
	#Displays the strings
	display1: .asciiz "Enter zero to remove even numbers or non-zero to odd numbers \n"
	display2: .asciiz "Specify how many numbers should be stored in the array (at most 8):\n"
	display3: .asciiz "Enter an integer: \n"
	display4: .asciiz "The array content is:\n"
	display5: .asciiz "After removing the even number.\n"
	display6: .asciiz "Exit the program"
	
.text
.globl main

#the program begins execution at main()
main: 
############################################################################
# Procedure main
# Description: The main calls the removeEvenOdd procedure twice with different arrays
# parameters: $a0 = address of array 
# return value: $v0 = length
# registers to be used: $s3 and $s4 will be used.
############################################################################     
    #Prints out the first message
	li $v0, 4
	la $a0, display1
	syscall
	
	#allows the user to input the integer
	li $v0, 5
	syscall
	move $s2, $v0
	
	
 ############################################################################
# Procedure readArray
# Description: The readArray procedure reads integers from user input and prints each element in the array.
# parameters: $a0 = address of array 
# return value: $v0 = length
# registers to be used: $s3 and $s4 will be used.
############################################################################ 
readArray:
      
    
############################################################################
# Procedure removeEvenOdd
# Description: The removeEvenOdd sets each even integer in the array to 1, if the parameter 
#				"even" is 0, and sets each odd integer in the array to 0, if the parameter "even" is not 0.
# parameters: $a0 = address of array 
# return value: $v0 = length
# registers to be used: $s3 and $s4 will be used.
############################################################################ 
removeEvenOdd:
  
 
Exit_Program:
       la       $a0,display6
       li       $v0,4
       syscall
	   
       li       $v0,10
       syscall
       