             ;
             ;       Compito del 19 Settembre 2024
             ;
vett_a       dcd     4,5,63,56,99,32,12,5,6,8
             ;       lungh = 10
vett_b       fill    40

             ;       R0 = lungh vett_a
             ;       R1 = ptr a vett_a
             ;       R2 = elemento i-esimo di vett_a
             ;       R3 = ptr a vett_b
             ;       R4 = lungh vett_b
             ;       R5 = k
             ;       R6 = registro temporaneo

             mov     r0,#10
             mov     r1,#vett_a
             mov     r3,#vett_b
             mov     r4,#0
             mov     r5,#3

loop         
             cmp     r0,#0
             beq     end_loop

             ldr     r2,[r1],#4
             mov     r6,r2

             ;       test divisibilita' r2 con r5
             ;       se test fallisce branch a skip
div_loop     
             cmp     r2,r5
             blt     end_div_loop
             sub     r2,r2,r5
             b       div_loop
end_div_loop 
             ;       r2 = resto
             cmp     r2,#0
             bne     skip

             str     r6,[r3],#4
             add     r4,r4,#1

skip         
             sub     r0,r0,#1
             b       loop

end_loop     
