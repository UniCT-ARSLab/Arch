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

              ;       mettere da parte R0, R1 e R2
              STMDB   R13!,{R0,R1,R2}   ; PUSH {R0,R1,R2}
              MOV     R1,R2
              MOV     R2,R5

              ;       Divisione intera
              ;       input:
              ;       R1 = A
              ;       R2 = B
              ;       output:
              ;       R0 = quoziente di A/B
              ;       R1 = resto
              ;
              mov     r0,#0

division_loop 
              cmp     r1,r2
              blt     end_division

              sub     r1, r1, r2 ; r1 = r1 - r2
              add     r0, r0, #1 ; r0 = r0 + 1

              b       division_loop

end_division  
              CMP     R1,#0
              BNE     skip

              ;       recuperare R0, R1, R2
              ldmia   R13!, {R0,R1,R2}      ; POP {R0,R1,R2}
              str     r2,[r3],#4
              add     r4,r4,#1
              sub     r0,r0,#1
              b       loop

skip          
              ldmia   R13!, {R0,R1,R2}      ; POP {R0,R1,R2}
              sub     r0,r0,#1
              b       loop

end_loop      
