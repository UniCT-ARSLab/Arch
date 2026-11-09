            ;
            ;       inserimento in ordine
            ;

array       dcd     4,5,8,9,10,11,14,15,20
            ;       9 elementi

            ;       R0 = numero di elementi
            ;       R1 = ptr i-esimo elemento
            ;       R2 = elemento (i-1)-esimo
            ;       R3 = valore da inserire
            ;       R4 = R0*4
            mov     r0,#9

            mov     r3,#1
loop        

            cmp     r0,#0
            blt     end_loop

            mov     r1,#array

            ;       r2 = [ r1 + (r0-1) * 4]
            ;       r2 = [ r1 + r0 * 4 - 4]
            ;
            lsl     r4, r0, #2 ; r4 = r0 * 4
            add     r1, r1, r4
            sub     r1, r1, #4
            ldr     r2, [r1]

            cmp     r2, r3
            bgt     move_item

            str     r3,[r1,#4]
            b       end_program

move_item   
            str     r2,[r1,#4]
            sub     r0, r0, #1
            b       loop

end_loop    
            mov     r1,#array
            str     r3,[r1]

end_program 
