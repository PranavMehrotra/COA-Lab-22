# Assignement No.: 4
# Problem No.: 3
# Semester: Autumn 2022
# Group No.: 65
# Member 1: Pranav Mehrotra (20CS10085)
# Member 2: Saransh Sharma (20CS30065)

# This program declares a static array and takes input from the user to fill the array.
# Then it sorts the array in ascending order, using recursive sort function.
# Finally it prints the sorted array.
# Finally, it finds the input key value in the sorted array using recursive search, and returns index if key is found, else returns -1.


    .data
array:
    .space 40                                                                                   #Allocating space for static array
prompt0:
    .asciiz "Please give 10 integers for the array: \n"                                         #prompt message to input 10 elements
prompt1:
    .asciiz "Enter an integer: "                                                                #prompt message for input of individual array elements
prompt2:
    .asciiz "Enter the value of key(to be searched in the array): "
nl:
    .asciiz "\n"                                                                                #output new line
print_message:
    .asciiz "Sorted array : "
espace:
    .asciiz ", "
found_it:
    .asciiz " is FOUND in the array at index "  
not_found_it:
    .asciiz " is NOT FOUND in the array.\n"  
full_stop:
    .asciiz ".\n"
    .text
    .globl main
    # Use of different registers as variables
    # $s0 : length
    # $s1 : key (to search)
main:                                                                                           # Main starts
    li $s0,10                                                                                   # Declaring length of array
    jal inp_arr                                                                                 # Calling array input function
    jal inp_k                                                                                   # Calling k input function
    move $s1,$v0                                                                                # Store the key in $s1

    la $a0,nl                                                                                   # Loading address of new line
    li $v0,4
    syscall                                                                                     # Printing new line

    la $a0,array                                                                                # Loading address of array
    # li $t0,0                                                                                  # Initializing i to 0, for sort function
    li $a1,0
    li $a2,9
    jal sort_array                                                                              # Calling sort function
    li $s0,10
    la $s2,array
    jal print_arr
    la $a0,nl                                                                                   # Loading address of new line
    li $v0,4
    syscall                                                                                     # Printing new line
    la $a0,array
    li $a1,0
    li $a2,9
    move $a3,$s1
    jal recursive_search
    move $s2,$v0
    blt $s2,$zero,print_negative_output
    j print_positive_output
    j end

inp_k:
    la $a0,prompt2                                                                              # Output prompt for input of k
    li $v0,4
    syscall
    li $v0,5                                                                                    # Input of k
    syscall
    jr $ra

inp_arr:                                                                                        # Function to take the input of the array
    la $a0,prompt0                                                                              # Output prompt for input of 10 array elements
    li $v0,4
    syscall
    li $t0,0                                                                                    # Initializing i to 0, for loop
    j loop                                                                                      # Jump to loop

loop:
    beq $t0,$s0,return                                                                          # If i is equal to length of array, then return
    la $a0,prompt1                                                                              # Output prompt for input of individual array elements
    li $v0,4
    syscall
    li $v0,5
    syscall                                                                                     # Input of individual array elements
    move $t1,$t0
    mul $t1,$t1,4                                                                               # Multiplying by 4 to get address of array element at i index
    sw $v0,array($t1)                                                                           # Storing ith element in array
    addi $t0,$t0,1                                                                              # Incrementing i by 1
    b loop                                                                                      # Continuing the loop

print_positive_output:
    move $a0,$s1
    li $v0,1
    syscall
    la $a0,found_it
    li $v0,4
    syscall
    move $a0,$s2
    li $v0,1
    syscall
    la $a0,full_stop
    li $v0,4
    syscall
    j end

print_negative_output:
    move $a0,$s1
    li $v0,1
    syscall
    la $a0,not_found_it
    li $v0,4
    syscall
    j end


print_arr:                                                                                      # Print the array to the console
    li $t0,0
    la $a0,print_message
    li $v0,4
    syscall
    move $t6,$s0
    addi $t6,$t6,-1
    printing_loop:                                                                              # Loop to print individual array elements
        beq $t0,$t6,print_last_ele
        move $t1,$t0
        mul $t1,$t1,4
        lw $a0,array($t1)                                                                       # Loading array element in the $a0 register to print
        li $v0,1
        syscall
        la $a0,espace                                                                           # Printing seperator: ", "
        li $v0,4
        syscall
        addi $t0,$t0,1
        b printing_loop                                                                         # Continue the loop
    print_last_ele:                                                                             # Print last array element seperately
        move $t1,$t0
        mul $t1,$t1,4
        lw $a0,array($t1)
        li $v0,1
        syscall
        j return

swap:                                                                                           # Function to swap two elements in array, given their addresses
    lw $t8,0($a0)                                                                               # Loading first element in $t7
    lw $t9,0($a1)                                                                               # Loading second element in $t8
    sw $t9,0($a0)                                                                               # Storing second element in first element's address
    sw $t8,0($a1)                                                                               # Storing first element in second element's address
    jr $ra                                                                                      # return to caller function

# Registers and Stack Positions of different variables
# t2, 4($sp) : l
# t3, 8($sp) : r
# t4, 12($sp): p
# a0,t5 : address of A
# a1,t6, 16($sp) : left
# a2,t7, 20($sp) : right

sort_array:                                                                                     # Function to sort the array in ascending order, using recursive sort
    addi $sp,$sp,-24                                                                            # Making space for 6 variables
    sw $ra,0($sp)                                                                               # Storing return address in stack
    move $t2,$a1                                                                                # Initialising l to 'left' in t2
    move $t3,$a2                                                                                # Initialising r to 'right' in t3
    move $t4,$a1                                                                                # Initialising p to 'left' in t4
    move $t5,$a0                                                                                # Initialising address of A to $t5
    move $t6,$a1                                                                                # Storing 'left' in t6
    move $t7,$a2                                                                                # Storing 'right' in t7
    while:                                                                                      # Loop to sort the array
        bge $t2,$t3,ret                                                                         # if l >= r, then break the loop and return
        while_l_p:                                                                              # Inner while loop to increment l, upto  A[l] <= A[p] and l < right
            bge $t2,$t7,while_r_p                                                               # break the loop if l >= right
            # Loading A[l] and A[p] in $s2 and $s4 to compare the second condition of the loop
            sll $s2,$t2,2
            sll $s4,$t4,2
            add $s2,$s2,$t5
            add $s4,$s4,$t5
            lw $s2,0($s2)
            lw $s4,0($s4)
            bgt $s2,$s4,while_r_p                                                               # If A[l] > A[p], then break the loop
            addi $t2,$t2,1                                                                      # Else add 1 to l
            j while_l_p                                                                         # Continue the loop
        while_r_p:                                                                              # Inner while loop to decrement r, upto A[r] >= A[p] and r > left
            ble $t3,$t6,if_l_r                                                                  # break the loop if r <= left
            # Loading A[r] and A[p] in $s3 and $s4 to compare the second condition of the loop
            sll $s3,$t3,2
            sll $s4,$t4,2
            add $s3,$s3,$t5
            add $s4,$s4,$t5
            lw $s3,0($s3)
            lw $s4,0($s4)
            blt $s3,$s4,if_l_r                                                                  # If A[r] < A[p], then break the loop
            addi $t3,$t3,-1                                                                     # Else decrement r by 1
            j while_r_p                                                                         # Continue the loop
        if_l_r:                                                                                 # If l>=r, then
            blt $t2,$t3,swap_l_r                                                                # If l<r, then branch to Swap(A[l],A[r])
            # Else , Swap A[p] and A[r]
            sll $s4,$t4,2
            sll $s3,$t3,2
            # Load addresses of A[p] and A[r] in $a0 and $a1
            add $a0,$t5,$s4 
            add $a1,$t5,$s3
            jal swap                                                                            # Call Swap
            # Store all 5 variables in stack
            sw $t2,4($sp)
            sw $t3,8($sp)
            sw $t4,12($sp)
            sw $t6,16($sp)
            sw $t7,20($sp)
            # Load the parameters in a0, a1 and a2
            move $a0,$t5
            move $a1,$t6
            move $a2,$t3
            addi $a2,$a2,-1
            jal sort_array                                                                      # Recursive call to sort_array
            # Load all 5 variables from stack, after the recursive call to function returns
            lw $t2,4($sp)
            lw $t3,8($sp)
            lw $t4,12($sp)
            lw $t6,16($sp)
            lw $t7,20($sp)
            # Load the parameters in a0, a1 and a2
            move $a0,$t5
            move $a1,$t3
            addi $a1,$a1,1
            move $a2,$t7
            # Store all 5 variables in stack
            sw $t2,4($sp)
            sw $t3,8($sp)
            sw $t4,12($sp)
            sw $t6,16($sp)
            sw $t7,20($sp)
            jal sort_array                                                                      # Recursive call to sort_array
            # Load all 5 variables from stack, after the recursive call to function returns
            lw $t2,4($sp)
            lw $t3,8($sp)
            lw $t4,12($sp)
            lw $t6,16($sp)
            lw $t7,20($sp)
            j ret                                                                               # Return from the function and pass the control to the caller function
        # If l<r, then Swap(A[l],A[r])
        swap_l_r:
            sll $s2,$t2,2
            sll $s3,$t3,2
            add $a0,$t5,$s2                                                                     # Load address of A[l] in $a0
            add $a1,$t5,$s3                                                                     # Load address of A[r] in $a1
            jal swap                                                                            # Call Swap
    j while                                                                                     # Continue the loop

# Function to return from sort function by loading the return address from current stack pointer
# and releasing the space by incrementing the stack pointer
# and passing the control to the caller function
return_sort:
    lw $ra,0($sp)
    addi $sp,$sp,24
    j return

# Registers of different variables used in the function
# $t1 : start
# $t2 : end
# $t3 : mid1
# $t4 : mid2
# $t5 : (end - start)/3
# $t6 : 3
recursive_search:                                                                               # Function to search for the element in the array using recursive search
    addi $sp,$sp,-4                                                                             # Decrement stack pointer by 4,to create space for return address
    sw $ra,0($sp)                                                                               # Store return address in stack
    move $t1,$a1                                                                                # Store 'start' in t1
    move $t2,$a2                                                                                # Store 'end' in t2
    bgt $t1,$t2,not_found                                                                       # If start > end, then branch to not_found and return -1
    # Calculate mid1 and mid2
    move $t3,$t1
    move $t4,$t2
    sub $t5,$t2,$t1                                                                             # Calculate (end - start)
    li $t6,3                                                                                    # Load 3 in t6
    div $t5,$t6                                                                                 # Calculate (end - start)/3
    mflo $t5                                                                                    # Store the quotient in t5 by moving the value from 'lo' register to t5
    add $t3,$t3,$t5                                                                             # Calculate mid1
    sub $t4,$t4,$t5                                                                             # Calculate mid2
    # Load A[mid1] and A[mid2] in $s3 and $s4
    sll $s3,$t3,2
    sll $s4,$t4,2
    add $s3,$s3,$a0
    add $s4,$s4,$a0
    lw $s3,0($s3)
    lw $s4,0($s4)
    beq $a3,$s3,mid1                                                                            # If A[mid1] == key, then branch to 'mid1'
    beq $a3,$s4,mid2                                                                            # If A[mid2] == key, then branch to 'mid2'
    blt $a3,$s3,less_than                                                                       # If key < A[mid1], then branch to 'less_than'
    bgt $a3,$s4,greater_than                                                                    # If key > A[mid2], then branch to 'greater_than'
    # Else
    # Load the parameters in a1 and a2, mid1+1 and mid2-1 in a1 and a2 respectively
    # a0 still contains the address of the array
    move $a1,$t3
    move $a2,$t4
    addi $a1,$a1,1
    addi $a2,$a2,-1
    jal recursive_search                                                                        # Recursive call to recursive_search
    j return_recursive_search                                                                   # Jump to return_recursive_search, to load the return address from stack and return the control to the caller function
    mid1:
        move $v0,$t3                                                                            # Load mid1 in v0, to return mid1 as the answer
        j return_recursive_search                                                               # Jump to return_recursive_search, to load the return address from stack and return the control to the caller function
    mid2:
        move $v0,$t4                                                                            # Load mid2 in v0, to return mid2 as the answer
        j return_recursive_search                                                               # Jump to return_recursive_search, to load the return address from stack and return the control to the caller function
    less_than:
        # Load mid1-1 in a2
        move $a2,$t3
        addi $a2,$a2,-1
        jal recursive_search                                                                    # Recursive call to recursive_search
        j return_recursive_search                                                               # Jump to return_recursive_search, to load the return address from stack and return the control to the caller function
    greater_than:
        # Load mid2+1 in a1
        move $a1,$t4
        addi $a1,$a1,1
        jal recursive_search                                                                    # Recursive call to recursive_search
        j return_recursive_search                                                               # Jump to return_recursive_search, to load the return address from stack and return the control to the caller function
    not_found:
        li $v0,-1                                                                               # Load -1 in v0, to return -1 as the answer, No key found
        j return_recursive_search                                                               # Jump to return_recursive_search, to load the return address from stack and return the control to the caller function

# Function to return from recursive search function by loading the return address from current stack pointer
# and releasing the space by incrementing the stack pointer
# and passing the control to the caller function
return_recursive_search:
    lw $ra,0($sp)
    addi $sp,$sp,4
    j return

return:                                                                                         # Return from a callee function to the caller function, assuming $ra stores the return address
    jr $ra

end:                                                                                            # Exit the program
    li $v0,10
    syscall