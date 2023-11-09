
jal main

one:
  addi t3, s4, 1
  sw t3, 1(s1)
  
  jalr ra

main:
  addi s1, zero, 0 # endereço do começo da ram
  
  addi s2, zero, 2 # enche s2 com 2
  addi s3, zero, 4 # enche s3 com 4 
  add s4, s3, s2 # faz a soma de s2 com s3 e guarda em s4
  sw s4, 0(s1) # guarda s4 dentro da memoria

  jal one
  
  addi t3, t3, 10
  sw t3, 0(s1) 
  
  li a7, 10
  ecall
