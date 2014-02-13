        .text
        .align  4
        .globl  _ipps_crDftFwd_Fact4_64f


_ipps_crDftFwd_Fact4_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x70
        mov     r5, r0
        ldr     r12, [r5]
        mov     r7, r2
        mov     r6, r1
        str     r12, [sp, #0x34]
        ldr     lr, [r5, #4]
        mov     r4, r3
        ldr     r12, [sp, #0x94]
        str     lr, [sp, #0x30]
        ldr     r8, [r5, +r4, lsl #5]
        ldr     r0, [sp, #0x34]
        ldr     r1, [sp, #0x30]
        add     r11, r5, r4, lsl #5
        str     r11, [sp, #0x14]
        ldr     r10, [r11, #4]
        add     r12, r12, #0x30
        str     r12, [sp, #0x1C]
        rsb     r9, r4, r4, lsl #2
        mov     r2, r8
        mov     r3, r10
        bl      __adddf3
        str     r1, [sp, #0x28]
        str     r0, [sp, #0x2C]
        ldr     r12, [r5, #8]
        str     r12, [sp, #0x24]
        ldr     r12, [r5, #0xC]
        ldr     r0, [sp, #0x24]
        str     r12, [sp, #0x20]
        ldr     r12, [r11, #8]
        ldr     r1, [sp, #0x20]
        str     r12, [sp, #0x10]
        ldr     r11, [r11, #0xC]
        ldr     r2, [sp, #0x10]
        str     r11, [sp, #0xC]
        ldr     r3, [sp, #0xC]
        add     r11, r5, r9, lsl #4
        str     r11, [sp, #4]
        add     r12, r6, r4, lsl #4
        str     r12, [sp, #0x18]
        bl      __adddf3
        str     r0, [sp, #8]
        ldr     r0, [sp, #0x34]
        str     r1, [sp, #0x38]
        ldr     r1, [sp, #0x30]
        mov     r2, r8
        mov     r3, r10
        bl      __subdf3
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0xC]
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0x24]
        str     r1, [sp, #0x30]
        ldr     r1, [sp, #0x20]
        bl      __subdf3
        ldr     r12, [r5, +r4, lsl #4]
        add     r10, r5, r4, lsl #4
        str     r12, [sp, #0x24]
        ldr     r12, [r5, +r9, lsl #4]
        str     r12, [sp, #0x20]
        ldr     r12, [r11, #4]
        str     r10, [sp, #0x10]
        ldr     r2, [sp, #0x20]
        str     r12, [sp, #0xC]
        ldr     r8, [r10, #4]
        ldr     r3, [sp, #0xC]
        str     r0, [sp, #0x3C]
        ldr     r0, [sp, #0x24]
        str     r1, [sp, #0x40]
        mov     r1, r8
        bl      __adddf3
        ldr     r12, [r10, #8]
        str     r12, [sp, #0x44]
        ldr     r10, [r10, #0xC]
        str     r10, [sp, #0x48]
        ldr     r12, [r11, #8]
        str     r12, [sp, #0x4C]
        ldr     r11, [r11, #0xC]
        ldr     r2, [sp, #0x4C]
        str     r0, [sp, #0x54]
        ldr     r0, [sp, #0x44]
        str     r11, [sp, #0x50]
        str     r1, [sp, #0x58]
        ldr     r1, [sp, #0x48]
        ldr     r3, [sp, #0x50]
        bl      __adddf3
        ldr     r3, [sp, #0xC]
        ldr     r2, [sp, #0x20]
        str     r0, [sp, #0x5C]
        ldr     r0, [sp, #0x24]
        str     r1, [sp, #0x60]
        mov     r1, r8
        add     r12, r7, r4, lsl #4
        str     r12, [sp]
        bl      __subdf3
        ldr     r3, [sp, #0x50]
        ldr     r2, [sp, #0x4C]
        mov     r10, r0
        ldr     r0, [sp, #0x44]
        mov     r11, r1
        ldr     r1, [sp, #0x48]
        bl      __subdf3
        ldr     r2, [sp, #0x54]
        ldr     r3, [sp, #0x58]
        str     r0, [sp, #0x50]
        ldr     r0, [sp, #0x2C]
        mov     r8, r1
        ldr     r1, [sp, #0x28]
        bl      __adddf3
        str     r0, [r6]
        str     r1, [r6, #4]
        ldr     r0, [sp, #8]
        ldr     r2, [sp, #0x5C]
        ldr     r3, [sp, #0x60]
        ldr     r1, [sp, #0x38]
        bl      __adddf3
        str     r0, [r7]
        str     r1, [r7, #4]
        ldr     r2, [sp, #0x54]
        ldr     r3, [sp, #0x58]
        ldr     r0, [sp, #0x2C]
        ldr     r1, [sp, #0x28]
        bl      __subdf3
        str     r0, [r6, +r4, lsl #4]
        ldr     r12, [sp, #0x18]
        str     r1, [r12, #4]
        ldr     r0, [sp, #8]
        ldr     r2, [sp, #0x5C]
        ldr     r3, [sp, #0x60]
        ldr     r1, [sp, #0x38]
        bl      __subdf3
        str     r0, [r7, +r4, lsl #4]
        ldr     r12, [sp]
        mov     r3, r8
        str     r1, [r12, #4]
        ldr     r0, [sp, #0x34]
        ldr     r1, [sp, #0x30]
        ldr     r2, [sp, #0x50]
        bl      __adddf3
        str     r0, [r6, +r4, lsl #3]
        add     r12, r6, r4, lsl #3
        str     r12, [sp, #0xC]
        str     r1, [r12, #4]
        ldr     r0, [sp, #0x3C]
        ldr     r1, [sp, #0x40]
        mov     r2, r10
        mov     r3, r11
        bl      __subdf3
        str     r0, [r7, +r4, lsl #3]
        add     r12, r7, r4, lsl #3
        str     r12, [sp, #8]
        str     r1, [r12, #4]
        ldr     r0, [sp, #0x34]
        ldr     r1, [sp, #0x30]
        ldr     r2, [sp, #0x50]
        mov     r3, r8
        bl      __subdf3
        str     r0, [r6, +r9, lsl #3]
        add     r8, r6, r9, lsl #3
        str     r1, [r8, #4]
        ldr     r0, [sp, #0x3C]
        ldr     r1, [sp, #0x40]
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        str     r0, [r7, +r9, lsl #3]
        add     r10, r7, r9, lsl #3
        cmp     r4, #1
        str     r1, [r10, #4]
        ble     LCOO1
        ldr     r0, [sp, #4]
        add     r2, r8, #4
        ldr     r8, [sp, #8]
        add     r9, r5, #0xC
        add     r5, r0, #4
        ldr     r0, [sp, #0x14]
        add     r1, r8, #4
        ldr     r8, [sp, #0xC]
        add     r7, r7, #4
        add     lr, r0, #4
        ldr     r0, [sp, #0x10]
        add     r11, r8, #4
        ldr     r8, [sp]
        add     r6, r6, #4
        add     r12, r0, #4
        add     r0, r10, #4
        add     r10, r8, #4
        ldr     r8, [sp, #0x18]
        sub     r4, r4, #1
        str     r4, [sp, #0x18]
        str     r6, [sp]
        add     r8, r8, #4
        str     r7, [sp, #0x10]
        str     r8, [sp, #0xC]
        str     r10, [sp, #8]
        str     r11, [sp, #4]
        str     r1, [sp, #0x20]
        str     r2, [sp, #0x24]
        str     r0, [sp, #0x14]
        str     r12, [sp, #0x2C]
        str     lr, [sp, #0x30]
        str     r5, [sp, #0x28]
        str     r9, [sp, #0x34]
LCOO0:
        ldr     r12, [sp, #0x2C]
        ldr     r3, [sp, #0x1C]
        ldr     r9, [r12, #0xC]
        ldr     r10, [r12, #0x10]
        ldr     r8, [r12, #0x14]
        ldr     r4, [r3, #4]
        ldr     r7, [r3]
        ldr     r5, [r12, #0x18]
        ldr     r12, [sp, #0x1C]
        mov     r0, r9
        mov     r1, r10
        ldr     r6, [r12, #0xC]
        ldr     r11, [r12, #8]
        mov     r3, r4
        mov     r2, r7
        bl      __muldf3
        str     r0, [sp, #0x60]
        str     r1, [sp, #0x5C]
        mov     r3, r6
        mov     r1, r5
        mov     r0, r8
        mov     r2, r11
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0x60]
        ldr     r1, [sp, #0x5C]
        bl      __subdf3
        str     r0, [sp, #0x60]
        str     r1, [sp, #0x5C]
        mov     r1, r5
        mov     r3, r4
        mov     r0, r8
        mov     r2, r7
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        mov     r1, r10
        mov     r2, r11
        mov     r3, r6
        mov     r0, r9
        bl      __muldf3
        mov     r3, r5
        mov     r2, r4
        bl      __adddf3
        ldr     lr, [sp, #0x1C]
        ldr     r12, [sp, #0x30]
        ldr     r11, [lr, #0x18]
        ldr     r7, [lr, #0x14]
        ldr     r6, [lr, #0x10]
        ldr     r9, [r12, #0xC]
        ldr     r10, [r12, #0x10]
        ldr     r5, [lr, #0x1C]
        ldr     r8, [r12, #0x14]
        ldr     r4, [r12, #0x18]
        str     r0, [sp, #0x58]
        str     r1, [sp, #0x54]
        mov     r2, r6
        mov     r1, r10
        mov     r0, r9
        mov     r3, r7
        bl      __muldf3
        str     r0, [sp, #0x50]
        str     r1, [sp, #0x4C]
        mov     r1, r4
        mov     r2, r11
        mov     r0, r8
        mov     r3, r5
        bl      __muldf3
        mov     r3, r1
        ldr     r1, [sp, #0x4C]
        mov     r2, r0
        ldr     r0, [sp, #0x50]
        bl      __subdf3
        str     r0, [sp, #0x50]
        str     r1, [sp, #0x4C]
        mov     r1, r4
        mov     r0, r8
        mov     r3, r7
        mov     r2, r6
        bl      __muldf3
        mov     r4, r0
        mov     r6, r1
        mov     r1, r10
        mov     r3, r5
        mov     r0, r9
        mov     r2, r11
        bl      __muldf3
        mov     r2, r4
        mov     r3, r6
        bl      __adddf3
        ldr     r2, [sp, #0x28]
        ldr     r12, [sp, #0x1C]
        ldr     r10, [r2, #0x10]
        ldr     r9, [r2, #0xC]
        ldr     r5, [r12, #0x2C]
        ldr     r6, [r2, #0x14]
        ldr     r4, [r2, #0x18]
        ldr     r8, [r12, #0x20]
        ldr     r7, [r12, #0x24]
        ldr     r11, [r12, #0x28]
        str     r0, [sp, #0x48]
        str     r1, [sp, #0x44]
        mov     r3, r7
        mov     r1, r10
        mov     r0, r9
        mov     r2, r8
        bl      __muldf3
        str     r0, [sp, #0x40]
        str     r1, [sp, #0x3C]
        mov     r1, r4
        mov     r3, r5
        mov     r0, r6
        mov     r2, r11
        bl      __muldf3
        mov     r3, r1
        ldr     r1, [sp, #0x3C]
        mov     r2, r0
        ldr     r0, [sp, #0x40]
        bl      __subdf3
        str     r0, [sp, #0x40]
        str     r1, [sp, #0x3C]
        mov     r3, r7
        mov     r1, r4
        mov     r2, r8
        mov     r0, r6
        bl      __muldf3
        mov     r4, r0
        mov     r6, r1
        mov     r2, r11
        mov     r1, r10
        mov     r0, r9
        mov     r3, r5
        bl      __muldf3
        mov     r2, r4
        mov     r3, r6
        bl      __adddf3
        ldr     r12, [sp, #0x34]
        ldr     r2, [sp, #0x50]
        ldr     r3, [sp, #0x4C]
        ldr     r7, [r12, #4]
        ldr     r6, [r12, #8]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r7
        mov     r1, r6
        bl      __adddf3
        ldr     r2, [sp, #0x50]
        ldr     r3, [sp, #0x4C]
        str     r0, [sp, #0x38]
        str     r1, [sp, #0x64]
        mov     r0, r7
        mov     r1, r6
        bl      __subdf3
        ldr     r12, [sp, #0x34]
        ldr     r3, [sp, #0x44]
        ldr     r2, [sp, #0x48]
        ldr     r7, [r12, #0xC]
        ldr     r6, [r12, #0x10]
        str     r0, [sp, #0x50]
        str     r1, [sp, #0x4C]
        mov     r0, r7
        mov     r1, r6
        bl      __adddf3
        ldr     r2, [sp, #0x48]
        ldr     r3, [sp, #0x44]
        str     r0, [sp, #0x68]
        str     r1, [sp, #0x6C]
        mov     r0, r7
        mov     r1, r6
        bl      __subdf3
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x3C]
        str     r1, [sp, #0x48]
        ldr     r1, [sp, #0x5C]
        mov     r9, r0
        ldr     r0, [sp, #0x60]
        bl      __adddf3
        mov     r8, r1
        mov     r10, r0
        ldr     r0, [sp, #0x60]
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x3C]
        ldr     r1, [sp, #0x5C]
        bl      __subdf3
        str     r1, [sp, #0x60]
        ldr     r1, [sp, #0x54]
        mov     r11, r0
        ldr     r0, [sp, #0x58]
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        mov     r6, r0
        mov     r7, r1
        ldr     r0, [sp, #0x58]
        ldr     r1, [sp, #0x54]
        mov     r2, r4
        mov     r3, r5
        bl      __subdf3
        mov     r4, r0
        ldr     r0, [sp, #0x38]
        mov     r5, r1
        ldr     r1, [sp, #0x64]
        mov     r2, r10
        mov     r3, r8
        bl      __adddf3
        ldr     r12, [sp]
        mov     r2, r6
        str     r0, [r12, #4]
        str     r1, [r12, #8]
        ldr     r0, [sp, #0x68]
        ldr     r1, [sp, #0x6C]
        mov     r3, r7
        bl      __adddf3
        ldr     r12, [sp, #0x10]
        mov     r2, r10
        str     r0, [r12, #4]
        str     r1, [r12, #8]
        ldr     r0, [sp, #0x38]
        ldr     r1, [sp, #0x64]
        mov     r3, r8
        bl      __subdf3
        ldr     r12, [sp, #0xC]
        mov     r2, r6
        str     r0, [r12, #4]
        str     r1, [r12, #8]
        ldr     r0, [sp, #0x68]
        ldr     r1, [sp, #0x6C]
        mov     r3, r7
        bl      __subdf3
        ldr     r12, [sp, #8]
        mov     r2, r4
        str     r0, [r12, #4]
        str     r1, [r12, #8]
        ldr     r0, [sp, #0x50]
        ldr     r1, [sp, #0x4C]
        mov     r3, r5
        bl      __adddf3
        ldr     r12, [sp, #4]
        mov     r2, r11
        str     r1, [r12, #8]
        str     r0, [r12, #4]
        ldr     r1, [sp, #0x48]
        ldr     r3, [sp, #0x60]
        mov     r0, r9
        bl      __subdf3
        ldr     r12, [sp, #0x20]
        mov     r2, r4
        str     r0, [r12, #4]
        str     r1, [r12, #8]
        ldr     r0, [sp, #0x50]
        ldr     r1, [sp, #0x4C]
        mov     r3, r5
        bl      __subdf3
        ldr     r3, [sp, #0x24]
        mov     r2, r11
        str     r1, [r3, #8]
        str     r0, [r3, #4]
        ldr     r1, [sp, #0x48]
        ldr     r3, [sp, #0x60]
        mov     r0, r9
        bl      __adddf3
        ldr     r2, [sp, #0x14]
        str     r1, [r2, #8]
        str     r0, [r2, #4]
        ldr     r0, [sp, #0x18]
        add     r2, r2, #8
        str     r2, [sp, #0x14]
        subs    r0, r0, #1
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x1C]
        add     r0, r0, #0x30
        str     r0, [sp, #0x1C]
        ldr     r0, [sp, #0x34]
        add     r0, r0, #0x10
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0x28]
        add     r0, r0, #0x10
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x30]
        add     r0, r0, #0x10
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x2C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x24]
        add     r0, r0, #8
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x20]
        add     r0, r0, #8
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #4]
        add     r0, r0, #8
        str     r0, [sp, #4]
        ldr     r0, [sp, #8]
        add     r0, r0, #8
        str     r0, [sp, #8]
        ldr     r0, [sp, #0xC]
        add     r0, r0, #8
        str     r0, [sp, #0xC]
        ldr     r0, [sp, #0x10]
        add     r0, r0, #8
        str     r0, [sp, #0x10]
        ldr     r0, [sp]
        add     r0, r0, #8
        str     r0, [sp]
        ldr     r0, [sp, #0x18]
        bne     LCOO0
LCOO1:
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}


