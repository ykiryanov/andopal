        .text
        .align  4
        .globl  _ipps_rDftFwd_Conv_64f


_ipps_rDftFwd_Conv_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x24
        mov     r5, r0
        ldr     r8, [r5, #4]
        ldr     r7, [r5, #0x30]
        mov     r10, r1
        cmp     r8, #0
        mov     r6, r2
        mov     r4, r3
        ble     LCQI3
        cmp     r8, #4
        mov     r11, #0
        movlt   r0, r11
        blt     LCQI1
        mov     r0, r11
        sub     r12, r8, #4
        sub     lr, r10, #0x14
        str     r6, [sp, #0x10]
        sub     r9, r4, #0x24
        str     lr, [sp]
        str     r12, [sp, #4]
        str     r7, [sp, #8]
        str     r8, [sp, #0xC]
        mov     r6, r0
LCQI0:
        ldr     r12, [r5, #0x40]
        ldr     lr, [sp]
        add     r7, r6, #1
        ldr     r2, [r12, +r6, lsl #4]
        add     r12, r12, r11
        ldr     r0, [lr, #0x14]
        ldr     r1, [lr, #0x18]
        ldr     r3, [r12, #4]
        bl      __muldf3
        str     r0, [r9, #0x24]
        str     r1, [r9, #0x28]
        ldr     r12, [sp]
        add     r8, r6, #2
        add     r6, r6, #3
        ldr     r0, [r12, #0x14]
        ldr     r1, [r12, #0x18]!
        str     r12, [sp]
        ldr     r12, [r5, #0x40]
        add     r12, r12, r11
        ldr     r2, [r12, #8]
        ldr     r3, [r12, #0xC]
        add     r12, r10, r7, lsl #3
        str     r12, [sp, #0x14]
        add     r12, r4, r7, lsl #4
        str     r12, [sp, #0x18]
        bl      __muldf3
        str     r0, [r9, #0x2C]
        str     r1, [r9, #0x30]!
        ldr     r12, [sp, #0x14]
        ldr     r0, [r10, +r7, lsl #3]
        add     lr, r10, r8, lsl #3
        ldr     r1, [r12, #4]
        ldr     r12, [r5, #0x40]
        str     lr, [sp, #0x1C]
        ldr     r2, [r12, +r7, lsl #4]
        add     lr, r12, r7, lsl #4
        ldr     r3, [lr, #4]
        add     r12, r4, r8, lsl #4
        str     r12, [sp, #0x20]
        bl      __muldf3
        str     r0, [r4, +r7, lsl #4]
        ldr     r12, [sp, #0x18]
        str     r1, [r12, #4]
        ldr     r12, [r5, #0x40]
        ldr     r0, [r10, +r7, lsl #3]
        ldr     lr, [sp, #0x14]
        add     r7, r12, r7, lsl #4
        ldr     r2, [r7, #8]
        ldr     r1, [lr, #4]
        ldr     r3, [r7, #0xC]
        bl      __muldf3
        ldr     r12, [sp, #0x18]
        add     r11, r11, #0x30
        str     r1, [r12, #0xC]
        str     r0, [r12, #8]
        ldr     r12, [sp, #0x1C]
        ldr     lr, [r5, #0x40]
        ldr     r0, [r10, +r8, lsl #3]
        ldr     r1, [r12, #4]
        add     r12, lr, r8, lsl #4
        ldr     r2, [lr, +r8, lsl #4]
        ldr     r3, [r12, #4]
        bl      __muldf3
        str     r0, [r4, +r8, lsl #4]
        ldr     r12, [sp, #0x20]
        str     r1, [r12, #4]
        ldr     r12, [sp, #0x1C]
        ldr     r0, [r10, +r8, lsl #3]
        ldr     r1, [r12, #4]
        ldr     r12, [r5, #0x40]
        add     r8, r12, r8, lsl #4
        ldr     r2, [r8, #8]
        ldr     r3, [r8, #0xC]
        bl      __muldf3
        ldr     r12, [sp, #4]
        cmp     r6, r12
        ldr     r12, [sp, #0x20]
        str     r0, [r12, #8]
        ldr     r12, [sp, #0x20]
        str     r1, [r12, #0xC]
        ble     LCQI0
        mov     r0, r6
        ldr     r7, [sp, #8]
        ldr     r8, [sp, #0xC]
        ldr     r6, [sp, #0x10]
LCQI1:
        mov     r12, r0, lsl #3
        sub     lr, r12, #4
        mov     r9, r0, lsl #4
        sub     r12, r9, #4
        add     r11, lr, r10
        str     r6, [sp, #0x10]
        add     r10, r12, r4
        mov     r6, r0
LCQI2:
        ldr     r12, [r5, #0x40]
        ldr     r0, [r11, #4]
        ldr     r1, [r11, #8]
        ldr     r2, [r12, +r6, lsl #4]
        add     r12, r12, r9
        ldr     r3, [r12, #4]
        bl      __muldf3
        str     r0, [r10, #4]
        str     r1, [r10, #8]
        ldr     r12, [r5, #0x40]
        ldr     r0, [r11, #4]
        ldr     r1, [r11, #8]!
        add     r12, r12, r9
        ldr     r2, [r12, #8]
        ldr     r3, [r12, #0xC]
        bl      __muldf3
        add     r6, r6, #1
        str     r0, [r10, #0xC]
        str     r1, [r10, #0x10]!
        cmp     r6, r8
        add     r9, r9, #0x10
        blt     LCQI2
        ldr     r6, [sp, #0x10]
LCQI3:
        cmp     r8, r7
        bge     LCQI4
        sub     r1, r7, r8
        add     r0, r4, r8, lsl #4
        bl      _ipps_cbZero_64fc
LCQI4:
        ldr     r2, [r5, #0x4C]
        add     r9, r4, r7, lsl #4
        mov     r0, r4
        mov     r3, r9
        mov     r1, r4
        bl      _ippsFFTFwd_CToC_64fc
        cmp     r0, #0
        addne   sp, sp, #0x24
        ldmneia sp!, {r4 - r11, pc}
        ldr     r0, [r5, #0x44]
        mov     r3, r7
        mov     r2, r4
        mov     r1, r4
        bl      _ipps_cbMpy3_64fc
        ldr     r2, [r5, #0x4C]
        mov     r3, r9
        mov     r0, r4
        mov     r1, r4
        bl      _ippsFFTInv_CToC_64fc
        cmp     r0, #0
        addne   sp, sp, #0x24
        ldmneia sp!, {r4 - r11, pc}
        ldr     r0, [r5, #0x40]
        mov     r3, r8
        mov     r2, r4
        mov     r1, r4
        bl      _ipps_cbMpy3_64fc
        ldr     r12, [r4]
        ldr     lr, [r4, #4]
        tst     r8, #1
        str     r12, [r6]
        mov     r12, #1
        str     lr, [r6, #4]
        beq     LCQI8
        add     r8, r8, #1
        mov     lr, r8, asr #1
        cmp     lr, #1
        ble     LCQI12
        sub     r5, lr, #1
        cmp     r5, #5
        sublt   r10, r6, #8
        blt     LCQI6
        sub     r10, r6, #8
        sub     r9, lr, #5
        sub     r8, r6, #0x2C
        sub     r7, r4, #0x24
        sub     r5, r10, #0x2C
LCQI5:
        ldr     r11, [r7, #0x34]
        ldr     r0, [r7, #0x38]
        str     r11, [r5, #0x3C]
        str     r0, [r5, #0x40]!
        ldr     r0, [r7, #0x40]
        ldr     r11, [r7, #0x3C]
        add     r7, r7, #0x40
        str     r0, [r8, #0x40]
        add     r0, r12, #1
        str     r11, [r8, #0x3C]
        ldr     r2, [r4, +r0, lsl #4]
        add     r11, r4, r0, lsl #4
        ldr     r1, [r11, #4]
        str     r2, [r10, +r0, lsl #4]
        add     r2, r10, r0, lsl #4
        str     r1, [r2, #4]
        ldr     r1, [r11, #8]
        ldr     r11, [r11, #0xC]
        add     r2, r6, r0, lsl #4
        str     r1, [r6, +r0, lsl #4]
        add     r0, r12, #2
        str     r11, [r2, #4]
        ldr     r2, [r4, +r0, lsl #4]
        add     r11, r4, r0, lsl #4
        ldr     r1, [r11, #4]
        str     r2, [r10, +r0, lsl #4]
        add     r2, r10, r0, lsl #4
        add     r8, r8, #0x40
        str     r1, [r2, #4]
        ldr     r1, [r11, #8]
        ldr     r11, [r11, #0xC]
        add     r2, r6, r0, lsl #4
        str     r1, [r6, +r0, lsl #4]
        add     r0, r12, #3
        str     r11, [r2, #4]
        ldr     r2, [r4, +r0, lsl #4]
        add     r11, r4, r0, lsl #4
        ldr     r1, [r11, #4]
        str     r2, [r10, +r0, lsl #4]
        add     r2, r10, r0, lsl #4
        add     r12, r12, #4
        str     r1, [r2, #4]
        ldr     r1, [r11, #8]
        ldr     r11, [r11, #0xC]
        cmp     r12, r9
        str     r1, [r6, +r0, lsl #4]
        add     r0, r6, r0, lsl #4
        str     r11, [r0, #4]
        ble     LCQI5
LCQI6:
        mov     r7, r12, lsl #4
        sub     r5, r7, #0xC
        sub     r7, r7, #4
        add     r4, r7, r4
        add     r6, r5, r6
        add     r0, r5, r10
LCQI7:
        ldr     r2, [r4, #4]
        ldr     r1, [r4, #8]
        str     r2, [r10, +r12, lsl #4]
        add     r12, r12, #1
        cmp     r12, lr
        str     r1, [r0, #0x10]!
        ldr     r2, [r4, #0xC]
        ldr     r1, [r4, #0x10]!
        str     r2, [r6, #0xC]
        str     r1, [r6, #0x10]!
        blt     LCQI7
        mov     r0, #0
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LCQI8:
        bic     r5, r8, #1
        ldr     lr, [r4, +r5, lsl #3]
        add     r5, r4, r5, lsl #3
        ldr     r5, [r5, #4]
        mov     r8, r8, asr #1
        cmp     r8, #1
        str     lr, [r6, #8]
        str     r5, [r6, #0xC]
        add     r10, r6, #8
        ble     LCQI12
        sub     lr, r8, #1
        cmp     lr, #5
        blt     LCQI10
        sub     r9, r8, #5
        sub     r7, r6, #0x2C
        sub     r5, r4, #0x24
        sub     lr, r6, #0x24
LCQI9:
        ldr     r11, [r5, #0x38]
        ldr     r0, [r5, #0x34]
        str     r11, [r7, #0x40]
        str     r0, [r7, #0x3C]
        ldr     r0, [r5, #0x3C]
        ldr     r11, [r5, #0x40]!
        add     r7, r7, #0x40
        str     r0, [lr, #0x3C]
        add     r0, r12, #1
        str     r11, [lr, #0x40]!
        ldr     r2, [r4, +r0, lsl #4]
        add     r11, r4, r0, lsl #4
        ldr     r1, [r11, #4]
        str     r2, [r6, +r0, lsl #4]
        add     r2, r6, r0, lsl #4
        str     r1, [r2, #4]
        ldr     r1, [r11, #8]
        ldr     r11, [r11, #0xC]
        add     r2, r10, r0, lsl #4
        str     r1, [r10, +r0, lsl #4]
        add     r0, r12, #2
        str     r11, [r2, #4]
        ldr     r2, [r4, +r0, lsl #4]
        add     r11, r4, r0, lsl #4
        ldr     r1, [r11, #4]
        str     r2, [r6, +r0, lsl #4]
        add     r2, r6, r0, lsl #4
        str     r1, [r2, #4]
        ldr     r1, [r11, #8]
        ldr     r11, [r11, #0xC]
        add     r2, r10, r0, lsl #4
        str     r1, [r10, +r0, lsl #4]
        add     r0, r12, #3
        str     r11, [r2, #4]
        ldr     r2, [r4, +r0, lsl #4]
        add     r11, r4, r0, lsl #4
        ldr     r1, [r11, #4]
        str     r2, [r6, +r0, lsl #4]
        add     r2, r6, r0, lsl #4
        add     r12, r12, #4
        str     r1, [r2, #4]
        ldr     r1, [r11, #8]
        ldr     r11, [r11, #0xC]
        cmp     r12, r9
        str     r1, [r10, +r0, lsl #4]
        add     r0, r10, r0, lsl #4
        str     r11, [r0, #4]
        ble     LCQI9
LCQI10:
        mov     r5, r12, lsl #4
        sub     lr, r5, #0xC
        sub     r5, r5, #4
        add     r4, r5, r4
        add     r6, lr, r6
        add     r10, lr, r10
LCQI11:
        ldr     r0, [r4, #4]
        ldr     r1, [r4, #8]
        add     r12, r12, #1
        str     r0, [r6, #0xC]
        cmp     r12, r8
        str     r1, [r6, #0x10]!
        ldr     r0, [r4, #0xC]
        ldr     r1, [r4, #0x10]!
        str     r0, [r10, #0xC]
        str     r1, [r10, #0x10]!
        blt     LCQI11
LCQI12:
        mov     r0, #0
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}


