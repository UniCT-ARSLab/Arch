         ;
         ;       algoritmo per il calcolo del minimo di un vettore
         ;
vett     dcd     3,4,1,2,9,10,5,11,3,1
         ;
         ;       R0 = lunghezza vettore
         ;       R1 = ptr a vett
         ;       R2 = elemento i-esimo di vett
         ;       R3 = minimo temporaneo
         ;
         mov     r0,#10
         mov     r1,#vett
         ldr     r3,[r1],#4
loop     
         cmp     r0,#1
         beq     end_loop
         ldr     r2,[r1],#4
         cmp     r2,r3
         bge     skip

         mov     r3,r2

skip     
         sub     r0,r0,#1
         b       loop
end_loop 
