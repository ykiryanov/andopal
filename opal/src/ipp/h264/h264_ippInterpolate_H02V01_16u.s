        .text
        .align  4
        .globl  _ippInterpolate_H02V01_16u


_ippInterpolate_H02V01_16u:
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
        ble     LKXM3
        mov     r5, #0
        add     r4, r12, #5
        str     r6, [sp]
        str     r12, [sp, #4]
        str     r3, [sp, #0xC]
        str     r1, [sp, #0x10]
LKXM0:
        cmp     lr, #0
        ble     LKXM2
        add     r1, sp, #0x14
        mov     r6, #0
        add     r1, r1, r5
        add     r12, r0, #8
        mov     r3, lr
        str     lr, [sp, #8]
LKXM1:
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
        bne     LKXM1
        ldr     lr, [sp, #8]
LKXM2:
        subs    r4, r4, #1
        add     r0, r2, r0
        add     r5, r5, #0x40
        bne     LKXM0
        ldr     r6, [sp]
        ldr     r12, [sp, #4]
        ldr     r3, [sp, #0xC]
        ldr     r1, [sp, #0x10]
LKXM3:
        cmp     r12, #0
        add     r4, sp, #0x14
        ble     LKXM9
        mov     r0, #1
        mov     r6, r0, lsl r6
        sub     r0, r6, #1
        mov     r2, #0
LKXM4:
        cmp     lr, #0
        ble     LKXM8
        mov     r5, r4
        mov     r8, #0
        mov     r6, r5
        mov     r7, r8
        str     r12, [sp, #4]
        str     r3, [sp, #0xC]
LKXM5:
        ldr     r3, [r6, #0xC0]
        ldr     r12, [r6, #0x80]
        ldr     r11, [r6, #0x40]
        ldr     r9, [r6, #0x140]
        add     r10, r3, r12
        ldr     r3, [r6, #0x100]
        ldr     r12, [r4, +r8, lsl #2]
        add     r10, r10, r10, lsl #2
        add     r3, r3, r11
        add     r9, r12, r9
        add     r10, r9, r10, lsl #2
        add     r3, r3, r3, lsl #2
        rsb     r10, r3, r10
        add     r3, r10, #2, 24
        mov     r3, r3, asr #10
        cmp     r3, r0
        movgt   r3, r0
        bgt     LKXM6
        cmp     r3, #0
        movlt   r3, r2
LKXM6:
        ldr     r12, [r5, #0x80]
        bic     r3, r3, #0xFF, 8
        bic     r3, r3, #0xFF, 16
        add     r12, r12, #0x10
        mov     r12, r12, asr #5
        cmp     r12, r0
        movgt   r12, r0
        bgt     LKXM7
        cmp     r12, #0
        movlt   r12, r2
LKXM7:
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
        blt     LKXM5
        ldr     r12, [sp, #4]
        ldr     r3, [sp, #0xC]
LKXM8:
        subs    r12, r12, #1
        add     r1, r1, r3, lsl #1
        add     r4, r4, #0x40
        bne     LKXM4
LKXM9:
        add     sp, sp, #0x55, 30
        add     sp, sp, #1, 22
        ldmia   sp!, {r4 - r11, pc}


