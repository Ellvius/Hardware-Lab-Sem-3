.globl main
.data
msg1: .asciiz "Enter a positive number: "
msg2: .asciiz "Factorial: "

.text
main:
li $v0,4
la $a0,msg1
syscall

li $v0,5
syscall
move $t0,$v0

addi $t1,$zero,1

fact:	
	beq $t0,$zero,exit
	mul $t1,$t1,$t0
	sub $t0,$t0,1
	j fact
	
exit:
	li $v0,4
	la $a0,msg2
	syscall 
	
	li $v0,1
	move $a0,$t1
	syscall 
	
	li $v0,10
	syscall