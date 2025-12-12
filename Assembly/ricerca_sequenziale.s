              ;
              ;       ricerca_sequenziale
              ;
vett_a        dcd     10,4,5,9,20,34,12,56,44
              ;
              ;       R0 = numero di elementi di vett_a
              ;       R1 = puntatore all'i-esimo elemento di vett_a
              ;       R2 = elemento i-esimo di vett_a
              ;       R3 = valore da cercare
              ;       R4 = registro che indica alla fine del loop se il valore e' stato trovato
              ;       0 = valore non trovato
              ;       1 = valore trovato
              ;
              mov     r0,#9
              mov     r1,#vett_a
              mov     r3,#12 ; cerchiamo il numero 12
              mov     r4,#1 ; ipotizziamo che il valore di R3 esista

loop          
              cmp     r0,#0
              beq     end_loop
              ldr     r2,[r1],#4

              cmp     r2,r3
              beq     element_found

              sub     r0, r0,#1
              b       loop

end_loop      
              mov     r4,#0

element_found 





