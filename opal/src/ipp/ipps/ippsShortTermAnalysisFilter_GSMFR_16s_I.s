        .text
        .align  4
        .globl  _ippsShortTermAnalysisFilter_GSMFR_16s_I


_ippsShortTermAnalysisFilter_GSMFR_16s_I:
        stmdb   sp!, {r4 - r9, lr}
        cmp     r0, #0
        beq     LDTD5
        cmp     r3, #0
        beq     LDTD5
        cmp     r1, #0
        beq     LDTD5
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r9, pc}
        cmp     r2, #0
        ble     LDTD4
        mov     r12, #0xFF
        orr     r12, r12, #0x7F, 24
LDTD0:
        ldrsh   r4, [r1]
        mov     r6, r0
        mov     r5, r3
        mov     lr, r4
        mov     r7, #8
LDTD1:
        ldrsh   r9, [r5]
        strh    r4, [r5], #2
        ldrsh   r8, [r6], #2
        mul     r4, lr, r8
        add     r4, r4, #1, 18
        mov     r4, r4, asr #15
        mov     r4, r4, lsl #16
        add     r4, r9, r4, asr #16
        cmp     r12, r4
        movlt   r4, #0xFF
        orrlt   r4, r4, #0x7F, 24
        blt     LDTD2
        cmn     r4, #2, 18
        movge   r4, r4, lsl #16
        movge   r4, r4, asr #16
        bge     LDTD2
        mov     r4, #0xFF
        orr     r4, r4, #0x7F, 24
        mvn     r4, r4
LDTD2:
        mul     r9, r8, r9
        mov     r8, #0xFF
        orr     r8, r8, #0x7F, 24
        add     r9, r9, #1, 18
        mov     r9, r9, asr #15
        mov     r9, r9, lsl #16
        add     r9, lr, r9, asr #16
        cmp     r12, r9
        movlt   lr, r8
        blt     LDTD3
        cmn     r9, #2, 18
        movge   r9, r9, lsl #16
        movge   lr, r9, asr #16
        mvnlt   lr, r8
LDTD3:
        subs    r7, r7, #1
        bne     LDTD1
        strh    lr, [r1], #2
        subs    r2, r2, #1
        bne     LDTD0
LDTD4:
        mov     r0, #0
        ldmia   sp!, {r4 - r9, pc}
LDTD5:
        mvn     r0, #7
        ldmia   sp!, {r4 - r9, pc}


