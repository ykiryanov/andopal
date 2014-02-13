        .text
        .align  4
        .globl  _ippsDeemphasize_AMRWBE_NR_16s_I


_ippsDeemphasize_AMRWBE_NR_16s_I:
        stmdb   sp!, {r4 - r8, lr}
        ldr     r12, [sp, #0x18]
        cmp     r2, #0
        beq     LDJR4
        cmp     r12, #0
        beq     LDJR4
        cmp     r3, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r8, pc}
        ldrsh   lr, [r2]
        ldrsh   r4, [r12]
        mov     r5, lr, lsl r1
        mov     lr, #0xFF
        orr     lr, lr, #0x7F, 24
        mla     r5, r0, r4, r5
        add     r5, r5, #1, 18
        mov     r4, r5, asr #15
        cmp     lr, r4
        movlt   r4, lr
        blt     LDJR0
        cmn     r4, #2, 18
        movge   r4, r4, lsl #16
        movge   r4, r4, asr #16
        mvnlt   r4, lr
LDJR0:
        cmp     r3, #1
        strh    r4, [r2]
        suble   r4, r2, #2
        ble     LDJR3
        sub     r4, r2, #2
        add     r2, r2, #2
        add     r5, r4, #2
        sub     r6, r3, #1
LDJR1:
        ldrsh   r8, [r2]
        ldrsh   r7, [r5], #2
        mov     r8, r8, lsl r1
        mla     r8, r0, r7, r8
        add     r7, r8, #1, 18
        mov     r7, r7, asr #15
        cmp     lr, r7
        movlt   r7, lr
        blt     LDJR2
        cmn     r7, #2, 18
        movge   r7, r7, lsl #16
        movge   r7, r7, asr #16
        mvnlt   r7, lr
LDJR2:
        strh    r7, [r2], #2
        subs    r6, r6, #1
        bne     LDJR1
LDJR3:
        mov     r3, r3, lsl #1
        ldrsh   r3, [r4, +r3]
        mov     r0, #0
        strh    r3, [r12]
        ldmia   sp!, {r4 - r8, pc}
LDJR4:
        mvn     r0, #7
        ldmia   sp!, {r4 - r8, pc}


