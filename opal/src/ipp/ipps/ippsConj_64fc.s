        .text
        .align  4
        .globl  _ippsConj_64fc


_ippsConj_64fc:
        stmdb   sp!, {r1, r4 - r11, lr}
        cmp     r0, #0
        beq     LCXL7
        cmp     r1, #0
        beq     LCXL7
        cmp     r2, #0
        ble     LCXL6
        and     r3, r2, #3
        sub     r2, r2, r3
        cmp     r2, #0
        ble     LCXL1
        mov     r10, #0
        sub     r9, r0, #4
        sub     r8, r1, #4
        sub     r7, r0, #0x14
        sub     r6, r1, #0x14
        sub     r5, r0, #0x24
        sub     r4, r1, #0x24
        sub     lr, r0, #0x34
        sub     r12, r1, #0x34
        str     r0, [sp]
LCXL0:
        ldr     r11, [lr, #0x34]
        ldr     r0, [lr, #0x38]
        add     r10, r10, #4
        str     r11, [r12, #0x34]
        cmp     r10, r2
        str     r0, [r12, #0x38]
        ldr     r11, [lr, #0x40]
        ldr     r0, [lr, #0x3C]
        add     lr, lr, #0x40
        eor     r11, r11, #2, 2
        str     r11, [r12, #0x40]
        str     r0, [r12, #0x3C]
        ldr     r11, [r5, #0x34]
        ldr     r0, [r5, #0x38]
        add     r12, r12, #0x40
        str     r11, [r4, #0x34]
        str     r0, [r4, #0x38]
        ldr     r11, [r5, #0x40]
        ldr     r0, [r5, #0x3C]
        add     r5, r5, #0x40
        eor     r11, r11, #2, 2
        str     r11, [r4, #0x40]
        str     r0, [r4, #0x3C]
        ldr     r11, [r7, #0x34]
        ldr     r0, [r7, #0x38]
        add     r4, r4, #0x40
        str     r11, [r6, #0x34]
        str     r0, [r6, #0x38]
        ldr     r11, [r7, #0x40]
        ldr     r0, [r7, #0x3C]
        add     r7, r7, #0x40
        eor     r11, r11, #2, 2
        str     r11, [r6, #0x40]
        str     r0, [r6, #0x3C]
        ldr     r11, [r9, #0x34]
        ldr     r0, [r9, #0x38]
        add     r6, r6, #0x40
        str     r11, [r8, #0x34]
        str     r0, [r8, #0x38]
        ldr     r11, [r9, #0x40]
        ldr     r0, [r9, #0x3C]
        add     r9, r9, #0x40
        eor     r11, r11, #2, 2
        str     r11, [r8, #0x40]
        str     r0, [r8, #0x3C]
        add     r8, r8, #0x40
        blt     LCXL0
        ldr     r0, [sp]
LCXL1:
        cmp     r3, #0
        beq     LCXL5
        add     r0, r0, r2, lsl #4
        cmp     r3, #0
        add     r2, r1, r2, lsl #4
        ble     LCXL5
        cmp     r3, #5
        mov     r4, #0
        blt     LCXL3
        sub     lr, r3, #5
        sub     r12, r0, #4
        sub     r1, r2, #4
LCXL2:
        ldr     r6, [r12, #8]
        ldr     r5, [r12, #4]
        add     r4, r4, #4
        str     r6, [r1, #8]
        cmp     r4, lr
        str     r5, [r1, #4]
        ldr     r6, [r12, #0x10]
        ldr     r5, [r12, #0xC]
        eor     r6, r6, #2, 2
        str     r6, [r1, #0x10]
        str     r5, [r1, #0xC]
        ldr     r6, [r12, #0x18]
        ldr     r5, [r12, #0x14]
        str     r6, [r1, #0x18]
        str     r5, [r1, #0x14]
        ldr     r6, [r12, #0x20]
        ldr     r5, [r12, #0x1C]
        eor     r6, r6, #2, 2
        str     r6, [r1, #0x20]
        str     r5, [r1, #0x1C]
        ldr     r6, [r12, #0x28]
        ldr     r5, [r12, #0x24]
        str     r6, [r1, #0x28]
        str     r5, [r1, #0x24]
        ldr     r6, [r12, #0x30]
        ldr     r5, [r12, #0x2C]
        eor     r6, r6, #2, 2
        str     r6, [r1, #0x30]
        str     r5, [r1, #0x2C]
        ldr     r6, [r12, #0x38]
        ldr     r5, [r12, #0x34]
        str     r6, [r1, #0x38]
        str     r5, [r1, #0x34]
        ldr     r6, [r12, #0x40]
        ldr     r5, [r12, #0x3C]
        add     r12, r12, #0x40
        eor     r6, r6, #2, 2
        str     r6, [r1, #0x40]
        str     r5, [r1, #0x3C]
        add     r1, r1, #0x40
        ble     LCXL2
LCXL3:
        mov     r1, r4, lsl #4
        sub     r1, r1, #4
        add     r0, r1, r0
        add     r2, r1, r2
LCXL4:
        ldr     r12, [r0, #8]
        ldr     r1, [r0, #4]
        add     r4, r4, #1
        str     r12, [r2, #8]
        cmp     r4, r3
        str     r1, [r2, #4]
        ldr     r12, [r0, #0x10]
        ldr     r1, [r0, #0xC]
        add     r0, r0, #0x10
        eor     r12, r12, #2, 2
        str     r12, [r2, #0x10]
        str     r1, [r2, #0xC]
        add     r2, r2, #0x10
        blt     LCXL4
LCXL5:
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LCXL6:
        mvn     r0, #5
        ldmia   sp!, {r1, r4 - r11, pc}
LCXL7:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}


