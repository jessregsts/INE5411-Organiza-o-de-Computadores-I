.data
b: .word 2
c: .word 0
d: .word 4
e: .word 1

.text
main:
    # Carrega valores da memoria
    la $s0, b
    la $s1, e
    la $s2, d
    lw $t0, 0($s2)
    lw $t8, 0($s0)
    lw $t9, 0($s1)

    ###### d� = d � d (bit a bit) ######
    li $t1, 0          # $t1 = acumulador para d�

    # Bit 0
    li $t3, 1          # M�scara para bit 0
    and $t4, $t0, $t3  # Isola bit 0
    sub $t7, $zero, $t4 # Cria m�scara de sele��o (0 ou 0xFFFFFFFF)
    sll $t5, $t0, 0    # d � 2? = d � 1
    and $t6, $t5, $t7  # Seleciona valor se bit=1
    add $t1, $t1, $t6  # Acumula

    # Bit 1
    li $t3, 2          # M�scara para bit 1
    and $t4, $t0, $t3  # Isola bit 1
    srl $t4, $t4, 1    # Desloca para bit 0
    sub $t7, $zero, $t4 # Cria m�scara de sele��o
    sll $t5, $t0, 1    # d � 2� = d � 2
    and $t6, $t5, $t7  # Seleciona valor se bit=1
    add $t1, $t1, $t6  # Acumula

    # Bit 2
    li $t3, 4          # M�scara para bit 2
    and $t4, $t0, $t3  # Isola bit 2
    srl $t4, $t4, 2    # Desloca para bit 0
    sub $t7, $zero, $t4 # Cria m�scara de sele��o
    sll $t5, $t0, 2    # d � 2� = d � 4
    and $t6, $t5, $t7  # Seleciona valor se bit=1
    add $t1, $t1, $t6  # Acumula

    # Bit 3
    li $t3, 8          # M�scara para bit 3
    and $t4, $t0, $t3  # Isola bit 3
    srl $t4, $t4, 3    # Desloca para bit 0
    sub $t7, $zero, $t4 # Cria m�scara de sele��o
    sll $t5, $t0, 3    # d � 2� = d � 8
    and $t6, $t5, $t7  # Seleciona valor se bit=1
    add $t1, $t1, $t6  # Acumula

    ###### d� = d� � d (bit a bit) ######
    li $t2, 0          # $t2 = acumulador para d�
    lw $t0, 0($s2)     # Recarrega d original

    # Bit 0
    li $t3, 1          # M�scara para bit 0
    and $t4, $t0, $t3  # Isola bit 0
    sub $t7, $zero, $t4 # Cria m�scara de sele��o
    sll $t5, $t1, 0    # d� � 2? = d� � 1
    and $t6, $t5, $t7  # Seleciona valor se bit=1
    add $t2, $t2, $t6  # Acumula

    # Bit 1
    li $t3, 2          # M�scara para bit 1
    and $t4, $t0, $t3  # Isola bit 1
    srl $t4, $t4, 1    # Desloca para bit 0
    sub $t7, $zero, $t4 # Cria m�scara de sele��o
    sll $t5, $t1, 1    # d� � 2� = d� � 2
    and $t6, $t5, $t7  # Seleciona valor se bit=1
    add $t2, $t2, $t6  # Acumula

    # Bit 2
    li $t3, 4          # M�scara para bit 2
    and $t4, $t0, $t3  # Isola bit 2
    srl $t4, $t4, 2    # Desloca para bit 0
    sub $t7, $zero, $t4 # Cria m�scara de sele��o
    sll $t5, $t1, 2    # d� � 2� = d� � 4
    and $t6, $t5, $t7  # Seleciona valor se bit=1
    add $t2, $t2, $t6  # Acumula

    # Bit 3
    li $t3, 8          # M�scara para bit 3
    and $t4, $t0, $t3  # Isola bit 3
    srl $t4, $t4, 3    # Desloca para bit 0
    sub $t7, $zero, $t4 # Cria m�scara de sele��o
    sll $t5, $t1, 3    # d� � 2� = d� � 8
    and $t6, $t5, $t7  # Seleciona valor se bit=1
    add $t2, $t2, $t6  # Acumula

    ## a = b+35
    addi $t8, $t8, 35
    #a+e
    add $t8, $t8, $t9
    ## c = d^3 - (a+e)
    lw $s3, c
    sub $s3, $t2, $t8

# O resultado final est� em $s3
    
    
