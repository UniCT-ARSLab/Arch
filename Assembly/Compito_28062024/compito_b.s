                 ;
                 ;       Compito B del 28/06/2024
                 ;
array            dcd     3,1,8,4,5,7,8,3,2,10
                 ;
                 ;       R0 = lunghezza
                 ;       R1 = ptr ad array
                 ;       R2 = elemento corrente di array
                 ;       R3 = max temporaneo
                 ;       R4 = min temporaneo
                 ;
                 mov     r0,#10
                 mov     r1,#array

                 ldr     r3,[r1],#4
                 mov     r4,r3

max_min_loop     
                 cmp     r0,#1
                 beq     end_max_min_loop

                 ldr     r2,[r1],#4

                 cmp     r2,r3
                 ble     skip_max
                 mov     r3,r2 ; aggiornamento max temporaneo perche' r2 > r3

skip_max         
                 cmp     r2,r4
                 bge     skip_min
                 mov     r4,r2 ; aggiornamento min temporaneo perche' r2 < r4

skip_min         
                 sub     r0,r0,#1
                 b       max_min_loop

end_max_min_loop 

                 add     r3,r3,r4 ; r3 = max + min
                 lsr     r3,r3,#1 ; r3 = (max + min) / 2, valore di "k"

                 mov     r0,#10
                 mov     r1,#array
                 ;       R4 = numero di elementi di array > k
                 mov     r4,#0

count_loop       
                 cmp     r0,#0
                 beq     end_count_loop
                 ldr     r2,[r1],#4

                 cmp     r2,r3
                 ble     skip_increment
                 add     r4,r4,#1
skip_increment   

                 sub     r0,r0,#1
                 b       count_loop

end_count_loop   


















