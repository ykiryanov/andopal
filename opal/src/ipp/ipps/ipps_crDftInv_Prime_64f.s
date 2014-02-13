        .text
        .align  4
        .globl  _ipps_crDftInv_Prime_64f


_ipps_crDftInv_Prime_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x70
        ldr     lr, [sp, #0x98]
        ldr     r4, [sp, #0x94]
        mul     r5, r2, lr
        ldr     r7, [sp, #0x9C]
        ldr     r6, [sp, #0xA0]
        add     r12, r4, #1
        cmp     lr, #0
        mov     r12, r12, asr #1
        ble     LCNZ7
        rsb     r8, r5, #0
        mla     r8, r4, r5, r8
        sub     r10, r4, #1
        add     r9, r6, #0x10
        str     r9, [sp, #0x68]
        str     r10, [sp, #0x64]
        str     r8, [sp, #0x60]
        str     r5, [sp, #0x6C]
        str     r6, [sp, #0x5C]
        str     r7, [sp, #0x58]
        str     lr, [sp, #0x54]
        str     r4, [sp, #0x50]
        str     r2, [sp, #0x4C]
LCNZ0:
        ldr     r7, [sp, #0x6C]
        ldr     r5, [r0]
        ldr     r4, [r0, #4]
        ldr     lr, [r1]
        ldr     r2, [r1, #4]
        add     r6, r0, r7, lsl #3
        add     r7, r1, r7, lsl #3
        str     r7, [sp, #0x14]
        ldr     r7, [sp, #0x60]
        str     r6, [sp, #0x10]
        cmp     r12, #1
        add     r6, r0, r7, lsl #3
        add     r7, r1, r7, lsl #3
        str     r6, [sp, #0x18]
        str     r7, [sp, #0x1C]
        mov     r9, r5
        mov     r8, r4
        mov     r7, lr
        mov     r6, r2
        ble     LCNZ2
        ldr     r11, [sp, #0x5C]
        str     r6, [sp]
        str     r7, [sp, #4]
        sub     r10, r11, #4
        str     r10, [sp, #0x24]
        sub     r11, r11, #0x14
        sub     r10, r12, #1
        str     r11, [sp, #0x28]
        str     r10, [sp, #0x20]
        str     r8, [sp, #8]
        str     r9, [sp, #0xC]
        ldr     r8, [sp, #0x1C]
        ldr     r10, [sp, #0x18]
        ldr     r11, [sp, #0x14]
        ldr     r9, [sp, #0x10]
        str     r2, [sp, #0x2C]
        str     lr, [sp, #0x30]
        str     r4, [sp, #0x34]
        str     r5, [sp, #0x38]
        str     r12, [sp, #0x3C]
        str     r3, [sp, #0x40]
        str     r1, [sp, #0x44]
        str     r0, [sp, #0x48]
LCNZ1:
        ldr     r2, [r10]
        ldr     r3, [r10, #4]
        ldr     r0, [r9]
        ldr     r1, [r9, #4]
        bl      __adddf3
        ldr     r2, [r11]
        ldr     r4, [r11, #4]
        ldr     r5, [r8]
        ldr     r3, [r8, #4]
        mov     r6, r0
        mov     r7, r1
        mov     r0, r2
        mov     r1, r4
        mov     r2, r5
        bl      __adddf3
        mov     r4, r0
        ldr     r0, [sp, #0xC]
        mov     r5, r1
        ldr     r1, [sp, #8]
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        str     r0, [sp, #0xC]
        ldr     r0, [sp, #4]
        str     r1, [sp, #8]
        ldr     r1, [sp]
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        ldr     r12, [sp, #0x28]
        str     r4, [r12, #0x1C]
        str     r5, [r12, #0x20]
        str     r6, [r12, #0x14]
        str     r7, [r12, #0x18]
        ldr     r2, [r9]
        ldr     r3, [r10, #4]
        ldr     r4, [r9, #4]
        ldr     r5, [r10]
        str     r0, [sp, #4]
        str     r1, [sp]
        mov     r0, r2
        mov     r1, r4
        mov     r2, r5
        bl      __subdf3
        ldr     r2, [sp, #0x24]
        str     r0, [r2, #0x14]
        str     r1, [r2, #0x18]
        ldr     r0, [r11]
        ldr     r1, [r11, #4]
        ldr     r2, [r8]
        ldr     r3, [r8, #4]
        bl      __subdf3
        ldr     r2, [sp, #0x24]
        str     r0, [r2, #0x1C]
        str     r1, [r2, #0x20]
        ldr     r0, [sp, #0x20]
        subs    r0, r0, #1
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x6C]
        add     r9, r9, r0, lsl #3
        add     r11, r11, r0, lsl #3
        sub     r10, r10, r0, lsl #3
        sub     r8, r8, r0, lsl #3
        ldr     r0, [sp, #0x24]
        add     r0, r0, #0x20
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x28]
        add     r0, r0, #0x20
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x20]
        bne     LCNZ1
        ldr     r6, [sp]
        ldr     r7, [sp, #4]
        ldr     r8, [sp, #8]
        ldr     r9, [sp, #0xC]
        ldr     r2, [sp, #0x2C]
        ldr     lr, [sp, #0x30]
        ldr     r4, [sp, #0x34]
        ldr     r5, [sp, #0x38]
        ldr     r12, [sp, #0x3C]
        ldr     r3, [sp, #0x40]
        ldr     r1, [sp, #0x44]
        ldr     r0, [sp, #0x48]
LCNZ2:
        cmp     r12, #1
        str     r9, [r3]
        str     r8, [r3, #4]
        str     r7, [r3, #8]
        str     r6, [r3, #0xC]
        ldrle   r2, [sp, #0x50]
        addle   r8, r3, r2, lsl #4
        ble     LCNZ6
        ldr     r6, [sp, #0x50]
        mov     r7, #1
        str     r2, [sp, #0x2C]
        add     r8, r3, r6, lsl #4
        add     r6, r3, #0xC
        str     r8, [sp, #0x24]
        str     lr, [sp, #0x30]
        str     r4, [sp, #0x34]
        str     r5, [sp, #0x38]
        str     r12, [sp, #0x3C]
        str     r3, [sp, #0x40]
        str     r1, [sp, #0x44]
        str     r0, [sp, #0x48]
LCNZ3:
        ldr     r0, [sp, #0x64]
        cmp     r0, #0
        ldr     r0, [sp, #0x38]
        str     r0, [sp, #8]
        ldr     r0, [sp, #0x34]
        str     r0, [sp, #4]
        ldr     r0, [sp, #0x30]
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0x2C]
        str     r0, [sp, #0x10]
        mov     r0, r7
        ble     LCNZ8
        mov     r1, #0
        mov     r10, r1
        mov     r11, r10
        mov     r9, r11
        ldr     r4, [sp, #0x68]
        ldr     r5, [sp, #0x5C]
        mov     r8, r9
        str     r9, [sp, #0x18]
        ldr     r9, [sp, #0x50]
        str     r6, [sp, #0x28]
        str     r7, [sp, #0x20]
        str     r8, [sp, #0x1C]
        str     r11, [sp, #0xC]
        str     r10, [sp]
        mov     r7, r0
        mov     r6, r1
LCNZ4:
        ldr     r3, [sp, #0x58]
        ldr     r0, [r5]
        ldr     r1, [r5, #4]
        ldr     r11, [r3, +r7, lsl #4]
        add     r8, r3, r7, lsl #4
        ldr     r10, [r8, #4]
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #4]
        bl      __adddf3
        ldr     r3, [r5, #8]
        ldr     r2, [r5, #0xC]
        str     r1, [sp, #4]
        str     r0, [sp, #8]
        mov     r1, r2
        mov     r0, r3
        mov     r3, r10
        mov     r2, r11
        bl      __muldf3
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp, #0x10]
        bl      __adddf3
        ldr     r10, [r8, #8]
        ldr     r3, [r4, #8]
        ldr     r2, [r4, #0xC]
        ldr     r8, [r8, #0xC]
        str     r0, [sp, #0x14]
        str     r1, [sp, #0x10]
        mov     r0, r3
        mov     r1, r2
        mov     r2, r10
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0x1C]
        bl      __adddf3
        ldr     r3, [r4]
        ldr     r2, [r4, #4]
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x1C]
        mov     r0, r3
        mov     r1, r2
        mov     r2, r10
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [sp]
        ldr     r3, [sp, #0xC]
        bl      __adddf3
        ldr     r2, [sp, #0x20]
        str     r0, [sp]
        add     r7, r2, r7
        cmp     r7, r9
        str     r1, [sp, #0xC]
        subge   r7, r7, r9
        ldr     r2, [sp, #0x64]
        add     r6, r6, #2
        add     r4, r4, #0x20
        cmp     r6, r2
        add     r5, r5, #0x20
        blt     LCNZ4
        ldr     r8, [sp, #0x1C]
        ldr     r9, [sp, #0x18]
        ldr     r11, [sp, #0xC]
        ldr     r10, [sp]
        ldr     r6, [sp, #0x28]
        ldr     r7, [sp, #0x20]
LCNZ5:
        ldr     r4, [sp, #8]
        ldr     r5, [sp, #4]
        mov     r2, r9
        mov     r0, r4
        mov     r3, r8
        mov     r1, r5
        bl      __adddf3
        ldr     r12, [sp, #0x40]
        mov     r2, r10
        str     r0, [r12, +r7, lsl #4]
        str     r1, [r6, #8]
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0x10]
        mov     r3, r11
        bl      __subdf3
        str     r0, [r6, #0xC]
        str     r1, [r6, #0x10]!
        mov     r0, r4
        mov     r1, r5
        mov     r2, r9
        mov     r3, r8
        bl      __subdf3
        ldr     lr, [sp, #0x24]
        rsb     r12, r7, #0
        str     r0, [lr, +r12, lsl #4]
        add     r4, lr, r12, lsl #4
        str     r1, [r4, #4]
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0x10]
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        ldr     r2, [sp, #0x3C]
        add     r7, r7, #1
        cmp     r7, r2
        str     r0, [r4, #8]
        str     r1, [r4, #0xC]
        blt     LCNZ3
        ldr     r8, [sp, #0x24]
        ldr     r12, [sp, #0x3C]
        ldr     r1, [sp, #0x44]
        ldr     r0, [sp, #0x48]
LCNZ6:
        ldr     r2, [sp, #0x54]
        ldr     r3, [sp, #0x4C]
        subs    r2, r2, #1
        str     r2, [sp, #0x54]
        add     r0, r0, r3, lsl #3
        add     r1, r1, r3, lsl #3
        mov     r3, r8
        bne     LCNZ0
LCNZ7:
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
LCNZ8:
        mov     r8, #0
        mov     r10, r8
        mov     r11, r10
        mov     r9, r11
        b       LCNZ5


