        .text
        .align  4
        .globl  ownvc_SumPredictOBMC8x8_8u_C1R


ownvc_SumPredictOBMC8x8_8u_C1R:
        stmdb   sp!, {r4 - r8, lr}
        ldr     r3, [pc, #0x58]
        mov     r12, #0
LEKN0:
        ldrb    r7, [r3, #0x40]
        ldrb    r6, [r0, #0x40]
        ldrb    r4, [r0]
        ldrb    r5, [r3]
        ldrb    lr, [r3, #0x80]
        mul     r7, r6, r7
        ldrb    r6, [r0, #0x80]
        and     r8, r12, #7
        cmp     r8, #7
        mla     r7, r4, r5, r7
        mla     r7, r6, lr, r7
        add     lr, r7, #4
        mov     lr, lr, asr #3
        strb    lr, [r12, +r1]
        addeq   r1, r1, r2
        subeq   r1, r1, #8
        add     r12, r12, #1
        cmp     r12, #0x40
        add     r0, r0, #1
        add     r3, r3, #1
        blt     LEKN0
        ldmia   sp!, {r4 - r8, pc}
        .long   mp4_OBMC8x8_wt


