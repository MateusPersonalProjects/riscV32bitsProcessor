# ------------------------- Variaveis ---------------------------
# s0 - auxiliar para reduzir o parametro da função de fibonacci
# s1 - auxiliar para execução das somas
# t0 - utilizado no condicional da função recursiva
# ---------------------------------------------------------------


.text
  addi a0, zero, 7 # inicializa N com 7
  jal ra, fibonacci # chama a função recursiva fibonacci
  
  li a7, 1 # chama função para printar a0 na tela
  ecall
  li a7, 10 # chamada função para terminar o programa
  ecall

fibonacci:

  # ----- inicio caso base ------ 
  addi t0, zero, 1 # inicializa t0 com 1 para utilizar no condicional
  bgt a0, t0, else # condicional
  jr ra # retorna
  # ----- fim caso base ------- 
 
  else:
    addi sp, sp, -12 # abrindo 3 espaços na stack
    sw ra, 8(sp) # guardando ra na stack
    sw s0, 4(sp) # guardando s0 na stack
    sw s1, 0(sp) # guardando s1 na stack
    
    add s0, a0, zero # armazenando valor atual de a0 em s0
    
    # ------ primeira chamada recusiva --------- 
    addi a0, s0, -1 # modificando o argumento para chamada recursiva
    jal ra, fibonacci # chamada recursiva
    add s1, a0, zero # armazenando novo valor de a0 em s1
    
    # ------ segunda chamada recursiva ---------
    addi a0, s0, -2 # modificando argumento para chamada recursiva
    jal ra, fibonacci # chamada recursiva
    add a0, a0, s1 # realiza a soma entre as chamadas recursivas 
    
    # restaurando valores anteriormente guardados na stack
    lw ra, 8(sp)
    lw s0, 4(sp)
    lw s1, 0(sp)
    
    addi sp, sp, 12 # devolvendo sp ao seu devido lugar
    jr ra # retorna
     
    
