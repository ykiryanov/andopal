        .text
        .align  4
        .globl  _ippsConjFlip_32fc


_ippsConjFlip_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x40
        cmp     r0, #0
        beq     LCXX7
        cmp     r1, #0
        beq     LCXX7
        cmp     r2, #0
        ble     LCXX6
        and     r7, r2, #7
        sub     r8, r2, r7
        cmp     r8, #0
        sub     r2, r2, #1
        ble     LCXX1
        mov     r2, r2, lsl #3
        add     lr, r2, #0x44
        sub     r4, r1, #0x10
        add     r4, lr, r4
        str     r4, [sp, #0x24]
        sub     r11, r0, #0x24
        sub     r4, r1, #0x38
        sub     r6, r1, #0x30
        sub     r2, r1, #0x18
        sub     r3, r1, #0x20
        sub     r12, r1, #0x28
        str     r11, [sp, #0x28]
        sub     r5, r1, #8
        sub     r11, r0, #0x2C
        add     r9, lr, r5
        add     r4, lr, r4
        add     r6, lr, r6
        add     r10, lr, r1
        add     r12, lr, r12
        add     r3, lr, r3
        add     r2, lr, r2
        mov     lr, #0
        str     r11, [sp, #0x2C]
        sub     r11, r0, #0x34
        str     lr, [sp, #0x1C]
        sub     lr, r0, #0x14
        str     r11, [sp, #0x34]
        str     lr, [sp, #0x38]
        sub     r11, r0, #0x3C
        str     r4, [sp, #0x20]
        str     r11, [sp, #0x30]
        sub     r5, r0, #4
        sub     r4, r0, #0xC
        sub     lr, r0, #0x1C
        str     r9, [sp]
        str     r6, [sp, #4]
        str     r8, [sp, #0xC]
        str     r7, [sp, #0x10]
        str     r1, [sp, #0x14]
        str     r0, [sp, #0x18]
        ldr     r9, [sp, #0x30]
        ldr     r0, [sp, #0x34]
        ldr     r1, [sp, #0x2C]
        ldr     r6, [sp, #0x28]
        ldr     r7, [sp, #0x38]
        ldr     r8, [sp, #0x24]
        str     r10, [sp, #8]
LCXX0:
        ldr     r10, [r9, #0x3C]
        ldr     r11, [sp, #0x1C]
        str     r10, [sp, #0x3C]
        ldr     r10, [sp, #0xC]
        add     r11, r11, #8
        str     r11, [sp, #0x1C]
        cmp     r11, r10
        ldr     r11, [sp, #0x3C]
        ldr     r10, [sp, #8]
        str     r11, [r10, #-0x44]
        ldr     r10, [r9, #0x40]!
        ldr     r11, [sp, #8]
        eor     r10, r10, #2, 2
        str     r10, [r11, #-0x40]!
        ldr     r10, [r0, #0x3C]
        str     r11, [sp, #8]
        ldr     r11, [sp]
        str     r10, [r11, #-0x44]
        ldr     r10, [r0, #0x40]!
        eor     r11, r10, #2, 2
        ldr     r10, [sp]
        str     r11, [r10, #-0x40]!
        ldr     r11, [r1, #0x3C]
        str     r10, [sp]
        str     r11, [r8, #-0x44]
        ldr     r10, [r1, #0x40]!
        eor     r10, r10, #2, 2
        str     r10, [r8, #-0x40]!
        ldr     r10, [r6, #0x3C]
        str     r10, [r2, #-0x44]
        ldr     r10, [r6, #0x40]!
        eor     r10, r10, #2, 2
        str     r10, [r2, #-0x40]!
        ldr     r10, [lr, #0x3C]
        str     r10, [r3, #-0x44]
        ldr     r10, [lr, #0x40]!
        eor     r10, r10, #2, 2
        str     r10, [r3, #-0x40]!
        ldr     r10, [r7, #0x3C]
        str     r10, [r12, #-0x44]
        ldr     r10, [r7, #0x40]!
        eor     r10, r10, #2, 2
        str     r10, [r12, #-0x40]!
        ldr     r10, [sp, #4]
        ldr     r11, [r4, #0x3C]
        str     r11, [r10, #-0x44]
        ldr     r10, [r4, #0x40]!
        ldr     r11, [sp, #4]
        eor     r10, r10, #2, 2
        str     r10, [r11, #-0x40]!
        ldr     r10, [r5, #0x3C]
        str     r11, [sp, #4]
        ldr     r11, [sp, #0x20]
        str     r10, [r11, #-0x44]
        ldr     r10, [r5, #0x40]!
        ldr     r11, [sp, #0x20]
        eor     r10, r10, #2, 2
        str     r10, [r11, #-0x40]!
        str     r11, [sp, #0x20]
        blt     LCXX0
        ldr     r8, [sp, #0xC]
        ldr     r7, [sp, #0x10]
        ldr     r1, [sp, #0x14]
        ldr     r0, [sp, #0x18]
LCXX1:
        cmp     r7, #0
        beq     LCXX5
        cmp     r7, #0
        add     r8, r0, r8, lsl #3
        sub     r12, r7, #1
        ble     LCXX5
        cmp     r7, #5
        mov     lr, #0
        blt     LCXX3
        mov     r0, r12, lsl #3
        add     r0, r0, #0xC
        add     r0, r0, r1
        sub     r3, r7, #5
        sub     r2, r8, #4
LCXX2:
        ldr     r4, [r2, #4]
        sub     r12, r12, #4
        add     lr, lr, #4
        str     r4, [r0, #-0xC]
        ldr     r4, [r2, #8]
        cmp     lr, r3
        eor     r4, r4, #2, 2
        str     r4, [r0, #-8]
        ldr     r4, [r2, #0xC]
        str     r4, [r0, #-0x14]
        ldr     r4, [r2, #0x10]
        eor     r4, r4, #2, 2
        str     r4, [r0, #-0x10]
        ldr     r4, [r2, #0x14]
        str     r4, [r0, #-0x1C]
        ldr     r4, [r2, #0x18]
        eor     r4, r4, #2, 2
        str     r4, [r0, #-0x18]
        ldr     r4, [r2, #0x1C]
        str     r4, [r0, #-0x24]
        ldr     r4, [r2, #0x20]!
        eor     r4, r4, #2, 2
        str     r4, [r0, #-0x20]!
        ble     LCXX2
LCXX3:
        mov     r0, lr, lsl #3
        sub     r2, r0, #4
        mov     r12, r12, lsl #3
        add     r0, r12, #0xC
        add     r8, r2, r8
        add     r1, r0, r1
LCXX4:
        ldr     r0, [r8, #4]
        add     lr, lr, #1
        cmp     lr, r7
        str     r0, [r1, #-0xC]
        ldr     r0, [r8, #8]!
        eor     r0, r0, #2, 2
        str     r0, [r1, #-8]!
        blt     LCXX4
LCXX5:
        mov     r0, #0
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LCXX6:
        mvn     r0, #5
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LCXX7:
        mvn     r0, #7
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}


