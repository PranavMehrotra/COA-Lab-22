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
    .space 40                                                                                   #Allocating space for static array
prompt0:
    .asciiz "Please give 10 integers for the array: \n"                                         #prompt message to input 10 elements
prompt1:
    .asciiz "Enter an integer: "                                                                #prompt message for input of individual array elements
nl:
    .asciiz "\n"                                                                                #output new line
print_message:
    .asciiz "Sorted array : "
espace:
    .asciiz ", "

    .text
    .globl main
    # Use of different registers as variables

main:                                                                                           # Main starts
    li $s0,10                                                                                   #Declaring length of array
    jal inp_arr                                                                                 # Calling array input function
    # jal inp_k                                                                                   # Calling k input function

    la $a0,nl                                                                                   # Loading address of new line
    li $v0,4
    syscall                                                                                     # Printing new line

    la $a0,array                                                                                # Loading address of array
    # li $t0,0                                                                                    # Initializing i to 0, for sort function
    li $a1,0
    li $a2,9
    jal sort_array                                                                              # Calling sort function
    li $s0,10
    la $s2,array
    jal print_arr
    j end

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


# t2, 4($sp) : l
# t3, 8($sp) : r
# t4, 12($sp): p
# a0,t5 : address of A
# a1,t6, 16($sp) : left
# a2,t7, 20($sp) : right

sort_array:
    addi $sp,$sp,-24
    sw $ra,0($sp)
    move $t2,$a1
    move $t3,$a2
    move $t4,$a1
    move $t5,$a0
    move $t6,$a1
    move $t7,$a2
    while:
        bge $t2,$t3,ret
        while_l_p:
            bge $t2,$t7,while_r_p
            sll $s2,$t2,2
            sll $s4,$t4,2
            add $s2,$s2,$t5
            add $s4,$s4,$t5
            lw $s2,0($s2)
            lw $s4,0($s4)
            bgt $s2,$s4,while_r_p
            addi $t2,$t2,1
            j while_l_p
        while_r_p:
            ble $t3,$t6,if_l_r
            sll $s3,$t3,2
            sll $s4,$t4,2
            add $s3,$s3,$t5
            add $s4,$s4,$t5
            lw $s3,0($s3)
            lw $s4,0($s4)
            blt $s3,$s4,if_l_r
            addi $t3,$t3,-1
            j while_r_p
        if_l_r:
            blt $t2,$t3,swap_l_r
            sll $s4,$t4,2
            sll $s3,$t3,2
            add $a0,$t5,$s4
            add $a1,$t5,$s3
            jal swap
            sw $t2,4($sp)
            sw $t3,8($sp)
            sw $t4,12($sp)
            sw $t6,16($sp)
            sw $t7,20($sp)
            move $a0,$t5
            move $a1,$t6
            move $a2,$t3
            addi $a2,$a2,-1
            jal sort_array
            lw $t2,4($sp)
            lw $t3,8($sp)
            lw $t4,12($sp)
            lw $t6,16($sp)
            lw $t7,20($sp)
            move $a0,$t5
            move $a1,$t3
            addi $a1,$a1,1
            move $a2,$t7
            sw $t2,4($sp)
            sw $t3,8($sp)
            sw $t4,12($sp)
            sw $t6,16($sp)
            sw $t7,20($sp)
            jal sort_array
            lw $t2,4($sp)
            lw $t3,8($sp)
            lw $t4,12($sp)
            lw $t6,16($sp)
            lw $t7,20($sp)
            j ret
        swap_l_r:
            sll $s2,$t2,2
            sll $s3,$t3,2
            add $a0,$t5,$s2
            add $a1,$t5,$s3
            jal swap
    j while

ret:
    lw $ra,0($sp)
    addi $sp,$sp,24
    j return


return:                                                                                         # Return from a callee function to the caller function, assuming $ra stores the return address
    jr $ra

end:                                                                                            # Exit the program
    li $v0,10
    syscall