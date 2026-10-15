image    dcd     0x00223344, 0x00808080, 0x00ff0000, 0x00000000, 0x008080ff

         ;       R0 = pixel count
         ;       R1 = ptr to image
         ;       R2 = current pixel

         mov     r0,#5
         mov     r1,#image
loop     
         cmp     r0,#0
         beq     end_loop
         ldr     r2,[r1]
         orr     r2,r2,#0xff00
         str     r2,[r1]
         sub     r0, r0, #1
         add     r1, r1, #4
         b       loop

end_loop 

