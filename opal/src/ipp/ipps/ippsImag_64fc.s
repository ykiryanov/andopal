        .text
        .align  4
        .globl  _ippsImag_64fc


_ippsImag_64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x40
        cmp     r0, #0
        beq     LCUY7
        cmp     r1, #0
        beq     LCUY7
        cmp     r2, #0
        ble     LCUY6
        and     r8, r2, #7
        sub     r2, r2, r8
        cmp     r2, #0
        str     r2, [sp, #0xC]
        ble     LCUY1
        sub     r2, r0, #0x54
        str     r2, [sp, #0x1C]
        sub     r2, r0, #0x64
        str     r2, [sp, #0x20]
        sub     r2, r0, #0x74
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
        sub     r7, r0, #4
        sub     r6, r0, #0x14
        sub     r5, r0, #0x24
        sub     r4, r0, #0x34
        sub     lr, r0, #0x44
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
LCUY0:
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
        blt     LCUY0
        ldr     r8, [sp, #0x10]
        ldr     r1, [sp, #0x14]
        ldr     r0, [sp, #0x18]
LCUY1:
        cmp     r8, #0
        beq     LCUY5
        ldr     r2, [sp, #0xC]
        cmp     r8, #0
        add     r0, r0, r2, lsl #4
        add     r1, r1, r2, lsl #3
        ble     LCUY5
        cmp     r8, #6
        mov     r4, #0
        blt     LCUY3
        sub     lr, r8, #6
        sub     r12, r0, #0x44
        sub     r3, r1, #0x24
LCUY2:
        ldr     r2, [r12, #0x4C]
        ldr     r5, [r12, #0x50]!
        str     r2, [r3, #0x24]
        add     r2, r4, #1
        str     r5, [r3, #0x28]!
        add     r5, r0, r2, lsl #4
        ldr     r6, [r5, #8]
        ldr     r5, [r5, #0xC]
        str     r6, [r1, +r2, lsl #3]
        add     r2, r1, r2, lsl #3
        str     r5, [r2, #4]
        add     r6, r4, #2
        add     r2, r4, #3
        add     r7, r0, r6, lsl #4
        ldr     r5, [r7, #8]
        ldr     r7, [r7, #0xC]
        add     r9, r1, r6, lsl #3
        str     r5, [r1, +r6, lsl #3]
        add     r6, r0, r2, lsl #4
        str     r7, [r9, #4]
        ldr     r5, [r6, #8]
        ldr     r6, [r6, #0xC]
        add     r7, r1, r2, lsl #3
        str     r5, [r1, +r2, lsl #3]
        str     r6, [r7, #4]
        add     r6, r4, #4
        add     r4, r4, #5
        add     r2, r0, r6, lsl #4
        ldr     r5, [r2, #8]
        ldr     r2, [r2, #0xC]
        cmp     r4, lr
        str     r5, [r1, +r6, lsl #3]
        add     r6, r1, r6, lsl #3
        str     r2, [r6, #4]
        ble     LCUY2
LCUY3:
        mov     r2, r4, lsl #4
        mov     r3, r4, lsl #3
        sub     r2, r2, #4
        sub     r3, r3, #4
        add     r0, r2, r0
        add     r1, r3, r1
LCUY4:
        ldr     r2, [r0, #0xC]
        ldr     r3, [r0, #0x10]!
        add     r4, r4, #1
        str     r2, [r1, #4]
        cmp     r4, r8
        str     r3, [r1, #8]!
        blt     LCUY4
LCUY5:
        mov     r0, #0
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LCUY6:
        mvn     r0, #5
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LCUY7:
        mvn     r0, #7
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}


