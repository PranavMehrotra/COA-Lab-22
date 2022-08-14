  .globl  main

    .data

input:     
    .asciiz "Enter four positive integers m, n, a and r:\n"                                       #prompt message for first input


error:
    .asciiz "One of the entered number is not-positive. Kindly enter again! "                   #error out of bound message

newline:
    .asciiz "\n"                                                                                #newline character

matrix_A:
    .asciiz "Matrix A:\n\n"                                                                     #Label for Matrix A

matrix_B:                                                                                       #Label fro Matrix B
    .asciiz "Matrix B:\n\n"

space:                                                                                          #space character
    .asciiz " "

    .text

main:                                                                                           #main starts

    jal initStack                                                                               #initalise stack

    la $a0,input                                                                                #printing the message for input 
    li $v0,4
    syscall

    li $v0,5                                                                                    #reading the m (s0 = m)
    syscall
    move $s0,$v0

    li $v0,5                                                                                    #reading the n (s1 = n)
    syscall
    move $s1,$v0

    li $v0,5                                                                                    #reading the a (s2 = a)
    syscall
    move $s2,$v0

    li $v0,5                                                                                    #reading the r (s3 = r)
    syscall
    move $s3,$v0

    ble $s0, 0, error_message                                                                   #check if m>0 else print error message
    ble $s1, 0, error_message                                                                   #check if n>0 else print error message
    ble $s2, 0, error_message                                                                   #check if a>0 else print error message
    ble $s3, 0, error_message                                                                   #check if r>0 else print error message

    mul $a0, $s0, $s1                                                                           #a0 = s0 * s1 i.e. matrix A is of size m*n (a0 = size of array that will store the matrix)  
    jal mallocInStack                                                                           #call mallocInStack to allot m*n size array in stack
    move $s4,$v0                                                                                #store the returned starting address of A in s4

    mul $a0, $s1, $s0                                                                           #a0 = s1 * s0 i.e. matrix B is of size n*m (a0 = size of array that will store the matrix)
    jal mallocInStack                                                                           #call mallocInStack to allot n*m size array in stack
    move $s5,$v0                                                                                #store the returned starting address of B in s5

    move $t0, $0                                                                                #t0 stores the index where the number will be inserted
    li $t1, 1                                                                                   #to keep track of what is multiplies by a to generate GP that is (powers of r) t1 = r^0

    matrix_A_complete:
        mul $t3, $s2,$t1                                                                        #generate element of GP by multiplying a and power of r and store in $t3 
        mul $t2, $t0,4                                                                          #calculate address to insert the element by multiplying index by sizeof(int)
        add $t2, $t2, $s4                                                                       #add base address of array to get the actual address of A[index] = A(base address) + index*sizeof(int)
        sw $t3, 0($t2)                                                                          #store word stored in t3 in t2 that store the GP element at appropriate address in stack
    
        mul $t1, $t1, $s3                                                                           #multiply $t1 by r to get the next power of r to be multiplied to a to generate elemnets of GP
        addi $t0, $t0,1                                                                             #index++
        mul $t2, $s0,$s1                                                                            #store the size of array i.e. m*n in t2
        blt $t0, $t2, matrix_A_complete                                                             #if index < m*n continue adding elements else print the completed matrix

    li $v0, 4                                                                                    #print space after every element
    la $a0, matrix_A
    syscall

    move $a0, $s0                                                                               #pass the number of rows i.e. m as first parameter in a0
    move $a1, $s1                                                                               #pass the number of columns i.e. n as second parameter in a1
    move $a2, $s4                                                                               #pass the array to be printed i.e. A as third parameter in a2
    jal printMatrix                                                                             #call printMatrix function with appropriate parameters

    move $a0, $s0                                                                               #pass the number of rows i.e. m as first parameter in a0
    move $a1, $s1                                                                               #pass the number of columns i.e. n as second parameter in a1
    move $a2, $s4 
    move $a3, $s5
    jal transposeMatrix

    li $v0, 4                                                                                    #print space after every element
    la $a0, matrix_B
    syscall

    move $a0, $s1                                                                               #pass the number of rows i.e. m as first parameter in a0
    move $a1, $s0                                                                               #pass the number of columns i.e. n as second parameter in a1
    move $a2, $s5                                                                               #pass the array to be printed i.e. A as third parameter in a2
    jal printMatrix

    j end                                                                           


error_message:
    la $a0,error                                                                                #print the error message 
    li $v0,4
    syscall

    la $a0,newline                                                                              #print a newline
    li $v0,4
    syscall

    j main                                                                                      #re-prompt the user to enetr numbers again

initStack:                                                                                      #to initialise stack
    sub $sp,$sp,4                                                                               #create space to store previous stack pointer
    sw $fp, 0($sp)                                                                              #store old frame pointer
    move $fp, $sp                                                                               #update frame pointer to the new wstack base pointer
    jr $ra                                                                                      #return from teh function


mallocInStack:
    mul $t0, $a0, 4                                                                              #a0 stores the size of array we have and each element occupies 4 bytes
    sub	$sp, $sp, $t0                                                                            # sp = sp - (4*size), create space in stack to store these elements
    move $v0, $sp                                                                                #store the base address of created array in $v0
    jr $ra  

pushToStack:
    addi $sp, $sp, -4                                                                            #make space for storing the new element
    sw $a0, 0($sp)                                                                               #save the new element stored at a0 to stack
    move $v0,  $sp                                                                               #return the starting address of the stack
    jr $ra



printMatrix:
    li $t0,0
    move $t4,$a0
    i_loop:
        li $t1,0 #j=0
        
        j_loop:
            mul $t2,$t0,$a1                                                                                #calculate the number of bytes after base address by multiply index by sizeof(int)
            add $t2, $t2, $t1                                                                            #A[j] = base address of A + j * sizeof(int)   
            mul $t2, $t2,4
            add $t2, $t2, $a2
            
            lw $t2, 0($t2)

            li $v0, 1                                                                                    #print $t2 i.e. A[j] 
            move $a0, $t2                                            
            syscall

            li $v0, 4                                                                                    #print space after every element
            la $a0, space
            syscall
            
            addi $t1,$t1,1
            blt $t1,$a1,j_loop

        li $v0, 4                                                                                    #print space after every element
        la $a0, newline
        syscall
        addi $t0,$t0,1
        blt $t0, $t4,i_loop
    jr $ra 




transposeMatrix:
    li $t0,0 #i=0
    
 
    loop_i:
        li $t1,0 #j=0
        
        loop_j:
            mul $t2,$t0,$a1                                                                                #calculate the number of bytes after base address by multiply index by sizeof(int)
            add $t2, $t2, $t1                                                                            #A[j] = base address of A + j * sizeof(int)   
            mul $t2, $t2,4
            add $t2, $t2, $a2
            
            lw $t2, 0($t2)

            mul $t3,$t1,$a0                                                                                #calculate the number of bytes after base address by multiply index by sizeof(int)
            add $t3, $t3, $t0                                                                            #A[j] = base address of A + j * sizeof(int)   
            mul $t3, $t3,4
            add $t3, $t3, $a3
            
            sw $t2, 0($t3)
            
            addi $t1,$t1,1
            blt $t1,$a1,loop_j

        addi $t0,$t0,1
        blt $t0, $a0,loop_i
    jr $ra 

end:
    
    li $v0, 10                                                                                   #terminate the program
    syscall