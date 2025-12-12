              ;
              ;       Compito A del 18/02/2025
              ;
vett_a        dcd     10,4,5,9,20,34,12,56,44
vett_b        dcd     9,20,10,42,44
counter       dcd     0
              ;
              ;
              ;       R0 = numero di elementi di vett_a
              ;       R1 = puntatore all'i-esimo elemento di vett_a
              ;       R2 = elemento i-esimo di vett_a
              ;       R3 = elemento i-esimo di vett_b ossia valore da cercare
              ;       R4 = registro che indica alla fine del loop se il valore e' stato trovato
              ;        0 = valore non trovato
              ;        1 = valore trovato
              ;
              ;       R5 = numero di elementi di vett_b
              ;       R6 = puntatore all'i-esimo elemento di vett_b
              ;       R7 = contatore di elementi di vett_b appartenenti a vett_a
              ;

              mov     r5,#5
              mov     r6,#vett_b
              mov     r7,#0

loop_b        
              cmp     r5,#0
              beq     end_loop_b
              ldr     r3,[r6],#4
              ;
              ;       Ricerca di R3 su vett_a

              mov     r0,#9
              mov     r1,#vett_a
loop          
              cmp     r0,#0
              beq     end_loop
              ldr     r2,[r1],#4

              cmp     r2,r3
              beq     element_found

              sub     r0, r0,#1
              b       loop

element_found ;       incrementare
              add     r7,r7,#1

end_loop      ;       nulla
              ;
              ;
              sub     r5,r5,#1
              b       loop_b

end_loop_b    

              mov     r0,#counter
              str     r7,[r0]


