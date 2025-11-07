         ;
         ;       Considerare un vettore v contenenti interi a 32 bit,
         ;       e due costanti a e b anch’esse intere.
         ;       Creare due vettori v1 e v2 :
         ;       v1 deve contenente i valori di v ∈ [a, b], v2 i rimanenti elementi.

vett     dcd     4,0,10,3,4,8,5,4,6,10,20,30,40
         ;       13 elementi
vett_1   fill    13*4
vett_2   fill    13*4

         ;       R0 = n. di elementi di vett
         ;       R1 = puntatore a vett
         ;       R2 = elemento corrente di vett
         ;       R3 = puntatore a vett_1
         ;       R4 = puntatore a vett_2
         ;       R5 = Ka
         ;       R6 = Kb
         ;
         mov     r0,#13
         mov     r1,#vett
         mov     r3,#vett_1
         mov     r4,#vett_2
         mov     r5,#10
         mov     r6,#200

loop     
         cmp     r0,#0
         beq     end_loop

         ldr     r2,[r1]
         cmp     r2,r5
         blt     not_in
         cmp     r2,r6
         bgt     not_in

         ;       r2 e' in [r5,r6]
         str     r2,[r3]
         add     r3,r3,#4
         b       next

not_in   
         ;       r2 non e' in [r5,r6]
         str     r2,[r4]
         add     r4,r4,#4

next     
         add     r1,r1,#4
         sub     r0,r0,#1
         b       loop

end_loop 















