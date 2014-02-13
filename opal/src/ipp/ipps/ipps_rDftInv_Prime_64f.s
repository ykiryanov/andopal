        .text
        .align  4
        .globl  _ipps_rDftInv_Prime_64f


_ipps_rDftInv_Prime_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x5C
        ldr     r4, [sp, #0x80]
        ldr     r7, [sp, #0x84]
        ldr     r12, [sp, #0x88]
        mul     r5, r1, r4
        add     lr, r3, #1
        cmp     r4, #0
        mov     r6, r0
        mov     lr, lr, asr #1
        ble     LCNK9
        rsb     r8, r5, #0
        mla     r8, r3, r5, r8
        sub     r10, r3, #1
        sub     r0, lr, #1
        sub     r9, lr, #4
        add     r11, r12, #8
        str     r9, [sp, #0x50]
        str     r0, [sp, #0x44]
        str     r10, [sp, #0x40]
        str     r8, [sp, #0x3C]
        str     r5, [sp, #0x18]
        str     r7, [sp, #0x38]
        str     r4, [sp, #0x34]
        str     r3, [sp, #0x30]
        str     r1, [sp, #0x2C]
LCNK0:
        ldr     r5, [r6]
        ldr     r7, [sp, #0x18]
        cmp     lr, #1
        str     r5, [sp, #0x48]
        ldr     r4, [r6, #4]
        add     r7, r2, r7, lsl #3
        str     r7, [sp, #0x10]
        ldr     r7, [sp, #0x3C]
        str     r4, [sp, #0x4C]
        add     r7, r2, r7, lsl #3
        str     r7, [sp, #0xC]
        ble     LCNK4
        ldr     r7, [sp, #0x44]
        cmp     r7, #4
        blt     LCNK10
        sub     r0, r6, #8
        mov     r3, #0
        sub     r1, r6, #0x1C
        mov     r7, #1
        sub     r10, r12, #4
        sub     r9, r12, #0xC
        sub     r8, r0, #0x1C
        str     r3, [sp, #8]
        str     r0, [sp, #4]
        str     r1, [sp, #0x58]
        str     r4, [sp, #0x54]
        str     r5, [sp]
        str     r11, [sp, #0x14]
        str     lr, [sp, #0x1C]
        str     r12, [sp, #0x20]
        str     r2, [sp, #0x24]
LCNK1:
        ldr     r0, [r8, #0x2C]
        ldr     r1, [r8, #0x30]!
        mov     r2, #0
        mov     r3, #1, 2
        bl      __muldf3
        ldr     r2, [sp]
        ldr     r3, [sp, #0x54]
        mov     r5, r0
        mov     r4, r1
        bl      __adddf3
        str     r4, [r9, #0x10]
        str     r5, [r9, #0xC]
        ldr     r2, [sp, #0x58]
        ldr     r4, [r6, +r7, lsl #4]
        add     r11, r7, #1
        ldr     r5, [r2, #0x30]
        str     r1, [sp]
        str     r0, [sp, #0x54]
        mov     r0, r4
        mov     r1, r5
        mov     r2, #0
        mov     r3, #1, 2
        bl      __muldf3
        str     r0, [r10, #0xC]
        str     r1, [r10, #0x10]
        ldr     r1, [sp, #4]
        mov     r2, #0
        mov     r3, #1, 2
        ldr     r0, [r1, +r11, lsl #4]
        add     r1, r1, r11, lsl #4
        ldr     r1, [r1, #4]
        bl      __muldf3
        ldr     r3, [sp]
        ldr     r2, [sp, #0x54]
        mov     r4, r0
        mov     r5, r1
        bl      __adddf3
        str     r4, [r9, #0x1C]
        str     r5, [r9, #0x20]
        add     r2, r6, r11, lsl #4
        ldr     r11, [r6, +r11, lsl #4]
        ldr     r2, [r2, #4]
        str     r1, [sp]
        str     r0, [sp, #0x54]
        mov     r1, r2
        mov     r2, #0
        mov     r3, #1, 2
        mov     r0, r11
        bl      __muldf3
        str     r0, [r10, #0x1C]
        str     r1, [r10, #0x20]
        ldr     r1, [sp, #4]
        add     r11, r7, #2
        mov     r2, #0
        ldr     r0, [r1, +r11, lsl #4]
        add     r1, r1, r11, lsl #4
        ldr     r1, [r1, #4]
        mov     r3, #1, 2
        add     r7, r7, #3
        bl      __muldf3
        ldr     r2, [sp, #0x54]
        ldr     r3, [sp]
        mov     r5, r0
        mov     r4, r1
        bl      __adddf3
        str     r5, [r9, #0x2C]
        str     r4, [r9, #0x30]!
        ldr     r2, [r6, +r11, lsl #4]
        str     r1, [sp, #0x54]
        str     r0, [sp]
        add     r11, r6, r11, lsl #4
        ldr     r1, [r11, #4]
        mov     r0, r2
        mov     r2, #0
        mov     r3, #1, 2
        bl      __muldf3
        str     r1, [r10, #0x30]
        str     r0, [r10, #0x2C]
        ldr     r1, [sp, #0x50]
        add     r10, r10, #0x30
        cmp     r7, r1
        ldr     r1, [sp, #0x58]
        add     r1, r1, #0x30
        str     r1, [sp, #0x58]
        ldr     r1, [sp, #8]
        add     r1, r1, #6
        str     r1, [sp, #8]
        ble     LCNK1
        ldr     r3, [sp, #8]
        ldr     r0, [sp, #4]
        ldr     r4, [sp, #0x54]
        ldr     r5, [sp]
        ldr     r11, [sp, #0x14]
        ldr     lr, [sp, #0x1C]
        ldr     r12, [sp, #0x20]
        ldr     r2, [sp, #0x24]
LCNK2:
        mov     r8, r7, lsl #4
        mov     r3, r3, lsl #3
        sub     r9, r3, #0xC
        sub     r8, r8, #0xC
        add     r1, r9, r11
        add     r10, r8, r0
        add     r9, r9, r12
        add     r8, r8, r6
        str     r1, [sp, #8]
        str     r0, [sp, #4]
        str     r11, [sp, #0x14]
        str     lr, [sp, #0x1C]
        str     r12, [sp, #0x20]
        str     r2, [sp, #0x24]
        str     r6, [sp, #0x28]
LCNK3:
        ldr     r12, [sp, #4]
        ldr     r1, [r10, #0x10]!
        mov     r2, #0
        ldr     r0, [r12, +r7, lsl #4]
        mov     r3, #1, 2
        bl      __muldf3
        mov     r11, r0
        mov     r6, r1
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        str     r11, [r9, #0xC]
        str     r6, [r9, #0x10]!
        ldr     r12, [sp, #0x28]
        ldr     r3, [r8, #0x10]!
        mov     r5, r0
        ldr     r2, [r12, +r7, lsl #4]
        mov     r4, r1
        mov     r1, r3
        mov     r3, #1, 2
        mov     r0, r2
        mov     r2, #0
        bl      __muldf3
        ldr     r12, [sp, #8]
        add     r7, r7, #1
        str     r0, [r12, #0xC]
        str     r1, [r12, #0x10]
        ldr     r12, [sp, #0x1C]
        cmp     r7, r12
        ldr     r12, [sp, #8]
        add     r12, r12, #0x10
        str     r12, [sp, #8]
        blt     LCNK3
        ldr     r11, [sp, #0x14]
        ldr     lr, [sp, #0x1C]
        ldr     r12, [sp, #0x20]
        ldr     r2, [sp, #0x24]
        ldr     r6, [sp, #0x28]
LCNK4:
        cmp     lr, #1
        str     r5, [r2]
        str     r4, [r2, #4]
        ble     LCNK8
        str     r11, [sp, #0x14]
        ldr     r11, [sp, #0xC]
        ldr     r8, [sp, #0x10]
        ldr     r9, [sp, #0x18]
        mov     r10, #1
        str     lr, [sp, #0x1C]
        str     r12, [sp, #0x20]
        str     r2, [sp, #0x24]
        str     r6, [sp, #0x28]
LCNK5:
        ldr     r0, [sp, #0x40]
        ldr     r5, [sp, #0x48]
        ldr     r4, [sp, #0x4C]
        cmp     r0, #0
        mov     r0, r10
        movle   r7, #0
        movle   r6, r7
        ble     LCNK7
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp, #0x20]
        mov     r1, #0
        mov     r6, r1
        mov     r7, r6
        str     r11, [sp, #0xC]
        ldr     r11, [sp, #0x30]
        str     r7, [sp]
        str     r6, [sp, #4]
        str     r8, [sp, #0x10]
        str     r10, [sp, #8]
        mov     r9, r0
        mov     r8, r1
        mov     r6, r2
        mov     r7, r3
LCNK6:
        ldr     r12, [sp, #0x38]
        ldr     r0, [r7]
        ldr     r1, [r7, #4]
        add     r10, r12, r9, lsl #4
        ldr     r2, [r12, +r9, lsl #4]
        ldr     r3, [r10, #4]
        bl      __muldf3
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        ldr     r2, [r10, #8]
        ldr     r3, [r10, #0xC]
        ldr     lr, [r6]
        ldr     r12, [r6, #4]
        mov     r5, r0
        mov     r4, r1
        mov     r0, lr
        mov     r1, r12
        bl      __muldf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp]
        bl      __adddf3
        ldr     r12, [sp, #8]
        str     r0, [sp, #4]
        add     r9, r12, r9
        cmp     r9, r11
        str     r1, [sp]
        subge   r9, r9, r11
        ldr     r12, [sp, #0x40]
        add     r8, r8, #2
        add     r6, r6, #0x10
        cmp     r8, r12
        add     r7, r7, #0x10
        blt     LCNK6
        ldr     r7, [sp]
        ldr     r6, [sp, #4]
        ldr     r10, [sp, #8]
        ldr     r11, [sp, #0xC]
        ldr     r8, [sp, #0x10]
        ldr     r9, [sp, #0x18]
LCNK7:
        mov     r0, r5
        mov     r1, r4
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        str     r0, [r8]
        str     r1, [r8, #4]
        mov     r0, r5
        mov     r1, r4
        mov     r2, r6
        mov     r3, r7
        bl      __subdf3
        str     r0, [r11]
        str     r1, [r11, #4]
        ldr     r0, [sp, #0x1C]
        add     r10, r10, #1
        add     r8, r8, r9, lsl #3
        cmp     r10, r0
        sub     r11, r11, r9, lsl #3
        blt     LCNK5
        ldr     r11, [sp, #0x14]
        ldr     lr, [sp, #0x1C]
        ldr     r12, [sp, #0x20]
        ldr     r2, [sp, #0x24]
        ldr     r6, [sp, #0x28]
LCNK8:
        ldr     r3, [sp, #0x2C]
        ldr     r1, [sp, #0x34]
        add     r2, r2, r3, lsl #3
        ldr     r3, [sp, #0x30]
        subs    r1, r1, #1
        str     r1, [sp, #0x34]
        add     r6, r6, r3, lsl #3
        bne     LCNK0
LCNK9:
        add     sp, sp, #0x5C
        ldmia   sp!, {r4 - r11, pc}
LCNK10:
        mov     r7, #1
        mov     r3, #0
        sub     r0, r6, #8
        b       LCNK2


