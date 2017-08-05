#####################################
#demo of the if condition
#
#
#


#data area
.data
message1: .asciiz "They are equal"
message2: .asciiz "they aren't equal"
prompt: .asciiz "enter a number"

#text area
.text

.globl main

main:
li $v0, 4 #call to one number
la $a0, prompt
syscall 

li $v0, 5
syscall

move $t0, $v0

li $v0, 4 #call to second
la $a0, prompt
syscall

li $v0, 5
syscall

move $t1, $v0

beq $t0, $t1, call1 #check for the equality
li $v0, 4
la $a0, message2
syscall

#Exit

li $v0, 10 
syscall

call1:

li $v0, 4
la $a0, message1
syscall
