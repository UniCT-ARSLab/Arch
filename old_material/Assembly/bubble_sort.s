               ;
               ;       Bubblesort
               ;
array          dcd     9,4,5,28,43,1,8,3,4,3
               ;       10 elementi

               ;       R0 = numero di elementi
               ;       R1 = ptr i-esimo elemento
               ;       R2 = elemento i-esimo
               ;       R3 = elemento (i+1)-esimo
               ;       R4 = flag "in_order"
               ;
               ;
outer_loop     
               mov     r4,#1
               ;
               ;       inner loop
               ;

               mov     r0,#10
               mov     r1,#array

inner_loop     
               cmp     r0,#1
               beq     end_inner_loop

               ldr     r2,[r1]
               ldr     r3,[r1,#4]

               cmp     r2,r3
               ble     skip
               ;       r2 > r3
               str     r3,[r1]
               str     r2,[r1,#4]
               mov     r4,#0

skip           
               add     r1,r1,#4
               sub     r0,r0,#1
               b       inner_loop


end_inner_loop 
               cmp     r4,#0
               beq     outer_loop

               ;       finito!
