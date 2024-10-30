              ;
              ;       Divisione intera
              ;       input:
              ;       R1 = A
              ;       R2 = B
              ;       output:
              ;       R0 = quoziente di A/B
              ;       R1 = resto
              ;
              mov     r1, #19
              mov     r2, #3

              mov     r0,#0

division_loop 
              cmp     r1,r2
              blt     end_division

              sub     r1, r1, r2 ; r1 = r1 - r2
              add     r0, r0, #1 ; r0 = r0 + 1

              b       division_loop


end_division  




