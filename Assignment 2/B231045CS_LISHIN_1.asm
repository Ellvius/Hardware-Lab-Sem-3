.globl main
.data
msg1: .asciiz "Enter a positive number: "
msg2: .asciiz "\nThe entered number is : odd"
msg3: .asciiz "\nThe entered number is : even"

.text
main:
li $v0,4
la $a0,msg1
syscall

li $v0,5
syscall
move $t1,$v0

addi $t2,$zero,2

div $t1,$t2
mfhi $t3

beq $t3,$zero,even
bne $t3,$zero,odd

even: 
	li $v0,4
	la $a0,msg3
	syscall
	
	li $v0,10
	syscall
	
odd: 
	li $v0,4
	la $a0,msg2
	syscall

	li $v0,10
	syscall



