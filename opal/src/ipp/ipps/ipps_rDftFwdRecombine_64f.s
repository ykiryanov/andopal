        .text
        .align  4
        .globl  _ipps_rDftFwdRecombine_64f


_ipps_rDftFwdRecombine_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x4C
        mov     r8, r0
        ldr     r4, [r8]
        ldr     r6, [r8, #4]
        ldr     r5, [r8, #8]
        ldr     r7, [r8, #0xC]
        str     r2, [sp]
        mov     r9, r1
        mov     r0, r4
        mov     r1, r6
        mov     r2, r5
        mov     r3, r7
        bl      __adddf3
        mov     r11, r0
        mov     r10, r1
        mov     r0, r4
        mov     r1, r6
        mov     r2, r5
        mov     r3, r7
        bl      __subdf3
        cmp     r9, #1
        str     r11, [r8]
        str     r10, [r8, #4]
        str     r0, [r8, #8]
        str     r1, [r8, #0xC]
        add     r2, r8, #8
        beq     LCNH2
        mov     r3, r9, lsl #1
        cmp     r9, #2
        sub     r3, r3, #2
        ble     LCNH1
        ldr     r12, [sp]
        mov     r3, r3, lsl #3
        add     r3, r3, #0x14
        add     r5, r3, r2
        add     r4, r3, r8
        add     r3, r12, #0xC
        mov     r2, #2
        add     r12, r12, #4
        add     r7, r8, #0xC
        add     r6, r8, #4
        str     r12, [sp]
        str     r3, [sp, #0x10]
        str     r2, [sp, #0xC]
        str     r9, [sp, #8]
        str     r8, [sp, #4]
LCNH0:
        ldr     r0, [r6, #0xC]
        str     r0, [sp, #0x14]
        ldr     r0, [r6, #0x10]
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0xC]
        ldr     r1, [sp, #0x18]
        add     r0, r0, #2
        str     r0, [sp, #0xC]
        ldr     r2, [r4, #-0x14]
        str     r2, [sp, #0x1C]
        ldr     r0, [r4, #-0x10]
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x14]
        ldr     r3, [sp, #0x20]
        bl      __subdf3
        ldr     r2, [r7, #0xC]
        mov     r8, r0
        mov     r9, r1
        str     r2, [sp, #0x24]
        ldr     r2, [r7, #0x10]
        ldr     r0, [sp, #0x24]
        str     r2, [sp, #0x28]
        ldr     r2, [r5, #-0x14]
        ldr     r1, [sp, #0x28]
        str     r2, [sp, #0x2C]
        ldr     r2, [r5, #-0x10]
        str     r2, [sp, #0x30]
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x30]
        bl      __adddf3
        ldr     r3, [sp, #0x10]
        ldr     r2, [r3, #0xC]
        str     r2, [sp, #0x34]
        ldr     r3, [r3, #0x10]
        ldr     r2, [sp, #0x34]
        str     r3, [sp, #0x38]
        ldr     r3, [sp]
        ldr     r11, [r3, #0xC]
        ldr     r10, [r3, #0x10]
        ldr     r3, [sp, #0x38]
        str     r0, [sp, #0x3C]
        str     r1, [sp, #0x40]
        mov     r0, r8
        mov     r1, r9
        bl      __muldf3
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0x3C]
        str     r1, [sp, #0x48]
        ldr     r1, [sp, #0x40]
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x44]
        ldr     r3, [sp, #0x48]
        bl      __adddf3
        ldr     r2, [sp, #0x34]
        str     r0, [sp, #0x48]
        ldr     r0, [sp, #0x3C]
        str     r1, [sp, #0x44]
        ldr     r1, [sp, #0x40]
        ldr     r3, [sp, #0x38]
        bl      __muldf3
        str     r0, [sp, #0x40]
        str     r1, [sp, #0x3C]
        mov     r0, r8
        mov     r1, r9
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x40]
        mov     r3, r1
        ldr     r1, [sp, #0x3C]
        bl      __subdf3
        ldr     r2, [sp, #0x48]
        ldr     r3, [sp, #0x44]
        mov     r8, r0
        ldr     r0, [sp, #0x14]
        mov     r9, r1
        ldr     r1, [sp, #0x18]
        bl      __subdf3
        ldr     r2, [sp, #0x48]
        ldr     r3, [sp, #0x44]
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x1C]
        str     r1, [sp, #0x3C]
        ldr     r1, [sp, #0x20]
        bl      __adddf3
        ldr     r2, [sp, #0x24]
        ldr     r3, [sp, #0x28]
        str     r0, [sp, #0x48]
        str     r1, [sp, #0x44]
        mov     r0, r8
        mov     r1, r9
        bl      __subdf3
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x30]
        mov     r10, r0
        mov     r11, r1
        mov     r0, r8
        mov     r1, r9
        bl      __subdf3
        ldr     r2, [sp, #0x48]
        str     r2, [r6, #0xC]
        ldr     r2, [sp, #0x44]
        str     r2, [r6, #0x10]!
        ldr     r2, [sp, #0x40]
        str     r2, [r4, #-0x14]
        ldr     r2, [sp, #0x3C]
        str     r2, [r4, #-0x10]!
        str     r0, [r7, #0xC]
        str     r1, [r7, #0x10]!
        str     r10, [r5, #-0x14]
        str     r11, [r5, #-0x10]!
        ldr     r0, [sp, #0xC]
        ldr     r1, [sp, #8]
        cmp     r0, r1
        ldr     r0, [sp, #0x10]
        add     r0, r0, #0x10
        str     r0, [sp, #0x10]
        ldr     r0, [sp]
        add     r0, r0, #0x10
        str     r0, [sp]
        blt     LCNH0
        ldr     r9, [sp, #8]
        ldr     r8, [sp, #4]
LCNH1:
        tst     r9, #1
        bne     LCNH2
        mov     r9, r9, lsl #3
        add     r2, r9, #8
        add     r1, r8, r2
        ldr     r3, [r1, #4]
        ldr     r12, [r2, +r8]
        eor     r3, r3, #2, 2
        str     r12, [r2, +r8]
        str     r3, [r1, #4]
LCNH2:
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}


