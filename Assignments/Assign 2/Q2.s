    .data
array:
    .space 40
prompt0:
    .asciiz "Please give 10 integers for the array: \n"
prompt1:
    .asciiz "Enter an integer: "
prompt2:
    .asciiz "Enter the value of k: "
prompt3:
    .asciiz "The "
prompt4:
    "th largest element is: "
nl:
    .asciiz "\n"
error_k_g:
    .asciiz "ERROR: k entered greater than the length of the array"
error_k_s:
    .asciiz "ERROR: k entered is zero or negative"
try_again:
    .asciiz "Try again"
espace:
    .asciiz ", "





    .text
    .globl main
# $s0 : length of array
# $s1 : k
# $t0 : i



main:
    li $s0,10
    jal inp_arr
    jal inp_k

    la $a0,nl
    li $v0,4
    syscall

    la $s2,array
    li $t0,0
    jal sort
    la $a0,prompt3
    li $v0,4
    syscall
    move $a0,$s1
    li $v0,1
    syscall
    la $a0,prompt4
    li $v0,4
    syscall
    move $t0,$s0
    sub $t0,$t0,$s1
    mul $t0,$t0,4
    lw $a0,array($t0)
    li $v0,1
    syscall

    
    la $a0,nl
    li $v0,4
    syscall


    # li $t0,0
    # jal print_arr
    # la $a0,nl
    # li $v0,4
    # syscall
    j end

inp_arr:
    la $a0,prompt0
    li $v0,4
    syscall
    li $t0,0
    j loop

loop:
    beq $t0,$s0,return
    la $a0,prompt1
    li $v0,4
    syscall
    li $v0,5
    syscall
    move $t1,$t0
    mul $t1,$t1,4
    sw $v0,array($t1)
    addi $t0,$t0,1
    b loop

inp_k:
    la $a0,prompt2
    li $v0,4
    syscall
    li $v0,5
    syscall
    move $s1,$v0
    b check_k

check_k:
    ble $s1,$0,error_k_small
    bgt $s1,$s0,error_k_great
    j return

error_k_great:
    la $a0,error_k_g
    li $v0,4
    syscall
    la $a0,nl
    li $v0,4
    syscall
    la $a0,try_again
    li $v0,4
    syscall
    la $a0,nl
    li $v0,4
    syscall
    j inp_k

error_k_small:
    la $a0,error_k_s
    li $v0,4
    syscall
    la $a0,nl
    li $v0,4
    syscall
    la $a0,try_again
    li $v0,4
    syscall
    la $a0,nl
    li $v0,4
    syscall
    j inp_k


print_arr:
    beq $t0,$s0,return
    move $t1,$t0
    mul $t1,$t1,4
    lw $a0,array($t1)
    li $v0,1
    syscall
    la $a0,espace
    li $v0,4
    syscall
    addi $t0,$t0,1
    b print_arr

swap:
    lw $t7,0($a0)
    lw $t8,0($a1)
    sw $t8,0($a0)
    sw $t7,0($a1)
    jr $ra


sort:
    bge $t0,$s0,return
    addi $t0,$t0,1
    li $t1,0
    move $t2,$s0
    sub $t2,$t2,$t0
    for_inner:
        bge $t1,$t2,sort
        mul $t3,$t1,4
        add $s5,$s2,$t3
        move $t4,$s5
        addi $t3,$t3,4
        add $s5,$s2,$t3
        move $t5,$s5
        move $a0,$t4
        move $a1,$t5
        addi $t1,$t1,1
        lw $t4,0($t4)
        lw $t5,0($t5)
        ble $t4,$t5,for_inner
        move $s4,$ra
        jal swap
        move $ra,$s4
        j for_inner





return:
    jr $ra

read_int:
    la $a0,prompt1
    li $v0,4
    syscall

end: 
    li $v0,10
    syscall