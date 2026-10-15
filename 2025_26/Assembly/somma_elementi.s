             ;
             ;
             ;
data         dcd     10,20,30,50,50,60

             mov     r1,#data
             mov     r0,#6 ; n. di elementi
             mov     r2,#0 ; somma parziale
sum_loop     
             cmp     r0,#0
             beq     end_sum_loop

             ldr     r3,[r1]
             add     r2,r2,r3

             add     r1,r1,#4

             sub     r0,r0,#1
             b       sum_loop

end_sum_loop 

