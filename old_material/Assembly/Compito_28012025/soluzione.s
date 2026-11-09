          ;       Considerare:
          ;       • un vettore a contenente interi a 32 bit;
          ;       • Due valori low e high memorizzati in due apposite locazioni di memoria
          ;       Effettuare le seguenti operazioni:
          ;       1. Generare un vettore b contenente gli elementi di a compresi tra low e high;
          ;       2. Calcolare la somma di tutti gli elementi del vettore b e memorizzare il risultato in
          ;       un’apposita locazione di memoria.
          ;
vett_a    dcd     4,0,10,3,4,8,5,14,6,10,20,30,40
          ;       13 elementi

low       dcd     5
high      dcd     20

vett_b    fill    13*4

          ;       R0 = n. di elementi di vett_a
          ;       R1 = puntatore a vett_a
          ;       R2 = elemento corrente di vett_a
          ;       R3 = puntatore a vett_b
          ;
          mov     r0,#13
          mov     r1,#vett_a
          mov     r3,#vett_b

          ;       R5 = low
          ;       R6 = high
          mov     r4,#low
          ldr     r5,[r4]
          mov     r4,#high
          ldr     r6,[r4]

          ;       R4 = numero di elementi di vett_b
          mov     r4,#0

loop      
          cmp     r0,#0
          beq     end_loop

          ldr     r2,[r1]
          cmp     r2,r5
          blt     skip
          cmp     r2,r6
          bgt     skip

          str     r2,[r3]
          add     r3,r3,#4
          add     r4,r4,#1

skip      
          add     r1,r1,#4
          sub     r0,r0,#1
          b       loop

end_loop  
          end

          ;       R0 = somma parziale
          ;       R4 = numero di elementi di vett_b
          ;       R3 = puntatore a vett_b
          ;       R2 = elemento i-esimo di vett_b
          mov     r0,#0

loop2     
          cmp     r4,#0
          beq     end_loop2
          ldr     r2,[r3]

          add     r0,r0,r2

          add     r3,r3,#4
          sub     r4,r4,#1
          b       loop2

end_loop2 























