        .text
        .align  4
        .globl  ownMul_32s16s


ownMul_32s16s:
        stmdb   sp!, {r4 - r7, lr}
        cmp     r3, #0
        ble     LDMW1
        mov     r12, #0xFF
        orr     lr, r12, #0x7F, 24
LDMW0:
        ldr     r12, [r0], #4
        ldr     r4, [r1], #4
        subs    r3, r3, #1
        mov     r6, r12, asr #16
        mov     r7, r6, lsl #16
        mov     r6, r4, asr #16
        and     r5, lr, r4, asr #1
        mov     r4, r7, asr #16
        mul     r5, r5, r4
        mov     r6, r6, lsl #16
        and     r12, lr, r12, asr #1
        mov     r6, r6, asr #16
        mul     r12, r6, r12
        mov     r5, r5, asr #15
        mla     r5, r4, r6, r5
        add     r12, r5, r12, asr #15
        mov     r12, r12, lsl #1
        strh    r12, [r2], #2
        bne     LDMW0
LDMW1:
        ldmia   sp!, {r4 - r7, pc}


