           ;
           ;       Compito A del 9 Luglio 2024
           ;
vett_a     dcd     2,6,4,2,6,0,2,4,5,6
           ;       lungh = 10

vett_b1    fill    40
vett_b2    fill    40
           ;
           ;       R0 = lunghezza vett_a
           ;       R1 = ptr a vett_a
           ;       R2 = k
           ;       R3 = elemento i-esimo di vett_a
           ;       R4 = ptr a vett_b1
           ;       R5 = lunghezza di vett_b1
           ;       R6 = ptr a vett_b2
           ;       R7 = lunghezza di vett_b2
           ;
           mov     r2,#5

           mov     r0,#10
           mov     r1,#vett_a
           mov     r4,#vett_b1
           mov     r6,#vett_b2
           mov     r5,#0
           mov     r7,#0

loop       
           cmp     r0,#0
           beq     end_loop

           ldr     r3,[r1],#4
           cmp     r3,r2
           bge     copy_to_b2

           ;       copy_to_b1
           str     r3,[r4],#4
           add     r5,r5,#1
           b       next

copy_to_b2 
           str     r3,[r6],#4
           add     r7,r7,#1

next       
           sub     r0,r0,#1
           b       loop

end_loop   
