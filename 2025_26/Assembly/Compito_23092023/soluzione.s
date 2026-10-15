                ;
                ;       Compito del 27 settembre 2023
                ;

vett_a          dcd     3,6,1,2,5,6,9,3,0,5,4

vett_b          dcd     4,7,0,3


                ;
                ;       Ricerca di R3, in vett_a
                ;
                ;       R0 = lungh vett_a
                ;       R1 = ptr a vett_a
                ;       R2 = i-esimo elemento di vett_a
                ;       R3 = elemento i-esimo di vett_b
                ;       R4 = contatore di elementi trovati
                ;       R5 = lungh vett_b
                ;       R6 = ptr a vett_b
                ;
                mov     r4,#0

                mov     r5,#4
                mov     r6,#vett_b

scan_b_loop     
                cmp     r5,#0
                beq     end_scan_b_loop

                ldr     r3,[r6],#4

                mov     r0,#11
                mov     r1,#vett_a

search_loop     
                cmp     r0,#0
                beq     end_search_loop
                ldr     r2,[r1],#4
                cmp     r2,r3
                beq     found
                sub     r0,r0,#1
                b       search_loop

end_search_loop 
                b       end_search

found           
                add     r4,r4,#1

end_search      
                sub     r5,r5,#1
                b       scan_b_loop

end_scan_b_loop 

                mov     r0,r4








