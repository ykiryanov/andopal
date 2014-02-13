        .text
        .align  4
        .globl  ownvc_Sub8x8_8u16s_C1R


ownvc_Sub8x8_8u16s_C1R:
        stmdb   sp!, {r4 - r6, lr}
        ldr     lr, [sp, #0x10]
        ldr     r12, [sp, #0x14]
        mov     r4, #8
LKCY0:
        ldrb    r6, [r2]
        ldrb    r5, [r0]
        subs    r4, r4, #1
        sub     r5, r5, r6
        strh    r5, [lr]
        ldrb    r5, [r0, #1]
        ldrb    r6, [r2, #1]
        sub     r5, r5, r6
        strh    r5, [lr, #2]
        ldrb    r5, [r0, #2]
        ldrb    r6, [r2, #2]
        sub     r5, r5, r6
        strh    r5, [lr, #4]
        ldrb    r5, [r0, #3]
        ldrb    r6, [r2, #3]
        sub     r5, r5, r6
        strh    r5, [lr, #6]
        ldrb    r5, [r0, #4]
        ldrb    r6, [r2, #4]
        sub     r5, r5, r6
        strh    r5, [lr, #8]
        ldrb    r5, [r0, #5]
        ldrb    r6, [r2, #5]
        sub     r5, r5, r6
        strh    r5, [lr, #0xA]
        ldrb    r5, [r0, #6]
        ldrb    r6, [r2, #6]
        sub     r5, r5, r6
        strh    r5, [lr, #0xC]
        ldrb    r5, [r0, #7]
        ldrb    r6, [r2, #7]
        add     r0, r0, r1
        add     r2, r2, r3
        sub     r5, r5, r6
        strh    r5, [lr, #0xE]
        add     lr, lr, r12
        bne     LKCY0
        ldmia   sp!, {r4 - r6, pc}


