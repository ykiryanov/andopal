        .text
        .align  4
        .globl  ownvc_SSD4x4_8u32s_C1R_FH


ownvc_SSD4x4_8u32s_C1R_FH:
        stmdb   sp!, {r4 - r10, lr}
        ldr     r12, [sp, #0x20]
        mov     r5, #0
        mov     lr, #4
LKDG0:
        ldrb    r9, [r2]
        ldrb    r8, [r0]
        mov     r4, r2
        add     r2, r2, r3
        ldrb    r10, [r2]
        ldrb    r6, [r0, #1]
        ldrb    r7, [r4, #1]
        subs    lr, lr, #1
        add     r10, r9, r10
        add     r9, r10, #1
        sub     r8, r8, r9, asr #1
        ldrb    r9, [r2, #1]
        mla     r8, r8, r8, r5
        ldrb    r5, [r0, #2]
        add     r9, r7, r9
        add     r7, r9, #1
        sub     r6, r6, r7, asr #1
        mla     r8, r6, r6, r8
        ldrb    r7, [r2, #2]
        ldrb    r6, [r4, #2]
        ldrb    r4, [r4, #3]
        add     r7, r6, r7
        add     r6, r7, #1
        sub     r5, r5, r6, asr #1
        mla     r8, r5, r5, r8
        ldrb    r6, [r2, #3]
        ldrb    r5, [r0, #3]
        add     r0, r0, r1
        add     r6, r4, r6
        add     r4, r6, #1
        sub     r5, r5, r4, asr #1
        mla     r5, r5, r5, r8
        bne     LKDG0
        str     r5, [r12]
        ldmia   sp!, {r4 - r10, pc}


