                ;
                ;       Compito B del 31/01/2023
                ;
data            dcd     8,3,1,48,16,3,5,32,12,64
sixteen         fill    10*4
result          dcd     -1
                ;
                ;       R0 = numero di elementi
                ;       R1 = puntatore all'i-esimo elemento
                ;       R2 = valore dell'i-esimo elemento
                ;       R3 = puntatore all'i-esimo elemento del vettore sixteen
                ;       R4 = contatore degli elementi di sixteen
                ; 
                mov     r0,#10
                mov     r1,#data
                mov     r3,#sixteen
                mov     r4,#0
loop            
                cmp     r0,#0
                beq     end_loop

                ldr     r2,[r1],#4
                ;       test divisibilita' per 16
                and     r5,r2,#0b1111
                cmp     r5,#0
                bne     is_not_div_b_16
                ;       il numero e' divisibile per 16
                str     r2,[r3],#4
                add     r4,r4,#1

is_not_div_b_16 
                sub     r0,r0,#1
                b       loop
end_loop        
                cmp     r4,#0
                beq     end_program

                ;
                ;       R0 = numero di elementi
                ;       R1 = puntatore all'i-esimo elemento
                ;       R2 = valore dell'i-esimo elemento
                ;       R3 = minimo temporaneo
                ;       R4 = massimo temporaneo
                ;
                mov     r0,r4
                mov     r1,#sixteen

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
                ;       R3 = minimo
                ;       R4 = massimo
                ;       R5 = (R3 + R4) / 2 = valore medio tra massimo e minimo
                add     r5,r3,r4
                lsr     r5,r5,#1

                mov     r0,#result
                str     r5,[r0]

end_program     







