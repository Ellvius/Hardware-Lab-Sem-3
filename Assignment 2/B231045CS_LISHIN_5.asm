# Declare main as global entry point
.globl main

# Section for declaring initialized data
.data
prompt1 : .asciiz "Enter first number: "
prompt2 : .asciiz "Enter second number: "
True : .asciiz "The sum of the numbers is a prime\n"
False : .asciiz "The sum of the numbers is not a prime\n"

.text
main:
	# Print prompt message to enter the first number to the user
	li $v0,4
	la $a0,prompt1
	syscall
	
	# Read the first number
	li $v0,5
	syscall
	move $t0,$v0
	
	# Print prompt message to enter the second number to the user
	li $v0,4
	la $a0,prompt2
	syscall

	# Read the first number
	li $v0,5
	syscall
	move $t1,$v0	
	
	# Add two numbers and store its result
	add $s0,$t1,$t0
	
	# if the sum is less than 2 then jump to false
	li $t0,2
	blt $s0,$t0,false
	
	# Initialize divisor and upperbound
	li $t0,2
	srl $t2,$s0,1
	
prime:
	bgt $t0,$t2,true		# if the divisor is greater than upperbound it is prime
	div $s0,$t0
	mfhi $t3
	beq $t3,$zero,false	# if any of the number divide it then it is not prime
	add $t0,$t0,1
	j prime
	
true:
	li $v0,4
	la $a0,True
	syscall
	j exit
	
false:
	li $v0,4
	la $a0,False
	syscall 
	j exit
	
exit:
	li $v0,10
	syscall