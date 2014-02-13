        .text
        .align  4
        .globl  _ippsCplxToReal_64fc


_ippsCplxToReal_64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        cmp     r0, #0
        beq     LCVA13
        cmp     r1, #0
        beq     LCVA13
        cmp     r2, #0
        beq     LCVA13
        cmp     r3, #0
        ble     LCVA12
        and     r12, r3, #3
        sub     r3, r3, r12
        cmp     r3, #0
        ble     LCVA1
        mov     r11, #0
        sub     r10, r1, #4
        sub     r9, r1, #0xC
        sub     r8, r1, #0x14
        sub     r7, r1, #0x1C
        sub     r6, r0, #0xC
        sub     r5, r0, #0x1C
        sub     r4, r0, #0x2C
        sub     lr, r0, #0x3C
        str     r1, [sp, #4]
        str     r0, [sp]
LCVA0:
        ldr     r0, [lr, #0x3C]
        ldr     r1, [lr, #0x40]!
        str     r0, [r7, #0x1C]
        add     r11, r11, #4
        str     r1, [r7, #0x20]!
        ldr     r0, [r4, #0x3C]
        ldr     r1, [r4, #0x40]!
        str     r0, [r8, #0x1C]
        str     r1, [r8, #0x20]!
        ldr     r0, [r5, #0x3C]
        ldr     r1, [r5, #0x40]!
        str     r0, [r9, #0x1C]
        str     r1, [r9, #0x20]!
        ldr     r0, [r6, #0x3C]
        ldr     r1, [r6, #0x40]!
        cmp     r11, r3
        str     r0, [r10, #0x1C]
        str     r1, [r10, #0x20]!
        blt     LCVA0
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LCVA1:
        cmp     r3, #0
        ble     LCVA3
        mov     r11, #0
        sub     r10, r2, #4
        sub     r9, r2, #0xC
        sub     r8, r2, #0x14
        sub     r7, r2, #0x1C
        sub     r6, r0, #4
        sub     r5, r0, #0x14
        sub     r4, r0, #0x24
        sub     lr, r0, #0x34
        str     r1, [sp, #4]
        str     r0, [sp]
LCVA2:
        ldr     r1, [lr, #0x3C]
        ldr     r0, [lr, #0x40]!
        str     r1, [r7, #0x1C]
        add     r11, r11, #4
        str     r0, [r7, #0x20]!
        ldr     r1, [r4, #0x3C]
        ldr     r0, [r4, #0x40]!
        str     r1, [r8, #0x1C]
        str     r0, [r8, #0x20]!
        ldr     r1, [r5, #0x3C]
        ldr     r0, [r5, #0x40]!
        str     r1, [r9, #0x1C]
        str     r0, [r9, #0x20]!
        ldr     r1, [r6, #0x3C]
        ldr     r0, [r6, #0x40]!
        cmp     r11, r3
        str     r1, [r10, #0x1C]
        str     r0, [r10, #0x20]!
        blt     LCVA2
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LCVA3:
        cmp     r12, #0
        beq     LCVA11
        add     lr, r1, r3, lsl #3
        add     r0, r0, r3, lsl #4
        cmp     r12, #0
        add     r3, r2, r3, lsl #3
        mov     r1, #0
        ble     LCVA7
        cmp     r12, #6
        movlt   r6, r1
        blt     LCVA5
        mov     r6, r1
        sub     r5, r12, #6
        sub     r4, r0, #0x4C
        sub     r2, lr, #0x24
LCVA4:
        ldr     r7, [r4, #0x4C]
        ldr     r8, [r4, #0x50]!
        str     r7, [r2, #0x24]
        add     r7, r6, #1
        str     r8, [r2, #0x28]!
        ldr     r9, [r0, +r7, lsl #4]
        add     r8, r0, r7, lsl #4
        ldr     r8, [r8, #4]
        str     r9, [lr, +r7, lsl #3]
        add     r7, lr, r7, lsl #3
        str     r8, [r7, #4]
        add     r9, r6, #2
        ldr     r8, [r0, +r9, lsl #4]
        add     r7, r0, r9, lsl #4
        ldr     r7, [r7, #4]
        str     r8, [lr, +r9, lsl #3]
        add     r9, lr, r9, lsl #3
        str     r7, [r9, #4]
        add     r9, r6, #3
        ldr     r8, [r0, +r9, lsl #4]
        add     r7, r0, r9, lsl #4
        ldr     r7, [r7, #4]
        str     r8, [lr, +r9, lsl #3]
        add     r9, lr, r9, lsl #3
        str     r7, [r9, #4]
        add     r9, r6, #4
        ldr     r8, [r0, +r9, lsl #4]
        add     r7, r0, r9, lsl #4
        ldr     r7, [r7, #4]
        str     r8, [lr, +r9, lsl #3]
        add     r6, r6, #5
        add     r9, lr, r9, lsl #3
        cmp     r6, r5
        str     r7, [r9, #4]
        ble     LCVA4
LCVA5:
        mov     r2, r6, lsl #4
        mov     r4, r6, lsl #3
        sub     r2, r2, #0xC
        sub     r4, r4, #4
        add     lr, r4, lr
        add     r2, r2, r0
LCVA6:
        ldr     r4, [r2, #0xC]
        ldr     r5, [r2, #0x10]!
        add     r6, r6, #1
        str     r4, [lr, #4]
        cmp     r6, r12
        str     r5, [lr, #8]!
        blt     LCVA6
LCVA7:
        cmp     r12, #0
        ble     LCVA11
        cmp     r12, #6
        blt     LCVA9
        sub     r5, r12, #6
        sub     r4, r0, #0x44
        sub     lr, r3, #0x24
LCVA8:
        ldr     r2, [r4, #0x4C]
        ldr     r6, [r4, #0x50]!
        str     r2, [lr, #0x24]
        add     r2, r1, #1
        str     r6, [lr, #0x28]!
        add     r6, r0, r2, lsl #4
        ldr     r7, [r6, #8]
        ldr     r6, [r6, #0xC]
        str     r7, [r3, +r2, lsl #3]
        add     r2, r3, r2, lsl #3
        str     r6, [r2, #4]
        add     r6, r1, #2
        add     r2, r1, #3
        add     r8, r0, r6, lsl #4
        ldr     r7, [r8, #8]
        ldr     r8, [r8, #0xC]
        add     r9, r3, r6, lsl #3
        str     r7, [r3, +r6, lsl #3]
        add     r7, r0, r2, lsl #4
        str     r8, [r9, #4]
        ldr     r6, [r7, #8]
        ldr     r7, [r7, #0xC]
        add     r8, r3, r2, lsl #3
        str     r6, [r3, +r2, lsl #3]
        add     r6, r1, #4
        str     r7, [r8, #4]
        add     r2, r0, r6, lsl #4
        ldr     r7, [r2, #8]
        ldr     r2, [r2, #0xC]
        add     r1, r1, #5
        str     r7, [r3, +r6, lsl #3]
        add     r6, r3, r6, lsl #3
        cmp     r1, r5
        str     r2, [r6, #4]
        ble     LCVA8
LCVA9:
        mov     r2, r1, lsl #4
        mov     lr, r1, lsl #3
        sub     r2, r2, #4
        sub     lr, lr, #4
        add     r0, r2, r0
        add     r3, lr, r3
LCVA10:
        ldr     lr, [r0, #0xC]
        ldr     r2, [r0, #0x10]!
        add     r1, r1, #1
        str     lr, [r3, #4]
        cmp     r1, r12
        str     r2, [r3, #8]!
        blt     LCVA10
LCVA11:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCVA12:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCVA13:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


