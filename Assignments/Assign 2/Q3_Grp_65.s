# Assignement No.: 2
# Problem No.: 3
# Semester: Autumn 2022
# Group No.: 65
# Member 1: Pranav Mehrotra (20CS10085)
# Member 2: Saransh Sharma (20CS30065)

#The programme takes as input four integers m, n, a, r where m and n is the dimension of matrix A
#The programme dynamically allocates two 2-D arrays in stack, fill the first matrix A with terms of GP with 'a' being the initial term and 'r' being the multiplicative ratio
#and it generates a matrix B Which is the transpose of A. Both matrices A and B are then printed.  

  .globl  main

    .data

input:     
    .asciiz "Enter four positive integers m, n, a and r:\n"                                     #prompt message for first input


error:
    .asciiz "One of the entered number is not-positive. Kindly enter again! "                   #error out of bound message

newline:
    .asciiz "\n"                                                                                #newline character

matrix_A:
    .asciiz "Matrix A:\n\n"                                                                     #Label for Matrix A

matrix_B:                                                                                       #Label for Matrix B
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
    
        mul $t1, $t1, $s3                                                                       #multiply $t1 by r to get the next power of r to be multiplied to a to generate elemnets of GP
        addi $t0, $t0,1                                                                         #index++
        mul $t2, $s0,$s1                                                                        #store the size of array i.e. m*n in t2
        blt $t0, $t2, matrix_A_complete                                                         #if index < m*n continue adding elements else print the completed matrix

    li $v0, 4                                                                                   #print message for Matrix A
    la $a0, matrix_A
    syscall

    move $a0, $s0                                                                               #pass the number of rows i.e. m as first parameter in a0
    move $a1, $s1                                                                               #pass the number of columns i.e. n as second parameter in a1
    move $a2, $s4                                                                               #pass the array to be printed i.e. A as third parameter in a2
    jal printMatrix                                                                             #call printMatrix function with appropriate parameters

    move $a0, $s0                                                                               #pass the number of rows i.e. m as first parameter in a0
    move $a1, $s1                                                                               #pass the number of columns i.e. n as second parameter in a1
    move $a2, $s4                                                                               #pass the array A as third parameter using a2
    move $a3, $s5                                                                               #pass the array B that will store the transpose using a3
    jal transposeMatrix                                                                         #call transposeMatrix 

    li $v0, 4                                                                                   #print message for Matrix B
    la $a0, matrix_B
    syscall

    move $a0, $s1                                                                               #pass the number of rows i.e. n as first parameter in a0
    move $a1, $s0                                                                               #pass the number of columns i.e. m as second parameter in a1
    move $a2, $s5                                                                               #pass the array to be printed i.e. B as third parameter in a2
    jal printMatrix                                                                             #call printMatrix function with appropriate parameters

    j end                                                                                       #terminate the programme


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
    li $t0,0                                                                                      #initialise i=0
    move $t4,$a0                                                                                  #store m in $t4
    
    i_loop:
        li $t1,0                                                                                  #initialise j=0   
        


        #A when converted to row major form A[i][j] will be stored at index i*n+j where n is the number of columns 
        j_loop:
            mul $t2,$t0,$a1                                                                       #multiply i * n
            add $t2, $t2, $t1                                                                     #add j to i*n i.e. t2 = i*n+j   
            mul $t2, $t2,4                                                                        #to calculate bytes multiple by 4
            add $t2, $t2, $a2                                                                     #A[i][j] = A(base address) + (i*n+j)*4
            
            lw $t2, 0($t2)                                                                        #load the word from stack

            li $v0, 1                                                                             #print $t2 i.e. A[i][j] 
            move $a0, $t2                                            
            syscall

            li $v0, 4                                                                             #print space after every element
            la $a0, space
            syscall
            
            addi $t1,$t1,1                                                                        #increment j
            blt $t1,$a1,j_loop                                                                    #check if j<n if j>=n break the loop  

        li $v0, 4                                                                                 #print a newline after all the elements of a row are printed
        la $a0, newline 
        syscall

        addi $t0,$t0,1                                                                            #increment i
        blt $t0, $t4,i_loop                                                                       #check if i<m
    
    jr $ra                                                                                        #return once all the elements are printed 


transposeMatrix:
    li $t0,0                                                                                      #initialise i=0
     
    loop_i:                                                                                 
        li $t1,0                                                                                  #initialise j=0
        #A when converted to row major form A[i][j] will be stored at index i*n+j where n is the number of columns 
        #B[j][i] = A[i][j] as B is transpose of A and so after B is converted to row major form B[j*m+i] = A[i*n+j]
        loop_j: 
            mul $t2,$t0,$a1                                                                       #multiply i * n
            add $t2, $t2, $t1                                                                     #add j to i*n i.e. t2 = i*n+j   
            mul $t2, $t2,4                                                                        #to calculate number of bytes multiply by 4
            add $t2, $t2, $a2                                                                     #add base address of A i.e. A[i][j] = A(base address) + (i*n+j)*4
            
            lw $t2, 0($t2)                                                                        #load A[i][j] from stack 

            mul $t3,$t1,$a0                                                                       #multiply j * m
            add $t3, $t3, $t0                                                                     #add i to j*m i.e. t3 = j*m+i   
            mul $t3, $t3,4                                                                        #to calculate number of bytes multiply by 4
            add $t3, $t3, $a3                                                                     #add base address of B i.e. B[j][i] = B(base address) + (j*m+i)*4
            
            sw $t2, 0($t3)                                                                        #store word from t2 in stack at position t3 i.e. B[j][i]=A[i][j]
            
            addi $t1,$t1,1                                                                        #increment j
            blt $t1,$a1,loop_j                                                                    #check if j<n else if j>=n break the loop

        addi $t0,$t0,1                                                                            #increment i
        blt $t0, $a0,loop_i                                                                       #check if i<m else if i>=m break the loop
    jr $ra                                                                                        #return from the function once all elements from A are stored in B at appropriate indices

end:
    
    li $v0, 10                                                                                    #terminate the program
    syscall