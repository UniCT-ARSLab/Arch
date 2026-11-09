                  ;
                  ;       Compito del 03/04/2023
                  ;
array_a           dcd     5,10,8,5,7,5,2,10,12
                  ;       len_a = 9
array_b           dcd     5,8,9,10,1
                  ;       len_b = 5
                  ;found  1,1,0,1,0
                  ;
found             fill    4 * 5
                  ;
                  ;       R0 = numero elementi di array_b
                  ;       R1 = ptr ad array_b
                  ;       R2 = i-esimo elemento di array_b
                  ;       R3 = numero elementi di array_a
                  ;       R4 = ptr ad array_a
                  ;       R5 = i-esimo elemento di array_a
                  ;       R7 = ptr a found
                  ;       R8 = contatore di "1"
                  ;
                  mov     r0,#5
                  mov     r1,#array_b
                  mov     r7,#found
                  mov     r8,#0
array_b_loop      
                  cmp     r0,#0
                  beq     end_array_b_loop
                  ldr     r2,[r1],#4
                  ;       cerca r2 in array_a

                  mov     r3,#9
                  mov     r4,#array_a
array_a_loop      
                  cmp     r3,#0
                  beq     element_not_found
                  ldr     r5,[r4],#4

                  cmp     r2,r5
                  beq     element_found

                  sub     r3,r3,#1
                  b       array_a_loop
element_found     
                  mov     r6,#1
                  add     r8,r8,#1
                  b       end_array_a_loop

element_not_found 
                  mov     r6,#0

end_array_a_loop  
                  str     r6,[r7],#4
                  sub     r0,r0,#1
                  b       array_b_loop

end_array_b_loop  
                  and     r0,r8,#1
                  ;       se R0 = 0, il numero di "1" e' pari
                  ;       se R0 = 1, il numero di "1" e' dispari





