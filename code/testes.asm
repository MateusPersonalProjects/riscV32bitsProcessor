
jal main

one:
  addi t3, s4, 1
  sw t3, 1(s1)
  
  jal two

main:
  addi s1, zero, 0 # endereço do começo da ram
  
  addi s2, zero, 2 # enche s2 com 2
  addi s3, zero, 4 # enche s3 com 4 
  add s4, s3, s2 # faz a soma de s2 com s3 e guarda em s4
  sw s4, 0(s1) # guarda s4 dentro da memoria
  
  addi t2, zero, 10 # valor para qual iremos comparar
  addi t3, zero, 0 #contador
  jal one

three:
  addi t3, t3, 1
  sw t3, 3(s1)
  
  jal fim
  
two:
  addi t3, t3, 1
  sw t3, 2(s1)
  
  jal three
  
fim:
  addi, t3, t3, 10
  sw t3, 0(s1) # guarda s4 dentro da memoria 
  li a7, 10
  ecall
