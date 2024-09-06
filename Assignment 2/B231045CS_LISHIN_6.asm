# Declare main as global entry point
.globl main

# Section for declaring initialized data
.data
prompt1: .asciiz "Enter a 32-bit binary number: "
result: .asciiz "Decimal equivalent of the number is: "
input: .space 34

.text
main:
	# Print prompt message to the user
	li $v0,4            
	la $a0,prompt1     
	syscall
	
	# Read the input as a string (up to 32 bits + newline)
	li $v0,8           
	la $a0,input      
	li $a1,34          
	syscall
	
	# Reach the end of the string to find its length
	li $t0,0           
	
findLength:
	lb $t1,input($t0)  
	beq $t1,10,length  
	add $t0,$t0,1     
	j findLength     
	
	# Point to the msb of the binary number
length:
	addi $t0,$t0,-1  
	
	# Initialize the base value (power of 2) and sum
	li $t2,1         
	li $t3,0        
	
	# Binary to decimal conversion loop
	# t1: digit ; t0: iterator ; t3: sum ; t2: base value
decimal_loop:
	lb $t1,input($t0)  
	beq $t1,10,exit   
	
	addi $t1,$t1,-48 		# convert char to digit by sub 48
	
	beq $t1,$zero,skip 	# if the digit is zero skip
	add $t3,$t3,$t2   

skip:
	sll $t2,$t2,1      
	addi $t0,$t0,-1   
	bgez $t0,decimal_loop 
	
exit:
	# Print result message
	li $v0,4           
	la $a0,result     
	syscall
	
	# Print the decimal result
	li $v0,1           
	move $a0,$t3       
	syscall
	
	# Exit program
	li $v0,10     
	syscall
