              ;
              ;       dato un array, raddoppiare ogni elemento
              ;
my_array      dcd     23,44,22,10,50
              ;
              mov     r0,#5 ; lunghezza dell'array
              mov     r1,#my_array ; puntatore all'array

scan_loop     
              cmp     r0,#0
              beq     end_scan_loop

              ldr     r2,[r1] ; r2 elemento i-esimo dell'array

              add     r2,r2,r2 ; R2 = R2 + R2

              str     r2,[r1] ; memorizza il nuovo valore nell'i-esimo elemento dell'array

              add     r1,r1,#4 ; sposta il puntatore all'elemento successivo

              sub     r0,r0,#1
              b       scan_loop

end_scan_loop 
