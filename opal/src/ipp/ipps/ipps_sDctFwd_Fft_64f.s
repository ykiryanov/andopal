        .text
        .align  4
        .globl  _ipps_sDctFwd_Fft_64f


_ipps_sDctFwd_Fft_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x48
        mov     r5, r0
        ldr     r9, [r5, #4]
        mov     r0, r1
        mov     r8, r3
        mov     r4, r2
        mov     r1, r8
        mov     r2, r9
        bl      _ippsCopy_64f
        add     r0, r8, r9, lsl #3
        mov     r1, r9
        bl      _ippsZero_64f
        ldr     r2, [r5, #0x58]
        add     r3, r8, r9, lsl #4
        mov     r0, r8
        mov     r1, r8
        bl      _ippsFFTFwd_RToPerm_64f
        cmp     r0, #0
        addne   sp, sp, #0x48
        ldmneia sp!, {r4 - r11, pc}
        ldr     r12, [r5, #0x48]
        cmp     r9, #0
        ble     LCTJ1
        sub     r0, r12, #0x14
        str     r0, [sp, #0x18]
        sub     r0, r8, #0x14
        str     r0, [sp, #0x14]
        sub     r0, r12, #0x1C
        str     r0, [sp, #0x10]
        sub     r0, r8, #0x1C
        str     r0, [sp, #0xC]
        sub     r0, r12, #0x24
        str     r0, [sp, #8]
        sub     r0, r8, #0x24
        str     r0, [sp, #4]
        sub     r10, r4, #4
        sub     lr, r4, #0xC
        sub     r7, r4, #0x14
        sub     r0, r12, #0x2C
        sub     r4, r4, #0x1C
        str     r0, [sp]
        str     r4, [sp, #0x1C]
        sub     r0, r8, #0x2C
        sub     r6, r8, #0x3C
        sub     r5, r8, #4
        sub     r4, r8, #0xC
        sub     r8, r8, #0x34
        str     r8, [sp, #0x38]
        str     r9, [sp, #0x20]
        ldr     r8, [sp, #0xC]
        ldr     r9, [sp, #0x18]
        sub     r3, r12, #0x3C
        sub     r2, r12, #4
        sub     r1, r12, #0xC
        mov     r11, #0
        sub     r12, r12, #0x34
        str     r12, [sp, #0x30]
        str     r0, [sp, #0x34]
        str     r1, [sp, #0x44]
        str     r2, [sp, #0x40]
        str     r3, [sp, #0x3C]
        str     lr, [sp, #0x2C]
        str     r10, [sp, #0x24]
        str     r11, [sp, #0x28]
LCTJ0:
        ldr     r3, [sp, #0x3C]
        ldr     r0, [r6, #0x3C]
        ldr     r1, [r6, #0x40]!
        ldr     r2, [r3, #0x3C]
        ldr     r3, [r3, #0x40]
        bl      __muldf3
        ldr     r12, [sp, #0x38]
        ldr     r3, [sp, #0x30]
        mov     r10, r0
        mov     r11, r1
        ldr     r2, [r3, #0x3C]
        ldr     lr, [r12, #0x3C]
        ldr     r3, [r3, #0x40]
        ldr     r12, [r12, #0x40]
        mov     r0, lr
        mov     r1, r12
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        ldr     r2, [sp, #0x1C]
        str     r0, [r2, #0x1C]
        str     r1, [r2, #0x20]
        ldr     r0, [sp]
        ldr     r1, [sp, #0x34]
        ldr     r2, [r0, #0x3C]
        ldr     r3, [r0, #0x40]
        ldr     r0, [r1, #0x3C]
        ldr     r1, [r1, #0x40]
        bl      __muldf3
        ldr     r12, [sp, #4]
        ldr     r3, [sp, #8]
        mov     r10, r0
        mov     r11, r1
        ldr     r2, [r3, #0x3C]
        ldr     lr, [r12, #0x3C]
        ldr     r12, [r12, #0x40]
        ldr     r3, [r3, #0x40]
        mov     r0, lr
        mov     r1, r12
        bl      __muldf3
        mov     r3, r11
        mov     r2, r10
        bl      __adddf3
        str     r1, [r7, #0x20]
        str     r0, [r7, #0x1C]
        ldr     r0, [sp, #0x10]
        ldr     r1, [r8, #0x40]
        add     r7, r7, #0x20
        ldr     r2, [r0, #0x3C]
        ldr     r3, [r0, #0x40]
        ldr     r0, [r8, #0x3C]
        bl      __muldf3
        ldr     r12, [sp, #0x14]
        ldr     lr, [r9, #0x3C]
        ldr     r3, [r9, #0x40]!
        ldr     r2, [r12, #0x3C]
        ldr     r12, [r12, #0x40]
        mov     r10, r0
        mov     r11, r1
        mov     r0, r2
        mov     r1, r12
        mov     r2, lr
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        ldr     r2, [sp, #0x2C]
        str     r0, [r2, #0x1C]
        str     r1, [r2, #0x20]
        ldr     r0, [r4, #0x3C]
        ldr     r3, [sp, #0x44]
        ldr     r1, [r4, #0x40]!
        ldr     r2, [r3, #0x3C]
        ldr     r3, [r3, #0x40]
        bl      __muldf3
        ldr     r3, [sp, #0x40]
        ldr     r12, [r5, #0x3C]
        ldr     r2, [r5, #0x40]!
        mov     r11, r1
        ldr     lr, [r3, #0x3C]
        ldr     r3, [r3, #0x40]
        mov     r1, r2
        mov     r10, r0
        mov     r0, r12
        mov     r2, lr
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        ldr     r2, [sp, #0x28]
        add     r2, r2, #4
        str     r2, [sp, #0x28]
        ldr     r2, [sp, #0x24]
        add     r8, r8, #0x40
        str     r1, [r2, #0x20]
        str     r0, [r2, #0x1C]
        ldr     r1, [sp, #0x20]
        ldr     r0, [sp, #0x28]
        cmp     r0, r1
        ldr     r0, [sp, #0x24]
        add     r0, r0, #0x20
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x2C]
        add     r0, r0, #0x20
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x1C]
        add     r0, r0, #0x20
        str     r0, [sp, #0x1C]
        ldr     r0, [sp, #0x3C]
        add     r0, r0, #0x40
        str     r0, [sp, #0x3C]
        ldr     r0, [sp, #0x40]
        add     r0, r0, #0x40
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x44]
        add     r0, r0, #0x40
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0x14]
        add     r0, r0, #0x40
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0x10]
        add     r0, r0, #0x40
        str     r0, [sp, #0x10]
        ldr     r0, [sp, #8]
        add     r0, r0, #0x40
        str     r0, [sp, #8]
        ldr     r0, [sp, #4]
        add     r0, r0, #0x40
        str     r0, [sp, #4]
        ldr     r0, [sp]
        add     r0, r0, #0x40
        str     r0, [sp]
        ldr     r0, [sp, #0x34]
        add     r0, r0, #0x40
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0x30]
        add     r0, r0, #0x40
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x38]
        add     r0, r0, #0x40
        str     r0, [sp, #0x38]
        blt     LCTJ0
LCTJ1:
        mov     r0, #0
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}


