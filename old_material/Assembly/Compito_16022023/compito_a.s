                 ;
                 ;       Compito A del 16/02/2023
                 ;
array_a          dcd     5,10,8,5,7,5,2,10,12
                 ;       len_a = 9
array_b          dcd     5,0,9,10,1
                 ;       len_b = 5
                 ;occurrences 1,0,0,2,0
                 ;
occurrences      fill    4 * 5
                 ;
                 ;       R0 = numero elementi di array_b
                 ;       R1 = ptr ad array_b
                 ;       R2 = i-esimo elemento di array_b
                 ;       R3 = numero elementi di array_a
                 ;       R4 = ptr ad array_a
                 ;       R5 = i-esimo elemento di array_a
                 ;       R6 = contatore occorrenze
                 ;       R7 = ptr ad occurrences
                 ;
                 mov     r0,#5
                 mov     r1,#array_b
                 mov     r7,#occurrences
array_b_loop     
                 cmp     r0,#0
                 beq     end_array_b_loop
                 ldr     r2,[r1],#4
                 ;       conta quante volte r2 e' presente in array_a

                 mov     r3,#9
                 mov     r4,#array_a
                 mov     r6,#0
array_a_loop     
                 cmp     r3,#0
                 beq     end_array_a_loop
                 ldr     r5,[r4],#4

                 cmp     r2,r5
                 bne     skip

                 add     r6,r6,#1

skip             
                 sub     r3,r3,#1
                 b       array_a_loop
end_array_a_loop 

                 str     r6,[r7],#4


                 sub     r0,r0,#1
                 b       array_b_loop

end_array_b_loop 






