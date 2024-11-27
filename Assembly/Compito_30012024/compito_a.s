           ;
           ;       Compito A del 30 gennaio 2024
           ;
vett_a     dcd     4,2,7,8,1,3,4,9,0
vett_a_len fill    4

           ;       R0 = numero di elementi di vett_a (da determinare)
           ;       R1 = ptr a vett_a
           ;       R2 = elemento i-esimo di vett_a

           mov     r1,#vett_a
           mov     r0,#0
loop       
           ldr     r2,[r1],#4
           cmp     r2,#0
           beq     end_loop
           add     r0,r0,#1
           b       loop
end_loop   
           mov     r3,#vett_a_len
           str     r0,[r3]
