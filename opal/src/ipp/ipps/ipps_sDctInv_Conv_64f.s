        .text
        .align  4
        .globl  _ipps_sDctInv_Conv_64f


_ipps_sDctInv_Conv_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x54
        mov     r10, r0
        ldr     r12, [r10, #0x3C]
        ldr     r9, [r10, #4]
        mov     r4, r1
        str     r12, [sp, #0x24]
        ldr     r12, [r10, #0x48]
        cmp     r9, #0
        str     r2, [sp, #0x20]
        mov     r8, r3
        addle   r5, r8, #8
        ble     LCTQ3
        cmp     r9, #4
        mov     r0, #0
        addlt   r5, r8, #8
        addlt   r1, r12, #8
        blt     LCTQ1
        sub     r11, r9, #4
        add     r1, r12, #8
        sub     r2, r4, #0x14
        sub     r3, r8, #0x2C
        sub     lr, r8, #0x24
        str     r11, [sp, #0x14]
        str     r9, [sp, #0x10]
        add     r5, r8, #8
        sub     r6, r12, #0x2C
        sub     r7, r12, #0x24
        str     r1, [sp, #8]
        str     lr, [sp, #4]
        str     r3, [sp, #0x28]
        str     r12, [sp, #0xC]
        str     r10, [sp, #0x1C]
        mov     r11, r0
        mov     r9, r2
LCTQ0:
        ldr     r2, [r6, #0x2C]
        ldr     r3, [r6, #0x30]!
        ldr     r0, [r9, #0x14]
        ldr     r1, [r9, #0x18]
        bl      __muldf3
        ldr     r12, [sp, #0x28]
        add     r10, r11, #1
        str     r0, [r12, #0x2C]
        str     r1, [r12, #0x30]
        ldr     r0, [r9, #0x14]
        ldr     r1, [r9, #0x18]!
        ldr     r2, [r7, #0x2C]
        ldr     r3, [r7, #0x30]!
        bl      __muldf3
        ldr     r12, [sp, #4]
        str     r0, [r12, #0x2C]
        str     r1, [r12, #0x30]
        add     r12, r4, r10, lsl #3
        str     r12, [sp, #0x2C]
        ldr     r0, [r4, +r10, lsl #3]
        ldr     r1, [r12, #4]
        ldr     lr, [sp, #0xC]
        add     r12, lr, r10, lsl #4
        ldr     r3, [r12, #4]
        ldr     r2, [lr, +r10, lsl #4]
        bl      __muldf3
        str     r0, [r8, +r10, lsl #4]
        add     r12, r8, r10, lsl #4
        str     r1, [r12, #4]
        ldr     r12, [sp, #0x2C]
        ldr     lr, [sp, #8]
        ldr     r0, [r4, +r10, lsl #3]
        ldr     r1, [r12, #4]
        add     r12, lr, r10, lsl #4
        ldr     r2, [lr, +r10, lsl #4]
        ldr     r3, [r12, #4]
        bl      __muldf3
        str     r0, [r5, +r10, lsl #4]
        add     r10, r5, r10, lsl #4
        str     r1, [r10, #4]
        add     r10, r11, #2
        ldr     r0, [r4, +r10, lsl #3]
        add     r12, r4, r10, lsl #3
        str     r12, [sp, #0x2C]
        ldr     lr, [sp, #0xC]
        ldr     r1, [r12, #4]
        add     r12, lr, r10, lsl #4
        ldr     r2, [lr, +r10, lsl #4]
        ldr     r3, [r12, #4]
        add     r11, r11, #3
        bl      __muldf3
        str     r0, [r8, +r10, lsl #4]
        add     r12, r8, r10, lsl #4
        str     r1, [r12, #4]
        ldr     r12, [sp, #0x2C]
        ldr     lr, [sp, #8]
        ldr     r0, [r4, +r10, lsl #3]
        ldr     r1, [r12, #4]
        add     r12, lr, r10, lsl #4
        ldr     r2, [lr, +r10, lsl #4]
        ldr     r3, [r12, #4]
        bl      __muldf3
        str     r0, [r5, +r10, lsl #4]
        ldr     r12, [sp, #0x14]
        add     r10, r5, r10, lsl #4
        str     r1, [r10, #4]
        cmp     r11, r12
        ldr     r12, [sp, #0x28]
        add     r12, r12, #0x30
        str     r12, [sp, #0x28]
        ldr     r12, [sp, #4]
        add     r12, r12, #0x30
        str     r12, [sp, #4]
        ble     LCTQ0
        mov     r0, r11
        ldr     r1, [sp, #8]
        ldr     r12, [sp, #0xC]
        ldr     r9, [sp, #0x10]
        ldr     r10, [sp, #0x1C]
LCTQ1:
        mov     lr, r0, lsl #4
        sub     lr, lr, #0xC
        add     r6, lr, r12
        mov     r12, r0, lsl #3
        sub     r12, r12, #4
        add     r2, r12, r4
        add     r7, lr, r8
        str     r9, [sp, #0x10]
        str     r8, [sp, #0x18]
        str     r10, [sp, #0x1C]
        add     r11, lr, r5
        add     r4, lr, r1
        mov     r8, r0
        mov     r10, r1
        mov     r9, r2
LCTQ2:
        ldr     r0, [r9, #4]
        ldr     r1, [r9, #8]
        ldr     r2, [r6, #0xC]
        ldr     r3, [r6, #0x10]!
        bl      __muldf3
        str     r0, [r7, #0xC]
        str     r1, [r7, #0x10]!
        ldr     r2, [r10, +r8, lsl #4]
        ldr     r0, [r9, #4]
        ldr     r1, [r9, #8]!
        ldr     r3, [r4, #0x10]!
        bl      __muldf3
        str     r0, [r5, +r8, lsl #4]
        str     r1, [r11, #0x10]!
        ldr     r3, [sp, #0x10]
        add     r8, r8, #1
        cmp     r8, r3
        blt     LCTQ2
        ldr     r9, [sp, #0x10]
        ldr     r8, [sp, #0x18]
        ldr     r10, [sp, #0x1C]
LCTQ3:
        ldr     r12, [r10, #0x4C]
        ldr     r4, [r8]
        ldr     r11, [r8, #4]
        ldr     r6, [r8, #0xC]
        ldr     r7, [r8, #8]
        str     r12, [sp, #0xC]
        mov     r3, r11
        mov     r1, r6
        mov     r0, r7
        mov     r2, r4
        bl      __adddf3
        str     r0, [sp, #0x2C]
        str     r1, [sp, #0x28]
        mov     r1, r11
        mov     r0, r4
        mov     r2, r7
        mov     r3, r6
        bl      __subdf3
        ldr     r12, [sp, #0x2C]
        str     r12, [r8]
        ldr     r12, [sp, #0x28]
        str     r1, [r8, #0xC]
        mov     r11, r9, lsl #1
        cmp     r9, #2
        str     r12, [r8, #4]
        str     r0, [r8, #8]
        sub     r1, r11, #2
        ble     LCTQ5
        ldr     lr, [sp, #0xC]
        mov     r12, r1, lsl #3
        add     r12, r12, #0x14
        add     r7, r12, r5
        add     r4, r12, r8
        add     r12, lr, #0xC
        mov     r0, #2
        add     lr, lr, #4
        add     r2, r5, #4
        str     r11, [sp, #0x14]
        str     r10, [sp, #0x1C]
        add     r6, r8, #4
        str     r2, [sp, #0xC]
        str     lr, [sp, #8]
        str     r12, [sp, #4]
        str     r5, [sp]
        str     r9, [sp, #0x10]
        str     r8, [sp, #0x18]
        mov     r11, r0
        mov     r10, r1
LCTQ4:
        ldr     r2, [r6, #0xC]
        str     r2, [sp, #0x2C]
        ldr     r2, [r6, #0x10]
        ldr     r0, [sp, #0x2C]
        str     r2, [sp, #0x28]
        ldr     r2, [r4, #-0x14]
        ldr     r1, [sp, #0x28]
        str     r2, [sp, #0x30]
        ldr     r3, [r4, #-0x10]
        str     r3, [sp, #0x34]
        ldr     r3, [sp, #0x34]
        bl      __subdf3
        ldr     r2, [sp]
        ldr     r2, [r2, +r11, lsl #3]
        str     r2, [sp, #0x38]
        ldr     r2, [sp, #0xC]
        ldr     r9, [r7, #-0x10]
        ldr     r8, [r2, #0x10]
        ldr     r2, [sp]
        mov     r3, r9
        ldr     r5, [r2, +r10, lsl #3]
        str     r0, [sp, #0x3C]
        ldr     r0, [sp, #0x38]
        str     r1, [sp, #0x40]
        mov     r2, r5
        mov     r1, r8
        bl      __adddf3
        ldr     r2, [sp, #0x30]
        ldr     r3, [sp, #0x34]
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0x2C]
        str     r1, [sp, #0x48]
        ldr     r1, [sp, #0x28]
        bl      __adddf3
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0x38]
        str     r1, [sp, #0x30]
        mov     r3, r9
        mov     r2, r5
        mov     r1, r8
        bl      __subdf3
        ldr     r3, [sp, #4]
        ldr     r12, [sp, #8]
        ldr     r8, [r3, #0x10]
        ldr     r9, [r3, #0xC]
        ldr     lr, [r12, #0xC]
        mov     r2, r9
        mov     r3, r8
        str     lr, [sp, #0x38]
        ldr     r5, [r12, #0x10]
        str     r1, [sp, #0x28]
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x3C]
        ldr     r1, [sp, #0x40]
        bl      __muldf3
        ldr     r2, [sp, #0x38]
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0x44]
        str     r1, [sp, #0x50]
        ldr     r1, [sp, #0x48]
        mov     r3, r5
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0x4C]
        ldr     r1, [sp, #0x50]
        bl      __subdf3
        ldr     r2, [sp, #0x38]
        str     r0, [sp, #0x50]
        ldr     r0, [sp, #0x3C]
        str     r1, [sp, #0x4C]
        ldr     r1, [sp, #0x40]
        mov     r3, r5
        bl      __muldf3
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x44]
        str     r1, [sp, #0x3C]
        ldr     r1, [sp, #0x48]
        mov     r3, r8
        mov     r2, r9
        bl      __muldf3
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x3C]
        bl      __adddf3
        mov     r5, r0
        mov     r8, r1
        ldr     r0, [sp, #0x34]
        ldr     r1, [sp, #0x30]
        ldr     r2, [sp, #0x50]
        ldr     r3, [sp, #0x4C]
        bl      __adddf3
        ldr     r2, [sp, #0x50]
        ldr     r3, [sp, #0x4C]
        str     r1, [sp, #0x44]
        ldr     r1, [sp, #0x30]
        str     r0, [sp, #0x48]
        ldr     r0, [sp, #0x34]
        bl      __subdf3
        str     r0, [sp, #0x50]
        ldr     r0, [sp, #0x2C]
        str     r1, [sp, #0x4C]
        ldr     r1, [sp, #0x28]
        mov     r2, r5
        mov     r3, r8
        bl      __adddf3
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x28]
        str     r0, [sp, #0x40]
        mov     r9, r1
        mov     r0, r5
        mov     r1, r8
        bl      __subdf3
        ldr     r2, [sp, #0x48]
        str     r2, [r4, #-0x14]
        ldr     r2, [sp, #0x44]
        str     r2, [r4, #-0x10]!
        ldr     r2, [sp]
        ldr     r3, [sp, #0x40]
        str     r3, [r2, +r10, lsl #3]
        str     r9, [r7, #-0x10]!
        ldr     r2, [sp, #0x50]
        sub     r10, r10, #2
        str     r2, [r6, #0xC]
        ldr     r2, [sp, #0x4C]
        str     r2, [r6, #0x10]!
        ldr     r2, [sp]
        str     r0, [r2, +r11, lsl #3]
        ldr     r2, [sp, #0xC]
        add     r11, r11, #2
        str     r1, [r2, #0x10]
        ldr     r2, [sp, #0x10]
        cmp     r11, r2
        ldr     r2, [sp, #4]
        add     r2, r2, #0x10
        str     r2, [sp, #4]
        ldr     r2, [sp, #8]
        add     r2, r2, #0x10
        str     r2, [sp, #8]
        ldr     r2, [sp, #0xC]
        add     r2, r2, #0x10
        str     r2, [sp, #0xC]
        blt     LCTQ4
        ldr     r5, [sp]
        ldr     r11, [sp, #0x14]
        ldr     r9, [sp, #0x10]
        ldr     r8, [sp, #0x18]
        ldr     r10, [sp, #0x1C]
LCTQ5:
        tst     r9, #1
        bne     LCTQ6
        add     r4, r8, r9, lsl #3
        ldr     r1, [r4, #4]
        ldr     r0, [r8, +r9, lsl #3]
        mov     r2, #0
        mov     r3, #1, 2
        bl      __muldf3
        str     r0, [r8, +r9, lsl #3]
        str     r1, [r4, #4]
        add     r4, r5, r9, lsl #3
        ldr     r0, [r5, +r9, lsl #3]
        ldr     r1, [r4, #4]
        mov     r2, #0
        mov     r3, #3, 2
        bl      __muldf3
        str     r0, [r5, +r9, lsl #3]
        str     r1, [r4, #4]
LCTQ6:
        ldr     r0, [r10, #0x50]
        mov     r3, r9
        mov     r2, r8
        mov     r1, r8
        bl      _ipps_cbMpy3_64fc
        ldr     r4, [sp, #0x24]
        add     r0, r8, r9, lsl #4
        rsb     r1, r11, r4, lsl #1
        bl      _ippsZero_64f
        ldr     r2, [r10, #0x5C]
        add     r4, r8, r4, lsl #4
        mov     r0, r8
        mov     r3, r4
        mov     r1, r8
        bl      _ippsFFTFwd_CToC_64fc
        cmp     r0, #0
        addne   sp, sp, #0x54
        ldmneia sp!, {r4 - r11, pc}
        ldr     r3, [sp, #0x24]
        ldr     r0, [r10, #0x54]
        mov     r2, r8
        mov     r1, r8
        bl      _ipps_cbMpy3_64fc
        ldr     r2, [r10, #0x5C]
        mov     r3, r4
        mov     r0, r8
        mov     r1, r8
        bl      _ippsFFTInv_CToC_64fc
        cmp     r0, #0
        addne   sp, sp, #0x54
        ldmneia sp!, {r4 - r11, pc}
        ldr     r0, [r10, #0x50]
        mov     r3, r9
        mov     r2, r8
        mov     r1, r8
        bl      _ipps_cbMpy3_64fc
        ldr     r1, [sp, #0x20]
        mov     r0, r8
        mov     r2, r9
        bl      _ippsCopy_64f
        mov     r0, #0
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}


