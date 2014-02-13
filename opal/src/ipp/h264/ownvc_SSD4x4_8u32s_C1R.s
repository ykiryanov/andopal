        .text
        .align  4
        .globl  ownvc_SSD4x4_8u32s_C1R


ownvc_SSD4x4_8u32s_C1R:
        stmdb   sp!, {r4 - r8, lr}
        ldr     r12, [sp, #0x18]
        mov     r5, #0
        mov     lr, #4
LKDH0:
        ldrb    r8, [r0]
        ldrb    r7, [r2]
        ldrb    r6, [r0, #1]
        ldrb    r4, [r2, #1]
        subs    lr, lr, #1
        sub     r8, r8, r7
        mla     r5, r8, r8, r5
        sub     r8, r6, r4
        ldrb    r7, [r0, #2]
        ldrb    r6, [r2, #2]
        ldrb    r4, [r0, #3]
        mla     r5, r8, r8, r5
        add     r0, r0, r1
        sub     r7, r7, r6
        ldrb    r6, [r2, #3]
        add     r2, r2, r3
        mla     r5, r7, r7, r5
        sub     r4, r4, r6
        mla     r5, r4, r4, r5
        bne     LKDH0
        str     r5, [r12]
        ldmia   sp!, {r4 - r8, pc}


