                        ;
                        ;       Compito A del 31/01/2023
                        ;
data                    dcd     8,3,1,51,11,3,5,21,12,14
odd                     fill    10*4
even                    fill    10*4
minimo                  fill    4
massimo                 fill    4
                        ;
                        ;       R0 = numero di elementi
                        ;       R1 = puntatore all'i-esimo elemento
                        ;       R2 = valore dell'i-esimo elemento
                        ;       R3 = puntatore all'i-esimo elemento del vettore odd
                        ;       R4 = puntatore all'i-esimo elemento del vettore even
                        ;       R5 = registro di scratch
                        ;       R6 = contatore degli elementi di odd
                        ;       R7 = contatore degli elementi di even
                        ;
                        mov     r0,#10
                        mov     r1,#data
                        mov     r3,#odd
                        mov     r4,#even
                        mov     r6,#0
                        mov     r7,#0

loop                    
                        cmp     r0,#0
                        beq     end_loop
                        ldr     r2,[r1],#4
                        and     r5,r2,#1
                        cmp     r5,#0
                        beq     is_even
                        ;       is_odd
                        str     r2,[r3],#4
                        add     r6,r6,#1
                        b       next
is_even                 
                        str     r2,[r4],#4
                        add     r7,r7,#1
next                    
                        sub     r0,r0,#1
                        b       loop
end_loop                

                        cmp     r6,r7
                        blt     even_is_longer_than_odd
                        ;       odd is longer than even

                        mov     r0,r6
                        mov     r1,#odd
                        b       calc_min_max

even_is_longer_than_odd 
                        mov     r0,r7
                        mov     r1,#even
                        ;
                        ;       R0 = numero di elementi
                        ;       R1 = puntatore all'i-esimo elemento
                        ;       R2 = valore dell'i-esimo elemento
                        ;       R3 = minimo temporaneo
                        ;       R4 = massimo temporaneo
                        ;
calc_min_max            
                        ldr     r3,[r1],#4 ; minimo temporaneo = primo elemento dell'array
                        mov     r4,r3 ; massimo temporaneo = primo elemento dell'array

loop2                   
                        cmp     r0,#1
                        beq     end_loop2
                        ldr     r2,[r1],#4

                        ;       confronto con il minimo temporaneo
                        cmp     r2,r3
                        bge     skip
                        mov     r3,r2
skip                    

                        ;       confronto con il massimo temporaneo
                        cmp     r2,r4
                        ble     skip_2
                        mov     r4,r2
skip_2                  


                        sub     r0,r0,#1
                        b       loop2
end_loop2               
                        mov     r0,#minimo
                        str     r3,[r0]
                        mov     r0,#massimo
                        str     r4,[r0]






