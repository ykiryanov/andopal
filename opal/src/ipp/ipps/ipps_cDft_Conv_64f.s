        .text
        .align  4
        .globl  _ipps_cDft_Conv_64f


_ipps_cDft_Conv_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        mov     r4, r0
        ldr     r7, [r4, #4]
        ldr     r9, [sp, #0x40]
        ldr     r8, [sp, #0x44]
        ldr     r10, [sp, #0x48]
        ldr     r11, [r4, #0x30]
        cmp     r7, #0
        mov     r6, r1
        mov     r5, r3
        ble     LCQL1
        sub     r1, r2, #4
        mov     r0, #0
        sub     r2, r6, #4
        mov     r3, r0
        sub     r6, r10, #4
        str     r11, [sp, #0x14]
        str     r10, [sp]
        str     r5, [sp, #0x10]
        str     r4, [sp, #0x18]
        str     r7, [sp, #4]
        str     r8, [sp, #8]
        str     r9, [sp, #0xC]
        mov     r5, r0
        mov     r11, r1
        mov     r10, r2
        mov     r4, r3
LCQL0:
        ldr     r12, [sp, #0x18]
        ldr     r0, [r10, #4]
        ldr     r1, [r10, #8]
        ldr     r12, [r12, #0x40]
        add     r9, r5, r12
        ldr     r3, [r9, #4]
        ldr     r2, [r12, +r4, lsl #4]
        bl      __muldf3
        ldr     r2, [r11, #4]
        ldr     r12, [r11, #8]
        ldr     lr, [r9, #8]
        ldr     r3, [r9, #0xC]
        mov     r7, r0
        mov     r0, r2
        mov     r8, r1
        mov     r1, r12
        mov     r2, lr
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r7
        mov     r1, r8
        bl      __subdf3
        str     r0, [r6, #4]
        str     r1, [r6, #8]
        ldr     r12, [sp, #0x18]
        ldr     r0, [r10, #4]
        ldr     r1, [r10, #8]!
        ldr     r9, [r12, #0x40]
        add     r7, r5, r9
        ldr     r2, [r7, #8]
        ldr     r3, [r7, #0xC]
        add     r5, r5, #0x10
        bl      __muldf3
        ldr     r12, [r7, #4]
        ldr     r3, [r11, #4]
        ldr     r2, [r11, #8]!
        ldr     r9, [r9, +r4, lsl #4]
        mov     r7, r0
        mov     r8, r1
        mov     r0, r3
        mov     r1, r2
        mov     r3, r12
        mov     r2, r9
        bl      __muldf3
        mov     r2, r7
        mov     r3, r8
        bl      __adddf3
        str     r0, [r6, #0xC]
        str     r1, [r6, #0x10]!
        ldr     r12, [sp, #4]
        add     r4, r4, #1
        cmp     r4, r12
        blt     LCQL0
        ldr     r11, [sp, #0x14]
        ldr     r7, [sp, #4]
        ldr     r10, [sp]
        ldr     r8, [sp, #8]
        ldr     r9, [sp, #0xC]
        ldr     r5, [sp, #0x10]
        ldr     r4, [sp, #0x18]
LCQL1:
        cmp     r7, r11
        bge     LCQL2
        sub     r1, r11, r7
        add     r0, r10, r7, lsl #4
        bl      _ipps_cbZero_64fc
LCQL2:
        ldr     r2, [r4, #0x4C]
        add     r6, r10, r11, lsl #4
        mov     r0, r10
        mov     r3, r6
        mov     r1, r10
        bl      _ippsFFTFwd_CToC_64fc
        cmp     r0, #0
        addne   sp, sp, #0x1C
        ldmneia sp!, {r4 - r11, pc}
        ldr     r0, [r4, #0x44]
        mov     r3, r11
        mov     r2, r10
        mov     r1, r10
        bl      _ipps_cbMpy3_64fc
        ldr     r2, [r4, #0x4C]
        mov     r3, r6
        mov     r0, r10
        mov     r1, r10
        bl      _ippsFFTInv_CToC_64fc
        cmp     r0, #0
        addne   sp, sp, #0x1C
        ldmneia sp!, {r4 - r11, pc}
        cmp     r7, #0
        ble     LCQL4
        sub     r6, r10, #4
        mov     r0, #0
        sub     r1, r9, #4
        sub     r10, r5, #4
        str     r5, [sp, #0x10]
        mov     r11, r0
        str     r1, [sp]
        str     r7, [sp, #4]
        str     r8, [sp, #8]
        str     r9, [sp, #0xC]
        mov     r5, r0
LCQL3:
        ldr     r2, [r4, #0x40]
        ldr     r0, [r6, #4]
        ldr     r1, [r6, #8]
        add     r9, r5, r2
        ldr     r3, [r9, #4]
        ldr     r2, [r2, +r11, lsl #4]
        bl      __muldf3
        mov     r7, r0
        mov     r8, r1
        ldr     r2, [r9, #8]
        ldr     r0, [r6, #0xC]
        ldr     r1, [r6, #0x10]
        ldr     r3, [r9, #0xC]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r7
        mov     r1, r8
        bl      __subdf3
        str     r0, [r10, #4]
        str     r1, [r10, #8]!
        ldr     r9, [r4, #0x40]
        ldr     r0, [r6, #4]
        ldr     r1, [r6, #8]
        add     r7, r5, r9
        ldr     r2, [r7, #8]
        ldr     r3, [r7, #0xC]
        bl      __muldf3
        ldr     r3, [r7, #4]
        ldr     r2, [r9, +r11, lsl #4]
        mov     r7, r0
        mov     r8, r1
        ldr     r0, [r6, #0xC]
        ldr     r1, [r6, #0x10]!
        bl      __muldf3
        mov     r2, r7
        mov     r3, r8
        bl      __adddf3
        ldr     r2, [sp]
        str     r1, [r2, #8]
        str     r0, [r2, #4]
        ldr     r1, [sp, #4]
        add     r11, r11, #1
        add     r2, r2, #8
        cmp     r11, r1
        add     r5, r5, #0x10
        str     r2, [sp]
        blt     LCQL3
        ldr     r7, [sp, #4]
        ldr     r8, [sp, #8]
        ldr     r9, [sp, #0xC]
        ldr     r5, [sp, #0x10]
LCQL4:
        cmp     r8, #0
        blt     LCQL6
LCQL5:
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LCQL6:
        sub     r7, r7, #1
        cmp     r7, #1
        ble     LCQL5
        mov     r0, r7, lsl #3
        add     r0, r0, #0xC
        add     r1, r0, r9
        add     r0, r0, r5
        mov     r2, #1
        add     r9, r9, #4
        add     r5, r5, #4
LCQL7:
        ldr     r3, [r0, #-0xC]
        ldr     r12, [r0, #-8]
        ldr     lr, [r5, #4]
        ldr     r4, [r5, #8]
        str     r3, [r5, #4]
        str     r12, [r5, #8]!
        str     lr, [r0, #-0xC]
        str     r4, [r0, #-8]!
        ldr     r3, [r1, #-0xC]
        ldr     r12, [r1, #-8]
        ldr     lr, [r9, #4]
        ldr     r4, [r9, #8]
        str     r3, [r9, #4]
        str     r12, [r9, #8]!
        add     r2, r2, #1
        sub     r7, r7, #1
        str     lr, [r1, #-0xC]
        str     r4, [r1, #-8]!
        cmp     r2, r7
        blt     LCQL7
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}


