         ;
         ;       conteggio dei bit a 1 di un numero presente in R0
         ;

         ;       R0 = numero da testare
         ;       R1 = contatore di ciclo di lunghezza 32
         ;       R2 = contatore di bit 1
         ;
         ldr     r0, =2341 ; mov r0,#2341

         mov     r1,#32
         mov     r2,#0

loop     
         cmp     r1,#0
         beq     end_loop

         and     r3,r0,#1
         cmp     r3,#0
         beq     is_zero

         add     r2,r2,#1

is_zero  
         lsr     r0,r0,#1

         sub     r1,r1,#1
         b       loop

end_loop 

