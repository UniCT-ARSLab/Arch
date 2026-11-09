                 ;
                 ;       Compito B del 16/02/2023
                 ;
array_a          dcd     5,10,8,5,7,5,2,10
                 fill    4*6
                 ;       len_a = 8
array_b          dcd     5,11,9,10,12,3
                 ;       len_b = 6
                 ;
                 ;       R0 = numero elementi di array_b
                 ;       R1 = ptr ad array_b
                 ;       R2 = i-esimo elemento di array_b
                 ;       R3 = numero elementi di array_a
                 ;       R4 = ptr ad array_a
                 ;       R5 = i-esimo elemento di array_a
                 ;       R6 = lunghezza effettiva dell'array_a
                 mov     r0,#6
                 mov     r1,#array_b
                 mov     r6,#8

array_b_loop     
                 cmp     r0,#0
                 beq     end_array_b_loop
                 ldr     r2,[r1],#4

                 mov     r3,r6
                 mov     r4,#array_a
array_a_loop     
                 cmp     r3,#0
                 beq     insert_at_tail
                 ldr     r5,[r4],#4

                 cmp     r2,r5
                 beq     end_array_a_loop

                 sub     r3,r3,#1
                 b       array_a_loop

insert_at_tail   
                 str     r2,[r4]
                 add     r6,r6,#1

end_array_a_loop 
                 sub     r0, r0,#1
                 b       array_b_loop
end_array_b_loop 
                 ;       calcolo minimo array_a

                 ;
                 ;       R0 = numero elementi di array_a
                 ;       R1 = ptr ad array_a
                 ;       R2 = i-esimo elemento di array_a
                 ;       R3 = minimo temporaneo
                 ;       R6 = lunghezza effettiva dell'array_a
                 mov     r0,r6
                 mov     r1,#array_a
                 ldr     r3,[r1],#4

min_loop         
                 cmp     r0,#1
                 beq     end_min_loop
                 ldr     r2,[r1],#4
                 cmp     r2,r3
                 bge     skip

                 mov     r3,r2

skip             
                 sub     r0,r0,#1
                 b       min_loop

end_min_loop     









