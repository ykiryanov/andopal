        .text
        .align  4
        .globl  _ipps_sDctFwd_Dir_64f


_ipps_sDctFwd_Dir_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x40
        ldr     r4, [sp, #0x64]
        tst     r2, #1
        mov     r7, #0
        mov     r12, r2, asr #1
        beq     LCTO7
        add     lr, r0, r12, lsl #3
        ldr     r8, [lr, #4]
        ldr     r9, [r0, +r12, lsl #3]
        cmp     r12, #0
        mov     r5, r8
        mov     r6, r9
        ble     LCTO1
        sub     r10, r0, #8
        str     r8, [sp, #0x2C]
        sub     r0, r0, #4
        sub     lr, r4, #4
        mov     r8, r10
        sub     r11, r4, #0xC
        str     lr, [sp, #0x24]
        str     r9, [sp, #0x30]
        str     r12, [sp, #0x28]
        str     r4, [sp, #0x34]
        str     r3, [sp, #0x3C]
        str     r2, [sp, #0x38]
        str     r1, [sp, #0x18]
        mov     r10, r0
LCTO0:
        ldr     r12, [sp, #0x38]
        ldr     r0, [r10, #4]
        ldr     r1, [r10, #8]
        sub     r9, r12, r7
        add     r7, r7, #1
        add     r12, r8, r9, lsl #3
        str     r12, [sp, #0x20]
        ldr     r3, [r12, #4]
        ldr     r2, [r8, +r9, lsl #3]
        bl      __adddf3
        str     r1, [sp, #0x1C]
        mov     r4, r0
        mov     r2, r6
        mov     r3, r5
        bl      __adddf3
        str     r4, [r11, #0xC]
        ldr     r12, [sp, #0x1C]
        mov     r6, r0
        mov     r5, r1
        str     r12, [r11, #0x10]!
        ldr     r12, [sp, #0x20]
        ldr     r2, [r10, #4]
        ldr     r3, [r10, #8]!
        ldr     r4, [r12, #4]
        ldr     r9, [r8, +r9, lsl #3]
        mov     r0, r2
        mov     r1, r3
        mov     r2, r9
        mov     r3, r4
        bl      __subdf3
        ldr     r12, [sp, #0x24]
        str     r0, [r12, #0xC]
        str     r1, [r12, #0x10]
        ldr     r12, [sp, #0x28]
        cmp     r7, r12
        ldr     r12, [sp, #0x24]
        add     r12, r12, #0x10
        str     r12, [sp, #0x24]
        blt     LCTO0
        ldr     r8, [sp, #0x2C]
        ldr     r9, [sp, #0x30]
        ldr     r4, [sp, #0x34]
        ldr     r3, [sp, #0x3C]
        ldr     r2, [sp, #0x38]
        ldr     r1, [sp, #0x18]
LCTO1:
        sub     r11, r2, #1
        cmp     r11, #1
        str     r6, [r1]
        str     r5, [r1, #4]
        ble     LCTO13
        add     r5, r4, #8
        eor     r0, r8, #2, 2
        add     r12, r1, #4
        mov     r10, #1
        mov     lr, #2
        sub     r1, r1, #4
        str     r0, [sp, #0x20]
        str     r5, [sp, #0x24]
        str     r8, [sp, #0x2C]
        str     r9, [sp, #0x30]
        str     r4, [sp, #0x34]
        str     r3, [sp, #0x3C]
        str     r2, [sp, #0x38]
LCTO2:
        tst     r10, #2
        beq     LCTO3
        ldr     r3, [sp, #0x2C]
        ldr     r4, [sp, #0x30]
        str     r3, [sp, #8]
        b       LCTO4
LCTO3:
        ldr     r0, [sp, #0x20]
        ldr     r4, [sp, #0x30]
        str     r0, [sp, #8]
LCTO4:
        cmp     r11, #0
        add     r9, r10, #1
        mov     r8, r10
        movle   r0, #0
        movle   r3, r0
        ble     LCTO6
        ldr     r5, [sp, #0x24]
        ldr     r6, [sp, #0x34]
        mov     r7, #0
        str     r10, [sp, #0x28]
        str     r11, [sp, #0xC]
        ldr     r10, [sp, #0x3C]
        ldr     r11, [sp, #0x38]
        mov     r3, r7
        mov     r0, r3
        mov     r2, r9, lsl #1
        str     r0, [sp]
        str     r3, [sp, #4]
        str     r2, [sp, #0x14]
        str     r1, [sp, #0x18]
        str     r12, [sp, #0x1C]
        str     lr, [sp, #0x10]
LCTO5:
        ldr     r0, [r6]
        ldr     r1, [r6, #4]
        add     r3, r10, r9, lsl #3
        ldr     r2, [r10, +r9, lsl #3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        ldr     r3, [sp, #8]
        mov     r2, r4
        bl      __adddf3
        ldr     r2, [r5]
        ldr     r12, [r10, +r8, lsl #3]
        ldr     lr, [r5, #4]
        str     r1, [sp, #8]
        add     r3, r10, r8, lsl #3
        ldr     r3, [r3, #4]
        mov     r4, r0
        mov     r0, r2
        mov     r1, lr
        mov     r2, r12
        bl      __muldf3
        ldr     r3, [sp]
        ldr     r2, [sp, #4]
        bl      __adddf3
        ldr     r3, [sp, #0x14]
        str     r1, [sp]
        ldr     r1, [sp, #0x10]
        add     r9, r3, r9
        cmp     r9, r11, lsl #2
        str     r0, [sp, #4]
        add     r8, r8, r1
        subge   r9, r9, r11, lsl #2
        cmp     r8, r11, lsl #2
        subge   r8, r8, r11, lsl #2
        ldr     r1, [sp, #0xC]
        add     r7, r7, #2
        add     r5, r5, #0x10
        cmp     r7, r1
        add     r6, r6, #0x10
        blt     LCTO5
        ldr     r0, [sp]
        ldr     r3, [sp, #4]
        ldr     r1, [sp, #0x18]
        ldr     r12, [sp, #0x1C]
        ldr     lr, [sp, #0x10]
        ldr     r10, [sp, #0x28]
        ldr     r11, [sp, #0xC]
LCTO6:
        str     r0, [r1, #0x10]
        str     r3, [r1, #0xC]
        str     r4, [r12, #0xC]
        ldr     r0, [sp, #8]
        add     r10, r10, #2
        cmp     r10, r11
        str     r0, [r12, #0x10]!
        add     r1, r1, #0x10
        add     lr, lr, #4
        blt     LCTO2
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LCTO7:
        cmp     r12, #0
        ble     LCTO15
        mov     lr, r7
        sub     r5, r0, #8
        mov     r11, lr
        str     r5, [sp, #0x30]
        mov     r10, r11
        sub     r5, r0, #4
        mov     r9, r10
        sub     r0, r4, #0xC
        sub     r8, r4, #4
        sub     r6, r3, #4
        str     r11, [sp, #0x2C]
        str     lr, [sp, #0x24]
        str     r9, [sp, #0x1C]
        str     r10, [sp, #0x20]
        str     r0, [sp, #0x14]
        str     r12, [sp, #0x28]
        str     r4, [sp, #0x34]
        str     r3, [sp, #0x3C]
        str     r2, [sp, #0x38]
        str     r1, [sp, #0x18]
LCTO8:
        ldr     r0, [r5, #4]
        ldr     r3, [sp, #0x30]
        str     r0, [sp, #0x10]
        ldr     r0, [sp, #0x38]
        ldr     r9, [r5, #8]!
        sub     r0, r0, r7
        ldr     r4, [r3, +r0, lsl #3]
        mov     r1, r9
        add     r0, r3, r0, lsl #3
        ldr     r3, [r0, #4]
        ldr     r0, [sp, #0x10]
        mov     r2, r4
        add     r7, r7, #1
        str     r3, [sp, #0xC]
        bl      __adddf3
        mov     r10, r0
        ldr     r0, [sp, #0x10]
        ldr     r3, [sp, #0xC]
        mov     r11, r1
        mov     r1, r9
        mov     r2, r4
        bl      __subdf3
        mov     r4, r0
        mov     r9, r1
        ldr     r0, [sp, #0x24]
        ldr     r1, [sp, #0x2C]
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        ldr     r2, [r6, #0xC]
        ldr     r3, [r6, #0x10]!
        str     r0, [sp, #0x24]
        str     r1, [sp, #0x2C]
        mov     r0, r4
        mov     r1, r9
        bl      __muldf3
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x1C]
        bl      __adddf3
        ldr     r12, [sp, #0x14]
        str     r10, [r12, #0xC]
        str     r11, [r12, #0x10]
        str     r4, [r8, #0xC]
        str     r9, [r8, #0x10]!
        ldr     r2, [sp, #0x28]
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x14]
        cmp     r7, r2
        str     r1, [sp, #0x1C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x14]
        blt     LCTO8
        ldr     r11, [sp, #0x2C]
        ldr     lr, [sp, #0x24]
        ldr     r9, [sp, #0x1C]
        ldr     r10, [sp, #0x20]
        ldr     r4, [sp, #0x34]
        ldr     r3, [sp, #0x3C]
        ldr     r2, [sp, #0x38]
        ldr     r1, [sp, #0x18]
LCTO9:
        sub     r7, r2, #1
        cmp     r7, #2
        str     lr, [r1]
        str     r11, [r1, #4]
        str     r10, [r1, #8]
        str     r9, [r1, #0xC]
        ble     LCTO13
        add     r0, r1, #0xC
        add     r5, r4, #8
        mov     lr, #2
        mov     r12, #4
        add     r1, r1, #4
        str     r0, [sp, #0x14]
        str     r5, [sp, #0x10]
        str     r4, [sp, #0x34]
        str     r3, [sp, #0x3C]
        str     r2, [sp, #0x38]
LCTO10:
        cmp     r7, #0
        mov     r11, lr
        add     r10, lr, #1
        ble     LCTO14
        ldr     r5, [sp, #0x10]
        mov     r9, #0
        mov     r3, r9
        mov     r0, r3
        mov     r4, r0
        mov     r8, r4
        ldr     r6, [sp, #0x34]
        str     r8, [sp, #0x2C]
        str     r7, [sp, #0x24]
        ldr     r7, [sp, #0x3C]
        ldr     r8, [sp, #0x38]
        mov     r2, r10, lsl #1
        str     r0, [sp, #0x28]
        str     r3, [sp, #0x30]
        str     r2, [sp, #0x1C]
        str     r1, [sp, #0x18]
        str     r12, [sp, #0x20]
        str     lr, [sp, #0xC]
LCTO11:
        ldr     r0, [r6]
        ldr     r1, [r6, #4]
        add     r3, r7, r11, lsl #3
        ldr     r2, [r7, +r11, lsl #3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        ldr     r2, [sp, #0x30]
        ldr     r3, [sp, #0x28]
        bl      __adddf3
        ldr     r2, [r5]
        ldr     r12, [r7, +r10, lsl #3]
        ldr     lr, [r5, #4]
        str     r0, [sp, #0x30]
        str     r1, [sp, #0x28]
        add     r3, r7, r10, lsl #3
        ldr     r3, [r3, #4]
        mov     r0, r2
        mov     r1, lr
        mov     r2, r12
        bl      __muldf3
        ldr     r3, [sp, #0x2C]
        mov     r2, r4
        bl      __adddf3
        ldr     r3, [sp, #0x20]
        str     r1, [sp, #0x2C]
        ldr     r1, [sp, #0x1C]
        add     r11, r11, r3
        cmp     r11, r8, lsl #2
        mov     r4, r0
        add     r10, r1, r10
        subge   r11, r11, r8, lsl #2
        cmp     r10, r8, lsl #2
        subge   r10, r10, r8, lsl #2
        ldr     r1, [sp, #0x24]
        add     r9, r9, #2
        add     r5, r5, #0x10
        cmp     r9, r1
        add     r6, r6, #0x10
        blt     LCTO11
        ldr     r0, [sp, #0x28]
        ldr     r3, [sp, #0x30]
        ldr     r8, [sp, #0x2C]
        ldr     r1, [sp, #0x18]
        ldr     r12, [sp, #0x20]
        ldr     lr, [sp, #0xC]
        ldr     r7, [sp, #0x24]
LCTO12:
        str     r3, [r1, #0xC]
        str     r0, [r1, #0x10]!
        ldr     r3, [sp, #0x14]
        add     lr, lr, #2
        str     r4, [r3, #0xC]
        str     r8, [r3, #0x10]!
        cmp     lr, r7
        str     r3, [sp, #0x14]
        add     r12, r12, #4
        blt     LCTO10
LCTO13:
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LCTO14:
        mov     r8, #0
        mov     r3, r8
        mov     r0, r3
        mov     r4, r0
        b       LCTO12
LCTO15:
        mov     lr, r7
        mov     r11, lr
        mov     r10, r11
        mov     r9, r10
        b       LCTO9


