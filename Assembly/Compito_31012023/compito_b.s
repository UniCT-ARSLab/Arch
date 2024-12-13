                 ;
                 ;       Compito B del 31/01/2023
                 ;

                 ;       lunghezza = 7
vett             dcd     8,128,64,3,4,32,1

sixteen          fill    32

result           fill    4

                 ;       R0 = lunghezza vett
                 ;       R1 = ptr a vett
                 ;       R2 = elemento i-esimo di vett
                 ;       R3 = lunghezza di sixteen
                 ;       R4 = ptr a sixteen
                 mov     r0,#7
                 mov     r1,#vett

                 mov     r4,#sixteen
                 mov     r3,#0

scan_loop        
                 cmp     r0,#0
                 beq     end_scan_loop
                 ldr     r2,[r1],#4

                 and     r5,r2,#0xf
                 cmp     r5,#0
                 bne     skip

                 str     r2,[r4],#4
                 add     r3,r3,#1
skip             
                 sub     r0,r0,#1
                 b       scan_loop

end_scan_loop    
                 cmp     r3,#0
                 beq     end_program

                 ;       R0 = lunghezza vett
                 ;       R1 = ptr vett
                 ;       R2 = elemento i-esimo
                 ;       R3 = massimo
                 ;       R4 = minimo
                 mov     r0,r3
                 mov     r1,#sixteen
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

                 ;       media = (max + min) / 2
                 add     r3,r3,r4 ; max + min
                 lsr     r3,r3,#1 ; (max + min) / 2

                 mov     r0,#result
                 str     r3,[r0]

end_program      





