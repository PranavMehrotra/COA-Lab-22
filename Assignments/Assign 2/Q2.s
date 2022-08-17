# Assignement No.: 2
# Problem No.: 2
# Semester: Autumn 2022
# Group No.: 65
# Member 1: Pranav Mehrotra (20CS10085)
# Member 2: Saransh Sharma (20CS30065)

# This program declares a static array and takes input from the user to fill the array.
# Then it sorts the array in ascending order.
# Finally it prints the kth largest element in the array, where k is given by the user as input.


    .data
array:
    .space 40 #Allocating space for static array
prompt0:
    .asciiz "Please give 10 integers for the array: \n" #prompt message to input 10 elements
prompt1:
    .asciiz "Enter an integer: " #prompt message for input of individual array elements
prompt2:
    .asciiz "Enter the value of k: " # prompt message for input of k 
prompt3:
    .asciiz "The " #prompt message for output first part
prompt4:
    .asciiz " largest element is: " #prompt message for output second part
first:
    .asciiz "st" # message if k==1
second:
    .asciiz "nd" # message if k==2
third:
    .asciiz "rd" # message if k==3
nth:
    .asciiz "th" # message if k>3
nl:
    .asciiz "\n" #output new line
error_k_g:
    .asciiz "ERROR: k entered greater than the length of the array" #error message for k greater than array length
error_k_s:
    .asciiz "ERROR: k entered is zero or negative" #error message for k is zero or negative
try_again:
    .asciiz "Try again" # if error in k, then try again
espace:
    .asciiz ", "

    .text
    .globl main
    # Use of different registers as variables
    # $s0 : length of array
    # $s1 : k
    # $s2 : array
    # $t0 : i, for loops

main:   # Main starts
    li $s0,10       #Declaring length of array
    jal inp_arr     # Calling array input function
    jal inp_k       # Calling k input function

    la $a0,nl       # Loading address of new line
    li $v0,4
    syscall         # Printing new line

    la $s2,array    # Loading address of array
    li $t0,0        # Initializing i to 0, for sort function
    jal sort        # Calling sort function
    la $a0,prompt3  # Output prompt for first part of output
    li $v0,4
    syscall
    move $a0,$s1    # Output k
    li $v0,1
    syscall
    li $t2,1       # Initializing t2 to 1, for printing suffix of k
    beq $s1,$t2,fir
    addi $t2,$t2,1
    beq $s1,$t2,sec
    addi $t2,$t2,1
    beq $s1,$t2,thi
    bgt $s1,$t2,genth
    ret_out:
        la $a0,prompt4  # Output prompt for second part of output
        li $v0,4
        syscall
        move $t1,$s0    # Loading length of array
        sub $t1,$t1,$s1 # Subtract k from length of array, (n-k)
        mul $t1,$t1,4   # Multiplying by 4 to get address of array element at (n-k)th index
        lw $a0,array($t1) # Loading kth largest element
        li $v0,1
        syscall # Output kth largest element

    
    la $a0,nl
    li $v0,4
    syscall # Printing new line

    j end   # Exit program

inp_arr: # Function to take the input of the array
    la $a0,prompt0 # Output prompt for input of 10 array elements
    li $v0,4
    syscall
    li $t0,0 # Initializing i to 0, for loop
    j loop # Jump to loop

loop:
    beq $t0,$s0,return # If i is equal to length of array, then return
    la $a0,prompt1 # Output prompt for input of individual array elements
    li $v0,4
    syscall
    li $v0,5
    syscall # Input of individual array elements
    move $t1,$t0
    mul $t1,$t1,4   # Multiplying by 4 to get address of array element at i index
    sw $v0,array($t1)   # Storing ith element in array
    addi $t0,$t0,1 # Incrementing i by 1
    b loop # Continuing the loop

inp_k:
    la $a0,prompt2 # Output prompt for input of k
    li $v0,4
    syscall
    li $v0,5 # Input of k
    syscall
    move $s1,$v0 # Storing k in $s1
    b check_k # Sanity check of k

check_k:
    ble $s1,$0,error_k_small # If k is zero or negative, then error_k_small
    bgt $s1,$s0,error_k_great # If k is greater than length of array, then error_k_great
    j return # Else if k is within bounds, then return

error_k_great:
    la $a0,error_k_g # Output error message for k greater than length of array
    li $v0,4
    syscall
    la $a0,nl   # Output new line
    li $v0,4
    syscall
    la $a0,try_again # Output try again
    li $v0,4
    syscall
    la $a0,nl # Output new line
    li $v0,4
    syscall
    j inp_k # Again take input of k

error_k_small:
    la $a0,error_k_s # Output error message for k is zero or negative
    li $v0,4
    syscall
    la $a0,nl # Output new line
    li $v0,4
    syscall
    la $a0,try_again # Output try again
    li $v0,4
    syscall
    la $a0,nl # Output new line
    li $v0,4
    syscall
    j inp_k # Again take input of k

fir: # Output suffix for k if k == 1
    la $a0,first
    li $v0,4
    syscall
    j ret_out
sec: # Output suffix for k if k == 2
    la $a0,second
    li $v0,4
    syscall
    j ret_out
thi: # Output suffix for k if k == 3
    la $a0,third
    li $v0,4
    syscall
    j ret_out
genth: # Output suffix for k if k > 3
    la $a0,nth
    li $v0,4
    syscall
    j ret_out

swap: # Function to swap two elements in array, given their addresses
    lw $t7,0($a0) # Loading first element in $t7
    lw $t8,0($a1) # Loading second element in $t8
    sw $t8,0($a0) # Storing second element in first element's address
    sw $t7,0($a1) # Storing first element in second element's address
    jr $ra # return to caller function


sort: # Function to sort array in ascending order, using bubble sort algorithm
    bge $t0,$s0,return # If i is greater than or equal to length of array, then return
    addi $t0,$t0,1 # Incrementing i by 1
    li $t1,0 # Initializing j to 0, for inner loop
    move $t2,$s0 # Initializing t2 to length of array
    sub $t2,$t2,$t0 # Subtracting i from length of array, (n-i)
    for_inner: # Inner loop for bubble sort
        bge $t1,$t2,sort # If j is greater than or equal to (n-i), then break the inner loop
        mul $t3,$t1,4 # Multiplying by 4 to get address of array element at j index
        # Loading address of the jth element in $t4 
        add $s5,$s2,$t3
        move $t4,$s5
        # Loading address of the (j+1)th element in $t5
        addi $t3,$t3,4
        add $s5,$s2,$t3
        move $t5,$s5
        move $a0,$t4 # Copying the address of the jth element in $a0
        move $a1,$t5 # Copying the address of the (j+1)th element in $a1
        addi $t1,$t1,1 # Incrementing j by 1
        lw $t4,0($t4) # Loading the jth element in $t4
        lw $t5,0($t5) # Loading the (j+1)th element in $t5
        ble $t4,$t5,for_inner # Comparing the jth and (j+1)th element, if jth element is greater than (j+1)th element, then swap them, else continue the inner loop
        move $s4,$ra # Storing the return address of sort function in $s4, for later use
        jal swap # Calling swap function to swap the jth and (j+1)th element
        move $ra,$s4 # Restoring the return address of sort function from $s4 to $ra
        j for_inner # Continuing the inner loop


return: # Return from a callee function to the caller function, assuming $ra stores the return address
    jr $ra

end: # Exit the program
    li $v0,10
    syscall