               ;
               ;       Dato un array di interi a 32 bit di cui e' nota la dimensione,
               ;       contare quanti elementi sono > 10
               ;
my_array       dcd     40,10,5,30,20,55,11,22

               ;       R0 = numero di elementi dell'array
               ;       R1 = puntatore all'i-esimo elemento dell'array
               ;       R2 = elemento i-esimo dell'array
               ;       R3 = contatore degli elementi > 10

               mov     r0,#8
               mov     r1,#my_array
               mov     r3,#0

scan_loop      
               cmp     r0,#0
               beq     end_scan_loop

               ldr     r2,[r1]
               cmp     r2,#10
               ble     skip_increment
               ;
               ;       if (r2 > 0) r3++;
               ;
               add     r3,r3,#1

skip_increment 
               add     r1,r1,#4
               sub     r0,r0,#1
               b       scan_loop

end_scan_loop  



