              ;
              ;       Dato un array "V1" di cui e' nota la lunghezza,
              ;       costruire un array "V2" che contiene gli elementi
              ;       di V1 che sono >= 10, avendo cura di determinare la
              ;       lunghezza finale di V2
              ;
V1            dcd     4,10,22,8,17,26
V2            fill    6*4

              ;       R0 = numero di elementi di V1
              ;       R1 = puntatore all'i-esimo elemento di V1
              ;       R2 = i-esimo elemento di V1
              ;       R3 = puntatore all'i-esimo elemento di V2
              ;       R4 = contatore di elementi di V2
              mov     r0, #6
              mov     r1, #V1
              mov     r3, #V2
              mov     r4,#0

scan_loop     
              cmp     r0,#0
              beq     end_scan_loop

              ldr     r2,[r1],#4
              cmp     r2, #10
              blt     skip
              str     r2, [r3],#4
              add     r4,r4,#1

skip          
              sub     r0,r0,#1
              b       scan_loop
end_scan_loop 
