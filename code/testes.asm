
jal main

#loop:
#  lw t0, 0(s1)
#  slli t1, t0, 2
#  sw t1, 0(s1)
#  jal fim

loop:
  bge t3, t2, fim
  addi t3, t3, 1
  add s1, s1, t3
  sw t3, 0(s1)
  
  jal loop

main:
  addi s1, zero, 0 # espaço da ram q vou alocar
  
  addi s2, zero, 2 # enche s2 com 2
  addi s3, zero, 4 # enche s3 com 4 
  add s4, s3, s2 # faz a soma de s2 com s3 e guarda em s4
  sw s4, 0(s1) # guarda s4 dentro da memoria
  
  addi t2, zero, 10 # valor para qual iremos comparar
  addi t3, zero, 0 #contador
  jal loop
  
fim:
  sw t3, 1(s1) # guarda s4 dentro da memoria 
  li a7, 10
  ecall
