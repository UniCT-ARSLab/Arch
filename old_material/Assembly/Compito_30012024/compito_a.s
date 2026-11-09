              ;
              ;       Compito A del 30 gennaio 2024
              ;
vett_a        dcd     4,2,7,8,6,1,3,4,2,0
vett_a_len    fill    4

vett_b        fill    64

              ;       R0 = numero di elementi di vett_a (da determinare)
              ;       R1 = ptr a vett_a
              ;       R2 = elemento i-esimo di vett_a

              mov     r1,#vett_a
              mov     r0,#0
loop          
              ldr     r2,[r1],#4
              cmp     r2,#0
              beq     end_loop
              add     r0,r0,#1
              b       loop
end_loop      
              mov     r3,#vett_a_len
              str     r0,[r3]
              ;
              ;       R0 = dimensione di vett_a
              ;       R1 = ptr a vett_a
              ;       R2 = elemento i-esimo di vett_a
              ;       R3 = ptr a vett_b
              ;       R4 = lunghezza vett_b
              ;
              mov     r1,#vett_a
              mov     r3,#vett_b
              mov     r4,#0
copy_loop     
              cmp     r0,#0
              ble     end_copy_loop
              ldr     r2,[r1],#8
              str     r2,[r3],#4
              add     r4,r4,#1
              sub     r0,r0,#2
              b       copy_loop
end_copy_loop 
              ;
              ;
              ;       R4 = lunghezza vett_b
              ;
              ;
              ;       R0 = lunghezza vett_b
              ;       R1 = ptr a vett_b
              ;       R2 = elemento i-esimo di vett_b
              ;       R3 = massimo temporaneo
              ;
              mov     r0,r4
              mov     r1,#vett_b
              ldr     r3,[r1],#4
max_loop      
              cmp     r0,#1
              beq     end_max_loop
              ldr     r2,[r1],#4
              cmp     r2,r3
              ble     skip

              mov     r3,r2

skip          
              sub     r0,r0,#1
              b       max_loop
end_max_loop  












