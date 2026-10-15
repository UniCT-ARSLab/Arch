
               ;       'h','e','l','l','o',0
s1             dcb     0x48, 0x45, 0x4c, 0x4c, 0x4f, 0x00, 0x0, 0x0

               ;       r0 = return value
               ;       -1 carattere non trovato
               ;       >=0 posizione del carattere trovato
               ;       r1 = s1
               ;       r2 = carattere da cercare

               mov     r0,#0
               mov     r1,#s1
               mov     r2,#0x4c

strchr_loop    
               ldrb    r3,[r1],#1
               cmp     r3,#0
               beq     char_not_found
               cmp     r3,r2
               beq     char_found
               add     r0,r0,#1
               b       strchr_loop
char_not_found 
               mov     r0,#-1

char_found     

