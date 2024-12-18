                ;
                ;       lunghezza di una stringa
                ;
                ;string dcb 'H','E','L','L','O', '1', 0x0
string          dcb     0x48, 0x45, 0x4c, 0x4c, 0x4f, 0x31, 0x0, 0x0

                ;       R0 = counter
                ;       R1 = ptr
                ;       R2 = i-th character

                mov     r1,#string
                mov     r0,#0

strlen_loop     
                ldrb    r2,[r1],#1
                cmp     r2,#0
                beq     end_strlen_loop
                add     r0,r0,#1
                b       strlen_loop

end_strlen_loop 
                end

