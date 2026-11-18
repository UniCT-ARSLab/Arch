                 ;
                 ;       Dato un array "V1" di cui e' nota la lunghezza,
                 ;       costruire un array "V2" che contiene gli elementi
                 ;       di V1 che sono compresi tra LOW e HIGH,
                 ;       avendo cura di determinare la
                 ;       lunghezza finale di V2
                 ;
V1               dcd     4,10,22,8,17,26
V2               fill    6*4
LOW              dcd     10
HIGH             dcd     20
SUM              fill    4

                 mov     r0,#LOW
                 ldr     r5,[r0]
                 mov     r0,#HIGH
                 ldr     r6,[r0]

                 ;       R0 = numero di elementi di V1
                 ;       R1 = puntatore all'i-esimo elemento di V1
                 ;       R2 = i-esimo elemento di V1
                 ;       R3 = puntatore all'i-esimo elemento di V2
                 ;       R4 = contatore di elementi di V2
                 ;       R5 = valore di LOW
                 ;       R6 = valore di HIGH

                 mov     r0, #6
                 mov     r1, #V1
                 mov     r3, #V2
                 mov     r4,#0

scan_loop        
                 cmp     r0,#0
                 beq     end_scan_loop

                 ldr     r2,[r1],#4
                 cmp     r2, r5
                 blt     skip

                 cmp     r2,r6
                 bgt     skip

                 str     r2, [r3],#4
                 add     r4,r4,#1

skip             
                 sub     r0,r0,#1
                 b       scan_loop
end_scan_loop    
                 ;       R4 = contatore di elementi di V2
                 ;       R1 = puntatore all'i-esimo elemento di V2
                 ;       R2 = i-esimo elemento di V2
                 ;       R0 = somma parziale
                 mov     r1, #V2
                 mov     r0,#0

scan_v2_loop     
                 cmp     r4,#0
                 beq     end_scan_v2_loop

                 ldr     r2,[r1], #4
                 add     r0,r0,r2

                 sub     r4,r4,#1
                 b       scan_v2_loop
end_scan_v2_loop 
                 mov     r1,#SUM
                 str     r0,[r1]





