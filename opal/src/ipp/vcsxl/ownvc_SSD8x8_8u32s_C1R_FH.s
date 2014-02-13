        .text
        .align  4
        .globl  ownvc_SSD8x8_8u32s_C1R_FH


ownvc_SSD8x8_8u32s_C1R_FH:
        stmdb   sp!, {r4 - r10, lr}
        ldr     r12, [sp, #0x20]
        mov     r7, #0
        mov     r4, #8
LEDW0:
        ldrb    r10, [r2]
        ldrb    r8, [r0]
        mov     r5, r2
        add     r2, r2, r3
        ldrb    r9, [r2]
        ldrb    lr, [r0, #1]
        ldrb    r6, [r5, #1]
        subs    r4, r4, #1
        add     r9, r10, r9
        add     r9, r9, #1
        sub     r8, r8, r9, asr #1
        ldrb    r9, [r2, #1]
        mla     r7, r8, r8, r7
        ldrb    r8, [r0, #2]
        add     r9, r6, r9
        add     r6, r9, #1
        sub     lr, lr, r6, asr #1
        mla     r7, lr, lr, r7
        ldrb    lr, [r2, #2]
        ldrb    r6, [r5, #2]
        ldrb    r10, [r5, #5]
        ldrb    r9, [r0, #5]
        add     lr, r6, lr
        add     lr, lr, #1
        sub     r8, r8, lr, asr #1
        mla     lr, r8, r8, r7
        ldrb    r7, [r2, #3]
        ldrb    r8, [r5, #3]
        ldrb    r6, [r0, #3]
        add     r7, r8, r7
        add     r7, r7, #1
        ldrb    r8, [r5, #4]
        sub     r6, r6, r7, asr #1
        mla     lr, r6, r6, lr
        ldrb    r7, [r2, #4]
        ldrb    r6, [r0, #4]
        add     r7, r8, r7
        ldrb    r8, [r2, #5]
        add     r7, r7, #1
        sub     r6, r6, r7, asr #1
        mla     r6, r6, r6, lr
        ldrb    lr, [r0, #6]
        ldrb    r7, [r5, #6]
        add     r10, r10, r8
        ldrb    r8, [r2, #6]
        ldrb    r5, [r5, #7]
        add     r10, r10, #1
        sub     r9, r9, r10, asr #1
        mla     r6, r9, r9, r6
        add     r8, r7, r8
        ldrb    r7, [r2, #7]
        add     r8, r8, #1
        sub     lr, lr, r8, asr #1
        mla     r6, lr, lr, r6
        ldrb    lr, [r0, #7]
        add     r7, r5, r7
        add     r5, r7, #1
        sub     lr, lr, r5, asr #1
        mla     r7, lr, lr, r6
        add     r0, r0, r1
        bne     LEDW0
        str     r7, [r12]
        ldmia   sp!, {r4 - r10, pc}


