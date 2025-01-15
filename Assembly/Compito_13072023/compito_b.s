               ;
               ;       Compito B del 13/07/2023
               ;

array_v        dcd     2345,356,112,35,6,6691,3245
array_counts   fill    28
               ;
               ;       R0 = lunghezza di array_v
               ;       R1 = ptr ad array_v
               ;       R2 = i-esimo elemento di array_v
               ;       R7 = ptr ad array_counts
               ;

               mov     r0,#7
               mov     r1,#array_v
               mov     r7,#array_counts

scan_loop      
               cmp     r0,#0
               beq     end_scan_loop

               ldr     r2,[r1],#4

               ;
               ;       conteggio dei bit a 1 di R2
               ;
               ;       R4 = loop counter (32 iterazioni)
               ;       R5 = risultato del test dell'i-esimo bit
               ;       R6 = contatore dei bit a 1

               mov     r4,#32
               mov     r6,#0

shift_loop     
               cmp     r4,#0
               beq     end_shift_loop
               and     r5,r2,#1
               cmp     r5,#0
               beq     skip

               add     r6,r6,#1

skip           

               lsr     r2,r2,#1
               sub     r4,r4,#1
               b       shift_loop
end_shift_loop 
               ;       R6 numero di bit a 1 di R2

               str     r6,[r7],#4


               sub     r0,r0,#1
               b       scan_loop

end_scan_loop  

; ...determinare il max di array_counts







