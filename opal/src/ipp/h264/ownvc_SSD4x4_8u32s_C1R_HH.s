        .text
        .align  4
        .globl  ownvc_SSD4x4_8u32s_C1R_HH


ownvc_SSD4x4_8u32s_C1R_HH:
        stmdb   sp!, {r4 - r11, lr}
        ldr     r12, [sp, #0x24]
        mov     lr, #0
        mov     r5, #4
LKDE0:
        ldrb    r9, [r2, #1]
        ldrb    r6, [r2]
        ldrb    r10, [r0]
        mov     r4, r2
        add     r2, r2, r3
        ldrb    r7, [r2]
        ldrb    r8, [r2, #1]
        add     r11, r6, r9
        ldrb    r6, [r4, #2]
        add     r7, r11, r7
        add     r11, r8, r7
        ldrb    r7, [r2, #2]
        add     r11, r11, #2
        sub     r10, r10, r11, asr #2
        mla     lr, r10, r10, lr
        add     r9, r9, r6
        add     r10, r9, r8
        ldrb    r9, [r0, #1]
        ldrb    r8, [r4, #3]
        ldrb    r4, [r4, #4]
        add     r10, r7, r10
        add     r10, r10, #2
        sub     r9, r9, r10, asr #2
        mla     lr, r9, r9, lr
        ldrb    r9, [r2, #3]
        add     r6, r6, r8
        add     r7, r6, r7
        add     r8, r8, r4
        ldrb    r4, [r0, #2]
        add     r7, r9, r7
        add     r7, r7, #2
        ldrb    r6, [r2, #4]
        sub     r4, r4, r7, asr #2
        mla     lr, r4, r4, lr
        ldrb    r4, [r0, #3]
        add     r9, r8, r9
        add     r6, r9, r6
        add     r6, r6, #2
        sub     r4, r4, r6, asr #2
        mla     lr, r4, r4, lr
        subs    r5, r5, #1
        add     r0, r0, r1
        bne     LKDE0
        str     lr, [r12]
        ldmia   sp!, {r4 - r11, pc}


