        .text
        .align  4
        .globl  ownTiltCompensateFilter_G729_16s


ownTiltCompensateFilter_G729_16s:
        stmdb   sp!, {r4 - r7, lr}
        ldr     lr, [sp, #0x14]
        ldr     r12, [sp, #0x18]
        mov     r5, #0
        add     r4, r0, #2
LDTP0:
        ldrsh   r7, [r0]
        ldrsh   r6, [r4]
        add     r5, r5, #2
        mul     r7, r2, r7
        cmp     r5, #0x28
        add     r7, r7, #2, 20
        add     r7, r6, r7, asr #14
        mov     r6, r7, lsl #16
        mov     r6, r6, asr #15
        mla     r6, r3, r6, r12
        mov     r6, r6, asr lr
        strh    r6, [r1]
        ldrsh   r7, [r0, #2]
        ldrsh   r6, [r4, #2]
        add     r4, r4, #4
        mul     r7, r2, r7
        add     r0, r0, #4
        add     r7, r7, #2, 20
        add     r7, r6, r7, asr #14
        mov     r6, r7, lsl #16
        mov     r6, r6, asr #15
        mla     r6, r3, r6, r12
        mov     r6, r6, asr lr
        strh    r6, [r1, #2]
        add     r1, r1, #4
        blt     LDTP0
        ldmia   sp!, {r4 - r7, pc}


