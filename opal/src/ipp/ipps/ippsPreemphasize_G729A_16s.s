        .text
        .align  4
        .globl  _ippsPreemphasize_G729A_16s


_ippsPreemphasize_G729A_16s:
        stmdb   sp!, {r4 - r9, lr}
        ldr     r12, [sp, #0x1C]
        cmp     r1, #0
        beq     LDQN4
        cmp     r2, #0
        beq     LDQN4
        cmp     r12, #0
        beq     LDQN4
        cmp     r3, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r9, pc}
        mov     lr, r3, lsl #1
        sub     r7, r1, #2
        ldrsh   lr, [r7, +lr]
        sub     r3, r3, #1
        cmp     r3, #0
        ble     LDQN3
        cmp     r3, #5
        blt     LDQN1
        add     r6, r1, r3, lsl #1
        add     r5, r7, r3, lsl #1
        add     r4, r2, r3, lsl #1
LDQN0:
        ldrsh   r9, [r5]
        ldrsh   r8, [r6]
        sub     r3, r3, #4
        mul     r9, r0, r9
        cmp     r3, #5
        sub     r8, r8, r9, asr #15
        strh    r8, [r4]
        ldrsh   r9, [r5, #-2]
        ldrsh   r8, [r6, #-2]
        mul     r9, r0, r9
        sub     r8, r8, r9, asr #15
        strh    r8, [r4, #-2]
        ldrsh   r9, [r5, #-4]
        ldrsh   r8, [r6, #-4]
        mul     r9, r0, r9
        sub     r8, r8, r9, asr #15
        strh    r8, [r4, #-4]
        ldrsh   r9, [r5, #-6]
        ldrsh   r8, [r6, #-6]
        sub     r5, r5, #8
        mul     r9, r0, r9
        sub     r6, r6, #8
        sub     r8, r8, r9, asr #15
        strh    r8, [r4, #-6]
        sub     r4, r4, #8
        bge     LDQN0
LDQN1:
        add     r7, r7, r3, lsl #1
        add     r4, r1, r3, lsl #1
        add     r5, r2, r3, lsl #1
LDQN2:
        ldrsh   r8, [r7], #-2
        ldrsh   r6, [r4], #-2
        mul     r8, r0, r8
        sub     r3, r3, #1
        cmp     r3, #0
        sub     r6, r6, r8, asr #15
        strh    r6, [r5], #-2
        bgt     LDQN2
LDQN3:
        ldrsh   r3, [r12]
        ldrsh   r1, [r1]
        mul     r3, r0, r3
        mov     r0, #0
        sub     r1, r1, r3, asr #15
        strh    r1, [r2]
        strh    lr, [r12]
        ldmia   sp!, {r4 - r9, pc}
LDQN4:
        mvn     r0, #7
        ldmia   sp!, {r4 - r9, pc}


