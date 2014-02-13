        .text
        .align  4
        .globl  _ippInterpolate_H00V03_16u


_ippInterpolate_H00V03_16u:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x38
        ldr     r7, [sp, #0x60]
        ldr     r12, [sp, #0x5C]
        ldr     lr, [sp, #0x64]
        cmp     r7, #0
        mov     r5, r1
        sub     r4, r0, r2, lsl #2
        movle   r6, r2, lsl #1
        ble     LKXS4
        mov     r6, #1
        mov     lr, r6, lsl lr
        add     r6, r2, r2, lsl #2
        add     r8, r2, r6
        add     r6, r2, r2, lsl #3
        add     r9, r2, r6
        sub     r10, lr, #1
        mov     r6, r2, lsl #1
        mov     r11, #0
        mov     lr, r7
        str     r10, [sp, #8]
        str     r9, [sp, #0x20]
        str     r8, [sp, #0x1C]
        str     r7, [sp]
        str     r2, [sp, #0x14]
        str     r1, [sp, #0x10]
        str     r0, [sp, #0xC]
LKXS0:
        cmp     r12, #0
        addle   r11, r4, r6
        ble     LKXS3
        ldr     r0, [sp, #0x14]
        add     r11, r4, r6
        ldr     r1, [sp, #0x1C]
        ldr     r2, [sp, #0x20]
        mov     r7, r11
        str     r11, [sp, #0x28]
        ldr     r11, [sp, #8]
        add     r8, r4, r0, lsl #2
        add     r1, r4, r1
        add     r0, r4, r0, lsl #3
        add     r2, r4, r2
        mov     r10, #0
        mov     r9, r12
        str     r6, [sp, #0x2C]
        str     lr, [sp, #0x24]
        str     r4, [sp, #0x30]
        str     r5, [sp, #0x34]
        str     r12, [sp, #0x18]
        str     r3, [sp, #4]
LKXS1:
        ldrh    lr, [r8], #2
        ldrh    r12, [r1], #2
        ldr     r3, [sp, #0x30]
        ldrh    r4, [r0], #2
        ldrh    r5, [r7], #2
        ldrh    r3, [r3, +r10]
        ldrh    r6, [r2], #2
        add     lr, r12, lr
        add     r5, r4, r5
        add     r6, r3, r6
        add     lr, lr, lr, lsl #2
        add     r5, r5, r5, lsl #2
        add     lr, r6, lr, lsl #2
        rsb     lr, r5, lr
        add     r3, lr, #0x10
        mov     r3, r3, asr #5
        cmp     r3, r11
        movgt   r3, r11
        bgt     LKXS2
        cmp     r3, #0
        mov     r12, #0
        movlt   r3, r12
LKXS2:
        ldr     r12, [sp, #0x34]
        subs    r9, r9, #1
        strh    r3, [r12, +r10]
        add     r10, r10, #2
        bne     LKXS1
        ldr     r6, [sp, #0x2C]
        ldr     r11, [sp, #0x28]
        ldr     lr, [sp, #0x24]
        ldr     r5, [sp, #0x34]
        ldr     r12, [sp, #0x18]
        ldr     r3, [sp, #4]
LKXS3:
        subs    lr, lr, #1
        mov     r4, r11
        add     r5, r5, r3, lsl #1
        bne     LKXS0
        ldr     r7, [sp]
        ldr     r1, [sp, #0x10]
        ldr     r0, [sp, #0xC]
LKXS4:
        cmp     r7, #0
        add     r0, r6, r0
        ble     LKXS8
LKXS5:
        cmp     r12, #0
        ble     LKXS7
        mov     r11, #0
        mov     r10, r11
        add     r9, r1, #2
        add     r8, r0, #2
        add     r5, r1, #4
        add     r4, r0, #4
        add     lr, r1, #6
        add     r2, r0, #6
        str     r7, [sp]
        str     r3, [sp, #4]
LKXS6:
        ldrh    r3, [r1, +r11]
        ldrh    r7, [r0, +r11]
        add     r10, r10, #4
        cmp     r10, r12
        add     r3, r7, r3
        add     r3, r3, #1
        mov     r3, r3, asr #1
        strh    r3, [r1, +r11]
        ldrh    r3, [r9]
        ldrh    r7, [r8], #8
        add     r11, r11, #8
        add     r3, r7, r3
        add     r3, r3, #1
        mov     r3, r3, asr #1
        strh    r3, [r9], #8
        ldrh    r3, [r5]
        ldrh    r7, [r4], #8
        add     r3, r7, r3
        add     r3, r3, #1
        mov     r3, r3, asr #1
        strh    r3, [r5], #8
        ldrh    r3, [lr]
        ldrh    r7, [r2], #8
        add     r3, r7, r3
        add     r3, r3, #1
        mov     r3, r3, asr #1
        strh    r3, [lr], #8
        blt     LKXS6
        ldr     r7, [sp]
        ldr     r3, [sp, #4]
LKXS7:
        subs    r7, r7, #1
        add     r0, r6, r0
        add     r1, r1, r3, lsl #1
        bne     LKXS5
LKXS8:
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}


