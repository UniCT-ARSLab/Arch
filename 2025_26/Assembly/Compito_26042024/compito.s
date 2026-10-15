              ;
              ;       Compito del 26/04/2024
              ;
array_v       dcd     3,1,8,4,5,7,8,3,2,12
array_v1      fill    40
              ;
              ;       R0 = lunghezza
              ;       R1 = ptr ad array_v
              ;       R2 = elemento corrente di array_v
              ;       R3 = lunghezza di array_v1
              ;       R4 = registro di calcolo
              ;       R5 = ptr ad array_v
              mov     r0,#10
              mov     r1,#array_v
              mov     r3,#0
              mov     r5,#array_v1

scan_loop     
              cmp     r0,#0
              beq     end_scan_loop

              ldr     r2,[r1],#4

              and     r4,r2,#0b000000000011
              ;       se r4 = 0 allora vuol dire che i bit 0 e 1 di R2 sono a 0
              ;       se r4 != 0 allora vuol dire che i bit 0 e 1 di R2 non sono entramnbi a 0
              cmp     r4,#0
              bne     skip

              str     r2,[r5],#4
              add     r3,r3,#1

skip          
              sub     r0,r0,#1
              b       scan_loop

end_scan_loop 

; .... determinare max e min di array_v1












