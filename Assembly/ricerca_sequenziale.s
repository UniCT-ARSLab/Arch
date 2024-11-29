                ;
                ;       Dato un vettore a e un valore k, determinare se k appartiene ad a
                ;
vett_a          dcd     3,6,1,2,5,6,9,3,0,5,4
                ;
                ;       R0 = lungh vett_a
                ;       R1 = ptr a vett_a
                ;       R2 = i-esimo elemento di vett_a
                ;       R3 = valore k
                ;       R4 = 0 se k non app. ad a, 1 se k app. ad a
                ;
                mov     r0,#11
                mov     r1,#vett_a
                mov     r3,#4

search_loop     
                cmp     r0,#0
                beq     end_search_loop
                ldr     r2,[r1],#4
                cmp     r2,r3
                beq     found
                sub     r0,r0,#1
                b       search_loop

end_search_loop 
                mov     r4,#0
                b       end_search

found           
                mov     r4,#1

end_search      















