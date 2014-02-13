        .text
        .align  4
        .globl  _ippInterpolate_H03V03_16u


_ippInterpolate_H03V03_16u:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x23, 28
        ldr     r12, [sp, #0x258]
        ldr     lr, [sp, #0x254]
        ldr     r4, [sp, #0x25C]
        cmp     r12, #0
        add     r5, sp, #0x30
        add     r6, r0, r2, lsl #1
        sub     r7, r6, #4
        ble     LKXG4
        mov     r6, #1
        mov     r6, r6, lsl r4
        sub     r6, r6, #1
        mov     r9, #0
        mov     r8, r12
        str     r4, [sp, #0x14]
        str     r12, [sp, #0x18]
        str     r3, [sp, #0x20]
        str     r1, [sp, #0x28]
        str     r0, [sp, #0x2C]
LKXG0:
        cmp     lr, #0
        ble     LKXG3
        mov     r0, r7
        mov     r1, lr
        mov     r3, #0
        str     lr, [sp, #0x1C]
        str     r2, [sp, #0x24]
LKXG1:
        ldrh    r10, [r0, #6]
        ldrh    r11, [r0, #4]
        ldrh    r2, [r0, #8]
        ldrh    r12, [r0, #2]
        ldrh    lr, [r7, +r3]
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
        bgt     LKXG2
        cmp     r2, #0
        movlt   r2, r9
LKXG2:
        strh    r2, [r5, +r3]
        subs    r1, r1, #1
        add     r3, r3, #2
        add     r0, r0, #2
        bne     LKXG1
        ldr     lr, [sp, #0x1C]
        ldr     r2, [sp, #0x24]
LKXG3:
        subs    r8, r8, #1
        add     r7, r7, r2, lsl #1
        add     r5, r5, #0x20
        bne     LKXG0
        ldr     r4, [sp, #0x14]
        ldr     r12, [sp, #0x18]
        ldr     r3, [sp, #0x20]
        ldr     r1, [sp, #0x28]
        ldr     r0, [sp, #0x2C]
LKXG4:
        add     r0, r0, #2
        cmp     r12, #0
        sub     r0, r0, r2, lsl #2
        mov     r5, r1
        ble     LKXG9
        mov     r6, #1
        mov     r4, r6, lsl r4
        add     r6, r2, r2, lsl #2
        add     r7, r2, r2, lsl #3
        sub     r8, r4, #1
        add     r6, r2, r6
        add     r7, r2, r7
        mov     r9, #0
        mov     r4, r12
        str     r8, [sp, #0x2C]
        str     r7, [sp, #0x10]
        str     r6, [sp, #0x14]
        str     r12, [sp, #0x18]
        str     r1, [sp, #0x28]
LKXG5:
        cmp     lr, #0
        addle   r11, r0, r2, lsl #1
        ble     LKXG8
        ldr     r1, [sp, #0x14]
        ldr     r12, [sp, #0x10]
        add     r11, r0, r2, lsl #1
        mov     r7, r11
        str     r11, [sp, #8]
        ldr     r11, [sp, #0x2C]
        add     r1, r0, r1
        add     r12, r0, r12
        add     r8, r0, r2, lsl #2
        add     r6, r0, r2, lsl #3
        mov     r10, #0
        mov     r9, lr
        str     r4, [sp, #0xC]
        str     r0, [sp, #4]
        str     r5, [sp]
        str     lr, [sp, #0x1C]
        str     r3, [sp, #0x20]
        str     r2, [sp, #0x24]
LKXG6:
        ldrh    r3, [r8], #2
        ldrh    r2, [r1], #2
        ldr     r0, [sp, #4]
        ldrh    lr, [r6], #2
        ldrh    r4, [r7], #2
        ldrh    r0, [r0, +r10]
        ldrh    r5, [r12], #2
        add     r3, r2, r3
        add     r4, lr, r4
        add     r5, r0, r5
        add     r2, r3, r3, lsl #2
        add     r4, r4, r4, lsl #2
        add     r2, r5, r2, lsl #2
        rsb     r2, r4, r2
        add     r0, r2, #0x10
        mov     r0, r0, asr #5
        cmp     r0, r11
        movgt   r0, r11
        bgt     LKXG7
        cmp     r0, #0
        mov     r2, #0
        movlt   r0, r2
LKXG7:
        ldr     r2, [sp]
        subs    r9, r9, #1
        strh    r0, [r2, +r10]
        add     r10, r10, #2
        bne     LKXG6
        ldr     r11, [sp, #8]
        ldr     r4, [sp, #0xC]
        ldr     r5, [sp]
        ldr     lr, [sp, #0x1C]
        ldr     r3, [sp, #0x20]
        ldr     r2, [sp, #0x24]
LKXG8:
        subs    r4, r4, #1
        mov     r0, r11
        add     r5, r5, r3, lsl #1
        bne     LKXG5
        ldr     r12, [sp, #0x18]
        ldr     r1, [sp, #0x28]
LKXG9:
        cmp     r12, #0
        add     r10, sp, #0x30
        ble     LKXG13
LKXG10:
        cmp     lr, #0
        ble     LKXG12
        mov     r9, #0
        mov     r8, r9
        add     r7, r1, #2
        add     r6, r10, #2
        add     r5, r1, #4
        add     r4, r10, #4
        add     r2, r1, #6
        add     r0, r10, #6
        str     r10, [sp, #0x2C]
        str     r12, [sp, #0x18]
        str     lr, [sp, #0x1C]
        str     r3, [sp, #0x20]
LKXG11:
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
        blt     LKXG11
        ldr     r10, [sp, #0x2C]
        ldr     r12, [sp, #0x18]
        ldr     lr, [sp, #0x1C]
        ldr     r3, [sp, #0x20]
LKXG12:
        subs    r12, r12, #1
        add     r10, r10, #0x20
        add     r1, r1, r3, lsl #1
        bne     LKXG10
LKXG13:
        add     sp, sp, #0x23, 28
        ldmia   sp!, {r4 - r11, pc}


