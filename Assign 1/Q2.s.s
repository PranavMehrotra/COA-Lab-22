# This program computes and displays the sum of integers from 1 up to n,
# where n is entered by the user.
#

    .globl  main

    .data
# program output text constants
input1:
    .asciiz "Please enter First positive integer: "         #prompt message for first input
input2:
    .asciiz "Please enter Second positive number: "         #prompt message for second input
newline:
    .asciiz "\n"                                            #newline 
error:
    .asciiz "One of the number entered is not positive."    #error message
output1:
    .asciiz "The GCD of the two integers is: "              #prompt message for output 


    .text                                                   # main program
main:
    li $s3, 0  

    la $a0,input1                                           #printing the message for entering first number 
    li $v0,4
    syscall

    li $v0,5                                                #reading the first number and storing it in register $s0
    syscall
    move $s0,$v0

    la $a0,input2                                           #printing the message for entering second number 
    li $v0,4
    syscall

    li $v0,5                                                #reading the second number and storing it in register $s1
    syscall
    move $s1,$v0

    blt $s0,$0,error_message                                #checking if either of the two numbers is negative
    blt $s1,$0,error_message
    b no_error

    error_message:
        la $a0,error                                        #display error message
        li $v0,4
        syscall

        li $v0, 10                                          #terminate the program
        syscall

    no_error:

        blt $s1,$s0,swap                                    #if b<a swap b and a so that a is always less than b
        b solution

        swap: 
            move $s2,$s1
            move $s1,$s0
            move $s0,$s2
            b solution
    
    solution:
        beq $s0,0,answer1                                   #check if a==0
        b for                                               #if a!=0
        
        answer1:                                            #if a=0
            la $a0,output1                                  #printing the output message 
            li $v0,4
            syscall

            li $v0, 1                                       #GCD is b
            move $a0, $s1
            syscall

            li $v0, 10                                      #terminate the program
            syscall

        for:                                                #if a!=0 loop
            beq $s1, $0, endf                               #exit loop if b==0
            bgt $s0, $s1, sub_a_b                           #if a>b a=a-b
            sub $s1,$s1,$s0                                 #else b=b-a
            b for                                           #continue loop

            sub_a_b:                                        #implements a=a-b
                sub $s0,$s0,$s1
                b for                                       #continue loop

        endf:                                               #when loop ends a stored the GCD
            la $a0,output1                                  #printing the output message 
            li $v0,4
            syscall

            li  $v0, 1                                      #print a          
            move  $a0, $s0
            syscall

            li $v0, 10                                      #terminate the program
            syscall
