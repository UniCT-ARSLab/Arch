              ;
              ;       calolo del minimo
              ;
my_array      dcd     6,20,4,8,10,30,2,5

              ;       R0 = numero di elementi
              ;       R1 = puntatore all'elemento i-esimo di my_array
              ;       R2 = elemento i-esimo di my_array
              ;       R3 = minimo temporaneo
              mov     r0,#8
              mov     r1,#my_array

              ldr     r3,[r1],#4

scan_loop     
              cmp     r0,#1
              beq     end_scan_loop

              ldr     r2,[r1],#4
              cmp     r2,r3
              bge     skip

              mov     r3,r2

skip          
              sub     r0,r0,#1
              b       scan_loop
end_scan_loop 


