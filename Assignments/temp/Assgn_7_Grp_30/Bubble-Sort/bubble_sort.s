main:
    xor $20, $20        # base address of array = 0 ($20)
    xor $21, $21
    addi $21, 10        # $21 = n = 10
    xor $8, $8          # $8 = i = 0
    xor $9, $9          # $9 = j = 0

fori:
    xor $10, $10
    add $10, $8
    comp $11, $21
    add $10, $11
    addi $10, 1         # $10 = i - (n - 1) = i - n + 1
    bz $10, exitfori    # if i == n - 1, jump to exitfori
    xor $9, $9          # j = 0

forj:
    xor $11, $11
    add $11, $9
    add $11, $10        # $11 = j + i - n + 1
    bz $11, exitforj    # if j == n - i - 1, jump to exitforj

    xor $12, $12
    add $12, $9
    shll $12, 2         # 4 * j
    add $12, $20        # arr + 4 * j
    lw $13, 0($12)      # $13 = arr[j]
    xor $4, $4
    add $4, $12
    addi $12, 4
    lw $14, 0($12)      # $14 = arr[j + 1]
    xor $5, $5
    add $5, $12

    comp $15, $14
    add $13, $15        # arr[j] - arr[j + 1]
    bltz $13, incj
    bz $13, incj
    bl swap             # swap if arr[j] > arr[j + 1]

incj:
    addi $9, 1          # j = j + 1
    b forj

swap:
    lw $18, 0($4)
    lw $19, 0($5)
    sw $18, 0($5)
    sw $19, 0($4)
    br $31

exitforj:
    addi $8, 1          # i = i + 1
    b fori

exitfori:
    xor $16, $16    
    addi $16, 1         # to indicate completion

