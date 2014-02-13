        .text
        .align  4
        .globl  _ippInterpolate_H02V02_16u


_ippInterpolate_H02V02_16u:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x55, 30
        sub     sp, sp, #1, 22
        ldr     r12, [sp, #0x57C]
        ldr     lr, [sp, #0x578]
        ldr     r6, [sp, #0x580]
        add     r4, r12, #5
        cmp     r4, #0
        mov     r2, r2, lsl #1
        add     r4, r2, #2
        sub     r0, r0, r4, lsl #1
        ble     LKXL3
        mov     r5, #0
        add     r4, r12, #5
        str     r6, [sp]
        str     r12, [sp, #4]
        str     r3, [sp, #0xC]
        str     r1, [sp, #0x10]
LKXL0:
        cmp     lr, #0
        ble     LKXL2
        add     r1, sp, #0x14
        mov     r6, #0
        add     r1, r1, r5
        add     r12, r0, #8
        mov     r3, lr
        str     lr, [sp, #8]
LKXL1:
        ldrh    r7, [r12, #-6]
        ldrh    lr, [r12]
        ldrh    r10, [r12, #-4]
        ldrh    r11, [r12, #-2]
        ldrh    r9, [r0, +r6]
        ldrh    r8, [r12, #2]!
        add     r7, lr, r7
        add     r10, r11, r10
        subs    r3, r3, #1
        add     r8, r9, r8
        add     lr, r10, r10, lsl #2
        add     r7, r7, r7, lsl #2
        add     r6, r6, #2
        add     lr, r8, lr, lsl #2
        rsb     lr, r7, lr
        str     lr, [r1], #4
        bne     LKXL1
        ldr     lr, [sp, #8]
LKXL2:
        subs    r4, r4, #1
        add     r0, r2, r0
        add     r5, r5, #0x40
        bne     LKXL0
        ldr     r6, [sp]
        ldr     r12, [sp, #4]
        ldr     r3, [sp, #0xC]
        ldr     r1, [sp, #0x10]
LKXL3:
        cmp     r12, #0
        add     r5, sp, #0x14
        ble     LKXL8
        mov     r0, #1
        mov     r6, r0, lsl r6
        sub     r0, r6, #1
        mov     r4, #0
LKXL4:
        cmp     lr, #0
        ble     LKXL7
        mov     r8, #0
        mov     r6, r5
        mov     r7, r8
LKXL5:
        ldr     r9, [r6, #0xC0]
        ldr     r10, [r6, #0x80]
        ldr     r2, [r6, #0x100]
        add     r11, r9, r10
        ldr     r9, [r6, #0x40]
        ldr     r10, [r5, +r8, lsl #2]
        add     r11, r11, r11, lsl #2
        add     r2, r2, r9
        ldr     r9, [r6, #0x140]
        add     r2, r2, r2, lsl #2
        add     r9, r10, r9
        add     r11, r9, r11, lsl #2
        rsb     r11, r2, r11
        add     r2, r11, #2, 24
        mov     r2, r2, asr #10
        cmp     r2, r0
        movgt   r2, r0
        bgt     LKXL6
        cmp     r2, #0
        movlt   r2, r4
LKXL6:
        add     r8, r8, #1
        strh    r2, [r1, +r7]
        cmp     r8, lr
        add     r7, r7, #2
        add     r6, r6, #4
        blt     LKXL5
LKXL7:
        subs    r12, r12, #1
        add     r1, r1, r3, lsl #1
        add     r5, r5, #0x40
        bne     LKXL4
LKXL8:
        add     sp, sp, #0x55, 30
        add     sp, sp, #1, 22
        ldmia   sp!, {r4 - r11, pc}


