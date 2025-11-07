         ;
         ;       Dato un insieme di numeri, determinare quanti di essi
         ;       sono pari
         ;
data     dcd     4,10,8,9,60,20,3,1,0,50,9,14
         ;       12 elementi
         ;
         ;       R0 = n. di elementi/loop counter
         ;       R1 = puntatore all'i-esimo elemento di "data"
         ;       R2 = i-esimo elemento di "data"
         ;       R3 = registro contatore degli pari
         ;
         mov     r0,#12
         mov     r1,#data
         mov     r3,#0

loop     
         cmp     r0, #0
         beq     end_loop

         ldr     r2,[r1]
         ;
         and     r2,r2,#1
         cmp     r2,#0
         bne     skip

         add     r3,r3,#1

skip     
         ;
         sub     r0,r0,#1
         add     r1,r1,#4
         b       loop

end_loop 



