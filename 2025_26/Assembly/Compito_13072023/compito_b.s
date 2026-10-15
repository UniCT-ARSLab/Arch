                ;
                ;       Sia dato un vettore v di interi a 32 bit:
                ;       Generare un nuovo vettore counts il cui i-esimo elemento indica quanti bit
                ;       a 1 ci sono nell’i-esimo elemento di v (effettuare l’AND con 1 per testare il
                ;       b0 e poi shiftare a destra il valore, ripetendo queste operazioni per 32 volte);
                ;
vett_v          dcd     10,30,0,-50,6
counts          fill    5*4

num_of_elements equ     5

                ;       R3 = numero di elementi
                ;       R4 = ptr i-esimo elemento di vett_v
                ;       R5 = ptr i-esimo elemento di counts

                mov     r3,#num_of_elements
                mov     r4,#vett_v
                mov     r5,#counts

scan_loop       
                cmp     r3,#0
                beq     end_scan_loop

                ldr     r0,[r4],#4
                ;       R0 = numero da testare
                ;       R1 = contatore di ciclo di lunghezza 32
                ;       R2 = contatore di bit 1
                ;
                mov     r1,#32
                mov     r2,#0

loop            
                cmp     r1,#0
                beq     end_loop

                and     r6,r0,#1
                cmp     r6,#0
                beq     is_zero

                add     r2,r2,#1

is_zero         
                lsr     r0,r0,#1

                sub     r1,r1,#1
                b       loop

end_loop        
                str     r2,[r5],#4
                sub     r3,r3,#1
                b       scan_loop
end_scan_loop   

                ;       R0 = numero di elementi
                ;       R1 = ptr i-esimo elemento di counts
                ;       R2 = i-esimo elemento di counts
                ;       R3 = massimo temporaneo
                mov     r0,#num_of_elements
                mov     r1,#counts

                ldr     r3,[r1],#4

max_loop        
                cmp     r0,#1
                beq     end_max_loop
                ldr     r2,[r1],#4
                cmp     r2,r3
                ble     skip
                mov     r3,r2
skip            
                sub     r0,r0,#1
                b       max_loop
end_max_loop    




