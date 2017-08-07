##################################
#to visualize arrays in mips
#
#

#data section

.data
myarray:  .space   12  #to allocate the memory for 3 integers(1 integer=4 bits)
message:  .asciiz  "the elements are \n" 
NL: 	  .asciiz  "\n"

#text section
.text
.globl main

main:

addi $s0, $zero, 5
addi $s1, $zero, 10
addi $s2, $zero, 15

addi $t0, $zero, 0 #index or offset in $t0

sw   $s0, myarray($t0) #inserting the element in s0 to array
	addi $t0, $t0, 4 #incrementing the counter by 1
sw   $s1, myarray($t0) #inserting second element into the array
	addi $t0, $t0, 4 #incrementing the counter by 1
sw   $s2, myarray($t0) #inserting third element into the array

li $v0, 4
la $a0, message
syscall

addi $t0, $zero, 0

while: 
beq $t0, 12, exit #condition of the while loop

lw $t3, myarray($t0)

li $v0, 1
add $a0, $zero, $t3
syscall

addi $t0, $t0, 4

li $v0, 4
la $a0, NL
syscall

j while #jumping back to the while loop 
exit:

#exit the program
li $v0, 10
syscall
