.globl main  #declare main as global entry point

.data			# Section for declaring initialized data
msg1: .asciiz "Enter a string : "
msg2: .asciiz "Case changed string : "
input: .space 101
output: .space 101
inputsize: .word 101

.text
main:
  # Prompt for the user to enter string
  li $v0,4
  la $a0, msg1
  syscall

  # Read the string.
  li $v0,8
  la $a0, input
  lw $a1, inputsize
  syscall

  # initialize the loop variable
  li $t0,0

loop:
	lb $t1,input($t0) # load each character
	beqz $t1,exit			 # exit if the character is endline character
	
	li $t2,'a'
	li $t3,'z'
	blt $t1,$t2,uppercase
	bgt $t1,$t3,uppercase
	
	li $t4,32
	sub $t1,$t1,$t4		# subtract 32 ASCII to convert to upper case
	j store
	
uppercase:
	li $t2,'A'
	li $t3,'Z'
	blt $t1,$t2,store
	bgt $t1,$t3,store
	
	li $t4,32
	add $t1,$t1,$t4		# Add 32 ASCII to convert to lower case
	j store

store:
	sb $t1,output($t0)
	add $t0,$t0,1
	j loop

exit:
	# terminate the string
	sb $zero,output($t0)
	
	# message for resulting string
  li $v0,4
  la $a0, msg2
  syscall
	
	# output the resulted string
	li $v0,4
	la $a0,output
	syscall
	
  # Exit the program
  li $v0, 10
  syscall