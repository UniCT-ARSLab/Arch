             ;
             ;       algoritmo per il calcolo della media aritmetica
             ;
vett         dcd     3,4,1,2,9,0,5,11,3,1
             ;
             ;       R0 = lunghezza vettore
             ;       R1 = ptr a vett
             ;       R2 = elemento i-esimo di vett
             ;       R3 = somma degli elementi di vett
             ;

             mov     r0,#10
             mov     r1,#vett
             mov     r3,#0
loop         
             cmp     r0,#0
             beq     end_loop
             ldr     r2,[r1],#4

             add     r3,r3,r2

skip         
             sub     r0,r0,#1
             b       loop
end_loop     
             ;       calcolo di R4=R3/10
             ;

division     
             mov     r4,#0
div_loop     
             cmp     r3,#10
             blt     end_div_loop

             sub     r3,r3,#10
             add     r4,r4,#1
             b       div_loop

end_div_loop 
             ;       R4 = media aritmetica (intera)















