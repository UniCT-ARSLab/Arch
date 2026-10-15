         ;
         ;       Massimo comun divisore
         ;       input
         ;       R0 = A
         ;       R1 = B
         ;       output
         ;       R0 = R1 = MCD(A, B)
         ;

         mov     r0,#15
         mov     r1,#25

mcd_loop 
         cmp     r0, r1
         beq     end_mcd

         ;       cmp r0, r1
         blt     r0_lt_r1
         ;       r0 > r1
         sub     r0, r0, r1 ; r0 = r0 - r1
         b       mcd_loop

r0_lt_r1 
         ;       r0 < r1
         sub     r1, r1, r0 ; r1 = r1 - r0
         b       mcd_loop


end_mcd  

