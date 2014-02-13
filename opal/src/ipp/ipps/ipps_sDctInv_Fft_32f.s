        .text
        .align  4
        .globl  _ipps_sDctInv_Fft_32f


_ipps_sDctInv_Fft_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x4C
        str     r0, [sp, #0x28]
        ldr     r6, [r0, #4]
        ldr     r12, [r0, #0x3C]
        cmp     r6, #0
        mov     r5, r1
        str     r2, [sp, #0x2C]
        mov     r4, r3
        ble     LCRX1
        mov     lr, #0
        add     r3, r4, #0x18
        str     lr, [sp, #0xC]
        add     lr, r4, #4
        str     r3, [sp, #0x10]
        add     r3, r5, #0xC
        str     lr, [sp, #8]
        str     r3, [sp, #0x14]
        add     lr, r12, #4
        add     r3, r12, #0x18
        str     lr, [sp, #4]
        str     r3, [sp, #0x1C]
        add     lr, r4, #8
        add     r3, r4, #0x1C
        add     r2, r4, #0xC
        add     r0, r4, #0x14
        add     r9, r4, #0x10
        str     r4, [sp, #0x18]
        str     r6, [sp, #0x34]
        str     r4, [sp, #0x30]
        ldr     r4, [sp, #0x14]
        ldr     r6, [sp, #8]
        str     lr, [sp]
        str     r3, [sp, #0x20]
        add     r1, r12, #0xC
        add     lr, r12, #0x14
        add     r3, r12, #0x1C
        add     r11, r5, #4
        add     r10, r12, #8
        add     r8, r5, #8
        add     r7, r12, #0x10
        str     r3, [sp, #0x24]
        str     lr, [sp, #0x3C]
        str     r0, [sp, #0x44]
        str     r1, [sp, #0x40]
        str     r2, [sp, #0x48]
        str     r12, [sp, #0x38]
LCRX0:
        ldr     r0, [r5]
        ldr     r2, [sp, #0x38]
        ldr     r1, [r2], #0x20
        str     r2, [sp, #0x38]
        ldr     r2, [sp, #0xC]
        add     r2, r2, #4
        str     r2, [sp, #0xC]
        bl      __mulsf3
        ldr     r2, [sp, #0x18]
        str     r0, [r2], #0x20
        ldr     r0, [sp, #4]
        ldr     r1, [r0]
        ldr     r0, [r5], #0x10
        str     r2, [sp, #0x18]
        bl      __mulsf3
        str     r0, [r6], #0x20
        ldr     r2, [sp, #4]
        ldr     r1, [r10], #0x20
        ldr     r0, [r11]
        add     r2, r2, #0x20
        str     r2, [sp, #4]
        bl      __mulsf3
        ldr     r2, [sp]
        str     r0, [r2]
        ldr     r0, [sp, #0x40]
        ldr     r2, [sp]
        ldr     r1, [r0]
        ldr     r0, [r11], #0x10
        add     r2, r2, #0x20
        str     r2, [sp]
        bl      __mulsf3
        ldr     r2, [sp, #0x48]
        str     r0, [r2]
        ldr     r2, [sp, #0x40]
        ldr     r0, [r8]
        ldr     r1, [r7], #0x20
        add     r2, r2, #0x20
        str     r2, [sp, #0x40]
        bl      __mulsf3
        str     r0, [r9], #0x20
        ldr     r2, [sp, #0x3C]
        ldr     r0, [r8], #0x10
        ldr     r1, [r2]
        ldr     r2, [sp, #0x48]
        add     r2, r2, #0x20
        str     r2, [sp, #0x48]
        bl      __mulsf3
        ldr     r2, [sp, #0x44]
        str     r0, [r2]
        ldr     r2, [sp, #0x1C]
        ldr     r0, [r4]
        ldr     r1, [r2]
        bl      __mulsf3
        ldr     r2, [sp, #0x10]
        str     r0, [r2], #0x20
        ldr     r0, [sp, #0x3C]
        str     r2, [sp, #0x10]
        add     r0, r0, #0x20
        str     r0, [sp, #0x3C]
        ldr     r0, [sp, #0x44]
        ldr     r2, [sp, #0x24]
        add     r0, r0, #0x20
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0x1C]
        add     r0, r0, #0x20
        str     r0, [sp, #0x1C]
        ldr     r1, [r2], #0x20
        ldr     r0, [r4], #0x10
        str     r2, [sp, #0x24]
        bl      __mulsf3
        ldr     r2, [sp, #0x20]
        str     r0, [r2], #0x20
        str     r2, [sp, #0x20]
        ldr     r2, [sp, #0x34]
        ldr     r0, [sp, #0xC]
        cmp     r0, r2
        blt     LCRX0
        ldr     r6, [sp, #0x34]
        ldr     r4, [sp, #0x30]
LCRX1:
        ldr     r12, [sp, #0x28]
        add     r3, r4, r6, lsl #3
        ldr     r2, [r12, #0x4C]
        mov     r0, r4
        mov     r1, r4
        bl      _ippsFFTInv_PermToR_32f
        cmp     r0, #0
        addne   sp, sp, #0x4C
        ldmneia sp!, {r4 - r11, pc}
        mov     r0, r4
        mov     r2, r6
        ldr     r1, [sp, #0x2C]
        bl      _ippsCopy_32f
        mov     r0, #0
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}


