# Assignement No.: 1
# Problem No.: 3
# Semester: Autumn 2022
# Group No.: 65
# Member 1: Pranav Mehrotra (20CS10085)
# Member 2: Saransh Sharma (20CS30065)



# This program checks whether n is a prime or a composite number,
# where n>=10 and it is entered by the user.

    .data
# program output text constants
prompt1:
    .asciiz "Enter a positive integer greater than equals to 10: "
err:
    .asciiz "Entered value is not valid!\n"
out1:
    .asciiz "Entered number is a "
out2:
    .asciiz "number.\n"
prime:
    .asciiz "PRIME "
composite:
    .asciiz "COMPOSITE "


    .text

# main program
#
# program variables
#   n:      $s0
#   i:      $s2
#   flag:   $s3

    .globl main
main:
    li      $v0, 4              # issue prompt1 and ask for input
    la      $a0, prompt1
    syscall                     

    li      $v0, 5
    syscall                     # get n from user
    move    $s0,$v0             # store n in $s0 register


    blt     $s0,10,error        # if n < 10, print error and terminate the program
    li      $s2,2               # Initialise variables
    li      $s3,1
    j       for
for:                            # Loop to check prime and composite
    ble     $s0,$s2,output      # if i==n, then n is a prime number
    div     $s0,$s2             # divide n by i and check remainder 
    mfhi    $t1
    beq		$t1, 0, set_comp    # if remainder==0, n is a composite number
    add     $s2,$s2,1           # else increment i
    b       for                 # continue loop
    
set_comp:                       # if n is composite number, set flag to 0
    li      $s3,0               
    j       output

comp:                           # Print "COMPOSITE number."
    li      $v0,4
    la      $a0, composite
    syscall
    li      $v0,4
    la      $a0,out2
    syscall
    j       terminate


prim:                           # Print "PRIME number."
    li      $v0,4
    la      $a0, prime
    syscall
    li      $v0,4
    la      $a0,out2
    syscall
    j       terminate

error:                          # if n<10, print error and terminate
    li      $v0,4
    la      $a0, err
    syscall
    j       terminate

output:                         # Print results
    li      $v0,4
    la      $a0, out1
    syscall

    beq     $s3,0,comp          # If Composite
    beq     $s3,1,prim          # If Prime


terminate:                     # Exit the program
    li      $v0,10
    syscall


