        .text
        .align  4
        .globl  _ippsImag_32fc


_ippsImag_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x3C
        cmp     r0, #0
        beq     LCUZ7
        cmp     r1, #0
        beq     LCUZ7
        cmp     r2, #0
        ble     LCUZ6
        and     r6, r2, #7
        sub     r2, r2, r6
        cmp     r2, #0
        str     r2, [sp, #0x14]
        ble     LCUZ1
        add     r2, r1, #0x18
        str     r2, [sp, #0x24]
        add     r2, r1, #0x1C
        str     r2, [sp, #0x28]
        sub     r2, r0, #4
        str     r2, [sp, #0x2C]
        sub     r2, r0, #0xC
        str     r2, [sp, #0x30]
        sub     r2, r0, #0x14
        str     r2, [sp, #0x34]
        add     r10, r1, #4
        add     r9, r1, #8
        add     r8, r1, #0xC
        add     r7, r1, #0x14
        sub     r2, r0, #0x1C
        str     r2, [sp, #0x38]
        str     r7, [sp, #0xC]
        str     r8, [sp]
        str     r9, [sp, #4]
        str     r10, [sp, #8]
        str     r6, [sp, #0x18]
        ldr     r7, [sp, #0x38]
        ldr     r8, [sp, #0x34]
        ldr     r9, [sp, #0x30]
        ldr     r6, [sp, #0x2C]
        ldr     r10, [sp, #0x24]
        mov     r11, r1
        mov     r5, #0
        add     r4, r1, #0x10
        sub     lr, r0, #0x24
        sub     r12, r0, #0x2C
        sub     r3, r0, #0x34
        sub     r2, r0, #0x3C
        str     r11, [sp, #0x10]
        str     r1, [sp, #0x1C]
        str     r0, [sp, #0x20]
LCUZ0:
        ldr     r1, [r3, #0x40]!
        ldr     r0, [sp, #0x10]
        ldr     r11, [r2, #0x40]!
        add     r5, r5, #8
        str     r11, [r0], #0x20
        str     r0, [sp, #0x10]
        ldr     r0, [sp, #8]
        str     r1, [r0], #0x20
        ldr     r11, [r12, #0x40]!
        ldr     r1, [lr, #0x40]!
        str     r0, [sp, #8]
        ldr     r0, [sp, #4]
        str     r11, [r0], #0x20
        ldr     r11, [sp]
        str     r0, [sp, #4]
        str     r1, [r11], #0x20
        ldr     r1, [r7, #0x40]!
        ldr     r0, [r8, #0x40]!
        str     r11, [sp]
        str     r1, [r4], #0x20
        ldr     r1, [sp, #0xC]
        str     r0, [r1], #0x20
        ldr     r11, [r9, #0x40]!
        ldr     r0, [r6, #0x40]!
        str     r1, [sp, #0xC]
        str     r11, [r10], #0x20
        ldr     r1, [sp, #0x28]
        str     r0, [r1], #0x20
        ldr     r0, [sp, #0x14]
        str     r1, [sp, #0x28]
        cmp     r5, r0
        blt     LCUZ0
        ldr     r6, [sp, #0x18]
        ldr     r1, [sp, #0x1C]
        ldr     r0, [sp, #0x20]
LCUZ1:
        cmp     r6, #0
        beq     LCUZ5
        ldr     r2, [sp, #0x14]
        cmp     r6, #0
        add     r0, r0, r2, lsl #3
        add     r1, r1, r2, lsl #2
        ble     LCUZ5
        cmp     r6, #6
        mov     lr, #0
        blt     LCUZ3
        sub     r12, r6, #6
        sub     r3, r0, #0x24
        mov     r2, r1
LCUZ2:
        ldr     r4, [r3, #0x28]!
        add     r5, lr, #1
        str     r4, [r2], #0x14
        add     r4, r0, r5, lsl #3
        ldr     r7, [r4, #4]
        add     r4, lr, #2
        str     r7, [r1, +r5, lsl #2]
        add     r7, r0, r4, lsl #3
        ldr     r7, [r7, #4]
        add     r5, lr, #3
        str     r7, [r1, +r4, lsl #2]
        add     r4, lr, #4
        add     r8, r0, r5, lsl #3
        ldr     r8, [r8, #4]
        add     lr, lr, #5
        cmp     lr, r12
        str     r8, [r1, +r5, lsl #2]
        add     r5, r0, r4, lsl #3
        ldr     r5, [r5, #4]
        str     r5, [r1, +r4, lsl #2]
        ble     LCUZ2
LCUZ3:
        mov     r2, lr, lsl #3
        sub     r2, r2, #4
        add     r0, r2, r0
        add     r1, r1, lr, lsl #2
LCUZ4:
        ldr     r2, [r0, #8]!
        add     lr, lr, #1
        cmp     lr, r6
        str     r2, [r1], #4
        blt     LCUZ4
LCUZ5:
        mov     r0, #0
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LCUZ6:
        mvn     r0, #5
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LCUZ7:
        mvn     r0, #7
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}


