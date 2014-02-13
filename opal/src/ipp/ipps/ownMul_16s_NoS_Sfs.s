        .text
        .align  4
        .globl  ownMul_16s_NoS_Sfs


ownMul_16s_NoS_Sfs:
        stmdb   sp!, {r4 - r9, lr}
        ldr     r12, [sp, #0x1C]
        cmp     r3, #0
        ble     LDMX3
        cmp     r3, #5
        mov     r7, #0
        blt     LDMX1
        sub     r6, r3, #5
        mov     r5, r1
        mov     r4, r0
        mov     lr, r2
LDMX0:
        ldrsh   r9, [r5]
        ldrsh   r8, [r4]
        add     r7, r7, #4
        cmp     r7, r6
        mul     r9, r8, r9
        mov     r8, r9, asr r12
        strh    r8, [lr]
        ldrsh   r9, [r5, #2]
        ldrsh   r8, [r4, #2]
        mul     r9, r8, r9
        mov     r8, r9, asr r12
        strh    r8, [lr, #2]
        ldrsh   r9, [r5, #4]
        ldrsh   r8, [r4, #4]
        mul     r9, r8, r9
        mov     r8, r9, asr r12
        strh    r8, [lr, #4]
        ldrsh   r9, [r5, #6]
        ldrsh   r8, [r4, #6]
        add     r5, r5, #8
        add     r4, r4, #8
        mul     r9, r8, r9
        mov     r8, r9, asr r12
        strh    r8, [lr, #6]
        add     lr, lr, #8
        ble     LDMX0
LDMX1:
        add     r1, r1, r7, lsl #1
        add     r0, r0, r7, lsl #1
        add     r2, r2, r7, lsl #1
LDMX2:
        ldrsh   lr, [r1], #2
        ldrsh   r4, [r0], #2
        add     r7, r7, #1
        mul     lr, r4, lr
        cmp     r7, r3
        mov     lr, lr, asr r12
        strh    lr, [r2], #2
        blt     LDMX2
LDMX3:
        ldmia   sp!, {r4 - r9, pc}


