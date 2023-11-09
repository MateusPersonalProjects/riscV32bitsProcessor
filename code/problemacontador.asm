
  addi s1, zero, 0 # ram
  
  addi s2, zero, 1
  sw s2, 0(s1)
  addi s2, s2, 1
  sw s2, 1(s1)
  addi s2, s2, 1
  sw s2, 2(s1)
  addi s2, s2, 1
  sw s2, 3(s1)
  
  li a7, 10
  ecall
