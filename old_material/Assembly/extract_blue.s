image        dcd     0x00223344, 0x00808080, 0x00ff0000, 0x00000000, 0x008080ff
blue_channel fill    20

             ;       R0 = pixel count
             ;       R1 = ptr to image
             ;       R2 = current pixel
             ;       R3 = ptr to blue_channel

             mov     r0,#5
             mov     r1,#image
             mov     r3,#blue_channel
loop         
             cmp     r0,#0
             beq     end_loop
             ldr     r2,[r1]
             and     r2, r2, #0x000000ff
             str     r2,[r3]
             sub     r0, r0, #1
             add     r1, r1, #4
             add     r3, r3, #4
             b       loop

end_loop     

