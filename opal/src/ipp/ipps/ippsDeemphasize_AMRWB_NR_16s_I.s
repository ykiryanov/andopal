        .text
        .align  4
        .globl  _ippsDeemphasize_AMRWB_NR_16s_I


_ippsDeemphasize_AMRWB_NR_16s_I:
        stmdb   sp!, {r4 - r7, lr}
        cmp     r1, #0
        beq     LDJP4
        cmp     r3, #0
        beq     LDJP4
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        ldrsh   r12, [r1]
        ldrsh   lr, [r3]
        mov     r4, r12, lsl #14
        mov     r12, #0xFF
        orr     r12, r12, #0x7F, 24
        mla     r4, r0, lr, r4
        add     r4, r4, #1, 18
        mov     lr, r4, asr #15
        cmp     r12, lr
        movlt   lr, r12
        blt     LDJP0
        cmn     lr, #2, 18
        movge   lr, lr, lsl #16
        movge   lr, lr, asr #16
        mvnlt   lr, r12
LDJP0:
        cmp     r2, #1
        strh    lr, [r1]
        suble   lr, r1, #2
        ble     LDJP3
        sub     lr, r1, #2
        add     r1, r1, #2
        add     r4, lr, #2
        sub     r5, r2, #1
LDJP1:
        ldrsh   r7, [r1]
        ldrsh   r6, [r4], #2
        mov     r7, r7, lsl #14
        mla     r7, r0, r6, r7
        add     r6, r7, #1, 18
        mov     r6, r6, asr #15
        cmp     r12, r6
        movlt   r6, r12
        blt     LDJP2
        cmn     r6, #2, 18
        movge   r6, r6, lsl #16
        movge   r6, r6, asr #16
        mvnlt   r6, r12
LDJP2:
        strh    r6, [r1], #2
        subs    r5, r5, #1
        bne     LDJP1
LDJP3:
        mov     r2, r2, lsl #1
        ldrsh   r2, [lr, +r2]
        mov     r0, #0
        strh    r2, [r3]
        ldmia   sp!, {r4 - r7, pc}
LDJP4:
        mvn     r0, #7
        ldmia   sp!, {r4 - r7, pc}


