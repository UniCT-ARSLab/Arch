                      ;       Considerare:
                      ;•      un vettore a contenente interi a 32 bit;
                      ;•      Un valore cut memorizzato in un’apposita locazione di memoria
                      ;Effettuare le seguenti operazioni:
                      ;1.     Generare un vettore low contenente gli elementi di a minori di cut;
                      ;2.     Generare un vettore high contenente gli elementi di a maggiori di cut;

vett_a                dcd     30,2,8,45,25,10,22,11

cut                   dcd     10

low                   fill    8*4
high                  fill    8*4

                      mov     r0,#cut
                      ldr     r9,[r0]
                      ;       R0 = numero di elementi di vett_a
                      ;       R1 = puntatore all'i-esimo elemento di vett_a
                      ;       R2 = i-esimo elemento di vett_a
                      ;       R3 = puntatore all'i-esimo elemento di low
                      ;       R4 = puntatore all'i-esimo elemento di high
                      ;       R5 = contatore elementi di low
                      ;       R6 = contatore elementi di high
                      ;       R9 = valore di cut
                      mov     r0,#8
                      mov     r1,#vett_a
                      mov     r3,#low
                      mov     r4,#high
                      mov     r5,#0
                      mov     r6,#0

scan_loop             
                      cmp     r0,#0
                      beq     end_scan_loop

                      ldr     r2,[r1],#4

                      cmp     r2,r9
                      bgt     put_in_high
                      blt     put_in_low

continue              
                      sub     r0,r0,#1
                      b       scan_loop

put_in_high           
                      str     r2,[r4],#4
                      add     r6,r6,#1
                      b       continue


put_in_low            
                      str     r2,[r3],#4
                      add     r5,r5,#1
                      b       continue

end_scan_loop         
                      cmp     r5,r6
                      ble     low_shorter_than_high
                      bgt     low_longer_than_high

                      mov     r0, #0
                      b       end_program

low_shorter_than_high 
                      mov     r0, #1
                      b       end_program

low_longer_than_high  
                      mov     r0,# -1

end_program           








