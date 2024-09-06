.globl main  #declare main as global entry point

.data			# Section for declaring initialized data
	two: .word 2
	msg1: .asciiz "Enter a positive number: "
	msg2: .asciiz "The entered number is : odd"
	msg3: .asciiz "The entered number is : even"
	
.text
main:
	# print the first message
	li $v0,4
	la $a0,msg1
	syscall
	
	# read the positive number
	li $v0,5
	syscall
	move $t1,$v0
	# print the first message
	li $v0,4
	la $a0,msg1
	syscall
	
	# read the positive number
	li $v0,5
	syscall
	move $t1,$v0

	# find remainder when divided by two
	lw $t2,two
	div $t1,$t2
	mfhi $t3
	# find remainder when divided by two
	lw $t2,two
	div $t1,$t2
	mfhi $t3

	# check if the remainder is equal to zero(even) or not(odd)
	beq $t3,$zero,even
	bne $t3,$zero,odd
	# check if the remainder is equal to zero(even) or not(odd)
	beq $t3,$zero,even
	bne $t3,$zero,odd

even: 
	# print the even number message 
	# print the even number message 
	li $v0,4
	la $a0,msg3
	syscall
	
	# Exit the program
	# Exit the program
	li $v0,10
	syscall
	
odd: 
	# print the odd number message 
	# print the odd number message 
	li $v0,4
	la $a0,msg2
	syscall

	# Exit the program
	# Exit the program
	li $v0,10
	syscall



