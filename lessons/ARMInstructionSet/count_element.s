         ;
         ;       Sia dato un vettore di interi a 32 bit,
         ;       di cui non è nota la dimensione,
         ;       contenente numeri positivi
         ;       e in cui la terminazione è indicata con lo zero.
         ;       Determinare la dimensione del vettore memorizzando
         ;       l’informazione in un’apposita
         ;       locazione di memoria
         ;
my_array dcd     10, 20, 30, 50, 60, 70, 0
length   dcd     0

         ;       R1 = puntatore all'i-esimo elemento
         ;       R2 = valore dell'i-esimo elemento
         ;       R0 = contatore numero di elementi
         mov     r1,#my_array
         mov     r0,#0

loop     
         ldr     r2,[r1]
         cmp     r2,#0
         beq     end_loop

         add     r0,r0,#1

         add     r1,r1,#4
         b       loop

end_loop 
         mov     r3,#length
         str     r0,[r3]

