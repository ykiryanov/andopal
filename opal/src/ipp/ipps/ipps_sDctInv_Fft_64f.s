        .text
        .align  4
        .globl  _ipps_sDctInv_Fft_64f


_ipps_sDctInv_Fft_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x58
        str     r0, [sp, #0x28]
        ldr     r8, [r0, #4]
        ldr     r12, [r0, #0x48]
        cmp     r8, #0
        str     r2, [sp, #0x2C]
        mov     r7, r3
        ble     LCTI1
        mov     lr, #0
        str     lr, [sp, #0x18]
        sub     lr, r7, #0x3C
        str     lr, [sp, #0x14]
        sub     lr, r12, #0x3C
        str     lr, [sp, #0x10]
        sub     lr, r1, #4
        str     lr, [sp, #0xC]
        sub     lr, r1, #0xC
        str     lr, [sp, #8]
        sub     r3, r7, #0x2C
        sub     lr, r1, #0x14
        str     r3, [sp, #0x1C]
        str     lr, [sp, #4]
        sub     r3, r12, #0x2C
        sub     lr, r7, #4
        sub     r11, r7, #0x14
        sub     r10, r7, #0x1C
        sub     r9, r7, #0x24
        str     r3, [sp, #0x20]
        sub     r4, r1, #0x1C
        str     lr, [sp]
        sub     r1, r7, #0xC
        sub     r3, r7, #0x34
        str     r9, [sp, #0x38]
        str     r10, [sp, #0x3C]
        str     r11, [sp, #0x40]
        str     r8, [sp, #0x34]
        str     r7, [sp, #0x30]
        ldr     r8, [sp, #0x20]
        ldr     r9, [sp, #4]
        ldr     r10, [sp, #8]
        ldr     r11, [sp, #0xC]
        ldr     r7, [sp, #0x14]
        sub     r2, r12, #4
        sub     r0, r12, #0xC
        sub     lr, r12, #0x24
        sub     r6, r12, #0x14
        sub     r5, r12, #0x1C
        sub     r12, r12, #0x34
        str     r3, [sp, #0x24]
        str     r12, [sp, #0x48]
        str     lr, [sp, #0x4C]
        str     r0, [sp, #0x54]
        str     r1, [sp, #0x44]
        str     r2, [sp, #0x50]
LCTI0:
        ldr     r3, [sp, #0x10]
        ldr     r0, [r4, #0x1C]
        ldr     r1, [r4, #0x20]
        ldr     r2, [r3, #0x3C]
        ldr     r3, [r3, #0x40]
        bl      __muldf3
        str     r1, [r7, #0x40]
        str     r0, [r7, #0x3C]
        ldr     r0, [sp, #0x48]
        ldr     r1, [r4, #0x20]
        add     r7, r7, #0x40
        ldr     r2, [r0, #0x3C]
        ldr     r3, [r0, #0x40]
        ldr     r0, [r4, #0x1C]
        bl      __muldf3
        ldr     r2, [sp, #0x24]
        str     r0, [r2, #0x3C]
        str     r1, [r2, #0x40]
        ldr     r2, [r8, #0x3C]
        ldr     r0, [r9, #0x1C]
        ldr     r1, [r9, #0x20]
        ldr     r3, [r8, #0x40]!
        bl      __muldf3
        ldr     r2, [sp, #0x1C]
        add     r4, r4, #0x20
        str     r0, [r2, #0x3C]
        str     r1, [r2, #0x40]
        ldr     r3, [sp, #0x4C]
        ldr     r0, [r9, #0x1C]
        ldr     r1, [r9, #0x20]!
        ldr     r2, [r3, #0x3C]
        ldr     r3, [r3, #0x40]
        bl      __muldf3
        ldr     r2, [sp, #0x38]
        str     r0, [r2, #0x3C]
        str     r1, [r2, #0x40]
        ldr     r0, [r10, #0x1C]
        ldr     r1, [r10, #0x20]
        ldr     r2, [r5, #0x3C]
        ldr     r3, [r5, #0x40]!
        bl      __muldf3
        ldr     r2, [sp, #0x3C]
        str     r0, [r2, #0x3C]
        str     r1, [r2, #0x40]
        ldr     r0, [r10, #0x1C]
        ldr     r1, [r10, #0x20]!
        ldr     r2, [r6, #0x3C]
        ldr     r3, [r6, #0x40]!
        bl      __muldf3
        ldr     r2, [sp, #0x40]
        str     r0, [r2, #0x3C]
        str     r1, [r2, #0x40]
        ldr     r3, [sp, #0x54]
        ldr     r0, [r11, #0x1C]
        ldr     r1, [r11, #0x20]
        ldr     r2, [r3, #0x3C]
        ldr     r3, [r3, #0x40]
        bl      __muldf3
        ldr     r2, [sp, #0x44]
        str     r0, [r2, #0x3C]
        str     r1, [r2, #0x40]
        ldr     r3, [sp, #0x50]
        ldr     r0, [r11, #0x1C]
        ldr     r1, [r11, #0x20]!
        ldr     r2, [r3, #0x3C]
        ldr     r3, [r3, #0x40]
        bl      __muldf3
        ldr     r2, [sp, #0x18]
        add     r2, r2, #4
        str     r2, [sp, #0x18]
        ldr     r2, [sp]
        str     r0, [r2, #0x3C]
        str     r1, [r2, #0x40]
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #0x34]
        cmp     r0, r1
        ldr     r0, [sp, #0x10]
        add     r0, r0, #0x40
        str     r0, [sp, #0x10]
        ldr     r0, [sp]
        add     r0, r0, #0x40
        str     r0, [sp]
        ldr     r0, [sp, #0x50]
        add     r0, r0, #0x40
        str     r0, [sp, #0x50]
        ldr     r0, [sp, #0x44]
        add     r0, r0, #0x40
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0x54]
        add     r0, r0, #0x40
        str     r0, [sp, #0x54]
        ldr     r0, [sp, #0x40]
        add     r0, r0, #0x40
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x3C]
        add     r0, r0, #0x40
        str     r0, [sp, #0x3C]
        ldr     r0, [sp, #0x38]
        add     r0, r0, #0x40
        str     r0, [sp, #0x38]
        ldr     r0, [sp, #0x4C]
        add     r0, r0, #0x40
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0x1C]
        add     r0, r0, #0x40
        str     r0, [sp, #0x1C]
        ldr     r0, [sp, #0x24]
        add     r0, r0, #0x40
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x48]
        add     r0, r0, #0x40
        str     r0, [sp, #0x48]
        blt     LCTI0
        ldr     r8, [sp, #0x34]
        ldr     r7, [sp, #0x30]
LCTI1:
        ldr     r12, [sp, #0x28]
        add     r3, r7, r8, lsl #4
        ldr     r2, [r12, #0x58]
        mov     r0, r7
        mov     r1, r7
        bl      _ippsFFTInv_PermToR_64f
        cmp     r0, #0
        addne   sp, sp, #0x58
        ldmneia sp!, {r4 - r11, pc}
        mov     r0, r7
        mov     r2, r8
        ldr     r1, [sp, #0x2C]
        bl      _ippsCopy_64f
        mov     r0, #0
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}


