        .text
        .align  4
        .globl  ownvc_SSD8x8_8u32s_C1R_HH


ownvc_SSD8x8_8u32s_C1R_HH:
        stmdb   sp!, {r4 - r11, lr}
        ldr     r12, [sp, #0x24]
        mov     r5, #0
        mov     r4, #8
LEDU0:
        add     r8, r2, r3
        mov     r9, #0
        mov     r7, r2
        add     r6, r8, #1
LEDU1:
        ldrb    r11, [r7, #1]!
        ldrb    r10, [r2, +r9]
        ldrb    lr, [r6, #-1]
        add     r11, r10, r11
        ldrb    r10, [r9, +r0]
        add     lr, r11, lr
        ldrb    r11, [r6], #1
        add     r9, r9, #1
        cmp     r9, #8
        add     r11, lr, r11
        add     lr, r11, #2
        sub     r10, r10, lr, asr #2
        mla     r5, r10, r10, r5
        blt     LEDU1
        subs    r4, r4, #1
        add     r0, r0, r1
        mov     r2, r8
        bne     LEDU0
        str     r5, [r12]
        ldmia   sp!, {r4 - r11, pc}


