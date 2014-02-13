        .text
        .align  4
        .globl  _ippInterpolate_H02V00_16u


_ippInterpolate_H02V00_16u:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        ldr     r12, [sp, #0x30]
        ldr     lr, [sp, #0x2C]
        ldr     r5, [sp, #0x34]
        cmp     r12, #0
        sub     r4, r0, #4
        ble     LKXN4
        mov     r0, #1
        mov     r5, r0, lsl r5
        sub     r0, r5, #1
        mov     r5, #0
LKXN0:
        cmp     lr, #0
        ble     LKXN3
        mov     r6, r4
        mov     r7, lr
        mov     r8, #0
        str     r3, [sp, #4]
        str     r2, [sp]
LKXN1:
        ldrh    r2, [r6, #6]
        ldrh    r3, [r6, #4]
        ldrh    r11, [r6, #2]
        ldrh    r9, [r6, #0xA]
        add     r10, r2, r3
        ldrh    r2, [r6, #8]
        ldrh    r3, [r4, +r8]
        add     r10, r10, r10, lsl #2
        add     r2, r2, r11
        add     r9, r3, r9
        add     r10, r9, r10, lsl #2
        add     r2, r2, r2, lsl #2
        rsb     r10, r2, r10
        add     r2, r10, #0x10
        mov     r2, r2, asr #5
        cmp     r2, r0
        movgt   r2, r0
        bgt     LKXN2
        cmp     r2, #0
        movlt   r2, r5
LKXN2:
        strh    r2, [r1, +r8]
        subs    r7, r7, #1
        add     r8, r8, #2
        add     r6, r6, #2
        bne     LKXN1
        ldr     r3, [sp, #4]
        ldr     r2, [sp]
LKXN3:
        subs    r12, r12, #1
        add     r4, r4, r2, lsl #1
        add     r1, r1, r3, lsl #1
        bne     LKXN0
LKXN4:
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


