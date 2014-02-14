        .text
        .align  4
        .globl  ippiQuantInvInter_H263_16s_C1I


ippiQuantInvInter_H263_16s_C1I:
        stmdb   sp!, {r4, lr}
        cmp     r0, #0
        mov     r4, r2
        mvneq   r0, #7
        ldmeqia sp!, {r4, pc}
        cmp     r4, #1
        blt     LFFX1
        cmp     r4, #0x1F
        bgt     LFFX1
        cmp     r1, #0
        mvnlt   r0, #0xA
        ldmltia sp!, {r4, pc}
        cmp     r3, #0
        bne     LFFX0
        mov     r2, r1
        mov     r1, r4
        mov     r3, #0
        bl      ownph263_QuantInv_16s_I
        mov     r0, #0
        ldmia   sp!, {r4, pc}
LFFX0:
        mov     r2, r1
        mov     r1, r4
        mov     r3, #0
        bl      ownph263_QuantInv_ModQ_16s_I
        mov     r0, #0
        ldmia   sp!, {r4, pc}
LFFX1:
        mvn     r0, #0xBF
        ldmia   sp!, {r4, pc}


