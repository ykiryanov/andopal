        .text
        .align  4
        .globl  ownvc_SSD8x8_8u32s_C1R


ownvc_SSD8x8_8u32s_C1R:
        stmdb   sp!, {r4 - r9, lr}
        ldr     r12, [sp, #0x1C]
        mov     lr, #0
        mov     r7, #8
LEDX0:
        ldrb    r6, [r0]
        ldrb    r8, [r2]
        ldrb    r4, [r0, #1]
        ldrb    r5, [r2, #1]
        subs    r7, r7, #1
        sub     r6, r6, r8
        mla     lr, r6, r6, lr
        sub     r8, r4, r5
        ldrb    r6, [r2, #2]
        ldrb    r5, [r0, #2]
        ldrb    r4, [r0, #3]
        mla     lr, r8, r8, lr
        ldrb    r8, [r2, #5]
        sub     r6, r5, r6
        ldrb    r5, [r2, #3]
        mla     r6, r6, r6, lr
        ldrb    lr, [r2, #4]
        sub     r5, r4, r5
        ldrb    r4, [r0, #4]
        mla     r9, r5, r5, r6
        ldrb    r5, [r0, #6]
        ldrb    r6, [r2, #6]
        sub     lr, r4, lr
        mla     lr, lr, lr, r9
        ldrb    r4, [r0, #5]
        sub     r5, r5, r6
        sub     r9, r4, r8
        mla     lr, r9, r9, lr
        ldrb    r4, [r0, #7]
        ldrb    r8, [r2, #7]
        add     r2, r2, r3
        add     r0, r0, r1
        mla     lr, r5, r5, lr
        sub     r4, r4, r8
        mla     lr, r4, r4, lr
        bne     LEDX0
        str     lr, [r12]
        ldmia   sp!, {r4 - r9, pc}


