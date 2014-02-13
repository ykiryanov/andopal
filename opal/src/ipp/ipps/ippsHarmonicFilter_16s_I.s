        .text
        .align  4
        .globl  _ippsHarmonicFilter_16s_I


_ippsHarmonicFilter_16s_I:
        stmdb   sp!, {r4 - r9, lr}
        cmp     r2, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r9, pc}
        cmp     r3, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r9, pc}
        cmp     r3, #5
        rsb     r1, r1, #0
        mov     r6, #0
        addlt   r1, r2, r1, lsl #1
        blt     LDUH1
        add     r1, r2, r1, lsl #1
        sub     r5, r3, #5
        mov     r4, r2
        mov     lr, r1
LDUH0:
        ldrsh   r8, [lr]
        ldrsh   r12, [r4]
        ldrsh   r7, [r4, #2]
        mul     r9, r0, r8
        ldrsh   r8, [r4, #4]
        add     r6, r6, #4
        cmp     r6, r5
        add     r9, r12, r9, asr #15
        strh    r9, [r4]
        ldrsh   r9, [lr, #2]
        ldrsh   r12, [r4, #6]
        mul     r9, r0, r9
        add     r9, r7, r9, asr #15
        strh    r9, [r4, #2]
        ldrsh   r7, [lr, #4]
        mul     r7, r0, r7
        add     r7, r8, r7, asr #15
        strh    r7, [r4, #4]
        ldrsh   r7, [lr, #6]
        add     lr, lr, #8
        mul     r7, r0, r7
        add     r7, r12, r7, asr #15
        strh    r7, [r4, #6]
        add     r4, r4, #8
        ble     LDUH0
LDUH1:
        add     r2, r2, r6, lsl #1
        mov     r12, r6, lsl #1
LDUH2:
        ldrsh   r4, [r1, +r12]
        ldrsh   lr, [r2]
        add     r12, r12, #2
        mul     r4, r0, r4
        add     r6, r6, #1
        cmp     r6, r3
        add     r4, lr, r4, asr #15
        strh    r4, [r2], #2
        blt     LDUH2
        mov     r0, #0
        ldmia   sp!, {r4 - r9, pc}


