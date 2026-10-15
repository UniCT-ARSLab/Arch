               ;
               ;       Compito B del 9 Luglio 2024
               ;

vett_a         dcd     1,2,3,4,5,6,7,8,9,10
               ;       lunghezza = 10 elementi

               ;
               ;       R0 = lunghezza vettore
               ;       R1 = puntatore al vettore
               ;       R2 = elemento i-esimo
               ;       R3 = elemento (i+1)-esimo
               ;       R4 = esito del test 0 = vettore non ordinato, 1 = vettore ordinato
               ;
               mov     r0,#10
               mov     r1,#vett_a

loop           
               cmp     r0,#1
               beq     end_loop

               ldr     r2,[r1]
               ldr     r3,[r1,#4]
               cmp     r2,r3
               bgt     not_ordered
               add     r1,r1,#4
               sub     r0,r0,#1
               b       loop

end_loop       
               ;       il vettore e' ordinato
               mov     r4,#1
               b       fine_programma

not_ordered    
               ;       il vettore non e' ordinato
               mov     r4,#0

fine_programma 

