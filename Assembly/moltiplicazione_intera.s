              ;
              ;       moltiplicazione intera
              ;       R1 = A
              ;       R2 = B
              ;       R0 = A * B
              ;
              mov     r1,#3
              mov     r2,#5

              mov     r0,#0

multiply_loop 
              cmp     r2,#0
              beq     end_multiply
              ;       r2 != 0
              add     r0, r0, r1 ; r0 = r0 + r1
              sub     r2, r2, #1 ; r2 = r2 - 1
              b       multiply_loop


end_multiply  

              ;
              ;       while (r2 != 0) {
              ;       r0 = r0 + r1;
              ;       r2 = r2 - 1;
              ;       }
              ;

