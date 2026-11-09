                ;
                ;       Compito A del 28/06/2024
                ;
vett_a          dcd     3,4,0,1,3,2,8,7
                ;
vett_b          dcd     4,9,6,2
                ;
vett_c          fill    16
                ;
                ;       R0 = lungh vett_a
                ;       R1 = ptr vett_a
                ;       R2 = lungh vett_b
                ;       R3 = ptr vett_b
                ;       R4 = ptr vett_c
                ;       R5 = i-esimo elemento di b
                ;       R6 = j-esimo elemento di a
                ;
                mov     r2,#4
                mov     r3,#vett_b
                mov     r4,#vett_c

scan_b_loop     
                cmp     r2,#0
                beq     end_scan_b_loop

                ldr     r5,[r3]

                mov     r0,#8
                mov     r1,#vett_a

scan_a_loop     
                cmp     r0,#0
                beq     end_scan_a_loop

                ldr     r6,[r1]
                cmp     r6,r5
                beq     found

                add     r1,r1,#4
                sub     r0,r0,#1
                b       scan_a_loop

end_scan_a_loop 
                mov     r7,#0
                b       next

found           
                mov     r7,#1
next            
                str     r7,[r4]
                sub     r2,r2,#1
                add     r3,r3,#4
                add     r4,r4,#4
                b       scan_b_loop

end_scan_b_loop 

