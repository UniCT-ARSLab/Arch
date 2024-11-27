         ;
         ;       Copiare sul vettore b solo gli elementi divisibili per 2 di a
         ;
vett_a   dcd     4,5,63,56,99,32,12,5,6,8
         ;       lungh = 10
vett_b   fill    40

         ;       R0 = lungh vett_a
         ;       R1 = ptr a vett_a
         ;       R2 = elemento i-esimo di vett_a
         ;       R3 = ptr a vett_b
         ;       R4 = lungh vett_b
         ;       R6 = registro temporaneo

         mov     r0,#10
         mov     r1,#vett_a
         mov     r3,#vett_b
         mov     r4,#0

loop     
         cmp     r0,#0
         beq     end_loop

         ldr     r2,[r1],#4
         mov     r6,r2

         ;       test divisibilita' r2 con 2
         ;       se test fallisce branch a skip
         and     r2,r2,#1
         cmp     r2,#1
         beq     skip

         str     r6,[r3],#4
         add     r4,r4,#1

skip     
         sub     r0,r0,#1
         b       loop

end_loop 
