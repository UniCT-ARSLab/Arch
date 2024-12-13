                 ;
                 ;       Compito A del 31 Gennaio 2023
                 ;

                 ;       10 elementi
vett             dcd     6,10,4,8,9,4,3,2,1,7

odd              fill    40
even             fill    40

max              fill    4
min              fill    4

                 ;       R0 = lunghezza di vett
                 ;       R1 = ptr a vett
                 ;       R2 = elemento i-esimo di vett
                 ;       R3 = lunghezza odd
                 ;       R4 = ptr a odd
                 ;       R5 = lunghezza even
                 ;       R6 = ptr a even
                 mov     r0, #10
                 mov     r1, #vett

                 mov     r4, #odd
                 mov     r6, #even

                 mov     r3, #0
                 mov     r5, #0

scan_loop        
                 cmp     r0,#0
                 beq     end_scan_loop
                 ldr     r2,[r1],#4
                 and     r7, r2,#1
                 cmp     r7,#0
                 beq     is_even
                 ;       il numero e' dispari
                 str     r2,[r4],#4
                 add     r3,r3,#1
                 b       next_element

is_even          
                 ;       il numero e' pari
                 str     r2,[r6],#4
                 add     r5,r5,#1

next_element     
                 sub     r0,r0,#1
                 b       scan_loop

end_scan_loop    
                 ;       R3 = lunghezza odd
                 ;       R5 = lunghezza even
                 cmp     r3,r5
                 bgt     use_odd
                 ;       use_even
                 mov     r1,#even
                 mov     r0,r5
                 b       calc_max_min
use_odd          
                 mov     r1,#odd
                 mov     r0,r3

calc_max_min     
                 ;       R0 = lunghezza odd o even
                 ;       R1 = ptr odd o even
                 ;       R2 = elemento i-esimo
                 ;       R3 = massimo
                 ;       R4 = minimo
                 ldr     r3,[r1],#4
                 mov     r4,r3

max_min_loop     
                 cmp     r0,#1
                 beq     end_max_min_loop

                 ldr     r2,[r1],#4
                 cmp     r2,r3
                 ble     skip_temp_max
                 mov     r3,r2 ; aggiorna il max temporaneo
skip_temp_max    
                 cmp     r2,r4
                 bge     skip_temp_min
                 mov     r4,r2 ; aggiorna il min temporaneo
skip_temp_min    

                 sub     r0,r0,#1
                 b       max_min_loop

end_max_min_loop 
                 mov     r0,#max
                 str     r3,[r0]
                 mov     r0,#min
                 str     r4,[r0]



















