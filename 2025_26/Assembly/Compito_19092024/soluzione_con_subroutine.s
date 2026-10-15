              ;
              ;       Compito del 19 Settembre 2024
              ;
vett_a        dcd     4,5,63,56,99,32,12,5,6,8
              ;       lungh = 10
vett_b        fill    40

              ;       R0 = lungh vett_a
              ;       R1 = ptr a vett_a
              ;       R2 = elemento i-esimo di vett_a
              ;       R3 = ptr a vett_b
              ;       R4 = lungh vett_b
              ;       R5 = k

              mov     r0,#10
              mov     r1,#vett_a
              mov     r3,#vett_b
              mov     r4,#0
              mov     r5,#3

loop          
              cmp     r0,#0
              beq     end_loop

              ldr     r2,[r1],#4
              ;       test divisibilita' r2 per r5, r2/r5
              mov     r8,r2
              mov     r9,r5
              bl      division
              cmp     r8,#0
              bne     skip

              str     r2,[r3],#4
              add     r4,r4,#1

skip          
              sub     r0,r0,#1
              b       loop

end_loop      
              b       end_program

              ;
              ;       Divisione intera
              ;       input:
              ;       R8 = A
              ;       R9 = B
              ;       output:
              ;       R7 = quoziente di A/B
              ;       R8 = resto
              ;
division      
              mov     r7,#0
division_loop 
              cmp     r8,r9
              blt     end_division
              sub     r8, r8, r9 ; r8 = r8 - r9
              add     r7, r7, #1 ; r7 = r7 + 1
              b       division_loop
end_division  
              mov     pc,lr

end_program   










