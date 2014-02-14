        .text
        .align  4
        .globl  ippiQuantInvIntra_H263_16s_C1I


ippiQuantInvIntra_H263_16s_C1I:
        stmdb   sp!, {r4, r5, lr}
        ldr     r12, [sp, #0xC]
        mov     r4, r0
        cmp     r4, #0
        mov     r0, r2
        mvneq   r0, #7
        ldmeqia sp!, {r4, r5, pc}
        cmp     r0, #1
        blt     LFFW3
        cmp     r0, #0x1F
        bgt     LFFW3
        cmp     r1, #0
        mvnlt   r0, #0xA
        ldmltia sp!, {r4, r5, pc}
        cmp     r3, #0
        bne     LFFW2
        ldrsh   r5, [r4]
        cmp     r1, #0
        ble     LFFW1
        cmp     r12, #0
        bne     LFFW0
        mov     r2, r1
        mov     r1, r0
        mov     r0, r4
        mov     r3, #1
        bl      ownph263_QuantInv_16s_I
        b       LFFW1
LFFW0:
        mov     r2, r1
        mov     r1, r0
        mov     r0, r4
        mov     r3, #1
        bl      ownph263_QuantInv_ModQ_16s_I
LFFW1:
        mov     r5, r5, lsl #3
        strh    r5, [r4]
        mov     r0, #0
        ldmia   sp!, {r4, r5, pc}
LFFW2:
        mov     r2, r1
        mov     r1, r0
        mov     r0, r4
        bl      ownph263_QuantInv_AdvIntra_16s_I
        mov     r0, #0
        ldmia   sp!, {r4, r5, pc}
LFFW3:
        mvn     r0, #0xBF
        ldmia   sp!, {r4, r5, pc}


