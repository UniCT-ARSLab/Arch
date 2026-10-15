         ;
         ;       Dato un insieme di numeri, creando un nuovo insieme
         ;       che contiene solo gli elementi > 10 del primo insieme
         ;
data_in  dcd     4,10,8,9,60,20,3,1,11,50,9,14
         ;data_out dcd 0,0,0,0,0,0,0,0,0,0,0,0
data_out fill    12*4
         ;       12 elementi
         ;
         ;       R0 = n. di elementi/loop counter
         ;       R1 = puntatore all'i-esimo elemento di "data_in"
         ;       R2 = i-esimo elemento di "data_in"
         ;       R3 = puntatore all'i-esimo elemento di "data_out"
         ;       R4 = contatore degli elementi copiati, ossia lunghezza di "data_out"

         mov     r0,#12
         mov     r1,#data_in
         mov     r3,#data_out
         mov     r4,#0

loop     
         cmp     r0,#0
         beq     end_loop

         ldr     r2,[r1]
         cmp     r2,#10
         ble     skip

         str     r2,[r3]
         add     r3,r3,#4
         add     r4,r4,#1

skip     
         add     r1,r1,#4
         sub     r0,r0,#1
         b       loop

end_loop 



