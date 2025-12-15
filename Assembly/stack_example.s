         ;
         ;       Dato un array, calcolare la somma di tutti gli elementi pari.
         ;       Utilizzare SOLAMENTE 4 registri
         ;
array    dcd     10,3,6,8,9,23,22,21,30,31
         ;
         ;       R0 = numero di elementi
         ;       R1 = puntatore all'i-esimo elemento
         ;       R2 = valore dell'i-esimo elemento
         ;       R3 = somma parziale
         ;
         mov     r0,#10
         mov     r1,#array
         mov     r3,#0

loop     
         cmp     r0,#0
         beq     end_loop
         ldr     r2,[r1],#4

         stmda   sp!, {r0} ; push r0
         and     r0,r2, #1
         cmp     r0,#0
         bne     odd
         add     r3,r3,r2
odd      
         ldmib   sp!, {r0} ; pop r0
         sub     r0, r0,#1
         b       loop

end_loop 
