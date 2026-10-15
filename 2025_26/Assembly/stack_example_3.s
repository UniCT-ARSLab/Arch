         ;
         ;       Dato un array, calcolare la somma di tutti gli elementi pari.
         ;       Utilizzare SOLAMENTE 3 registri
         ;
array    dcd     10,3,6,8,9,23,22,21,30,31
         ;
         ;       R0 = numero di elementi
         ;       R1 = puntatore all'i-esimo elemento
         ;       R2 = somma parziale
         ;
         mov     r0,#10
         mov     r1,#array
         mov     r2,#0

loop     
         cmp     r0,#0
         beq     end_loop

         stmda   sp!, {r0,r1} ; push r0,r1
         ldr     r0,[r1]
         and     r1,r0,#1
         cmp     r1,#0
         bne     odd
         ;       R2 = somma parziale
         ;       R0 = valure dell'i-esimo elemento
         add     r2,r2,r0
odd      
         ldmib   sp!, {r0,r1} ; pop r1,r0
         add     r1,r1,#4
         sub     r0, r0,#1
         b       loop

end_loop 
