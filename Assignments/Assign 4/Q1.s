# Assignement No.: 2
# Problem No.: 1
# Semester: Autumn 2022
# Group No.: 65
# Member 1: Pranav Mehrotra (20CS10085)
# Member 2: Saransh Sharma (20CS30065)
 
#This program takes in input n,a,r and m. A nXn matrix is constructed in row major form using the the geometric series with first term a and common ratio r(taken mod wrt to m) 
# and first prints the matrix. It then computes determinant recursively by calculating minors and cofactors


  .globl  main

    .data

input:     
    .asciiz "Enter four positive integers n, a, r and m:\n"                                     #prompt message for input


error:
    .asciiz "One of the entered number is not-positive. Kindly enter again! "                   #error out of bound message

newline:
    .asciiz "\n"                                                                                #newline character

matrix_A:
    .asciiz "Matrix A:\n\n"                                                                     #Label for Matrix A

output:
    .asciiz "Final determinant of the matrix A is: "                                            #Label for output message

space:                                                                                          #space character
    .asciiz " "

    .text

main:                                                                                           #main starts
    
    la   $a0,input                                                                              #printing the message for input 
    li   $v0,4
    syscall

    li   $v0,5                                                                                  #reading the n (s0 = n)
    syscall
    move $s0,$v0

    li   $v0,5                                                                                  #reading the a (s1 = a)
    syscall
    move $s1,$v0

    li   $v0,5                                                                                  #reading the r (s2 = r)
    syscall
    move $s2,$v0

    li   $v0,5                                                                                  #reading the m (s3 = m)
    syscall
    move $s3,$v0

    ble  $s0, 0, error_message                                                                  #check if n>0 else print error message
    ble  $s1, 0, error_message                                                                  #check if a>0 else print error message
    ble  $s2, 0, error_message                                                                  #check if r>0 else print error message
    ble  $s3, 0, error_message                                                                  #check if m>0 else print error message

    
    mul  $t0, $s0, $s0                                                                          #t0 = s0 * s0 i.e. matrix A is of size n*n  
    mul  $t0, $t0, 4                                                                            #t0 stores the size of array we have and each element occupies 4 bytes therefore total bytes needed 4*so*so
    sub	 $sp, $sp, $t0                                                                          # sp = sp - (4*size), create space in stack to store these elements
    move $s4, $sp                                                                               #store the base address of created array in $s4
       
    move $t0, $0                                                                                #t0 stores the index where the number will be inserted in matrix A
    li   $t1, 1                                                                                 #to keep track of what is multiplied by a to generate GP that is (powers of r) t1 = r^0 

    matrix_A_complete:
        mul  $t3, $s1,$t1                                                                       #generate element of GP by multiplying a and power of r and store in $t3 
        mul  $t2, $t0,4                                                                         #calculate address to insert the element by multiplying index by sizeof(int)
        add  $t2, $t2,$s4                                                                       #add base address of array to get the actual address of A[index] = A(base address) + index*sizeof(int)
        div  $t3, $s3                                                                           #divide ar^n by m
        mfhi $t3                                                                                #store the remainder of the previous division i.e (ar^n) mod m
        sw   $t3, 0($t2)                                                                        #store word stored in t3 in t2 that store the GP element at appropriate address in stack
    
        mul  $t1, $t1, $s2                                                                      #multiply $t1 by r to get the next power of r to be multiplied to a to generate elemnets of GP
        div  $t1,$s3                                                                            #divide r^n by m
        mfhi $t1                                                                                #t3 = r^n mod m
        addi $t0, $t0,1                                                                         #index++
        mul  $t2, $s0,$s0                                                                       #store the size of array i.e. n*n in t2
        blt  $t0, $t2, matrix_A_complete                                                        #if index < n*n continue adding elements else print the completed matrix

    li   $v0, 4                                                                                 #print message for Matrix A
    la   $a0, matrix_A
    syscall

    move $a0, $s0                                                                               #pass the size of matrix i.e. n as first parameter in a0
    move $a1, $s4                                                                               #pass the array to be printed i.e. A as third parameter in a2
    jal  printMatrix                                                                            #call printMatrix function with appropriate parameters

    move $a0, $s0                                                                               #pass n as the first parameter
    move $a1, $s4                                                                               #pass matrix A whose determinant needs to be calculated as second parameter
    jal  determinant                                                                            #call detreminant function which will return the determinant of the matrix

    move $t0,$v0                                                                                #store the determinant temporarily in t0
    
    la   $a0,newline                                                                            #printing a new line 
    li   $v0,4
    syscall

    la   $a0,output                                                                             #printing the output message 
    li   $v0,4
    syscall
    
    li   $v0, 1                                                                                 #print the determinant          
    move $a0, $t0
    syscall

    j    end                                                                                    #terminate the programme

error_message:
    la $a0,error                                                                                #print the error message 
    li $v0,4
    syscall

    la $a0,newline                                                                              #print a newline
    li $v0,4
    syscall

    j main                                                                                      #re-prompt the user to enetr numbers again

printMatrix:
    addi $sp, $sp, -8                                                                           #create space in stack to save parameters
    sw   $s0, 0($sp)                                                                            #save s0 i.e. n in memory
    sw   $s4,4($sp)                                                                             #save s4 i.e. base address of A in memory
    li   $t0,0                                                                                  #initialise i=0
    move $s0,$a0                                                                                #store n in $s0
    move $s4,$a1                                                                                #store base address of A in $s4
    i_loop:
        li $t1,0                                                                                #initialise j=0           

        #A when converted to row major form A[i][j] will be stored at index i*n+j where n is the number of columns 
        j_loop:
            mul  $t2,$t0,$s0                                                                    #multiply i * n
            add  $t2, $t2, $t1                                                                  #add j to i*n i.e. t2 = i*n+j   
            mul  $t2, $t2,4                                                                     #to calculate bytes multiple by 4
            add  $t2, $t2, $s4                                                                  #A[i][j] = A(base address) + (i*n+j)*4
            
            lw   $t2, 0($t2)                                                                    #load the word from stack

            li   $v0, 1                                                                         #print $t2 i.e. A[i][j] 
            move $a0, $t2                                            
            syscall

            li   $v0, 4                                                                         #print space after every element
            la   $a0, space
            syscall
            
            addi $t1,$t1,1                                                                      #increment j column counter
            blt  $t1,$s0,j_loop                                                                 #check if j<n if j>=n break the loop  

        li   $v0, 4                                                                             #print a newline after all the elements of a row are printed
        la   $a0, newline 
        syscall

        addi $t0,$t0,1                                                                          #increment i row counter
        blt  $t0, $s0,i_loop                                                                    #check if i<n
    
    lw   $s0, 0($sp)                                                                            #restore the old value stored in $s0
    lw   $s4, 4($sp)                                                                            #restore the old value stored in $s4
    addi $sp, $sp, 8                                                                            #pop the two elements and restore the original stack size
    jr   $ra                                                                                    #return once all the elements are printed 

determinant:                                                                                    #determinant function
    # $s0 and $s4 initially contained n and base address of A but during determinant function they will store other values
    #therefore, we save the old values of these registers and would restore them once we return from the function


    addi $sp, $sp, -32                                                                          #first create space for 8 variable in stack
    sw   $s0, 0($sp)                                                                            #store the value stored in $s0 in memory
    sw   $s1, 4($sp)                                                                            #store the value stored in $s1 in memory
    sw   $s2, 8($sp)                                                                            #store the value stored in $s2 in memory
    sw   $s3, 12($sp)                                                                           #store the value stored in $s3 in memory
    sw   $s4, 16($sp)                                                                           #store the value stored in $s4 in memory
    sw   $s5, 20($sp)                                                                           #store the value stored in $s5 in memory
    sw   $ra, 24($sp)                                                                           #store the previous return address $ra in memory
    sw   $fp, 28($sp)                                                                           #store the previous frame pointer in memory

    #s0 will store the size of matrix A
    #s1 will store the base address of A whose determinant needs to be calculated
    #s2 will store the column index to be hidden
    #s3 will store the base adddress of intermediate matrix A_intermediate whose minor would be calculated
    #s4 will store the current sum i.e. th determinant value
    #s5 will store the sign which would be useful as adjacent cofactors changes sign

    move $s0, $a0                                                                               #s0 = n
    move $s1, $a1                                                                               #s1 = A
    li   $s2, 0                                                                                 #s2 column to be skipped = 0

    li   $s4, 0                                                                                 #initialise current sum (determinant value)(sum of cofactor*A[i][j]) to 0
    li   $s5, 1                                                                                 #initialise current sign to +1

    add  $t0, $s0,-1                                                                            #t0 = n-1 i.e. size of A_intermediate
    mul  $t0, $t0, $t0                                                                          #t0 = t0 * t0 i.e. matrix A_intermediate is of size (n-1)*(n-1)  
    mul  $t0, $t0, 4                                                                            #t0 stores the size of array we have and each element occupies 4 bytes
    sub	 $sp, $sp, $t0                                                                          #sp = sp - (4*size), create space in stack to store these elements
    move $s3, $sp                                                                               #save the base address of array in $s3  

    beq  $s0, 1 base_cond                                                                       #if n==1 return the only element in A i.e. base condition of recursion

loop:                                                                                           #else loop begins
    
    matrix_A_intermediate:                                                                      #to fill intermediate matrix A_intermediate formed by hiding ith row (0th row) and jth column
        li $t0,1                                                                                #current row i=0
        li $t1,0                                                                                #current column j=0
        li $t2,0                                                                                #counter to store the address of A_intermediate where new data can be entered 
                                                                                                #base address of A_intermediate + t2 will represent the memory space where the element has to be inserted
        
        fill_intermediate:                                                                      #loop to fill the elements of A_intermediate
            beq  $t1, $s2, loop_next	                                                        #if current column==column to be skipped, go to loop next i.e. skip this column
            mul  $t3, $t0, $s0                                                                  #t3 = i*n
            add  $t3, $t3,$t1                                                                   #t3 = i*n+j 
            mul  $t3, $t3, 4                                                                    #t3 = 4(i*n+j)
            add  $t3, $s1, $t3                                                                  #t3 = address of (A[i][j])
            add  $t4, $t2, $s3                                                                  #t4 = address of (A_intermediate[t2])
            lw   $t3, 0($t3)                                                                    #$t3 = A[current row][current column]
            sw   $t3, 0($t4)                                                                    #store A_intermediate[t2] = A[i][j]
            addi $t2,$t2, 4                                                                     #t2 = t2 + 4 that is offset for the next element in A_intermediate
            
loop_next:
    addi $t1,$t1,1                                                                              #increment current column by 1
    blt  $t1, $s0, fill_intermediate                                                            #if current column< num of column (n) continue filling

    li   $t1, 0                                                                                 #once all columsn correspondingto a row are filled that is if (current_column == n) reset column index to 0
    add  $t0,$t0, 1                                                                             #increment the current row counter i.e. start copying elemenst from another row
    blt  $t0, $s0, fill_intermediate                                                            #while not all rows are copies in A_intermediate i.e. current_row<n continue filling   
    
    #A_intermediate now store A when ith row(0 in this case) and column specified in s2 are hidden
    addi $t0, $s0,-1                                                                            #t0 = n-1 size of A-intermediate

    move $a0,$t0                                                                                #pass n-1 to a0 that is first parameter
    move $a1,$s3                                                                                #pass base address of A_intermediate as second parameter
    jal  determinant                                                                            #calculate determinant of A_intermediate i.e. Minor   
    
    move $t0,$v0                                                                                #store the computed determinant of the small matrix in t0 i.e. minor 

    mul  $t1, $s2, 4                                                                            #$t1 = column index(to be skipped) * 4
    add  $t1, $t1, $s1                                                                          #$t1 = base address of A + column index(to be skipped) * 4
    lw   $t1, 0($t1)                                                                            #$t1 = A[0][column index] the element wrt whom the minor was calculated 
    mul  $t1, $t1, $t0                                                                          #$t1 = minor wrt element A[0, column index] * A[0][column index]
    mul  $t1, $t1, $s5                                                                          #$t0 = sign * minor wrt element A[0, column index] * A[0][column index](sign = -1^(i+j)) 
    add  $s4, $s4, $t1                                                                          #current sum += cofactor wrt A[0, column index] * A[0][column index]
    mul  $s5, $s5, -1                                                                           #sign = -sign i.e. sign flips after every column is skipped sign(0,0) = +, sign (0,1) = -1, sign (0,2) = +....

      
    addi $s2,$s2,1                                                                              #move to the next column and hide that
    blt  $s2,$s0, loop                                                                          #now reinitiate the fill A_intermediate process and then corresponding minor, cofactor calculation 
    j    determinant_end                                                                        #once all cofactors are calculated and appropriate sum is calculated

base_cond:
    lw   $s4,0($s1)                                                                             #if n==1 sum = only element in A i.e. A[0]

determinant_end:
    #once all the cofactor calculation is over and s5 stores the current determinant or sum value 
    #pop out all elements of A_intermediate from stack and restore variables
    addi $t0, $s0, -1                                                                           #$t0 = n - 1
    mul  $t0, $t0, $t0                                                                          #$t0 = (n-1)*(n-1)
    mul  $t0, $t0, 4                                                                            #$t0 = 4*(n-1)*(n-1)
    add  $sp, $sp, $t0                                                                          #deallocate A_intermediate

    move $t0, $s4                                                                               #store the sum(determinant) in t0
    lw   $s0, 0($sp)                                                                            #restore previous value of $s0 
    lw   $s1, 4($sp)                                                                            #restore previous value of $s1
    lw   $s2, 8($sp)                                                                            #restore previous value of $s2
    lw   $s3, 12($sp)                                                                           #restore the previous value of $s3
    lw   $s4, 16($sp)                                                                           #restore the previous value of $s4
    lw   $s5, 20($sp)                                                                           #restore the previous value of $s5
    lw   $ra, 24($sp)                                                                           #restore the previous return address $ra
    lw   $fp, 28($sp)                                                                           #restore the previous file pointer
    addi $sp, $sp, 32                                                                           #deallocate the space that was created to store variables
    move $v0, $t0                                                                               #pass the sum to v0 
    jr   $ra                                                                                    #return from the function with determinant value stored in v0
end:
    
    li   $v0, 10                                                                                #terminate the program
    syscall