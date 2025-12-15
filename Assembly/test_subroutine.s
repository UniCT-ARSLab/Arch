              ;
              ;       Dato un vettore di interi, sostituire ogni elemento
              ;       con il prodotto di esso per una costante fornita a run-time
              ;       a[i] = a[i] * const
              ;

array         dcd     9,4,5,6
const         equ     3

              ;       R3 = numero elementi
              ;       R4 = ptr
              ;       R5 = elemento i-esimo
              mov     r3,#4
              mov     r4,#array

loop          
              cmp     r3,#0
              beq     end_loop

              ldr     r5,[r4]

              mov     r1,r5
              mov     r2,#const
              bl      multiply
              str     r0,[r4],#4
              sub     r3,r3,#1
              b       loop

end_loop      
              ;....
              b       end_program


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
              mov     pc, lr ; return

end_program   
