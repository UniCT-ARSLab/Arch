
data     dcd     10,20,30,50,50,60,70,20,-4

         mov     r1,#data
         mov     r2,#0
loop     
         ldr     r0,[r1]
         cmp     r0,#0
         blt     end_loop
         add     r2, r2, r0
         add     r1,r1,#4
         b       loop

end_loop 

