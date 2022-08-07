# This program computes and displays the sum of integers from 1 up to n,
# where n is entered by the user.
#

    .globl  main

    .data
# program output text constants
input1:
    .asciiz "Enter a positive integer: "                    #prompt message for first input

error:
    .asciiz "Number entered is not positive."               #error message

output1:
    .asciiz "Entered number is a perfect number."           #prompt message for output 

output2:
    .asciiz "Entered number is not a perfect number. "      #prompt message for output 


    .text                                                   # main program
main:
    li $s1, 1                                               #i=1
    li $s2, 0                                               #sum=0
     

    la $a0,input1                                           #printing the message for entering a number n
    li $v0,4
    syscall

    li $v0,5                                                #reading the number and storing it in register $s0
    syscall
    move $s0,$v0


    ble $s0,$0,error_message                                #checking if the number entered is negative
    b no_error

    error_message:
        la $a0,error                                        #display error message
        li $v0,4
        syscall

        li $v0, 10                                          #terminate the program
        syscall

    no_error:

        for:                                                
            bge $s1, $s0, endf                              #exit loop if i>=n
            div $s0,$s1                                     #divide n/i
            mfhi $s3                                        # s3 = remainder of (n/i)
            beq $s3,$0,add_sum	                            #if remainder==0 add it to sum
            addi $s1,$s1,1	                                #update counter i
            b for                                           #continue loop

        add_sum:                                            #add i to sum if i divides sum
            add $s2,$s2,$s1
            addi $s1,$s1,1                                  #update i
            b for
            
        endf:                                               #loop ends when i>=n
            beq $s2,$s0,perfect                             #if sum==n output perfect number message
            b not_perfect                                   #else output not perfect number message
        
        perfect:
            la $a0,output1                                  #printing the output message 
            li $v0,4
            syscall

            li $v0, 10                                      #terminate the program
            syscall

        not_perfect:
            la $a0,output2                                  #printing the output message 
            li $v0,4
            syscall

            li $v0, 10                                      #terminate the program
            syscall
