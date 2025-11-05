         ;
         ;       Dato un insieme di numeri, determinare quanti di essi
         ;       sono inclusi in un intervallo [a, b], con "a" e "b" parametrici
         ;
data     dcd     4,10,8,9,60,20,3,1,0,50,9,14
         ;       12 elementi
         ;
         ;       R0 = n. di elementi/loop counter
         ;       R1 = puntatore all'i-esimo elemento di "data"
         ;       R2 = i-esimo elemento di "data"
         ;       R3 = registro contatore degli elementi inclusi in [a,b]
         ;       R4 = valore di a
         ;       R5 = valore di b
         ;
         mov     r0,#12
         mov     r1,#data
         mov     r3,#0
         mov     r4,#10
         mov     r5,#30

loop     
         cmp     r0, #0
         beq     end_loop

         ldr     r2,[r1]
         ;
         cmp     r2,r4
         blt     skip
         cmp     r2,r5
         bgt     skip
         ;

         add     r3,r3,#1

skip     
         sub     r0,r0,#1
         add     r1,r1,#4
         b       loop

end_loop 



