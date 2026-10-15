            ;Si     realizzi un programma in assembly ARM che implementi le seguenti funzionalità.
            ;Considerare un vettore vett contenenti interi a 32 bit, e due costanti ka e kb anch’esse
            ;intere.
            ;Creare un vettore vett1 contenente i valori di vett ∈ [ka , kb ].
            ;Al     termine del programma, il registro R0 deve contenere uno dei seguenti valori:
            ;•      0, se il numero di elementi di vett1 è maggiore di zero;
            ;•      1, se il numero di elementi di vett1 è zero.

vett        dcd     4,0,10,3,4,8,5,4,6,10,20,30,40
            ;       13 elementi
vett_1      fill    13*4

            ;       R0 = n. di elementi di vett
            ;       R1 = puntatore a vett
            ;       R2 = elemento corrente di vett
            ;       R3 = puntatore a vett_1
            ;       R4 = n. di elementi di vett_1
            ;       R5 = Ka
            ;       R6 = Kb
            ;
            mov     r0,#13
            mov     r1,#vett
            mov     r3,#vett_1
            mov     r4,#0
            mov     r5,#10
            mov     r6,#200

loop        
            cmp     r0,#0
            beq     end_loop

            ldr     r2,[r1]
            cmp     r2,r5
            blt     skip
            cmp     r2,r6
            bgt     skip

            str     r2,[r3]
            add     r4,r4,#1
            add     r3,r3,#4

skip        
            add     r1,r1,#4
            sub     r0,r0,#1
            b       loop

end_loop    
            mov     r0,#1 ; ipotizzo che il num di elementi copiati e' "0"
            cmp     r4,#0
            beq     end_program

            mov     r0,#0

end_program 
















