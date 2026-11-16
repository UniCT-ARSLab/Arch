              ;
              ;       dato un array, cercare un valore
              ;
my_array      dcd     23,44,22,10,50
              ;
              mov     r0,#5 ; lunghezza dell'array
              mov     r1,#my_array ; puntatore all'array
              mov     r2,#11 ; valore da cercare
              ;       se il valore e' stato trovato allora R5 = 1
              ;       se il valore non e' stato trovato allora R5 = 0
scan_loop     
              cmp     r0,#0
              beq     end_scan_loop

              ldr     r3,[r1] ; r3 elemento i-esimo dell'array

              cmp     r3,r2
              beq     found

              add     r1,r1,#4 ; sposta il puntatore all'elemento successivo

              sub     r0,r0,#1
              b       scan_loop

found         
              mov     r5,#1
              b       end_program

end_scan_loop 
              mov     r5,#0

end_program   







