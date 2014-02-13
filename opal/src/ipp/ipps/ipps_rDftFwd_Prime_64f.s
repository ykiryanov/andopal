        .text
        .align  4
        .globl  _ipps_rDftFwd_Prime_64f


_ipps_rDftFwd_Prime_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x4C
        ldr     r8, [sp, #0x70]
        mov     r4, r1
        ldr     r6, [sp, #0x74]
        mul     lr, r4, r8
        ldr     r5, [sp, #0x78]
        add     r12, r3, #1
        cmp     r8, #0
        mov     r1, r0
        mov     r12, r12, asr #1
        ble     LCNR7
        rsb     r7, lr, #0
        mla     r9, r3, lr, r7
        sub     r10, r3, #1
        add     r7, r5, #8
        str     r7, [sp, #0x44]
        str     r10, [sp, #0x40]
        str     lr, [sp, #0x48]
        str     r5, [sp, #0x3C]
        str     r6, [sp, #0x38]
        str     r3, [sp, #0x34]
        str     r4, [sp, #0x30]
LCNR0:
        ldr     r4, [sp, #0x48]
        ldr     lr, [r1]
        ldr     r3, [r1, #4]
        add     r10, r1, r4, lsl #3
        cmp     r12, #1
        add     r11, r1, r9, lsl #3
        mov     r5, lr
        mov     r4, r3
        ble     LCNR2
        ldr     r6, [sp, #0x3C]
        sub     r7, r12, #1
        str     r3, [sp, #0x14]
        sub     r0, r6, #4
        sub     r6, r6, #0xC
        str     r0, [sp, #0x10]
        str     lr, [sp, #0x18]
        str     r9, [sp, #0x1C]
        str     r12, [sp, #0x20]
        str     r8, [sp, #0x24]
        str     r2, [sp, #0x28]
        str     r1, [sp, #0x2C]
LCNR1:
        ldr     r0, [r10]
        ldr     r1, [r10, #4]
        ldr     r2, [r11]
        ldr     r3, [r11, #4]
        bl      __adddf3
        mov     r8, r0
        mov     r9, r1
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        str     r8, [r6, #0xC]
        str     r9, [r6, #0x10]!
        ldr     r2, [r10]
        ldr     r3, [r11, #4]
        ldr     r8, [r10, #4]
        ldr     r9, [r11]
        mov     r5, r0
        mov     r0, r2
        mov     r4, r1
        mov     r1, r8
        mov     r2, r9
        bl      __subdf3
        ldr     r12, [sp, #0x10]
        subs    r7, r7, #1
        str     r0, [r12, #0xC]
        str     r1, [r12, #0x10]
        ldr     r12, [sp, #0x48]
        add     r10, r10, r12, lsl #3
        sub     r11, r11, r12, lsl #3
        ldr     r12, [sp, #0x10]
        add     r12, r12, #0x10
        str     r12, [sp, #0x10]
        bne     LCNR1
        ldr     r3, [sp, #0x14]
        ldr     lr, [sp, #0x18]
        ldr     r9, [sp, #0x1C]
        ldr     r12, [sp, #0x20]
        ldr     r8, [sp, #0x24]
        ldr     r2, [sp, #0x28]
        ldr     r1, [sp, #0x2C]
LCNR2:
        cmp     r12, #1
        str     r5, [r2]
        str     r4, [r2, #4]
        ble     LCNR6
        sub     r4, r2, #8
        mov     r0, #1
        add     r10, r4, #4
        add     r11, r2, #4
        str     r3, [sp, #0x14]
        str     r9, [sp, #0x1C]
        str     r8, [sp, #0x24]
        str     r1, [sp, #0x2C]
LCNR3:
        ldr     r1, [sp, #0x40]
        ldr     r4, [sp, #0x14]
        mov     r5, lr
        cmp     r1, #0
        mov     r9, r0
        movle   r3, #0
        movle   r1, r3
        ble     LCNR5
        ldr     r6, [sp, #0x44]
        ldr     r7, [sp, #0x3C]
        mov     r8, #0
        str     r11, [sp, #0xC]
        ldr     r11, [sp, #0x34]
        mov     r1, r8
        mov     r3, r1
        str     r3, [sp]
        str     r1, [sp, #4]
        str     r10, [sp, #0x10]
        str     r0, [sp, #8]
        str     lr, [sp, #0x18]
        str     r12, [sp, #0x20]
        str     r2, [sp, #0x28]
LCNR4:
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
        blt     LCNR4
        ldr     r3, [sp]
        ldr     r1, [sp, #4]
        ldr     r11, [sp, #0xC]
        ldr     r10, [sp, #0x10]
        ldr     r0, [sp, #8]
        ldr     lr, [sp, #0x18]
        ldr     r12, [sp, #0x20]
        ldr     r2, [sp, #0x28]
LCNR5:
        str     r5, [r10, #0xC]
        str     r4, [r10, #0x10]!
        str     r1, [r2, +r0, lsl #4]
        add     r0, r0, #1
        str     r3, [r11, #0x10]!
        cmp     r0, r12
        blt     LCNR3
        ldr     r9, [sp, #0x1C]
        ldr     r8, [sp, #0x24]
        ldr     r1, [sp, #0x2C]
LCNR6:
        ldr     r3, [sp, #0x30]
        subs    r8, r8, #1
        add     r1, r1, r3, lsl #3
        ldr     r3, [sp, #0x34]
        add     r2, r2, r3, lsl #3
        bne     LCNR0
LCNR7:
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}


