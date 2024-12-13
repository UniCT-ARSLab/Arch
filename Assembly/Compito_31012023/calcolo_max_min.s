                 ;
                 ;       calcolo del massimo e del minimo
                 ;
                 ;       10 elementi
vett             dcd     3,10,5,8,9,14,3,2,1,7

                 ;       R0 = lunghezza vett
                 ;       R1 = ptr vett
                 ;       R2 = elemento i-esimo
                 ;       R3 = massimo
                 ;       R4 = minimo
                 mov     r0,#10
                 mov     r1,#vett
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









