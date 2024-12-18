                  ;
                  ;       moltiplicazione "in colonna" con segno
                  ;
                  ;       R1 = A
                  ;       R2 = B
                  ;       R3 = A * B, somma parziale
                  ;       R0 = contatore di bit
                  ;       R4 = maschera
                  ;       R5 = risultato dell'operzione di mascheratura
                  ;       R6 = segno di A (0 = +, 1 = -)
                  ;       R7 = segno di B (0 = +, 1 = -)
                  mov     r1,#-12
                  mov     r2,#5

                  stmdb   R13!,{R1,R2} ; push R1,R2

                  mov     r3,#0
                  mov     r0,#0
                  mov     r4,#1

                  mov     r6,#0
                  cmp     r1,#0
                  bge     a_is_positive
                  mov     r6,#1

                  ;       R1 = -R1
                  mvn     r1,r1 ; R1 = not(R1)
                  add     r1,r1,#1 ; R1 = R1 + 1

a_is_positive     

                  mov     r7,#0
                  cmp     r2,#0
                  bge     b_is_positive
                  mov     r7,#1

                  ;       R2 = - R2
                  mvn     r2,r2 ; R2 = not(R2)
                  add     r2,r2,#1 ; R1 = R2 + 1

b_is_positive     

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
                  ;       R3 = |R1| + |R2|
                  ;       R6 = segno di R1
                  ;       R7 = segno di R2
                  ;       R6 = R6 xor R7
                  eor     r6,r6,r7
                  cmp     r6,#0
                  beq     m_is_positive

                  mvn     r3,r3
                  add     r3,r3,#1
m_is_positive     
                  ldmia   R13!,{R1,R2} ; pop R1,R2














