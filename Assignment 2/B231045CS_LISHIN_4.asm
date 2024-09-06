# Declare main as global entry point
.globl main

# Section for declaring initialized data
.data
UserPrompt: .asciiz "Enter a string : "
True: .asciiz "The entered string is : Palindrome\n"
False: .asciiz "The entered string is : not Palindrome\n"
input: .space 101
inputsize: .word 101

.text
main:
    # Prompt the user to enter the string
    li $v0, 4
    la $a0, UserPrompt
    syscall

    # Read the entered string
    li $v0, 8
    la $a0, input
    lw $a1, inputsize
    syscall

    # Find the length of the string
    li $t0, 0 

find_length:
    lb $t1, input($t0)  
    beqz $t1, length_found 
    add $t0, $t0, 1
    j find_length

length_found:
    addi $t1, $t0, -2 
    li $t0, 0         

check_palindrome:
    # Compare characters
    lb $t2, input($t0) 
    lb $t3, input($t1) 
    
    bge $t0, $t1, palindrome_true 
    bne $t2, $t3, palindrome_false 
    
    # Increment and decrement the indices
    addi $t0, $t0, 1
    subi $t1, $t1, 1
    j check_palindrome

palindrome_true:
    li $v0, 4
    la $a0, True
    syscall
    j exit

palindrome_false:
    li $v0, 4
    la $a0, False
    syscall

exit:
    li $v0, 10
    syscall
