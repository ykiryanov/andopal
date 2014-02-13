        .text
        .align  4
        .globl  _ippsThreshold_16s_I


_ippsThreshold_16s_I:
        stmdb   sp!, {r4 - r7, lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r7, pc}
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        cmp     r3, #4
        mov     r3, #0
        beq     LARS3
        cmp     r1, #6
        blt     LARS1
        sub     r5, r1, #6
        mov     r6, r0
LARS0:
        ldrsh   r7, [r6]
        ldrsh   r12, [r6, #2]
        ldrsh   lr, [r6, #4]
        cmp     r2, r7
        movgt   r7, r2
        cmp     r2, r12
        ldrsh   r4, [r6, #6]
        movgt   r12, r2
        cmp     r2, lr
        strh    r7, [r6]
        ldrsh   r7, [r6, #8]
        movgt   lr, r2
        cmp     r2, r4
        movgt   r4, r2
        cmp     r2, r7
        movgt   r7, r2
        add     r3, r3, #5
        strh    r12, [r6, #2]
        strh    lr, [r6, #4]
        strh    r4, [r6, #6]
        strh    r7, [r6, #8]
        cmp     r3, r5
        add     r6, r6, #0xA
        ble     LARS0
LARS1:
        add     r0, r0, r3, lsl #1
LARS2:
        ldrsh   r12, [r0]
        add     r3, r3, #1
        cmp     r2, r12
        movgt   r12, r2
        strh    r12, [r0], #2
        cmp     r3, r1
        blt     LARS2
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}
LARS3:
        cmp     r1, #6
        blt     LARS5
        sub     lr, r1, #6
        mov     r12, r0
LARS4:
        ldrsh   r7, [r12]
        ldrsh   r6, [r12, #2]
        ldrsh   r5, [r12, #4]
        cmp     r2, r7
        movlt   r7, r2
        cmp     r2, r6
        ldrsh   r4, [r12, #6]
        movlt   r6, r2
        cmp     r2, r5
        strh    r7, [r12]
        ldrsh   r7, [r12, #8]
        movlt   r5, r2
        cmp     r2, r4
        movlt   r4, r2
        cmp     r2, r7
        movlt   r7, r2
        add     r3, r3, #5
        strh    r6, [r12, #2]
        strh    r5, [r12, #4]
        strh    r4, [r12, #6]
        strh    r7, [r12, #8]
        cmp     r3, lr
        add     r12, r12, #0xA
        ble     LARS4
LARS5:
        add     r0, r0, r3, lsl #1
LARS6:
        ldrsh   r12, [r0]
        add     r3, r3, #1
        cmp     r2, r12
        movlt   r12, r2
        strh    r12, [r0], #2
        cmp     r3, r1
        blt     LARS6
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}


