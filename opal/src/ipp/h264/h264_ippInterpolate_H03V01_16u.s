        .text
        .align  4
        .globl  _ippInterpolate_H03V01_16u


_ippInterpolate_H03V01_16u:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x23, 28
        ldr     lr, [sp, #0x258]
        ldr     r12, [sp, #0x254]
        ldr     r4, [sp, #0x25C]
        cmp     lr, #0
        add     r5, sp, #0x30
        sub     r9, r0, #4
        ble     LKXI4
        mov     r6, #1
        mov     r6, r6, lsl r4
        sub     r6, r6, #1
        mov     r8, #0
        mov     r7, lr
        str     r4, [sp, #0x14]
        str     lr, [sp, #0x18]
        str     r3, [sp, #0x20]
        str     r1, [sp, #0x28]
        str     r0, [sp, #0x2C]
LKXI0:
        cmp     r12, #0
        ble     LKXI3
        mov     r0, r9
        mov     r1, r12
        mov     r3, #0
        str     r12, [sp, #0x1C]
        str     r2, [sp, #0x24]
LKXI1:
        ldrh    r10, [r0, #6]
        ldrh    r11, [r0, #4]
        ldrh    r2, [r0, #8]
        ldrh    r12, [r0, #2]
        ldrh    lr, [r9, +r3]
        ldrh    r4, [r0, #0xA]
        add     r10, r10, r11
        add     r12, r2, r12
        add     r10, r10, r10, lsl #2
        add     r4, lr, r4
        add     r12, r12, r12, lsl #2
        add     r10, r4, r10, lsl #2
        rsb     r10, r12, r10
        add     r2, r10, #0x10
        mov     r2, r2, asr #5
        cmp     r2, r6
        movgt   r2, r6
        bgt     LKXI2
        cmp     r2, #0
        movlt   r2, r8
LKXI2:
        strh    r2, [r5, +r3]
        subs    r1, r1, #1
        add     r3, r3, #2
        add     r0, r0, #2
        bne     LKXI1
        ldr     r12, [sp, #0x1C]
        ldr     r2, [sp, #0x24]
LKXI3:
        subs    r7, r7, #1
        add     r9, r9, r2, lsl #1
        add     r5, r5, #0x20
        bne     LKXI0
        ldr     r4, [sp, #0x14]
        ldr     lr, [sp, #0x18]
        ldr     r3, [sp, #0x20]
        ldr     r1, [sp, #0x28]
        ldr     r0, [sp, #0x2C]
LKXI4:
        add     r0, r0, #2
        cmp     lr, #0
        sub     r0, r0, r2, lsl #2
        mov     r5, r1
        ble     LKXI9
        mov     r6, #1
        mov     r4, r6, lsl r4
        add     r6, r2, r2, lsl #2
        add     r7, r2, r2, lsl #3
        sub     r8, r4, #1
        add     r6, r2, r6
        add     r7, r2, r7
        mov     r9, #0
        mov     r4, lr
        str     r8, [sp, #0x2C]
        str     r7, [sp, #0x10]
        str     r6, [sp, #0x14]
        str     lr, [sp, #0x18]
        str     r1, [sp, #0x28]
LKXI5:
        cmp     r12, #0
        addle   r11, r0, r2, lsl #1
        ble     LKXI8
        ldr     r1, [sp, #0x14]
        ldr     lr, [sp, #0x10]
        add     r11, r0, r2, lsl #1
        mov     r7, r11
        str     r11, [sp, #8]
        ldr     r11, [sp, #0x2C]
        add     r1, r0, r1
        add     lr, r0, lr
        add     r8, r0, r2, lsl #2
        add     r6, r0, r2, lsl #3
        mov     r10, #0
        mov     r9, r12
        str     r4, [sp, #0xC]
        str     r0, [sp, #4]
        str     r5, [sp]
        str     r12, [sp, #0x1C]
        str     r3, [sp, #0x20]
        str     r2, [sp, #0x24]
LKXI6:
        ldrh    r3, [r8], #2
        ldrh    r2, [r1], #2
        ldr     r0, [sp, #4]
        ldrh    r12, [r6], #2
        ldrh    r4, [r7], #2
        ldrh    r0, [r0, +r10]
        ldrh    r5, [lr], #2
        add     r3, r2, r3
        add     r4, r12, r4
        add     r5, r0, r5
        add     r2, r3, r3, lsl #2
        add     r4, r4, r4, lsl #2
        add     r2, r5, r2, lsl #2
        rsb     r2, r4, r2
        add     r0, r2, #0x10
        mov     r0, r0, asr #5
        cmp     r0, r11
        movgt   r0, r11
        bgt     LKXI7
        cmp     r0, #0
        mov     r2, #0
        movlt   r0, r2
LKXI7:
        ldr     r2, [sp]
        subs    r9, r9, #1
        strh    r0, [r2, +r10]
        add     r10, r10, #2
        bne     LKXI6
        ldr     r11, [sp, #8]
        ldr     r4, [sp, #0xC]
        ldr     r5, [sp]
        ldr     r12, [sp, #0x1C]
        ldr     r3, [sp, #0x20]
        ldr     r2, [sp, #0x24]
LKXI8:
        subs    r4, r4, #1
        mov     r0, r11
        add     r5, r5, r3, lsl #1
        bne     LKXI5
        ldr     lr, [sp, #0x18]
        ldr     r1, [sp, #0x28]
LKXI9:
        cmp     lr, #0
        add     r10, sp, #0x30
        ble     LKXI13
LKXI10:
        cmp     r12, #0
        ble     LKXI12
        mov     r9, #0
        mov     r8, r9
        add     r7, r1, #2
        add     r6, r10, #2
        add     r5, r1, #4
        add     r4, r10, #4
        add     r2, r1, #6
        add     r0, r10, #6
        str     r10, [sp, #0x2C]
        str     lr, [sp, #0x18]
        str     r12, [sp, #0x1C]
        str     r3, [sp, #0x20]
LKXI11:
        ldr     r12, [sp, #0x1C]
        ldrh    r3, [r1, +r9]
        add     r8, r8, #4
        cmp     r8, r12
        ldr     r12, [sp, #0x2C]
        ldrh    r10, [r6], #8
        ldrh    lr, [r4], #8
        ldrh    r11, [r12, +r9]
        ldrh    r12, [r0], #8
        add     r3, r11, r3
        add     r3, r3, #1
        mov     r3, r3, asr #1
        strh    r3, [r1, +r9]
        ldrh    r3, [r7]
        add     r9, r9, #8
        add     r3, r10, r3
        add     r3, r3, #1
        mov     r3, r3, asr #1
        strh    r3, [r7], #8
        ldrh    r3, [r5]
        add     r3, lr, r3
        add     r3, r3, #1
        mov     r3, r3, asr #1
        strh    r3, [r5], #8
        ldrh    r3, [r2]
        add     r3, r12, r3
        add     r3, r3, #1
        mov     r3, r3, asr #1
        strh    r3, [r2], #8
        blt     LKXI11
        ldr     r10, [sp, #0x2C]
        ldr     lr, [sp, #0x18]
        ldr     r12, [sp, #0x1C]
        ldr     r3, [sp, #0x20]
LKXI12:
        subs    lr, lr, #1
        add     r10, r10, #0x20
        add     r1, r1, r3, lsl #1
        bne     LKXI10
LKXI13:
        add     sp, sp, #0x23, 28
        ldmia   sp!, {r4 - r11, pc}


