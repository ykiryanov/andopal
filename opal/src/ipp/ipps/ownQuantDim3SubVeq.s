        .text
        .align  4
        .globl  ownQuantDim3SubVeq


ownQuantDim3SubVeq:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        ldr     r12, [sp, #0x2C]
        mov     r4, r0
        cmp     r12, #0
        mvn     r5, #2, 2
        mov     lr, #0
        mov     r12, r1
        bne     LDOP2
        cmp     r3, #0
        movle   r2, lr
        ble     LDOP1
        ldrsh   r8, [r2]
        ldrsh   r6, [r2, #2]
        ldrsh   r10, [r2, #4]
        ldrsh   r9, [r4]
        ldrsh   r7, [r4, #2]
        ldrsh   r11, [r4, #4]
        mov     r2, lr
        str     r1, [sp]
        str     r4, [sp, #4]
LDOP0:
        ldrsh   r1, [r12]
        ldrsh   r0, [r12, #2]
        ldrsh   r4, [r12, #4]
        sub     r1, r9, r1
        mov     r1, r1, lsl #16
        sub     r0, r7, r0
        mov     r1, r1, asr #16
        mul     r1, r8, r1
        mov     r0, r0, lsl #16
        sub     r4, r11, r4
        mov     r0, r0, asr #16
        mul     r0, r6, r0
        mov     r4, r4, lsl #16
        mov     r1, r1, asr #15
        mov     r4, r4, asr #16
        mul     r4, r10, r4
        mov     r1, r1, lsl #16
        mov     r0, r0, asr #15
        mov     r1, r1, asr #16
        mul     r1, r1, r1
        mov     r0, r0, lsl #16
        mov     r4, r4, asr #15
        mov     r0, r0, asr #16
        mla     r1, r0, r0, r1
        mov     r4, r4, lsl #16
        mov     r4, r4, asr #16
        mla     r1, r4, r4, r1
        cmp     r1, r5
        movlt   r5, r1
        movlt   r2, lr
        add     lr, lr, #1
        cmp     lr, r3
        add     r12, r12, #6
        blt     LDOP0
        ldr     r1, [sp]
        ldr     r4, [sp, #4]
LDOP1:
        mov     r3, r2, lsl #16
        mov     r3, r3, asr #16
        add     r12, r3, r3, lsl #2
        add     r12, r3, r12
        b       LDOP5
LDOP2:
        cmp     r3, #0
        movle   r2, lr
        ble     LDOP4
        ldrsh   r8, [r2]
        ldrsh   r6, [r2, #2]
        ldrsh   r10, [r2, #4]
        ldrsh   r9, [r4]
        ldrsh   r7, [r4, #2]
        ldrsh   r11, [r4, #4]
        mov     r2, lr
        str     r1, [sp]
        str     r4, [sp, #4]
LDOP3:
        ldrsh   r1, [r12]
        ldrsh   r0, [r12, #2]
        ldrsh   r4, [r12, #4]
        sub     r1, r9, r1
        mov     r1, r1, lsl #16
        sub     r0, r7, r0
        mov     r1, r1, asr #16
        mul     r1, r8, r1
        mov     r0, r0, lsl #16
        sub     r4, r11, r4
        mov     r0, r0, asr #16
        mul     r0, r6, r0
        mov     r4, r4, lsl #16
        mov     r1, r1, asr #15
        mov     r4, r4, asr #16
        mul     r4, r10, r4
        mov     r1, r1, lsl #16
        mov     r0, r0, asr #15
        mov     r1, r1, asr #16
        mul     r1, r1, r1
        mov     r0, r0, lsl #16
        mov     r4, r4, asr #15
        mov     r0, r0, asr #16
        mla     r1, r0, r0, r1
        mov     r4, r4, lsl #16
        mov     r4, r4, asr #16
        mla     r1, r4, r4, r1
        cmp     r1, r5
        movlt   r5, r1
        movlt   r2, lr
        add     lr, lr, #1
        cmp     lr, r3
        add     r12, r12, #0xC
        blt     LDOP3
        ldr     r1, [sp]
        ldr     r4, [sp, #4]
LDOP4:
        mov     r3, r2, lsl #16
        mov     r3, r3, asr #16
        rsb     r3, r3, r3, lsl #2
        mov     r12, r3, lsl #2
LDOP5:
        ldrsh   r3, [r12, +r1]
        add     r1, r1, r12
        mov     r2, r2, lsl #16
        strh    r3, [r4]
        ldrsh   r3, [r1, #2]
        mov     r0, r2, asr #16
        strh    r3, [r4, #2]
        ldrsh   r1, [r1, #4]
        strh    r1, [r4, #4]
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


