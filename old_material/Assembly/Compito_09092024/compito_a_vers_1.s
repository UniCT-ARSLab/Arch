          ;
          ;       Compito A del 9 Luglio 2024
          ;
vett_a    dcd     2,6,4,2,6,0,2,4,5,6
          ;       lungh = 10

vett_b1   fill    40
vett_b2   fill    40
          ;
          ;       R0 = lunghezza vett_a
          ;       R1 = ptr a vett_a
          ;       R2 = k
          ;       R3 = elemento i-esimo di vett_a
          ;       R4 = ptr a vett_b1
          ;       R5 = lunghezza di vett_b1
          ;
          mov     r2,#5

          mov     r0,#10
          mov     r1,#vett_a
          mov     r4,#vett_b1
          mov     r5,#0

loop      
          cmp     r0,#0
          beq     end_loop

          ldr     r3,[r1]
          cmp     r3,r2
          bge     skip

          str     r3,[r4]
          add     r4,r4,#4
          add     r5,r5,#1

skip      
          add     r1,r1,#4
          sub     r0,r0,#1
          b       loop

end_loop  

          ;       R4 = ptr a vett_b2
          ;       R6 = lunghezza di vett_b2

          mov     r0,#10
          mov     r1,#vett_a
          mov     r4,#vett_b2
          mov     r6,#0

loop2     
          cmp     r0,#0
          beq     end_loop2

          ldr     r3,[r1]
          cmp     r3,r2
          blt     skip2

          str     r3,[r4]
          add     r4,r4,#4
          add     r6,r6,#1

skip2     
          add     r1,r1,#4
          sub     r0,r0,#1
          b       loop2

end_loop2 

