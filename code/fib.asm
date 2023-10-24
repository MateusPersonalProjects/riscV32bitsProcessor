
# s0 = endereço base do vetor, s1 = i, s2 = tam

# ------------ vetor ---------------
# inicializa o vetor
lui s0, 0x10010 # add o endereço onde sera armazenado o vetor
ori s0, s0, 0x400 
addi s2, zero, 20 # define o tamanho do vetor

# prepara a chamada da função fib
addi a1, zero, 1 # primeiro elemento como parametro
addi a2, zero, 1 # segundo elemento como parametro
add a3, zero, s2 # tamanho do vetor como parametro

jal ra, fib # chama fib

li a7, 10 # encerra o programa
ecall


fib:
  addi s1, zero, 2
  sw a1, 0(s0) # colocamos a1 dentro da primeira posição do vetor
  sw a2, 4(s0) # colocamos a2 dentro da segunda posição do vetor
  
  # ------------------- for loop -----------------------------
  loop:
    bge s1, a3, fim # condicional
    slli t0, s1, 2 # multiplico por 4 o iterador para pegar o endereço correto
    add t0, t0, s0  # adiciono o endereço ao iterador
    
    lw t1, -4(t0) # carrego o penultimo valor
    lw t2, -8(t0) # carrego o antepenultimo valor
    add t3, t1, t2 # soma os valores
    sw t3, 0(t0) # armazena o valor em sua devida posição
    
    addi s1, s1, 1 # add 1 no nosso iterador
    j loop
  fim:
  jr ra
  