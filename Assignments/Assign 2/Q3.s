  .globl  main

    .data

input:     
    .asciiz "Enter four positive integers m, n, a and r:"                                       #prompt message for first input


error:
    .asciiz "One of the entered number is not-positive. Kindly enter again! "               #error out of bound message

newline:
    .asciiz "\n"                                                         #newline character

matrix_A:
    .asciiz "Matrix A:\n\n"

matrix_B:
    .asciiz "Matrix B:\n\n"

space:
    .asciiz " "

    .text

main:          
    la $a0,input                                                      #printing the message for entering first number 
    li $v0,4
    syscall

    li $v0,5                                                             #reading the m
    syscall
    move $s0,$v0

    li $v0,5                                                             #reading the n
    syscall
    move $s1,$v0

    li $v0,5                                                             #reading the a
    syscall
    move $s2,$v0

    li $v0,5                                                             #reading the r
    syscall
    move $s3,$v0

    ble $s0, 0, error_message                                       
    ble $s1, 0, error_message                                       
    ble $s2, 0, error_message                                        
    ble $s3, 0, error_message

    mul $a0, $s0, $s1                                                   #matrix A
    jal mallocInStack
    move $s4,$v0

    mul $a0, $s0, $s1                                                   #matrix B
    jal mallocInStack
    move $s5,$v0


error_message:
    la $a0,error                                                         #print the error message 
    li $v0,4
    syscall

    la $a0,newline                                                       #print a newline
    li $v0,4
    syscall

    j main 

mallocInStack:
    mul     $t0, $a0, 4     #a0 stores the number of integers we have and each integer occupies 4 bytes
    sub		$sp, $sp, $t0   # sp = sp - (4*size), reserve space in stack
    move    $v0, $sp        # store the base address in $v0
    jr      $ra
end:
    
    li $v0, 10                                                               #terminate the program
    syscall