#addition of registers

#data section
	.data
prompt: .asciiz "input the number"
message: .asciiz "the sum is"  	
	
#text section
	.text
	
	.globl my_main

my_main:
	#main code goes here
	
	li $v0, 4 #input first element
	la $a0, prompt
	syscall

	li $v0, 5
	syscall
	
	move $t0, $v0
 
	li $v0, 4 #input second element
	la $a0, prompt
	syscall

	li $v0, 5
	syscall
	
	move $t1, $v0
	
	add $t2, $t1, $t0 #add the values
	
	li $v0, 4  
	la $a0, message
	syscall
	
	li $v0, 1 #print the answer
	move $a0, $t2
	syscall

#exit
	li $v0, 10
	syscall 			
