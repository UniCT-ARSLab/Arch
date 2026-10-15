         ;
         ;       calcolo del minimo e del massimo
         ;
data     dcd     8,2,1,50,10,3,5,20,12,14
         ;
         ;       R0 = numero di elementi
         ;       R1 = puntatore all'i-esimo elemento
         ;       R2 = valore dell'i-esimo elemento
         ;       R3 = minimo temporaneo
         ;       R4 = massimo temporaneo
         ;
         mov     r0,#10
         mov     r1,#data

         ldr     r3,[r1],#4 ; minimo temporaneo = primo elemento dell'array
         mov     r4,r3 ; massimo temporaneo = primo elemento dell'array

loop     
         cmp     r0,#1
         beq     end_loop
         ldr     r2,[r1],#4

         ;       confronto con il minimo temporaneo
         cmp     r2,r3
         bge     skip
         mov     r3,r2
skip     

         ;       confronto con il massimo temporaneo
         cmp     r2,r4
         ble     skip_2
         mov     r4,r2
skip_2   


         sub     r0,r0,#1
         b       loop
end_loop 

