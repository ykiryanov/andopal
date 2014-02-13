        .text
        .align  4
        .globl  _ippInterpolate_H00V02_16u


_ippInterpolate_H00V02_16u:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x28
        ldr     r12, [sp, #0x50]
        ldr     lr, [sp, #0x4C]
        ldr     r4, [sp, #0x54]
        cmp     r12, #0
        sub     r10, r0, r2, lsl #2
        ble     LKXT4
        mov     r0, #1
        mov     r5, r0, lsl r4
        add     r0, r2, r2, lsl #2
        add     r4, r2, r2, lsl #3
        add     r0, r2, r0
        add     r4, r2, r4
        sub     r5, r5, #1
        mov     r6, #0
        str     r5, [sp]
        str     r4, [sp, #0x18]
        str     r0, [sp, #0x14]
LKXT0:
        cmp     lr, #0
        addle   r11, r10, r2, lsl #1
        ble     LKXT3
        add     r11, r10, r2, lsl #1
        ldr     r0, [sp, #0x14]
        ldr     r4, [sp, #0x18]
        mov     r6, r11
        str     r11, [sp, #0x1C]
        ldr     r11, [sp]
        add     r0, r10, r0
        add     r4, r10, r4
        add     r7, r10, r2, lsl #2
        add     r5, r10, r2, lsl #3
        mov     r9, #0
        mov     r8, lr
        str     r10, [sp, #0x20]
        str     r12, [sp, #0x10]
        str     lr, [sp, #0xC]
        str     r3, [sp, #8]
        str     r2, [sp, #4]
        str     r1, [sp, #0x24]
LKXT1:
        ldrh    r3, [r7], #2
        ldrh    r2, [r0], #2
        ldr     r1, [sp, #0x20]
        ldrh    r12, [r5], #2
        ldrh    lr, [r6], #2
        ldrh    r1, [r1, +r9]
        ldrh    r10, [r4], #2
        add     r3, r2, r3
        add     lr, r12, lr
        add     r10, r1, r10
        add     r3, r3, r3, lsl #2
        add     lr, lr, lr, lsl #2
        add     r3, r10, r3, lsl #2
        rsb     r3, lr, r3
        add     r1, r3, #0x10
        mov     r1, r1, asr #5
        cmp     r1, r11
        movgt   r1, r11
        bgt     LKXT2
        cmp     r1, #0
        mov     r2, #0
        movlt   r1, r2
LKXT2:
        ldr     r2, [sp, #0x24]
        subs    r8, r8, #1
        strh    r1, [r2, +r9]
        add     r9, r9, #2
        bne     LKXT1
        ldr     r11, [sp, #0x1C]
        ldr     r12, [sp, #0x10]
        ldr     lr, [sp, #0xC]
        ldr     r3, [sp, #8]
        ldr     r2, [sp, #4]
        ldr     r1, [sp, #0x24]
LKXT3:
        subs    r12, r12, #1
        add     r1, r1, r3, lsl #1
        mov     r10, r11
        bne     LKXT0
LKXT4:
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}


