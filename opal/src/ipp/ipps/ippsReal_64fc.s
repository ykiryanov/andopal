        .text
        .align  4
        .globl  _ippsReal_64fc


_ippsReal_64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x40
        cmp     r0, #0
        beq     LCUU7
        cmp     r1, #0
        beq     LCUU7
        cmp     r2, #0
        ble     LCUU6
        and     r8, r2, #7
        sub     r2, r2, r8
        cmp     r2, #0
        str     r2, [sp, #0xC]
        ble     LCUU1
        sub     r2, r0, #0x5C
        str     r2, [sp, #0x1C]
        sub     r2, r0, #0x6C
        str     r2, [sp, #0x20]
        sub     r2, r0, #0x7C
        str     r2, [sp, #0x24]
        sub     r2, r1, #4
        str     r2, [sp, #0x28]
        sub     r2, r1, #0xC
        str     r2, [sp, #0x2C]
        sub     r2, r1, #0x14
        mov     r9, #0
        str     r2, [sp, #0x30]
        sub     r11, r1, #0x1C
        sub     r10, r1, #0x24
        sub     r7, r0, #0xC
        sub     r6, r0, #0x1C
        sub     r5, r0, #0x2C
        sub     r4, r0, #0x3C
        sub     lr, r0, #0x4C
        sub     r12, r1, #0x2C
        sub     r3, r1, #0x34
        sub     r2, r1, #0x3C
        str     r9, [sp, #8]
        str     r8, [sp, #0x10]
        str     r1, [sp, #0x14]
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x2C]
        ldr     r1, [sp, #0x24]
        ldr     r8, [sp, #0x20]
        ldr     r9, [sp, #0x1C]
        str     r10, [sp]
        str     r11, [sp, #4]
LCUU0:
        ldr     r11, [r1, #0x80]
        ldr     r10, [r1, #0x7C]
        add     r1, r1, #0x80
        str     r11, [sp, #0x34]
        ldr     r11, [r8, #0x7C]
        str     r11, [sp, #0x38]
        ldr     r11, [r8, #0x80]!
        str     r11, [sp, #0x3C]
        str     r10, [r2, #0x3C]
        ldr     r10, [sp, #0x34]
        str     r10, [r2, #0x40]!
        ldr     r10, [sp, #0x38]
        str     r10, [r3, #0x3C]
        ldr     r10, [sp, #0x3C]
        str     r10, [r3, #0x40]!
        ldr     r10, [r9, #0x7C]
        ldr     r11, [r9, #0x80]!
        str     r11, [sp, #0x3C]
        ldr     r11, [lr, #0x7C]
        str     r11, [sp, #0x38]
        ldr     r11, [lr, #0x80]!
        str     r11, [sp, #0x34]
        str     r10, [r12, #0x3C]
        ldr     r10, [sp, #0x3C]
        str     r10, [r12, #0x40]!
        ldr     r11, [sp, #0x38]
        ldr     r10, [sp]
        str     r11, [r10, #0x3C]
        ldr     r11, [sp, #0x34]
        str     r11, [r10, #0x40]
        ldr     r10, [r4, #0x7C]
        ldr     r11, [r4, #0x80]!
        str     r11, [sp, #0x3C]
        ldr     r11, [r5, #0x7C]
        str     r11, [sp, #0x38]
        ldr     r11, [r5, #0x80]!
        str     r11, [sp, #0x34]
        ldr     r11, [sp, #4]
        str     r10, [r11, #0x3C]
        ldr     r10, [sp, #0x3C]
        str     r10, [r11, #0x40]
        ldr     r10, [sp, #0x30]
        ldr     r11, [sp, #0x38]
        str     r11, [r10, #0x3C]
        ldr     r11, [sp, #0x34]
        str     r11, [r10, #0x40]
        ldr     r11, [r6, #0x80]
        ldr     r10, [r6, #0x7C]
        add     r6, r6, #0x80
        str     r11, [sp, #0x3C]
        ldr     r11, [r7, #0x7C]
        str     r11, [sp, #0x38]
        ldr     r11, [r7, #0x80]!
        str     r11, [sp, #0x34]
        str     r10, [r0, #0x3C]
        ldr     r10, [sp, #0x3C]
        str     r10, [r0, #0x40]!
        ldr     r10, [sp, #8]
        ldr     r11, [sp, #0x38]
        add     r10, r10, #8
        str     r10, [sp, #8]
        ldr     r10, [sp, #0x28]
        str     r11, [r10, #0x3C]
        ldr     r11, [sp, #0x34]
        str     r11, [r10, #0x40]
        ldr     r10, [sp, #0xC]
        ldr     r11, [sp, #8]
        cmp     r11, r10
        ldr     r10, [sp, #0x28]
        add     r10, r10, #0x40
        str     r10, [sp, #0x28]
        ldr     r10, [sp, #0x30]
        add     r10, r10, #0x40
        str     r10, [sp, #0x30]
        ldr     r10, [sp, #4]
        add     r10, r10, #0x40
        str     r10, [sp, #4]
        ldr     r10, [sp]
        add     r10, r10, #0x40
        str     r10, [sp]
        blt     LCUU0
        ldr     r8, [sp, #0x10]
        ldr     r1, [sp, #0x14]
        ldr     r0, [sp, #0x18]
LCUU1:
        cmp     r8, #0
        beq     LCUU5
        ldr     r2, [sp, #0xC]
        cmp     r8, #0
        add     r0, r0, r2, lsl #4
        add     r1, r1, r2, lsl #3
        ble     LCUU5
        cmp     r8, #6
        mov     lr, #0
        blt     LCUU3
        sub     r12, r8, #6
        sub     r3, r0, #0x4C
        sub     r2, r1, #0x24
LCUU2:
        ldr     r4, [r3, #0x4C]
        ldr     r5, [r3, #0x50]!
        str     r4, [r2, #0x24]
        add     r4, lr, #1
        str     r5, [r2, #0x28]!
        ldr     r6, [r0, +r4, lsl #4]
        add     r5, r0, r4, lsl #4
        ldr     r5, [r5, #4]
        str     r6, [r1, +r4, lsl #3]
        add     r4, r1, r4, lsl #3
        str     r5, [r4, #4]
        add     r6, lr, #2
        ldr     r5, [r0, +r6, lsl #4]
        add     r4, r0, r6, lsl #4
        ldr     r4, [r4, #4]
        str     r5, [r1, +r6, lsl #3]
        add     r6, r1, r6, lsl #3
        str     r4, [r6, #4]
        add     r6, lr, #3
        ldr     r5, [r0, +r6, lsl #4]
        add     r4, r0, r6, lsl #4
        ldr     r4, [r4, #4]
        str     r5, [r1, +r6, lsl #3]
        add     r6, r1, r6, lsl #3
        str     r4, [r6, #4]
        add     r6, lr, #4
        ldr     r5, [r0, +r6, lsl #4]
        add     r4, r0, r6, lsl #4
        ldr     r4, [r4, #4]
        str     r5, [r1, +r6, lsl #3]
        add     lr, lr, #5
        add     r6, r1, r6, lsl #3
        cmp     lr, r12
        str     r4, [r6, #4]
        ble     LCUU2
LCUU3:
        mov     r2, lr, lsl #4
        mov     r3, lr, lsl #3
        sub     r2, r2, #0xC
        sub     r3, r3, #4
        add     r0, r2, r0
        add     r1, r3, r1
LCUU4:
        ldr     r2, [r0, #0xC]
        ldr     r3, [r0, #0x10]!
        add     lr, lr, #1
        str     r2, [r1, #4]
        cmp     lr, r8
        str     r3, [r1, #8]!
        blt     LCUU4
LCUU5:
        mov     r0, #0
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LCUU6:
        mvn     r0, #5
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LCUU7:
        mvn     r0, #7
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}


