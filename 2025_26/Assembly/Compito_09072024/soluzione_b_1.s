              ;Sia    dato un vettore a di interi a 32 bit:
              ;•      Determinare se il vettore è ordinato, cioè verificare che ∀i ∈ [0..n − 2], ai ≤ ai+1 ,
              ;dove   n è la dimensione del vettore;
              ;•      Qualora il vettore sia ordinato, generare un nuovo vettore b che contiene gli elementi
              ;di     a dall’indice n2 − 1 all’indice n − 1.
              ;

vett          dcd     5,6,10,12,14,18,20,25,26,30,33,34
              ;       12 elementi
vett_b        fill    12*4

              ;       R0 = n. di elementi
              ;       R1 = puntatore a vett
              ;       R2 = i-esimo elemento
              ;       R3 = i+1 -esimo elemento
              ;       R4 = 1 -> array ordinato, 0 -> array non e' ordinato
              ;       R5 = memorizzazione temporanea del num di elementi
              mov     r0,#12
              mov     r5,r0
              mov     r1,#vett

loop          
              cmp     r0,#1
              beq     end_loop

              ldr     r2,[r1]
              add     r1,r1,#4
              ldr     r3,[r1]

              cmp     r2,r3
              bgt     not_ordered

              sub     r0,r0,#1
              b       loop

end_loop      
              mov     r4,#1

              lsr     r0,r5,#1
              sub     r0,r0,#1
              ;       R0 = n/2 -1

              mov     r3,#vett_b

copy_loop     
              cmp     r0,R5
              beq     end_copy_loop
              ;       vett + r0 * 4

              ;       r1 = r0 * 4
              lsl     r1,r0,#2
              ;       r1 = r1 + vett
              add     r1,r1,#vett
              ldr     r2,[r1]
              str     r2,[r3]
              add     r3,r3,#4

              add     r0,r0,#1
              b       copy_loop


end_copy_loop 
              b       end_program

not_ordered   
              mov     r4,#0

end_program   


