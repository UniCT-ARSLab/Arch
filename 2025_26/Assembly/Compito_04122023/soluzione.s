              ;
              ;       Compito del 4 Dicembre 2023
              ;
vett_v        dcd     23,255,7,6,254,164,4,136,22

vett_v1       fill    36
              ;
              ;       R0 = numero di elementi di vett_v
              ;       R1 = ptr a vett_v
              ;       R2 = elemento i-esimo di vett_v
              ;       R3 = ptr a vett_v1
              ;       R4 = numero di elementi di vett_v1
              ;
              ;
              ;       b13 ...... b7 b6 b5 b4 b3 b2 b1 b0 AND
              ;       0 ..... 1 0 0 0 1 0 0 0 = 0x88
              ;       =======================================
              ;       0 ..... b7 0 0 0 b3 0 0 0
              ;

              mov     r0,#9
              mov     r1,#vett_v
              mov     r3,#vett_v1
              mov     r4,#0

copy_loop     
              cmp     r0,#0
              beq     end_copy_loop
              ldr     r2,[r1],#4

              and     r5, r2,#0x88
              cmp     r5,#0x88
              bne     copy_skip

              str     r2,[r3],#4
              add     r4,r4,#1

copy_skip     
              sub     r0,r0,#1
              b       copy_loop

end_copy_loop 
              ;       R4 = lunghezza di vett_v1
              ;
              ;       R0 = lunghezza vettore
              ;       R1 = ptr a vett
              ;       R2 = elemento i-esimo di vett
              ;       R3 = minimo temporaneo
              ;
              mov     r0,r4
              mov     r1,#vett_v1
              ldr     r3,[r1],#4
min_loop      
              cmp     r0,#1
              beq     end_min_loop
              ldr     r2,[r1],#4
              cmp     r2,r3
              bge     min_skip

              mov     r3,r2

min_skip      
              sub     r0,r0,#1
              b       min_loop
end_min_loop  


