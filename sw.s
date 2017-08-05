##################################################
#to store a number into the memory from the register
#
#using the sw(store word) command
#

#data area:
	.data

#text area:
	.text
	.globl my_main
my_main:
	
	li	$t0, 0x30
	li	$t1, 0x010010000
	sw	$t0, 0($t1)

	addi	$t0, $t0, 1
	sw	$t0, 4($t1)
	
	li	$t0, 0x12345678	
	sw	$t0, 8($t1)

	li	$t0, 0xa5a5a5a
	sw	$t0, 12($t1)

#end the program
	li 	$v0, 10
	syscall
 
