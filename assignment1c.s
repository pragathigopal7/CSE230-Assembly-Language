###########################################################
# Assignment #: 1
#  Name: Pragathi Gopal	 
#  ASU email: pgopal4@asu.edu
#  Course: CSE/EEE230,  T/Th 3:00 PM
#  Description: This is my first assembly language program.
#                     	It prints "This is my first MIPS code" and “I will eventually write more MIPS
#			code.”. 
###########################################################
#data declarations: declare variable names used in program, storage allocated in RAM
                            .data   
message1:     	.asciiz "This is my first MIPS code.\n" #create a string containing "This is my first MIPS code.\n"
message2: 	.asciiz "I will eventually write more MIPS code.\n" #create a string containing "I will eventually write more MIPS code. \n"
#program code is contained below under .text
                        .text 
                    	.globl    main    #define a global function main
# the program begins execution at main()
main:
        la      $a0, message1  # $a0 = address of message1
            li       	$v0, 4            	# $v0 = 4  --- this is to call print_string()
            syscall                       	# call print_string()
          	$ra                  	# return
		