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

addi $t3, $zero, 0
lw   $t0, myarray($zero)  #used to store back the num frm memory to registers
addi $t4, $zero, 4 #incrementing the counter by 1
lw   $t1, myarray($t4)
addi $t5, $zero, 8 #incrementing the counter by 1
lw   $t2, myarray($t5)

#printing the elements in the array
li   $v0, 4
la   $a0, message
syscall

li   $v0, 1  #printing the first element
move  $a0, $t0
syscall

li   $v0, 4  # nextline
la   $a0, NL
syscall

li   $v0, 1 #printing the second element
move $a0, $t1
syscall

li   $v0, 4 #next line
la   $a0, NL
syscall

li   $v0, 1 #printing the third element
move $a0, $t2
syscall

#exiting
li $v0, 10 
syscall
