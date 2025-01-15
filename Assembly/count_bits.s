               ;
               ;       conteggio dei bit a 1 di R0
               ;
               ;       R1 = loop counter (32 iterazioni)
               ;       R2 = risultato del test dell'i-esimo bit
               ;       R3 = contatore dei bit a 1

               mov     r0,#230


               mov     r1,#32
               mov     r3,#0

shift_loop     
               cmp     r1,#0
               beq     end_shift_loop
               and     r2,r0,#1
               cmp     r2,#0
               beq     skip

               add     r3,r3,#1

skip           

               lsr     r0,r0,#1
               sub     r1,r1,#1
               b       shift_loop
end_shift_loop 