##########################################
#
#program to visualize while loop
#
#

#data area
.data

message1:  .asciiz  "enter the number" 
message2:  .asciiz  "the factorial of the number is"

#text area
.text
.globl main

main:

li $v0, 4
la $a0, message1
syscall

li $v0, 5 # input the number from the user
syscall

move $t0, $v0 #t0 holds the number 
addi $t1, $zero, 1 # initialize factorial to 0 at first

while: 
beq $t0, $zero, exit
mul $t1, $t1, $t0
addi $t0, $t0, -1 
j while

exit:
li $v0, 4  #print the factorial
la $a0, message2
syscall
li $v0, 1
move $a0, $t1 
syscall 

li $v0, 10 #Exit the program
syscall
