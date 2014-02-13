        .text
        .align  4
        .globl  _ippInterpolate_H00V01_16u


_ippInterpolate_H00V01_16u:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x34
        ldr     r6, [sp, #0x5C]
        ldr     r12, [sp, #0x58]
        ldr     lr, [sp, #0x60]
        cmp     r6, #0
        mov     r5, r1
        sub     r4, r0, r2, lsl #2
        ble     LKXU4
        mov     r7, #1
        mov     lr, r7, lsl lr
        add     r7, r2, r2, lsl #2
        add     r8, r2, r2, lsl #3
        sub     r9, lr, #1
        add     r7, r2, r7
        add     r8, r2, r8
        mov     r10, #0
        mov     lr, r6
        str     r9, [sp, #8]
        str     r8, [sp, #0x20]
        str     r7, [sp, #0x1C]
        str     r6, [sp, #0x18]
        str     r1, [sp, #0x10]
        str     r0, [sp, #0xC]
LKXU0:
        cmp     r12, #0
        addle   r11, r4, r2, lsl #1
        ble     LKXU3
        ldr     r0, [sp, #0x1C]
        ldr     r1, [sp, #0x20]
        add     r11, r4, r2, lsl #1
        mov     r7, r11
        str     r11, [sp, #0x28]
        ldr     r11, [sp, #8]
        add     r0, r4, r0
        add     r1, r4, r1
        add     r8, r4, r2, lsl #2
        add     r6, r4, r2, lsl #3
        mov     r10, #0
        mov     r9, r12
        str     lr, [sp, #0x24]
        str     r4, [sp, #0x2C]
        str     r5, [sp, #0x30]
        str     r12, [sp, #0x14]
        str     r3, [sp]
        str     r2, [sp, #4]
LKXU1:
        ldrh    r12, [r8], #2
        ldrh    r3, [r0], #2
        ldr     r2, [sp, #0x2C]
        ldrh    lr, [r6], #2
        ldrh    r4, [r7], #2
        ldrh    r2, [r2, +r10]
        ldrh    r5, [r1], #2
        add     r12, r3, r12
        add     r4, lr, r4
        add     r5, r2, r5
        add     r12, r12, r12, lsl #2
        add     r4, r4, r4, lsl #2
        add     r12, r5, r12, lsl #2
        rsb     r12, r4, r12
        add     r2, r12, #0x10
        mov     r2, r2, asr #5
        cmp     r2, r11
        movgt   r2, r11
        bgt     LKXU2
        cmp     r2, #0
        mov     r3, #0
        movlt   r2, r3
LKXU2:
        ldr     r3, [sp, #0x30]
        subs    r9, r9, #1
        strh    r2, [r3, +r10]
        add     r10, r10, #2
        bne     LKXU1
        ldr     r11, [sp, #0x28]
        ldr     lr, [sp, #0x24]
        ldr     r5, [sp, #0x30]
        ldr     r12, [sp, #0x14]
        ldr     r3, [sp]
        ldr     r2, [sp, #4]
LKXU3:
        subs    lr, lr, #1
        mov     r4, r11
        add     r5, r5, r3, lsl #1
        bne     LKXU0
        ldr     r6, [sp, #0x18]
        ldr     r1, [sp, #0x10]
        ldr     r0, [sp, #0xC]
LKXU4:
        cmp     r6, #0
        ble     LKXU8
LKXU5:
        cmp     r12, #0
        ble     LKXU7
        mov     r11, #0
        mov     r10, r11
        add     r9, r1, #2
        add     r8, r0, #2
        add     r7, r1, #4
        add     r5, r0, #4
        add     r4, r1, #6
        add     lr, r0, #6
        str     r3, [sp]
        str     r2, [sp, #4]
LKXU6:
        ldrh    r2, [r1, +r11]
        ldrh    r3, [r0, +r11]
        add     r10, r10, #4
        cmp     r10, r12
        add     r2, r3, r2
        add     r2, r2, #1
        mov     r2, r2, asr #1
        strh    r2, [r1, +r11]
        ldrh    r2, [r9]
        ldrh    r3, [r8], #8
        add     r11, r11, #8
        add     r2, r3, r2
        add     r2, r2, #1
        mov     r2, r2, asr #1
        strh    r2, [r9], #8
        ldrh    r2, [r7]
        ldrh    r3, [r5], #8
        add     r2, r3, r2
        add     r2, r2, #1
        mov     r2, r2, asr #1
        strh    r2, [r7], #8
        ldrh    r2, [r4]
        ldrh    r3, [lr], #8
        add     r2, r3, r2
        add     r2, r2, #1
        mov     r2, r2, asr #1
        strh    r2, [r4], #8
        blt     LKXU6
        ldr     r3, [sp]
        ldr     r2, [sp, #4]
LKXU7:
        subs    r6, r6, #1
        add     r0, r0, r2, lsl #1
        add     r1, r1, r3, lsl #1
        bne     LKXU5
LKXU8:
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}


