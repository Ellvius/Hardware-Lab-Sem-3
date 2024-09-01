.globl main		# declare main as global entry point

.data			# Section for declaring initialized data
	one: .word 1
	msg1: .asciiz "Enter a positive number: "
	msg2: .asciiz "Factorial: "

.text			# Code section
main:		
	# print message 1
	li $v0,4
	la $a0,msg1
	syscall

	# read the positive number
	li $v0,5
	syscall
	move $t0,$v0
	
	# initialize the result to one 
	lw $t1,one

fact:	
	# factorial loop 
	beq $t0,$zero,exit			# exit if the number becomes equal to 0
	mul $t1,$t1,$t0			# multiply the result with earlier value of result 
	sub $t0,$t0,1				# reduce the number by 1
	j fact					# jump back to the loop
	
exit:
	# print the factorial message
	li $v0,4
	la $a0,msg2
	syscall 
	
	# print the result(factorial)
	li $v0,1
	move $a0,$t1
	syscall 
	
	# Exit the program
	li $v0,10
	syscall
