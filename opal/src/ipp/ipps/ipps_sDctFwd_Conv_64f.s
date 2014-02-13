        .text
        .align  4
        .globl  _ipps_sDctFwd_Conv_64f


_ipps_sDctFwd_Conv_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x5C
        mov     r7, r0
        ldr     r6, [r7, #4]
        ldr     r0, [r7, #0x50]
        ldr     r8, [r7, #0x3C]
        mov     r4, r3
        mov     r9, r1
        mov     r3, r6, asr #1
        mov     r5, r2
        mov     r2, r4
        bl      _ipps_cbMpy3_64fc
        ands    r11, r6, #1
        beq     LCTR0
        ldr     r12, [r7, #0x50]
        sub     r9, r9, #8
        add     lr, r9, r6, lsl #3
        str     lr, [sp, #0x24]
        ldr     r1, [lr, #4]
        bic     r10, r6, #1
        ldr     r0, [r9, +r6, lsl #3]
        ldr     r2, [r12, +r10, lsl #3]
        add     lr, r12, r10, lsl #3
        ldr     r3, [lr, #4]
        bl      __muldf3
        str     r0, [r4, +r10, lsl #3]
        add     r12, r4, r10, lsl #3
        str     r12, [sp, #0x10]
        str     r1, [r12, #4]
        ldr     r12, [sp, #0x24]
        ldr     r0, [r9, +r6, lsl #3]
        ldr     r1, [r12, #4]
        ldr     r12, [r7, #0x50]
        add     r10, r12, r10, lsl #3
        ldr     r2, [r10, #8]
        ldr     r3, [r10, #0xC]
        bl      __muldf3
        ldr     r12, [sp, #0x10]
        str     r0, [r12, #8]
        str     r1, [r12, #0xC]
LCTR0:
        rsb     r12, r11, #0
        sub     r12, r12, r6
        add     lr, r4, r6, lsl #3
        add     r0, lr, r11, lsl #3
        add     r1, r12, r8, lsl #1
        bl      _ippsZero_64f
        ldr     r2, [r7, #0x5C]
        add     r9, r4, r8, lsl #4
        mov     r0, r4
        mov     r3, r9
        mov     r1, r4
        bl      _ippsFFTFwd_CToC_64fc
        cmp     r0, #0
        addne   sp, sp, #0x5C
        ldmneia sp!, {r4 - r11, pc}
        ldr     r0, [r7, #0x54]
        mov     r3, r8
        mov     r2, r4
        mov     r1, r4
        bl      _ipps_cbMpy3_64fc
        ldr     r2, [r7, #0x5C]
        mov     r3, r9
        mov     r0, r4
        mov     r1, r4
        bl      _ippsFFTInv_CToC_64fc
        cmp     r0, #0
        addne   sp, sp, #0x5C
        ldmneia sp!, {r4 - r11, pc}
        ldr     r0, [r7, #0x50]
        mov     r1, r4
        mov     r3, r6
        mov     r2, r4
        bl      _ipps_cbMpy3_64fc
        ldr     r12, [r4, #0xC]
        ldr     r9, [r4, #8]
        str     r12, [sp, #0x24]
        ldr     r12, [r7, #0x4C]
        ldr     r10, [r4]
        ldr     r8, [r4, #4]
        ldr     r1, [sp, #0x24]
        str     r12, [sp]
        mov     r0, r9
        mov     r2, r10
        mov     r3, r8
        bl      __adddf3
        ldr     r3, [sp, #0x24]
        str     r0, [sp, #0x10]
        str     r1, [sp, #8]
        mov     r0, r10
        mov     r1, r8
        mov     r2, r9
        bl      __subdf3
        ldr     r12, [sp, #0x10]
        str     r12, [r4]
        ldr     r12, [sp, #8]
        str     r0, [r4, #8]
        str     r1, [r4, #0xC]
        str     r12, [r4, #4]
        mov     r12, r6, lsl #1
        cmp     r6, #2
        sub     r12, r12, #2
        add     r0, r4, #8
        ble     LCTR2
        ldr     r9, [sp]
        mov     r12, r12, lsl #3
        add     lr, r12, #0x14
        add     r1, lr, r0
        add     r8, lr, r4
        add     lr, r9, #0xC
        add     r2, r9, #4
        mov     r12, #2
        str     r11, [sp, #0x14]
        add     r10, r4, #0xC
        add     r9, r4, #4
        str     r2, [sp]
        str     lr, [sp, #4]
        str     r12, [sp, #8]
        str     r0, [sp, #0x10]
        str     r6, [sp, #0xC]
        str     r4, [sp, #0x18]
        str     r5, [sp, #0x1C]
        str     r7, [sp, #0x20]
        mov     r11, r1
LCTR1:
        ldr     r0, [sp, #8]
        add     r0, r0, #2
        str     r0, [sp, #8]
        ldr     r0, [r9, #0xC]
        str     r0, [sp, #0x24]
        ldr     r0, [r9, #0x10]
        str     r0, [sp, #0x28]
        ldr     r2, [r8, #-0x14]
        ldr     r1, [sp, #0x28]
        str     r2, [sp, #0x2C]
        ldr     r0, [r8, #-0x10]
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x24]
        ldr     r3, [sp, #0x30]
        bl      __subdf3
        ldr     r2, [r10, #0xC]
        mov     r4, r0
        mov     r5, r1
        str     r2, [sp, #0x34]
        ldr     r2, [r10, #0x10]
        ldr     r0, [sp, #0x34]
        str     r2, [sp, #0x38]
        ldr     r2, [r11, #-0x14]
        ldr     r1, [sp, #0x38]
        str     r2, [sp, #0x3C]
        ldr     r2, [r11, #-0x10]
        str     r2, [sp, #0x40]
        ldr     r2, [sp, #0x3C]
        ldr     r3, [sp, #0x40]
        bl      __adddf3
        ldr     r2, [sp, #4]
        ldr     r3, [r2, #0xC]
        str     r3, [sp, #0x44]
        ldr     r2, [r2, #0x10]
        ldr     r3, [sp]
        str     r2, [sp, #0x48]
        ldr     r2, [sp, #0x44]
        ldr     r7, [r3, #0xC]
        ldr     r6, [r3, #0x10]
        ldr     r3, [sp, #0x48]
        str     r0, [sp, #0x4C]
        str     r1, [sp, #0x50]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        str     r0, [sp, #0x54]
        ldr     r0, [sp, #0x4C]
        str     r1, [sp, #0x58]
        ldr     r1, [sp, #0x50]
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        ldr     r2, [sp, #0x54]
        ldr     r3, [sp, #0x58]
        bl      __adddf3
        ldr     r2, [sp, #0x44]
        ldr     r3, [sp, #0x48]
        str     r0, [sp, #0x58]
        ldr     r0, [sp, #0x4C]
        str     r1, [sp, #0x54]
        ldr     r1, [sp, #0x50]
        bl      __muldf3
        str     r0, [sp, #0x50]
        str     r1, [sp, #0x4C]
        mov     r2, r7
        mov     r3, r6
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x50]
        mov     r3, r1
        ldr     r1, [sp, #0x4C]
        bl      __subdf3
        mov     r5, r0
        mov     r4, r1
        ldr     r0, [sp, #0x24]
        ldr     r1, [sp, #0x28]
        ldr     r2, [sp, #0x58]
        ldr     r3, [sp, #0x54]
        bl      __subdf3
        ldr     r2, [sp, #0x58]
        ldr     r3, [sp, #0x54]
        str     r0, [sp, #0x50]
        str     r1, [sp, #0x4C]
        ldr     r0, [sp, #0x2C]
        ldr     r1, [sp, #0x30]
        bl      __adddf3
        ldr     r2, [sp, #0x34]
        ldr     r3, [sp, #0x38]
        str     r0, [sp, #0x58]
        str     r1, [sp, #0x54]
        mov     r0, r5
        mov     r1, r4
        bl      __subdf3
        ldr     r2, [sp, #0x3C]
        ldr     r3, [sp, #0x40]
        mov     r6, r0
        mov     r7, r1
        mov     r0, r5
        mov     r1, r4
        bl      __subdf3
        ldr     r2, [sp, #0x58]
        str     r2, [r9, #0xC]
        ldr     r2, [sp, #0x54]
        str     r2, [r9, #0x10]!
        ldr     r2, [sp, #0x50]
        str     r2, [r8, #-0x14]
        ldr     r2, [sp, #0x4C]
        str     r2, [r8, #-0x10]!
        str     r0, [r10, #0xC]
        str     r1, [r10, #0x10]!
        str     r6, [r11, #-0x14]
        str     r7, [r11, #-0x10]!
        ldr     r0, [sp, #0xC]
        ldr     r2, [sp, #8]
        cmp     r2, r0
        ldr     r0, [sp, #4]
        add     r0, r0, #0x10
        str     r0, [sp, #4]
        ldr     r0, [sp]
        add     r0, r0, #0x10
        str     r0, [sp]
        blt     LCTR1
        ldr     r0, [sp, #0x10]
        ldr     r11, [sp, #0x14]
        ldr     r6, [sp, #0xC]
        ldr     r4, [sp, #0x18]
        ldr     r5, [sp, #0x1C]
        ldr     r7, [sp, #0x20]
LCTR2:
        cmp     r11, #0
        bne     LCTR3
        add     r12, r0, r6, lsl #3
        ldr     r8, [r12, #4]
        ldr     lr, [r0, +r6, lsl #3]
        eor     r8, r8, #2, 2
        str     lr, [r0, +r6, lsl #3]
        str     r8, [r12, #4]
LCTR3:
        ldr     r7, [r7, #0x48]
        cmp     r6, #0
        ble     LCTR7
        cmp     r6, #4
        mov     r9, #0
        addlt   r8, r7, #8
        blt     LCTR5
        sub     r1, r6, #4
        sub     r11, r7, #0x2C
        sub     lr, r4, #0x2C
        sub     r12, r7, #0x24
        sub     r2, r5, #0x14
        str     r6, [sp, #0xC]
        add     r8, r7, #8
        sub     r10, r4, #0x24
        str     r2, [sp, #8]
        str     r12, [sp, #4]
        str     lr, [sp]
        str     r11, [sp, #0x24]
        str     r1, [sp, #0x14]
        mov     r6, r0
LCTR4:
        ldr     r12, [sp]
        ldr     r0, [r12, #0x2C]
        ldr     r1, [r12, #0x30]
        ldr     r12, [sp, #0x24]
        ldr     r2, [r12, #0x2C]
        ldr     r3, [r12, #0x30]
        bl      __muldf3
        ldr     r12, [sp, #4]
        ldr     lr, [r10, #0x2C]
        ldr     r2, [r12, #0x2C]
        ldr     r3, [r12, #0x30]
        ldr     r12, [r10, #0x30]!
        str     r0, [sp, #0x58]
        mov     r11, r1
        mov     r0, lr
        mov     r1, r12
        bl      __muldf3
        ldr     r2, [sp, #0x58]
        mov     r3, r11
        bl      __adddf3
        ldr     r12, [sp, #8]
        add     r11, r9, #1
        str     r1, [r12, #0x18]
        str     r0, [r12, #0x14]
        ldr     r0, [r4, +r11, lsl #4]
        ldr     r2, [r7, +r11, lsl #4]
        add     r12, r7, r11, lsl #4
        ldr     r3, [r12, #4]
        add     r12, r4, r11, lsl #4
        ldr     r1, [r12, #4]
        add     r12, r6, r11, lsl #4
        str     r12, [sp, #0x58]
        add     r12, r8, r11, lsl #4
        str     r12, [sp, #0x54]
        bl      __muldf3
        ldr     r12, [r6, +r11, lsl #4]
        ldr     lr, [sp, #0x54]
        str     r12, [sp, #0x50]
        ldr     r12, [sp, #0x58]
        ldr     r2, [r8, +r11, lsl #4]
        ldr     r3, [lr, #4]
        ldr     r12, [r12, #4]
        str     r0, [sp, #0x58]
        ldr     r0, [sp, #0x50]
        str     r1, [sp, #0x54]
        mov     r1, r12
        bl      __muldf3
        ldr     r2, [sp, #0x58]
        ldr     r3, [sp, #0x54]
        bl      __adddf3
        str     r0, [r5, +r11, lsl #3]
        add     r11, r5, r11, lsl #3
        str     r1, [r11, #4]
        ldr     r12, [sp, #0x24]
        add     r11, r9, #2
        add     r12, r12, #0x30
        str     r12, [sp, #0x24]
        ldr     r12, [sp]
        add     r9, r9, #3
        add     r12, r12, #0x30
        str     r12, [sp]
        ldr     r12, [sp, #4]
        add     r12, r12, #0x30
        str     r12, [sp, #4]
        ldr     r12, [sp, #8]
        add     r12, r12, #0x18
        str     r12, [sp, #8]
        add     r12, r4, r11, lsl #4
        ldr     r1, [r12, #4]
        ldr     r0, [r4, +r11, lsl #4]
        add     r12, r7, r11, lsl #4
        ldr     r3, [r12, #4]
        ldr     r2, [r7, +r11, lsl #4]
        bl      __muldf3
        str     r1, [sp, #0x54]
        str     r0, [sp, #0x58]
        add     r12, r6, r11, lsl #4
        ldr     r1, [r12, #4]
        ldr     r0, [r6, +r11, lsl #4]
        add     r12, r8, r11, lsl #4
        ldr     r3, [r12, #4]
        ldr     r2, [r8, +r11, lsl #4]
        bl      __muldf3
        ldr     r2, [sp, #0x58]
        ldr     r3, [sp, #0x54]
        bl      __adddf3
        ldr     r12, [sp, #0x14]
        str     r0, [r5, +r11, lsl #3]
        add     r11, r5, r11, lsl #3
        cmp     r9, r12
        str     r1, [r11, #4]
        ble     LCTR4
        mov     r0, r6
        ldr     r6, [sp, #0xC]
LCTR5:
        mov     r12, r9, lsl #4
        mov     lr, r9, lsl #3
        sub     r12, r12, #0xC
        sub     lr, lr, #4
        add     r5, lr, r5
        add     r7, r12, r7
        add     r4, r12, r4
        add     r10, r12, r0
        add     r11, r12, r8
        str     r8, [sp, #0x20]
        str     r6, [sp, #0xC]
LCTR6:
        ldr     r0, [r4, #0xC]
        ldr     r1, [r4, #0x10]!
        ldr     r2, [r7, #0xC]
        ldr     r3, [r7, #0x10]!
        bl      __muldf3
        ldr     lr, [sp, #0x20]
        ldr     r2, [r10, #0x10]
        ldr     r12, [r10, #0xC]
        ldr     r3, [r11, #0x10]!
        ldr     lr, [lr, +r9, lsl #4]
        mov     r8, r1
        mov     r1, r2
        mov     r6, r0
        mov     r0, r12
        mov     r2, lr
        bl      __muldf3
        mov     r2, r6
        mov     r3, r8
        bl      __adddf3
        str     r0, [r5, #4]
        str     r1, [r5, #8]!
        ldr     r0, [sp, #0xC]
        add     r9, r9, #1
        cmp     r9, r0
        add     r10, r10, #0x10
        blt     LCTR6
LCTR7:
        mov     r0, #0
        add     sp, sp, #0x5C
        ldmia   sp!, {r4 - r11, pc}


