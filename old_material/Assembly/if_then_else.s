       mov     r0, #5
       mov     r1,#-3
       mov     r2, r1
       add     r4,r0,r1 ; r4 = r0 + r1
       sub     r0, r0, #2 ; r0 = r0 - 2
       ;
       ;       if (r0 != 3) goto qui;
       ;       r7 = 50;
       ;       qui:
       ;       r8 = 50;
       ;
       cmp     r0,#3
       bne     qui

       mov     r7,#50

qui    
       mov     r8,#60

       ;       if (r0 == 3)
       ;       r7 = 50;
       ;       else
       ;       r8 = 60
       ;
       cmp     r0,#3
       beq     then
       ;       else
       mov     r8, #60
       b       endif

then   
       mov     r7,#50

endif  

