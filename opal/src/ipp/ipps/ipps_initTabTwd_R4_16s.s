        .text
        .align  4
        .globl  _ipps_initTabTwd_R4_16s


_ipps_initTabTwd_R4_16s:
        stmdb   sp!, {r4 - r10, lr}
        mov     lr, #1
        mov     r12, lr, lsl r0
        sub     r2, r2, r0
        add     r4, r3, r12, lsl #3
        and     r0, r4, #0x1F
        rsb     r0, r0, #0
        mov     r5, r12, asr #1
        and     r0, r0, #0x1F
        mov     lr, lr, lsl r2
        add     r5, r12, r5, lsr #30
        add     r0, r4, r0
        mov     r2, r5, asr #2
        cmp     r2, #0
        mov     r4, #0
        ble     LCCH1
        mov     r8, #0
        add     r7, r3, #2
        mov     r6, r8
        sub     r5, r3, #2
LCCH0:
        rsb     r9, r8, #0
        mul     r9, lr, r9
        add     r8, r8, #1
        cmp     r8, r2
        mla     r10, lr, r2, r9
        mov     r9, r6, lsl #1
        add     r6, r6, lr
        mov     r10, r10, lsl #1
        ldrsh   r10, [r1, +r10]
        strh    r10, [r7, #-2]
        ldrsh   r9, [r1, +r9]
        strh    r9, [r7]
        rsb     r9, r9, #0
        strh    r9, [r5, #6]
        ldrsh   r9, [r7, #-2]
        add     r7, r7, #8
        strh    r9, [r5, #8]!
        blt     LCCH0
LCCH1:
        cmp     r12, #0
        mov     r1, #1
        movlt   r4, r1
        add     r4, r12, r4
        mov     r1, r4, asr #1
        cmp     r2, r1
        bge     LCCH3
        mov     r4, r2, lsl #3
        rsb     lr, r2, #0
        add     r5, r4, #2
        add     lr, r3, lr, lsl #3
        sub     r4, r4, #6
        add     r6, r3, #4
        add     lr, r5, lr
        add     r4, r4, r6
        add     r5, r5, r3
        sub     r2, r1, r2
LCCH2:
        ldrsh   r6, [lr]
        subs    r2, r2, #1
        rsb     r6, r6, #0
        strh    r6, [r5, #-2]
        ldrsh   r6, [lr, #-2]
        add     lr, lr, #8
        strh    r6, [r5]
        rsb     r6, r6, #0
        strh    r6, [r4, #6]
        ldrsh   r6, [r5, #-2]
        add     r5, r5, #8
        strh    r6, [r4, #8]!
        bne     LCCH2
LCCH3:
        cmp     r1, r12
        bge     LCCH5
        mov     r4, r1, lsl #3
        rsb     lr, r1, #0
        sub     r2, r4, #6
        add     r5, r4, #2
        add     lr, r3, lr, lsl #3
        sub     r12, r12, r1
        add     r4, r3, #4
        add     r1, r2, lr
        add     r3, r5, r3
        add     r2, r2, r4
LCCH4:
        ldrsh   lr, [r1, #6]
        subs    r12, r12, #1
        rsb     lr, lr, #0
        strh    lr, [r3, #-2]
        ldrsh   lr, [r1, #8]!
        rsb     lr, lr, #0
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        strh    lr, [r3]
        rsb     lr, lr, #0
        strh    lr, [r2, #6]
        ldrsh   lr, [r3, #-2]
        add     r3, r3, #8
        strh    lr, [r2, #8]!
        bne     LCCH4
LCCH5:
        ldmia   sp!, {r4 - r10, pc}


