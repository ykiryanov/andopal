        .text
        .align  4
        .globl  ownTakeSign_G729E_16s


ownTakeSign_G729E_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x28
        mov     r3, #0
        str     r2, [sp, #0x1C]
LDHF0:
        ldr     r2, [pc, #0x15C]
        add     r4, r3, #1
        add     lr, r0, r3, lsl #7
        smull   r12, r2, r4, r2
        mov     r12, r4, asr #31
        rsb     r12, r12, r2, asr #1
        mov     r2, r3, lsl #1
        add     r12, r12, r12, lsl #2
        sub     r3, r4, r12
        str     r4, [sp, #0x20]
        mov     r5, r3, lsl #1
        add     r11, r5, #0xA
        add     r10, r5, #0x1E
        add     r9, r5, #0x28
        add     r8, r5, #0x32
        add     r7, r5, #0x3C
        add     r6, r5, #0x46
        add     r12, r5, #0x14
        mov     r3, #8
        str     r6, [sp, #0xC]
        str     r7, [sp, #8]
        str     r8, [sp, #4]
        str     r9, [sp, #0x10]
        str     r10, [sp]
        str     r11, [sp, #0x14]
        str     r5, [sp, #0x18]
        str     r0, [sp, #0x24]
LDHF1:
        ldrsh   r4, [r1, +r2]
        mov     r0, r1
        cmp     r4, #0
        ldrlt   r0, [sp, #0x1C]
        ldr     r4, [sp, #0x18]
        ldrsh   r7, [lr]
        ldrsh   r10, [lr, #2]
        ldrsh   r6, [r0, +r4]
        ldrsh   r4, [lr, #4]
        ldrsh   r5, [lr, #6]
        ldrsh   r8, [lr, #0xC]
        mul     r11, r7, r6
        ldrsh   r6, [lr, #8]
        ldrsh   r7, [lr, #0xA]
        ldrsh   r9, [lr, #0xE]
        add     r2, r2, #0xA
        mov     r11, r11, asr #15
        strh    r11, [lr]
        ldr     r11, [sp, #0x14]
        subs    r3, r3, #1
        ldrsh   r11, [r11, +r0]
        mul     r11, r10, r11
        mov     r10, r11, asr #15
        strh    r10, [lr, #2]
        ldrsh   r10, [r12, +r0]
        mul     r10, r4, r10
        mov     r4, r10, asr #15
        strh    r4, [lr, #4]
        ldr     r4, [sp]
        ldrsh   r4, [r4, +r0]
        mul     r4, r5, r4
        mov     r4, r4, asr #15
        strh    r4, [lr, #6]
        ldr     r4, [sp, #0x10]
        ldrsh   r4, [r4, +r0]
        mul     r4, r6, r4
        mov     r4, r4, asr #15
        strh    r4, [lr, #8]
        ldr     r4, [sp, #4]
        ldrsh   r4, [r4, +r0]
        mul     r4, r7, r4
        mov     r4, r4, asr #15
        strh    r4, [lr, #0xA]
        ldr     r4, [sp, #8]
        ldrsh   r4, [r4, +r0]
        mul     r4, r8, r4
        mov     r4, r4, asr #15
        strh    r4, [lr, #0xC]
        ldr     r4, [sp, #0xC]
        ldrsh   r0, [r4, +r0]
        mul     r0, r9, r0
        mov     r0, r0, asr #15
        strh    r0, [lr, #0xE]
        add     lr, lr, #0x10
        bne     LDHF1
        ldr     r4, [sp, #0x20]
        ldr     r0, [sp, #0x24]
        cmp     r4, #5
        mov     r3, r4
        blt     LDHF0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
        .long   0x66666667


