
                ;       'h','e','l','l','o',0
s1              dcb     0x48, 0x45, 0x4c, 0x4c, 0x4f, 0x00, 0x0, 0x0
                ;       'h','e','l','l', 'o', 0
s2              dcb     0x48, 0x45, 0x4c, 0x4c, 0x4f, 0x00, 0x0, 0x0

                ;       r0 = return value, 0 --> stringhe uguali
                ;       r1 = s1
                ;       r2 = s2
                ;       r3 = *s1
                ;       r4 = *s2

                mov     r1,#s1
                mov     r2,#s2

strcmp_loop     
                ldrb    r3,[r1]
                ldrb    r4,[r2]

                sub     r0, r3, r4
                cmp     r3,r4
                bne     end_strcmp_loop

                cmp     r3,#0
                bne     strcmp_continue
                cmp     r4,#0
                bne     strcmp_continue
                ;       r3 == 0&& r4 == 0
                b       end_strcmp_loop

strcmp_continue 
                add     r1,r1,#1
                add     r2,r2,#1
                b       strcmp_loop

end_strcmp_loop 
                end

