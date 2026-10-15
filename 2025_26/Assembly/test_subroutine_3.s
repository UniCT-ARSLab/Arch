              ;
              ;       Dato un vettore di interi, sostituire ogni elemento
              ;       con il prodotto di esso per una costante fornita a run-time
              ;       a[i] = a[i] * const
              ;

array         dcd     9,4,5,6
const         equ     3

              ;       R0 = numero elementi
              ;       R1 = ptr
              ;       R2 = elemento i-esimo
              ;
              mov     r0,#4
              mov     r1,#array

loop          
              cmp     r0,#0
              beq     end_loop

              ldr     r2,[r1]

              stmda   sp!,{r0} ; push r0
              stmda   sp!,{r1} ; push r1

              mov     r1,#const
              bl      multiply
              ;       R0 = prodotto
              ldmib   sp!,{r1} ; pop r1
              str     r0,[r1],#4
              ldmib   sp!,{r0} ; pop r0
              sub     r0,r0,#1
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
