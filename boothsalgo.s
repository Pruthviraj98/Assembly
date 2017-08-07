.data 

message: .asciiz "enter the multiplier"
message1: .asciiz "enter the multiplicand"
message2: .asciiz "the product is:"

.text 
.globl main

main:

    li $v0, 4               #input the multiplier
    la $a0, message
    syscall


    li $v0, 5               
    syscall
    move $s0, $v0

    li $v0, 4               #input the multiplicand
    la $a0, message1
    syscall

    li $v0, 5
    syscall

    andi $s1, $v0, 0x0000ffff           # for shifting the value of multiplier to $s1
    sll $s0, $s0, 16                    # added with 16 to make it worth adding with the value of $s1 in the later stages
    li $s4,0                            # saving the last bit
    li $s5,16                           # counter

loop:
    andi $s3, $s1, 1                    # $s3 to store lsb of $s1
    beq $s3, $s4, eloop               # to check if s3 and s4 are same 00 or 11
    beq $s3, $zero, check1              # 01 
    sub $s1, $s1, $s0                   # beginning of a run
    j eloop

check1:
    add $s1, $s1, $s0                   #moves to shifting after this 

eloop:

    sra $s1, $s1, 1                     # arithmetic right shift
    addi $s5, -1                        # decrementing the counter for number of right shifts
    move $s4, $s3
    bne $s5, $zero, loop              

    li $v0, 4                         
    la $a0, message2
    syscall
    
    li $v0, 1                           #printing the value of the final answer
    move $a0, $s1
    syscall   

end:
    li $v0, 10                          #exit the program
    syscall
