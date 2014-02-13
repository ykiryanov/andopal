        .text
        .align  4
        .globl  ownvc_SSD4x4_8u32s_C1R_HF


ownvc_SSD4x4_8u32s_C1R_HF:
        stmdb   sp!, {r4 - r8, lr}
        ldr     r12, [sp, #0x18]
        mov     r6, #0
        mov     r4, #4
LKDF0:
        ldrb    r8, [r2]
        ldrb    r5, [r2, #1]
        ldrb    r7, [r0]
        ldrb    lr, [r2, #2]
        subs    r4, r4, #1
        add     r8, r8, r5
        add     r8, r8, #1
        sub     r7, r7, r8, asr #1
        mla     r6, r7, r7, r6
        ldrb    r7, [r0, #1]
        add     r5, r5, lr
        add     r5, r5, #1
        sub     r7, r7, r5, asr #1
        mla     r6, r7, r7, r6
        ldrb    r5, [r2, #3]
        ldrb    r7, [r0, #2]
        add     lr, lr, r5
        add     lr, lr, #1
        sub     r7, r7, lr, asr #1
        mla     r6, r7, r7, r6
        ldrb    r7, [r2, #4]
        ldrb    lr, [r0, #3]
        add     r2, r2, r3
        add     r7, r5, r7
        add     r5, r7, #1
        sub     lr, lr, r5, asr #1
        mla     r6, lr, lr, r6
        add     r0, r0, r1
        bne     LKDF0
        str     r6, [r12]
        ldmia   sp!, {r4 - r8, pc}


