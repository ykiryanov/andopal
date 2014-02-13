        .text
        .align  4
        .globl  _ipps_sDctFwd_Fft_32f


_ipps_sDctFwd_Fft_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x50
        mov     r7, r0
        ldr     r5, [r7, #4]
        mov     r0, r1
        mov     r4, r3
        mov     r6, r2
        mov     r1, r4
        mov     r2, r5
        bl      _ippsCopy_32f
        add     r0, r4, r5, lsl #2
        mov     r1, r5
        bl      _ippsZero_32f
        ldr     r2, [r7, #0x4C]
        add     r3, r4, r5, lsl #3
        mov     r0, r4
        mov     r1, r4
        bl      _ippsFFTFwd_RToPerm_32f
        cmp     r0, #0
        addne   sp, sp, #0x50
        ldmneia sp!, {r4 - r11, pc}
        ldr     r12, [r7, #0x3C]
        cmp     r5, #0
        ble     LCRY1
        add     r7, r12, #0xC
        str     r7, [sp, #0x18]
        add     r7, r6, #8
        str     r7, [sp, #0x14]
        add     r7, r4, #0x10
        str     r7, [sp, #0x10]
        add     r7, r12, #0x10
        str     r7, [sp, #0xC]
        add     r7, r4, #0x14
        str     r7, [sp, #8]
        add     r7, r12, #0x14
        str     r7, [sp, #4]
        add     r11, r6, #4
        add     r10, r4, #8
        add     lr, r4, #4
        add     r7, r6, #0xC
        add     r3, r4, #0x1C
        add     r9, r4, #0xC
        add     r8, r4, #0x18
        str     r10, [sp, #0x44]
        str     r11, [sp, #0x3C]
        str     r5, [sp, #0x20]
        str     r4, [sp, #0x24]
        str     r6, [sp, #0x2C]
        ldr     r6, [sp, #4]
        ldr     r4, [sp, #8]
        ldr     r10, [sp, #0xC]
        ldr     r11, [sp, #0x10]
        ldr     r5, [sp, #0x14]
        str     lr, [sp, #0x1C]
        mov     r1, #0
        add     r0, r12, #4
        add     lr, r12, #8
        str     r7, [sp]
        add     r2, r12, #0x1C
        add     r7, r12, #0x18
        str     r2, [sp, #0x28]
        str     r3, [sp, #0x48]
        str     lr, [sp, #0x40]
        str     r0, [sp, #0x38]
        str     r1, [sp, #0x30]
        str     r12, [sp, #0x34]
LCRY0:
        ldr     r0, [sp, #0x34]
        ldr     r2, [sp, #0x24]
        ldr     r1, [r0]
        ldr     r0, [r2], #0x20
        str     r2, [sp, #0x24]
        ldr     r2, [sp, #0x34]
        add     r2, r2, #0x20
        str     r2, [sp, #0x34]
        bl      __mulsf3
        ldr     r1, [sp, #0x38]
        ldr     r2, [sp, #0x1C]
        ldr     r3, [sp, #0x1C]
        ldr     r1, [r1]
        ldr     r2, [r2]
        str     r0, [sp, #0x4C]
        add     r3, r3, #0x20
        str     r3, [sp, #0x1C]
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #0x4C]
        bl      __addsf3
        ldr     r1, [sp, #0x2C]
        str     r0, [r1]
        ldr     r0, [sp, #0x44]
        ldr     r1, [sp, #0x40]
        ldr     r2, [sp, #0x38]
        ldr     r0, [r0]
        ldr     r1, [r1]
        add     r2, r2, #0x20
        str     r2, [sp, #0x38]
        ldr     r2, [sp, #0x2C]
        add     r2, r2, #0x10
        str     r2, [sp, #0x2C]
        bl      __mulsf3
        ldr     r1, [sp, #0x18]
        ldr     r2, [r9], #0x20
        ldr     r3, [sp, #0x44]
        ldr     r1, [r1]
        str     r0, [sp, #0x4C]
        add     r3, r3, #0x20
        str     r3, [sp, #0x44]
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #0x4C]
        bl      __addsf3
        ldr     r1, [sp, #0x3C]
        str     r0, [r1]
        ldr     r1, [r10], #0x20
        ldr     r0, [r11], #0x20
        ldr     r2, [sp, #0x40]
        add     r2, r2, #0x20
        str     r2, [sp, #0x40]
        bl      __mulsf3
        ldr     r1, [r4], #0x20
        ldr     r2, [r6], #0x20
        ldr     r3, [sp, #0x18]
        str     r0, [sp, #0x4C]
        add     r3, r3, #0x20
        str     r3, [sp, #0x18]
        mov     r0, r1
        mov     r1, r2
        bl      __mulsf3
        ldr     r1, [sp, #0x4C]
        bl      __addsf3
        str     r0, [r5], #0x10
        ldr     r2, [sp, #0x3C]
        ldr     r0, [r8], #0x20
        ldr     r1, [r7], #0x20
        add     r2, r2, #0x10
        str     r2, [sp, #0x3C]
        bl      __mulsf3
        ldr     r1, [sp, #0x48]
        ldr     r2, [sp, #0x28]
        ldr     r1, [r1]
        ldr     r2, [r2]
        str     r0, [sp, #0x4C]
        mov     r0, r1
        mov     r1, r2
        bl      __mulsf3
        ldr     r1, [sp, #0x4C]
        bl      __addsf3
        ldr     r1, [sp, #0x30]
        add     r1, r1, #4
        str     r1, [sp, #0x30]
        ldr     r1, [sp]
        str     r0, [r1], #0x10
        ldr     r0, [sp, #0x48]
        str     r1, [sp]
        add     r0, r0, #0x20
        str     r0, [sp, #0x48]
        ldr     r0, [sp, #0x28]
        ldr     r1, [sp, #0x20]
        add     r0, r0, #0x20
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x30]
        cmp     r0, r1
        blt     LCRY0
LCRY1:
        mov     r0, #0
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}


