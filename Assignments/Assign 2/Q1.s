
    .globl  main

    .data

input1:     
    .asciiz "Enter First number: "                                       #prompt message for first input

input2:
    .asciiz "Enter second number: "                                      #promt message for second input

error1:                                                                  #error out of bound message
    .asciiz "First number entered is out of range. Number should be in the range of [32767,-32768]. "              

error2:                                                                  #error out of bound message
    .asciiz "Second number entered is out of range. Number should be in the range of [32767,-32768]. "               

output1:
    .asciiz "Product of the two numbers are: "                           #prompt message for output 
newline:
    .asciiz "\n"                                                         #newline character

    .text

main:                                                                    #main function starts
    la $a0,input1                                                        #printing the message for entering first number 
    li $v0,4
    syscall

    li $v0,5                                                             #reading the first number and storing it in register $s0 = M
    syscall
    move $s0,$v0

    la $a0,input2                                                        #printing the message for entering second number 
    li $v0,4
    syscall

    li $v0,5                                                             #reading the second number and storing it in register $s1 = Q
    syscall
    move $s1,$v0

    blt $s0, -32768, error_message1                                       #if M<-32768 i.e. it cannot be represented using 16 bits, display error message ( minimum 16 bit signed number = -2^16 )
    blt $s1, -32768, error_message2                                       #if Q<-32768 i.e. it cannot be represented using 16 bits, display error message
    bgt $s0, 32767, error_message1                                        #if M>32767 i.e. it cannot be represented using 16 bits, display error message  ( maximum 16 bit signed number = 2^16 - 1 )
    bgt $s1, 32767, error_message2                                        #if Q>32767 i.e. it cannot be represented using 16 bits, display error message

    move $a0, $s0                                                        #a0 = M save M as first parameter in register a0                                      
    move $a1, $s1                                                        #a1 = Q save Q as second paramter in register a1
    jal multiply_booth                                                   # call multiply_booth function with M and Q as parameter 

    move $s2, $v0                                                        #store the returned value of multiply_booth from v0 to s0
    
    li $v0, 4                              
    la $a0, output1                                                      #print the output message string
    syscall

    li $v0, 1                                                            #print the returned value of multiply_booth i.e. the product of the numbers
    move $a0, $s2
    syscall

    b end                                                                #terminate the programme

error_message1:
    la $a0,error1                                                         #print the error message 
    li $v0,4
    syscall

    la $a0,newline                                                       #print a newline
    li $v0,4
    syscall

    j main                                                               #re run the programme and ask the user to input numbers again

error_message2:
    la $a0,error2                                                         #print the error message 
    li $v0,4
    syscall

    la $a0,newline                                                       #print a newline
    li $v0,4
    syscall

    j main                                                               #re run the programme and ask the user to input numbers again

multiply_booth:
    move $t0, $0                                                         #initialise A=0 ( $t0 = A )
    move $t1, $0                                                         #initialise Q_-1=0 ( $t1 = Q_-1)
    li $t2,32                                                            #initialise count = 32 ( $t2 = count )

    LSB_check:
    andi $t3,$a1,1                                                       #t3 = LSB of Q taking and of Q with 00....01 will make all other bits 0 
                                                                         #while if LSB of Q is 1, and with 1 will lead to 1 so t3 = 00.....01
                                                                         #while if LSB of Q is 0, and with 1 will lead to 0 so t3 = 00.....00
                                                                          
    xor $t3, $t3, $t1                                                    #checking if LSB of Q and LSB_prev are same(i.e. 00,11) or different(01,10)

    bne $t3, $0, case                                                    #if LSB of Q and LSB_prev are different i.e. xor!=0 go to case and perform arithmetic operation
    j  shift_right                                                       #else implement arithmetic right shift

        shift_right:                                                         #arithmetic right shift operation
            andi $t3,$a1,1                                                   #t3 = LSB of Q                                   

            move $t1, $t3                                                    #LSB_prev = LSB of Q i.e.  Q-1 = Q0
            
            andi $t3,$t0,1                                                   #t3 = LSB of A i.e. t3 = A0

            srl $a1, $a1,1                                                   #Q = Q >> 1 i.e. shift right logical Q ( 0 is added to MSB )
            sll $t3,$t3,31                                                   #shift A0 by 31 bits i.e. if A0 was 00....01 then after shift A0 becomes 100...00 ( A0 is the MSB of t3 )   
            or $a1,$a1,$t3                                                   #The MSB of Q after shift is basically A0 therefore after shifting A0 take bitwise OR. All other bits remain the same while or with 1 (LSB of A0) makes the MSB of Q 1. else the MSB remains 0
            sra $t0,$t0,1                                                    #shift right arithmetic A i.e. shift right and push in the sign bit of A as the MSB of shifted A
            addi $t2, $t2, -1                                                #update count=count-1
            
            bnez $t2,LSB_check                                               #if count!=0 go back to the LSB check step
            move $v0, $a1                                                    #else store the product (i.e. Q) in v0
            jr	$ra                                                          #return from multiply_booth with the return value stored in v0

    case:
        bnez $t1, case_01                                                    #if Q_-1 = 1 then go to case 01 i.e. when Q0 = 0 and Q_-1 = 1
        b case_10                                                            #else if Q_-1 = 0 then go to case 10 i.e. when Q0 = 1 and Q_-1 = 0

    case_01:
        add		$t0, $t0, $a0		                                         # A <- A + M
        b shift_right                                                        #perform arithmetic right shift

    case_10:                                                            
        sub		$t0, $t0, $a0		                                         # A <- A - M    
        b shift_right                                                        #perform arithmetic right shift
    

end:
    
    li $v0, 10                                                               #terminate the program
    syscall
