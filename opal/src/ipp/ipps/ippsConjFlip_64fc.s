        .text
        .align  4
        .globl  _ippsConjFlip_64fc


_ippsConjFlip_64fc:
        stmdb   sp!, {r1, r4 - r11, lr}
        cmp     r0, #0
        beq     LCXW7
        cmp     r1, #0
        beq     LCXW7
        cmp     r2, #0
        ble     LCXW6
        and     r4, r2, #3
        sub     r10, r2, r4
        cmp     r10, #0
        sub     r2, r2, #1
        ble     LCXW1
        mov     r2, r2, lsl #4
        add     r2, r2, #0x4C
        sub     r3, r1, #0x10
        sub     r12, r1, #0x20
        sub     lr, r1, #0x30
        add     lr, r2, lr
        add     r12, r2, r12
        add     r3, r2, r3
        add     r2, r2, r1
        mov     r9, #0
        sub     r8, r0, #4
        sub     r7, r0, #0x14
        sub     r6, r0, #0x24
        sub     r5, r0, #0x34
        str     r0, [sp]
LCXW0:
        ldr     r11, [r5, #0x34]
        ldr     r0, [r5, #0x38]
        add     r9, r9, #4
        str     r11, [r2, #-0x4C]
        cmp     r9, r10
        str     r0, [r2, #-0x48]
        ldr     r11, [r5, #0x40]
        ldr     r0, [r5, #0x3C]
        add     r5, r5, #0x40
        eor     r11, r11, #2, 2
        str     r11, [r2, #-0x40]
        str     r0, [r2, #-0x44]
        ldr     r11, [r6, #0x34]
        ldr     r0, [r6, #0x38]
        sub     r2, r2, #0x40
        str     r11, [r3, #-0x4C]
        str     r0, [r3, #-0x48]
        ldr     r11, [r6, #0x40]
        ldr     r0, [r6, #0x3C]
        add     r6, r6, #0x40
        eor     r11, r11, #2, 2
        str     r11, [r3, #-0x40]
        str     r0, [r3, #-0x44]
        ldr     r11, [r7, #0x34]
        ldr     r0, [r7, #0x38]
        sub     r3, r3, #0x40
        str     r11, [r12, #-0x4C]
        str     r0, [r12, #-0x48]
        ldr     r11, [r7, #0x40]
        ldr     r0, [r7, #0x3C]
        add     r7, r7, #0x40
        eor     r11, r11, #2, 2
        str     r11, [r12, #-0x40]
        str     r0, [r12, #-0x44]
        ldr     r11, [r8, #0x34]
        ldr     r0, [r8, #0x38]
        sub     r12, r12, #0x40
        str     r11, [lr, #-0x4C]
        str     r0, [lr, #-0x48]
        ldr     r11, [r8, #0x40]
        ldr     r0, [r8, #0x3C]
        add     r8, r8, #0x40
        eor     r11, r11, #2, 2
        str     r11, [lr, #-0x40]
        str     r0, [lr, #-0x44]
        sub     lr, lr, #0x40
        blt     LCXW0
        ldr     r0, [sp]
LCXW1:
        cmp     r4, #0
        beq     LCXW5
        cmp     r4, #0
        add     r10, r0, r10, lsl #4
        sub     r12, r4, #1
        ble     LCXW5
        cmp     r4, #5
        mov     lr, #0
        blt     LCXW3
        mov     r0, r12, lsl #4
        add     r0, r0, #0x1C
        add     r0, r0, r1
        sub     r3, r4, #5
        sub     r2, r10, #4
LCXW2:
        ldr     r6, [r2, #8]
        ldr     r5, [r2, #4]
        sub     r12, r12, #4
        str     r6, [r0, #-0x18]
        add     lr, lr, #4
        str     r5, [r0, #-0x1C]
        ldr     r6, [r2, #0x10]
        ldr     r5, [r2, #0xC]
        cmp     lr, r3
        eor     r6, r6, #2, 2
        str     r6, [r0, #-0x10]
        str     r5, [r0, #-0x14]
        ldr     r6, [r2, #0x18]
        ldr     r5, [r2, #0x14]
        str     r6, [r0, #-0x28]
        str     r5, [r0, #-0x2C]
        ldr     r6, [r2, #0x20]
        ldr     r5, [r2, #0x1C]
        eor     r6, r6, #2, 2
        str     r6, [r0, #-0x20]
        str     r5, [r0, #-0x24]
        ldr     r6, [r2, #0x28]
        ldr     r5, [r2, #0x24]
        str     r6, [r0, #-0x38]
        str     r5, [r0, #-0x3C]
        ldr     r6, [r2, #0x30]
        ldr     r5, [r2, #0x2C]
        eor     r6, r6, #2, 2
        str     r6, [r0, #-0x30]
        str     r5, [r0, #-0x34]
        ldr     r6, [r2, #0x38]
        ldr     r5, [r2, #0x34]
        str     r6, [r0, #-0x48]
        str     r5, [r0, #-0x4C]
        ldr     r6, [r2, #0x40]
        ldr     r5, [r2, #0x3C]
        add     r2, r2, #0x40
        eor     r6, r6, #2, 2
        str     r6, [r0, #-0x40]
        str     r5, [r0, #-0x44]
        sub     r0, r0, #0x40
        ble     LCXW2
LCXW3:
        mov     r0, lr, lsl #4
        sub     r2, r0, #4
        mov     r12, r12, lsl #4
        add     r0, r12, #0x1C
        add     r10, r2, r10
        add     r1, r0, r1
LCXW4:
        ldr     r2, [r10, #8]
        ldr     r0, [r10, #4]
        add     lr, lr, #1
        str     r2, [r1, #-0x18]
        cmp     lr, r4
        str     r0, [r1, #-0x1C]
        ldr     r2, [r10, #0x10]
        ldr     r0, [r10, #0xC]
        add     r10, r10, #0x10
        eor     r2, r2, #2, 2
        str     r2, [r1, #-0x10]
        str     r0, [r1, #-0x14]
        sub     r1, r1, #0x10
        blt     LCXW4
LCXW5:
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LCXW6:
        mvn     r0, #5
        ldmia   sp!, {r1, r4 - r11, pc}
LCXW7:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}


