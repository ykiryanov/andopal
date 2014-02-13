        .text
        .align  4
        .globl  _ippInterpolate_H00V00_16u


_ippInterpolate_H00V00_16u:
        stmdb   sp!, {r0, r4 - r11, lr}
        ldr     r12, [sp, #0x2C]
        ldr     lr, [sp, #0x28]
        cmp     r12, #0
        ble     LKXV3
LKXV0:
        cmp     lr, #0
        ble     LKXV2
        mov     r11, #0
        mov     r10, r11
        add     r9, r1, #2
        add     r8, r0, #2
        add     r7, r1, #4
        add     r6, r0, #4
        add     r5, r1, #6
        add     r4, r0, #6
        str     r2, [sp]
LKXV1:
        ldrh    r2, [r0, +r11]
        add     r10, r10, #4
        cmp     r10, lr
        strh    r2, [r1, +r11]
        ldrh    r2, [r8], #8
        add     r11, r11, #8
        strh    r2, [r9], #8
        ldrh    r2, [r6], #8
        strh    r2, [r7], #8
        ldrh    r2, [r4], #8
        strh    r2, [r5], #8
        blt     LKXV1
        ldr     r2, [sp]
LKXV2:
        subs    r12, r12, #1
        add     r0, r0, r2, lsl #1
        add     r1, r1, r3, lsl #1
        bne     LKXV0
LKXV3:
        ldmia   sp!, {r0, r4 - r11, pc}


