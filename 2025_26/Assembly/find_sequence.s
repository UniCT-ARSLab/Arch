                   ;
                   ;
                   ;
array_a            dcd     2,1,3,3
                   ;
sequence           dcd     3,1
                   ;
sequence_len       equ     2
                   ;       Trovare la sequenza "sequence" dentro l'"array_a"
                   ;
                   ;       R0 = lunghezza array_a
                   ;       R1 = ptr array_a
                   ;       R2 = lunghezza sequence
                   ;       R3 = ptr sequence
                   ;       R4 = elemento corrente array_a
                   ;       R5 = elemento corrente sequence
                   ;       R6 = salvataggio temporaneo di R1
                   ;       R7 = registro temporaneo per il calcolo del limite di scan_a_loop
                   ;
                   ;       in output
                   ;       R0 = 0 sequence not fround
                   ;       R0 = 1 sequence found
                   ;
                   mov     r0,#4
                   mov     r1,#array_a
                   mov     r2,#sequence_len
                   sub     r7,r0,r2
                   sub     r7,r7,#1

scan_a_loop        
                   cmp     r0,r7 ; lunghezza di a - lunghezza di sequence - 1
                   beq     end_scan_a_loop

                   mov     r2,#sequence_len
                   mov     r3,#sequence

                   mov     r6,r1 ; salvataggio di R1

scan_sequence_loop 
                   cmp     r2,#0
                   beq     end_scan_sequence

                   ldr     r4,[r1]
                   ldr     r5,[r3]
                   cmp     r4,r5
                   bne     sequence_not_found

                   add     R3,R3,#4
                   add     r1,r1,#4
                   sub     r2,r2,#1
                   b       scan_sequence_loop

end_scan_sequence  
                   ;       sequenza trovata!!!
                   mov     r0,#1
                   b       end_program

sequence_not_found 

                   sub     r0,r0,#1
                   mov     r1,r6 ; Ripristino di R1
                   add     r1,r1,#4
                   b       scan_a_loop

end_scan_a_loop    
                   ;       sequenza non trovata
                   mov     r0,#0

end_program        





