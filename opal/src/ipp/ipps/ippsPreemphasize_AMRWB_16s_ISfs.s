        .text
        .align  4
        .globl  _ippsPreemphasize_AMRWB_16s_ISfs


_ippsPreemphasize_AMRWB_16s_ISfs:
        stmdb   sp!, {r4 - r10, lr}
        ldr     r12, [sp, #0x20]
        cmp     r1, #0
        beq     LDJH6
        cmp     r12, #0
        beq     LDJH6
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r10, pc}
        cmp     r3, #0
        blt     LDJH5
        cmp     r3, #0xF
        bgt     LDJH5
        mov     lr, r2, lsl #1
        sub     r6, r1, #2
        ldrsh   lr, [r6, +lr]
        adds    r5, r3, #1
        moveq   r4, #0
        movne   r4, #1
        movne   r4, r4, lsl r3
        sub     r3, r2, #1
        cmp     r3, #0
        rsble   r0, r0, #0
        ble     LDJH2
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        rsb     r0, r0, #0
        add     r6, r6, r3, lsl #1
        mvn     r8, r2
        add     r7, r1, r3, lsl #1
LDJH0:
        ldrsh   r10, [r7]
        ldrsh   r9, [r6], #-2
        mov     r10, r10, lsl #15
        mla     r10, r0, r9, r10
        add     r9, r4, r10
        mov     r9, r9, asr r5
        cmp     r8, r9
        mvnlt   r9, r2
        blt     LDJH1
        cmn     r9, #2, 18
        movge   r9, r9, lsl #16
        movge   r9, r9, asr #16
        movlt   r9, #0
        sublt   r9, r9, #2, 18
LDJH1:
        sub     r3, r3, #1
        strh    r9, [r7], #-2
        cmp     r3, #0
        bgt     LDJH0
LDJH2:
        ldrsh   r2, [r1]
        ldrsh   r3, [r12]
        mov     r6, r2, lsl #15
        mvn     r2, #0xFF
        mla     r6, r0, r3, r6
        bic     r0, r2, #0x7F, 24
        mvn     r2, r0
        add     r6, r4, r6
        mov     r5, r6, asr r5
        cmp     r2, r5
        blt     LDJH3
        cmn     r5, #2, 18
        movge   r5, r5, lsl #16
        movge   r0, r5, asr #16
        b       LDJH4
LDJH3:
        mov     r0, #0
        sub     r0, r0, #2, 18
        mvn     r0, r0
LDJH4:
        strh    r0, [r1]
        mov     r0, #0
        strh    lr, [r12]
        ldmia   sp!, {r4 - r10, pc}
LDJH5:
        mvn     r0, #0xC
        ldmia   sp!, {r4 - r10, pc}
LDJH6:
        mvn     r0, #7
        ldmia   sp!, {r4 - r10, pc}


