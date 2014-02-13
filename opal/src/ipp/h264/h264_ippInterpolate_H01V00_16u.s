        .text
        .align  4
        .globl  _ippInterpolate_H01V00_16u


_ippInterpolate_H01V00_16u:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        ldr     lr, [sp, #0x40]
        ldr     r12, [sp, #0x3C]
        ldr     r4, [sp, #0x44]
        cmp     lr, #0
        mov     r8, r1
        sub     r7, r0, #4
        ble     LKXR4
        mov     r5, #1
        mov     r4, r5, lsl r4
        sub     r4, r4, #1
        mov     r6, #0
        mov     r5, lr
        str     lr, [sp, #0x14]
        str     r1, [sp, #0xC]
        str     r0, [sp, #8]
LKXR0:
        cmp     r12, #0
        ble     LKXR3
        mov     r0, r7
        mov     r1, r12
        mov     lr, #0
        str     r12, [sp, #0x10]
        str     r3, [sp]
        str     r2, [sp, #4]
LKXR1:
        ldrh    r10, [r0, #6]
        ldrh    r11, [r0, #4]
        ldrh    r2, [r0, #8]
        ldrh    r3, [r0, #2]
        ldrh    r12, [r7, +lr]
        ldrh    r9, [r0, #0xA]
        add     r10, r10, r11
        add     r3, r2, r3
        add     r10, r10, r10, lsl #2
        add     r9, r12, r9
        add     r3, r3, r3, lsl #2
        add     r10, r9, r10, lsl #2
        rsb     r10, r3, r10
        add     r2, r10, #0x10
        mov     r2, r2, asr #5
        cmp     r2, r4
        movgt   r2, r4
        bgt     LKXR2
        cmp     r2, #0
        movlt   r2, r6
LKXR2:
        strh    r2, [r8, +lr]
        subs    r1, r1, #1
        add     lr, lr, #2
        add     r0, r0, #2
        bne     LKXR1
        ldr     r12, [sp, #0x10]
        ldr     r3, [sp]
        ldr     r2, [sp, #4]
LKXR3:
        subs    r5, r5, #1
        add     r7, r7, r2, lsl #1
        add     r8, r8, r3, lsl #1
        bne     LKXR0
        ldr     lr, [sp, #0x14]
        ldr     r1, [sp, #0xC]
        ldr     r0, [sp, #8]
LKXR4:
        cmp     lr, #0
        ble     LKXR8
LKXR5:
        cmp     r12, #0
        ble     LKXR7
        mov     r11, #0
        mov     r10, r11
        add     r9, r1, #2
        add     r8, r0, #2
        add     r7, r1, #4
        add     r6, r0, #4
        add     r5, r1, #6
        add     r4, r0, #6
        str     r3, [sp]
        str     r2, [sp, #4]
LKXR6:
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
        ldrh    r3, [r6], #8
        add     r2, r3, r2
        add     r2, r2, #1
        mov     r2, r2, asr #1
        strh    r2, [r7], #8
        ldrh    r2, [r5]
        ldrh    r3, [r4], #8
        add     r2, r3, r2
        add     r2, r2, #1
        mov     r2, r2, asr #1
        strh    r2, [r5], #8
        blt     LKXR6
        ldr     r3, [sp]
        ldr     r2, [sp, #4]
LKXR7:
        subs    lr, lr, #1
        add     r0, r0, r2, lsl #1
        add     r1, r1, r3, lsl #1
        bne     LKXR5
LKXR8:
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}


