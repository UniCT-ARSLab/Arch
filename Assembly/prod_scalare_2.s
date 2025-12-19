              ;
              ;       prodotto scalare
              ;

vett_a        dcd     3,4,8,9,10
vett_b        dcd     2,9,3,4,1

              ;
              ;       R3 = numero di elementi
              ;       R4 = ptr elemento vett_a
              ;       R6 = ptr elemento vett_b
              ;       R8 = somma dei prodotti
              ;
main          
              mov     r3,#5
              mov     r4,#vett_a
              mov     r6,#vett_b
              mov     r8,#0

loop          
              cmp     r3,#0
              beq     end_loop

              ldr     r1,[r4],#4
              ldr     r2,[r6],#4

              ;
              ;       moltiplicazione intera
              ;       R1 = A
              ;       R2 = B
              ;       R0 = A * B
              ;
multiply      
              mov     r0,#0
multiply_loop 
              cmp     r2,#0
              beq     end_multiply
              ;       r2 != 0
              add     r0, r0, r1 ; r0 = r0 + r1
              sub     r2, r2, #1 ; r2 = r2 - 1
              b       multiply_loop
end_multiply  

              add     r8,r8,r0

              sub     r3,r3,#1
              b       loop

end_loop      
















