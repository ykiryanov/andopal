        .text
        .align  4
        .globl  _ippsPreemphasize_GSMAMR_16s


_ippsPreemphasize_GSMAMR_16s:
        stmdb   sp!, {r4 - r9, lr}
        ldr     r12, [sp, #0x1C]
        cmp     r1, #0
        beq     LDOY4
        cmp     r2, #0
        beq     LDOY4
        cmp     r12, #0
        beq     LDOY4
        cmp     r3, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r9, pc}
        sub     r7, r3, #1
        cmp     r7, #0
        suble   lr, r1, #2
        ble     LDOY3
        cmp     r7, #5
        sublt   lr, r1, #2
        blt     LDOY1
        sub     lr, r1, #2
        add     r6, r1, r7, lsl #1
        add     r5, lr, r7, lsl #1
        add     r4, r2, r7, lsl #1
LDOY0:
        ldrsh   r9, [r5]
        ldrsh   r8, [r6]
        sub     r7, r7, #4
        mul     r9, r0, r9
        cmp     r7, #5
        add     r9, r8, r9, asr #15
        strh    r9, [r4]
        ldrsh   r9, [r5, #-2]
        ldrsh   r8, [r6, #-2]
        mul     r9, r0, r9
        add     r9, r8, r9, asr #15
        strh    r9, [r4, #-2]
        ldrsh   r9, [r5, #-4]
        ldrsh   r8, [r6, #-4]
        mul     r9, r0, r9
        add     r9, r8, r9, asr #15
        strh    r9, [r4, #-4]
        ldrsh   r9, [r5, #-6]
        ldrsh   r8, [r6, #-6]
        sub     r5, r5, #8
        mul     r9, r0, r9
        sub     r6, r6, #8
        add     r9, r8, r9, asr #15
        strh    r9, [r4, #-6]
        sub     r4, r4, #8
        bge     LDOY0
LDOY1:
        mov     r4, r7, lsl #1
        add     r5, r1, r7, lsl #1
        add     r6, r2, r7, lsl #1
LDOY2:
        ldrsh   r9, [lr, +r4]
        ldrsh   r8, [r5], #-2
        sub     r4, r4, #2
        mul     r9, r0, r9
        sub     r7, r7, #1
        cmp     r7, #0
        add     r9, r8, r9, asr #15
        strh    r9, [r6], #-2
        bgt     LDOY2
LDOY3:
        ldrsh   r4, [r12]
        ldrsh   r1, [r1]
        mov     r3, r3, lsl #1
        mul     r4, r0, r4
        mov     r0, #0
        add     r4, r1, r4, asr #15
        strh    r4, [r2]
        ldrsh   r3, [lr, +r3]
        strh    r3, [r12]
        ldmia   sp!, {r4 - r9, pc}
LDOY4:
        mvn     r0, #7
        ldmia   sp!, {r4 - r9, pc}


