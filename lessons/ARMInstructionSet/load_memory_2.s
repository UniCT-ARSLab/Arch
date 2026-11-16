
my_data dcd     20, 30, 11, -3, 44

        mov     r0,#my_data
        ldr     r1,[r0]
        mov     r0,#my_data + 4
        ldr     r2,[r0]
        add     r3,r1,r2
        mov     r0,#my_data
        str     r3,[r0]

