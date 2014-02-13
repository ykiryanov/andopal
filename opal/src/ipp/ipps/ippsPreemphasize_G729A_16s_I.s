        .text
        .align  4
        .globl  _ippsPreemphasize_G729A_16s_I


_ippsPreemphasize_G729A_16s_I:
        stmdb   sp!, {r4 - r9, lr}
        cmp     r1, #0
        beq     LDQM4
        cmp     r3, #0
        beq     LDQM4
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r9, pc}
        mov     r12, r2, lsl #1
        sub     r8, r1, #2
        ldrsh   r12, [r8, +r12]
        sub     r2, r2, #1
        cmp     r2, #0
        ble     LDQM3
        cmp     r2, #5
        blt     LDQM1
        add     r7, r1, r2, lsl #1
        add     r6, r8, r2, lsl #1
LDQM0:
        ldrsh   r4, [r6]
        ldrsh   lr, [r7]
        ldrsh   r5, [r7, #-2]
        mul     r4, r0, r4
        sub     r2, r2, #4
        cmp     r2, #5
        sub     lr, lr, r4, asr #15
        strh    lr, [r7]
        ldrsh   lr, [r6, #-2]
        ldrsh   r4, [r7, #-4]
        mul     r9, r0, lr
        ldrsh   lr, [r7, #-6]
        sub     r5, r5, r9, asr #15
        strh    r5, [r7, #-2]
        ldrsh   r5, [r6, #-4]
        mul     r5, r0, r5
        sub     r4, r4, r5, asr #15
        strh    r4, [r7, #-4]
        ldrsh   r4, [r6, #-6]
        sub     r6, r6, #8
        mul     r4, r0, r4
        sub     lr, lr, r4, asr #15
        strh    lr, [r7, #-6]
        sub     r7, r7, #8
        bge     LDQM0
LDQM1:
        add     r8, r8, r2, lsl #1
        add     lr, r1, r2, lsl #1
LDQM2:
        ldrsh   r5, [r8], #-2
        ldrsh   r4, [lr]
        mul     r5, r0, r5
        sub     r2, r2, #1
        cmp     r2, #0
        sub     r4, r4, r5, asr #15
        strh    r4, [lr], #-2
        bgt     LDQM2
LDQM3:
        ldrsh   lr, [r3]
        ldrsh   r2, [r1]
        mul     lr, r0, lr
        mov     r0, #0
        sub     r2, r2, lr, asr #15
        strh    r2, [r1]
        strh    r12, [r3]
        ldmia   sp!, {r4 - r9, pc}
LDQM4:
        mvn     r0, #7
        ldmia   sp!, {r4 - r9, pc}


