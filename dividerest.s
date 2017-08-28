.data 

message: .asciiz "enter the divider"
message1: .asciiz "enter the dividend"
message2: .asciiz "the quotient is:"

.text 
.globl main

main:

    li $v0, 4
    la $a0, message
    syscall


    li $v0, 5
    syscall
    move $s0, $v0

    li $v0, 4
    la $a0, message1
    syscall

    li $v0, 5
    syscall

    andi $s1, $v0, 0x0000ffff
    sll $s0, $s0, 16                    # into Upper-Halfword (for addition)
    srl $s1, $s1, 16
    ##li $s4,0                            # saving the last bit
    li $s5,16                           # counter

loop:
    beq $s5, $zero, endloop
    sll $s1, $s1, 1
    lui  $s3, 0x8000
    or   $s3, $s3, $s1
    #andi $s3, $s1, 1000000000000000        # $s3=MSB($s1)
    beq $s3, $zero, runend              #
    add $s1, $s1, $s0                   # beginning of a run
    lui  $s3, 0x8000
    or   $s3, $s3, $s1
    #andi $s3, $s1, 1000000000000000        # $s3=LSB($s1)
    beq $s3, $zero, end2              # 01 -> runend
    j restore    

end2:
    addi $s1, $s1, 1
    addi $s5, $s5, -1
    j loop

runend:
    sub $s1, $s1, $s0
    lui  $s3, 0x8000
    or   $s3, $s3, $s1
    #andi $s3, $s1, 1000000000000000        # $s3=LSB($s1)
    beq $s3, $zero, end2               # 01 -> runend
    add $s1, $s1, 1   
    addi $s5, $s5, -1
    j loop

restore:
    sub $s1, $s1, $s0
    lui  $s3, 0x8000
    or   $s3, $s3, $s1
    #andi $s3, $s1, 1000000000000000        # $s3=LSB($s1)
    beq $s3, $zero, end2               # 01 -> runend
    addi $s5, $s5, -1
    j loop
    
endloop:

    li $v0, 4
    la $a0, message2
    syscall
    
    li $v0, 1
    move $a0, $s1
    syscall   

    li $v0, 10
    syscall
