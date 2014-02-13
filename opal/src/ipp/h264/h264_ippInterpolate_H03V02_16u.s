        .text
        .align  4
        .globl  _ippInterpolate_H03V02_16u


_ippInterpolate_H03V02_16u:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x5E, 30
        sub     sp, sp, #1, 22
        ldr     r12, [sp, #0x5A0]
        ldr     lr, [sp, #0x59C]
        ldr     r7, [sp, #0x5A4]
        mov     r8, r2, lsl #1
        add     r4, r8, #2
        cmp     r12, #0
        sub     r0, r0, r4, lsl #1
        ble     LKXH3
        add     r5, r2, r2, lsl #2
        add     r4, r2, r2, lsl #3
        add     r9, r2, r5
        add     r10, r2, r4
        add     r6, lr, #5
        mov     r5, #0
        mov     r4, r12
        str     r10, [sp, #0x10]
        str     r9, [sp, #0x14]
        str     r8, [sp, #0x1C]
        str     r7, [sp, #0x20]
        str     r12, [sp, #0x24]
        str     lr, [sp, #0x28]
        str     r3, [sp, #0x2C]
        str     r1, [sp, #0x34]
LKXH0:
        cmp     r6, #0
        ldrle   r1, [sp, #0x1C]
        addle   r11, r1, r0
        ble     LKXH2
        ldr     r1, [sp, #0x14]
        ldr     lr, [sp, #0x1C]
        add     r10, r0, r2, lsl #2
        add     r12, r0, r1
        ldr     r1, [sp, #0x10]
        add     r11, lr, r0
        add     r9, r0, r2, lsl #3
        mov     r8, #0
        add     r3, r0, r1
        add     r1, sp, #0x38
        add     lr, r1, r5
        ldr     r1, [sp, #0x28]
        mov     r7, r11
        str     r11, [sp, #4]
        str     r4, [sp, #8]
        add     r1, r1, #5
        str     r5, [sp, #0xC]
        str     r6, [sp, #0x18]
        str     r0, [sp]
        str     r2, [sp, #0x30]
LKXH1:
        ldrh    r4, [r10], #2
        ldrh    r2, [r12], #2
        ldr     r0, [sp]
        ldrh    r5, [r9], #2
        ldrh    r6, [r7], #2
        ldrh    r0, [r0, +r8]
        ldrh    r11, [r3], #2
        add     r4, r2, r4
        add     r6, r5, r6
        add     r11, r0, r11
        add     r2, r4, r4, lsl #2
        add     r6, r6, r6, lsl #2
        subs    r1, r1, #1
        add     r2, r11, r2, lsl #2
        rsb     r2, r6, r2
        str     r2, [lr], #4
        add     r8, r8, #2
        bne     LKXH1
        ldr     r11, [sp, #4]
        ldr     r4, [sp, #8]
        ldr     r5, [sp, #0xC]
        ldr     r6, [sp, #0x18]
        ldr     r2, [sp, #0x30]
LKXH2:
        subs    r4, r4, #1
        mov     r0, r11
        add     r5, r5, #0x54
        bne     LKXH0
        ldr     r7, [sp, #0x20]
        ldr     r12, [sp, #0x24]
        ldr     lr, [sp, #0x28]
        ldr     r3, [sp, #0x2C]
        ldr     r1, [sp, #0x34]
LKXH3:
        cmp     r12, #0
        add     r0, sp, #0x38
        ble     LKXH9
        mov     r2, #1
        mov     r7, r2, lsl r7
        sub     r2, r7, #1
        mov     r4, #0
LKXH4:
        cmp     lr, #0
        ble     LKXH8
        mov     r8, #0
        add     r5, r0, #4
        mov     r6, r0
        mov     r7, r8
        str     r12, [sp, #0x24]
        str     r3, [sp, #0x2C]
LKXH5:
        ldr     r3, [r6, #0xC]
        ldr     r12, [r6, #8]
        ldr     r11, [r6, #4]
        ldr     r9, [r6, #0x14]
        add     r10, r3, r12
        ldr     r3, [r6, #0x10]
        ldr     r12, [r0, +r8, lsl #2]
        add     r10, r10, r10, lsl #2
        add     r3, r3, r11
        add     r9, r12, r9
        add     r10, r9, r10, lsl #2
        add     r3, r3, r3, lsl #2
        rsb     r10, r3, r10
        add     r3, r10, #2, 24
        mov     r3, r3, asr #10
        cmp     r3, r2
        movgt   r3, r2
        bgt     LKXH6
        cmp     r3, #0
        movlt   r3, r4
LKXH6:
        ldr     r12, [r5, #8]
        bic     r3, r3, #0xFF, 8
        bic     r3, r3, #0xFF, 16
        add     r12, r12, #0x10
        mov     r12, r12, asr #5
        cmp     r12, r2
        movgt   r12, r2
        bgt     LKXH7
        cmp     r12, #0
        movlt   r12, r4
LKXH7:
        bic     r12, r12, #0xFF, 8
        bic     r12, r12, #0xFF, 16
        add     r12, r3, r12
        add     r3, r12, #1
        add     r8, r8, #1
        mov     r3, r3, asr #1
        strh    r3, [r1, +r7]
        cmp     r8, lr
        add     r7, r7, #2
        add     r5, r5, #4
        add     r6, r6, #4
        blt     LKXH5
        ldr     r12, [sp, #0x24]
        ldr     r3, [sp, #0x2C]
LKXH8:
        subs    r12, r12, #1
        add     r1, r1, r3, lsl #1
        add     r0, r0, #0x54
        bne     LKXH4
LKXH9:
        add     sp, sp, #0x5E, 30
        add     sp, sp, #1, 22
        ldmia   sp!, {r4 - r11, pc}


