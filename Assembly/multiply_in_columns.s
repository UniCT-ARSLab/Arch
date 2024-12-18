                  ;
                  ;       moltiplicazione "in colonna"
                  ;
                  ;       R1 = A
                  ;       R2 = B
                  ;       R3 = A * B, somma parziale
                  ;       R0 = contatore di bit
                  ;       R4 = maschera
                  ;       R5 = risultato dell'operzione di mascheratura
                  ;
                  mov     r1,#12
                  mov     r2,#5

                  mov     r3,#0
                  mov     r0,#0
                  mov     r4,#1

multiply_loop     
                  cmp     r0,#16
                  beq     end_multiply_loop
                  and     r5,r2,r4
                  cmp     r5,#0
                  beq     skip

                  ;       R3 = R3 + (R1 << R0)
                  lsl     r5,r1,r0
                  add     r3,r3,r5

skip              
                  add     r0,r0,#1
                  lsl     r4,r4,#1
                  b       multiply_loop

end_multiply_loop 











