        .text
        .align  4
        .globl  _ippsPreemphasize_GSMFR_16s


_ippsPreemphasize_GSMFR_16s:
        stmdb   sp!, {r4, r5, lr}
        cmp     r0, #0
        beq     LDTG3
        cmp     r1, #0
        beq     LDTG3
        cmp     r3, #0
        beq     LDTG3
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4, r5, pc}
        ldrsh   r4, [r3]
        cmp     r2, #0
        ble     LDTG2
        mvn     lr, #0x13
        mov     r12, #0xFF
        bic     lr, lr, #0x6E, 24
        orr     r12, r12, #0x7F, 24
LDTG0:
        mul     r5, r4, lr
        ldrsh   r4, [r0]
        add     r5, r5, #1, 18
        mov     r5, r5, asr #15
        mov     r5, r5, lsl #16
        add     r5, r4, r5, asr #16
        cmp     r12, r5
        movlt   r4, r12
        blt     LDTG1
        cmn     r5, #2, 18
        movge   r4, r5, lsl #16
        movge   r4, r4, asr #16
        mvnlt   r4, r12
LDTG1:
        strh    r4, [r1], #2
        ldrsh   r4, [r0], #2
        subs    r2, r2, #1
        bne     LDTG0
LDTG2:
        mov     r0, #0
        strh    r4, [r3]
        ldmia   sp!, {r4, r5, pc}
LDTG3:
        mvn     r0, #7
        ldmia   sp!, {r4, r5, pc}


