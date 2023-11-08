
addi s1, zero, 1 # espaço da ram q vou alocar

addi s2, zero, 2 # enche s2 com 2
addi s3, zero, 4 # enche s3 com 4 
add s4, s3, s2 # faz a soma de s2 com s3 e guarda em s4

sw s4, 0(s1)
lw t0, 0(s1)
slli t1, t0, 2
sw t1, 0(s1)

li a7, 10
ecall
