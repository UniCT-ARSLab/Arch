              ;
              ;       Dato un array "V1" di cui e' nota la lunghezza,
              ;       costruire un array "V2" che contiene gli elementi di V1 raddoppiati
              ;
V1            dcd     4,10,22,8,7,6
V2            fill    6*4

              ;       R0 = numero di elementi di V1
              ;       R1 = puntatore all'i-esimo elemento di V1
              ;       R2 = i-esimo elemento di V1
              ;       R3 = puntatore all'i-esimo elemento di V2
              mov     r0, #6
              mov     r1, #V1
              mov     r3, #V2

scan_loop     
              cmp     r0,#0
              beq     end_scan_loop

              ldr     r2,[r1]

              add     r2,r2,r2
              str     r2, [r3]

              add     r1,r1,#4
              add     r3,r3,#4
              sub     r0,r0,#1
              b       scan_loop
end_scan_loop 
