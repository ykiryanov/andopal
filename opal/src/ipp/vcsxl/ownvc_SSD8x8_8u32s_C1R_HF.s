        .text
        .align  4
        .globl  ownvc_SSD8x8_8u32s_C1R_HF


ownvc_SSD8x8_8u32s_C1R_HF:
        stmdb   sp!, {r4 - r9, lr}
        ldr     r12, [sp, #0x1C]
        mov     r6, #0
        mov     lr, #8
LEDV0:
        ldrb    r8, [r2]
        ldrb    r4, [r2, #1]
        ldrb    r7, [r0]
        ldrb    r5, [r2, #2]
        ldrb    r9, [r0, #4]
        add     r8, r8, r4
        add     r8, r8, #1
        sub     r7, r7, r8, asr #1
        mla     r6, r7, r7, r6
        ldrb    r7, [r0, #1]
        add     r4, r4, r5
        add     r4, r4, #1
        sub     r7, r7, r4, asr #1
        mla     r7, r7, r7, r6
        ldrb    r6, [r2, #3]
        ldrb    r8, [r0, #2]
        ldrb    r4, [r2, #4]
        add     r5, r5, r6
        add     r5, r5, #1
        add     r6, r6, r4
        sub     r8, r8, r5, asr #1
        mla     r7, r8, r8, r7
        add     r5, r6, #1
        ldrb    r6, [r0, #3]
        ldrb    r8, [r2, #6]
        subs    lr, lr, #1
        sub     r6, r6, r5, asr #1
        mla     r6, r6, r6, r7
        ldrb    r7, [r2, #5]
        ldrb    r5, [r2, #7]
        add     r4, r4, r7
        add     r4, r4, #1
        sub     r9, r9, r4, asr #1
        mla     r6, r9, r9, r6
        ldrb    r4, [r0, #5]
        add     r7, r7, r8
        add     r7, r7, #1
        sub     r4, r4, r7, asr #1
        mla     r6, r4, r4, r6
        ldrb    r7, [r0, #6]
        add     r8, r8, r5
        ldrb    r4, [r2, #8]
        add     r8, r8, #1
        sub     r7, r7, r8, asr #1
        mla     r6, r7, r7, r6
        ldrb    r7, [r0, #7]
        add     r4, r5, r4
        add     r4, r4, #1
        sub     r7, r7, r4, asr #1
        mla     r6, r7, r7, r6
        add     r2, r2, r3
        add     r0, r0, r1
        bne     LEDV0
        str     r6, [r12]
        ldmia   sp!, {r4 - r9, pc}


