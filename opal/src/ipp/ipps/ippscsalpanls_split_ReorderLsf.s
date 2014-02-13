        .text
        .align  4
        .globl  ReorderLsf


ReorderLsf:
        stmdb   sp!, {r4 - r6, lr}
        cmp     r2, #0
        ble     LDOW2
        cmp     r2, #5
        mov     r4, #0
        movlt   lr, r4
        movlt   r12, r1
        blt     LDOW1
        mov     lr, r4
        sub     r3, r2, #5
        mov     r12, r1
LDOW0:
        mov     r4, r4, lsl #1
        ldrsh   r5, [r0, +r4]
        add     r6, lr, #1
        cmp     r5, r1
        movgt   r1, r5
        strh    r1, [r0, +r4]
        add     r5, r12, r1
        mov     r6, r6, lsl #16
        mov     r5, r5, lsl #16
        mov     r1, r6, asr #15
        ldrsh   r4, [r0, +r1]
        mov     r5, r5, asr #16
        cmp     r4, r5
        movgt   r5, r4
        strh    r5, [r0, +r1]
        add     r1, lr, #2
        add     r5, r12, r5
        mov     r4, r1, lsl #16
        mov     r1, r5, lsl #16
        mov     r4, r4, asr #15
        ldrsh   r5, [r0, +r4]
        mov     r1, r1, asr #16
        cmp     r5, r1
        movgt   r1, r5
        strh    r1, [r0, +r4]
        add     r4, lr, #3
        add     r1, r12, r1
        mov     r4, r4, lsl #16
        mov     r1, r1, lsl #16
        mov     r4, r4, asr #15
        ldrsh   r5, [r0, +r4]
        mov     r1, r1, asr #16
        add     lr, lr, #4
        cmp     r5, r1
        movgt   r1, r5
        strh    r1, [r0, +r4]
        add     r1, r12, r1
        mov     r4, lr, lsl #16
        mov     r1, r1, lsl #16
        mov     r4, r4, asr #16
        cmp     r4, r3
        mov     r1, r1, asr #16
        ble     LDOW0
LDOW1:
        mov     r4, r4, lsl #1
        ldrsh   r3, [r0, +r4]
        add     lr, lr, #1
        cmp     r3, r1
        movgt   r1, r3
        strh    r1, [r0, +r4]
        add     r1, r12, r1
        mov     r3, lr, lsl #16
        mov     r1, r1, lsl #16
        mov     r4, r3, asr #16
        cmp     r4, r2
        mov     r1, r1, asr #16
        blt     LDOW1
LDOW2:
        ldmia   sp!, {r4 - r6, pc}


