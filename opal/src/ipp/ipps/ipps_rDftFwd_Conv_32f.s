        .text
        .align  4
        .globl  _ipps_rDftFwd_Conv_32f


_ipps_rDftFwd_Conv_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        mov     r5, r0
        ldr     r8, [r5, #4]
        ldr     r7, [r5, #0x2C]
        cmp     r8, #0
        mov     r6, r2
        mov     r4, r3
        ble     LCLX3
        cmp     r8, #4
        mov     r11, #0
        movlt   r0, r11
        blt     LCLX1
        mov     r0, r11
        str     r6, [sp, #0xC]
        sub     r12, r8, #4
        str     r7, [sp, #4]
        mov     r6, r5
        sub     r10, r4, #0x14
        mov     r9, r1
        str     r12, [sp]
        str     r8, [sp, #8]
        mov     r5, r0
        mov     r7, r1
LCLX0:
        ldr     r0, [r9]
        ldr     r12, [r6, #0x3C]
        add     r8, r5, #1
        ldr     r1, [r12, +r5, lsl #3]
        bl      __mulsf3
        str     r0, [r10, #0x14]
        ldr     r12, [r6, #0x3C]
        ldr     r0, [r9], #0xC
        add     r12, r12, r11
        ldr     r1, [r12, #4]
        add     r11, r11, #0x18
        bl      __mulsf3
        str     r0, [r10, #0x18]!
        ldr     r12, [r6, #0x3C]
        ldr     r0, [r7, +r8, lsl #2]
        ldr     r1, [r12, +r8, lsl #3]
        add     r12, r4, r8, lsl #3
        str     r12, [sp, #0x10]
        bl      __mulsf3
        str     r0, [r4, +r8, lsl #3]
        ldr     r0, [r7, +r8, lsl #2]
        ldr     r12, [r6, #0x3C]
        add     r8, r12, r8, lsl #3
        ldr     r1, [r8, #4]
        add     r8, r5, #2
        add     r5, r5, #3
        bl      __mulsf3
        ldr     r12, [sp, #0x10]
        str     r0, [r12, #4]
        ldr     r12, [r6, #0x3C]
        ldr     r0, [r7, +r8, lsl #2]
        ldr     r1, [r12, +r8, lsl #3]
        bl      __mulsf3
        str     r0, [r4, +r8, lsl #3]
        ldr     r12, [r6, #0x3C]
        ldr     r0, [r7, +r8, lsl #2]
        add     r12, r12, r8, lsl #3
        ldr     r1, [r12, #4]
        add     r8, r4, r8, lsl #3
        bl      __mulsf3
        ldr     r12, [sp]
        str     r0, [r8, #4]
        cmp     r5, r12
        ble     LCLX0
        mov     r0, r5
        mov     r5, r6
        mov     r1, r7
        ldr     r7, [sp, #4]
        ldr     r8, [sp, #8]
        ldr     r6, [sp, #0xC]
LCLX1:
        mov     r11, r0, lsl #3
        sub     r12, r11, #4
        str     r6, [sp, #0xC]
        add     r10, r12, r4
        add     r9, r1, r0, lsl #2
        mov     r6, r0
LCLX2:
        ldr     r12, [r5, #0x3C]
        ldr     r0, [r9]
        ldr     r1, [r12, +r6, lsl #3]
        add     r6, r6, #1
        bl      __mulsf3
        str     r0, [r10, #4]
        ldr     r12, [r5, #0x3C]
        ldr     r0, [r9], #4
        add     r12, r12, r11
        ldr     r1, [r12, #4]
        add     r11, r11, #8
        bl      __mulsf3
        str     r0, [r10, #8]!
        cmp     r6, r8
        blt     LCLX2
        ldr     r6, [sp, #0xC]
LCLX3:
        cmp     r8, r7
        bge     LCLX4
        sub     r1, r7, r8
        add     r0, r4, r8, lsl #3
        bl      _ipps_cbZero_32fc
LCLX4:
        ldr     r2, [r5, #0x48]
        add     r9, r4, r7, lsl #3
        mov     r0, r4
        mov     r3, r9
        mov     r1, r4
        bl      _ippsFFTFwd_CToC_32fc
        cmp     r0, #0
        addne   sp, sp, #0x14
        ldmneia sp!, {r4 - r11, pc}
        ldr     r0, [r5, #0x40]
        mov     r3, r7
        mov     r2, r4
        mov     r1, r4
        bl      _ipps_cbMpy3_32fc
        ldr     r2, [r5, #0x48]
        mov     r3, r9
        mov     r0, r4
        mov     r1, r4
        bl      _ippsFFTInv_CToC_32fc
        cmp     r0, #0
        addne   sp, sp, #0x14
        ldmneia sp!, {r4 - r11, pc}
        ldr     r0, [r5, #0x3C]
        mov     r3, r8
        mov     r2, r4
        mov     r1, r4
        bl      _ipps_cbMpy3_32fc
        ldr     lr, [r4]
        tst     r8, #1
        mov     r12, #1
        str     lr, [r6]
        beq     LCLX8
        add     r8, r8, #1
        mov     lr, r8, asr #1
        cmp     lr, #1
        ble     LCLX12
        sub     r5, lr, #1
        cmp     r5, #5
        sublt   r0, r6, #4
        blt     LCLX6
        sub     r0, r6, #4
        sub     r11, lr, #5
        sub     r10, r4, #0x14
        add     r9, r0, #8
        add     r8, r6, #8
LCLX5:
        ldr     r5, [r10, #0x1C]
        str     r5, [r9], #0x20
        ldr     r5, [r10, #0x20]!
        str     r5, [r8], #0x20
        add     r5, r12, #1
        ldr     r7, [r4, +r5, lsl #3]
        add     r1, r4, r5, lsl #3
        str     r7, [r0, +r5, lsl #3]
        ldr     r1, [r1, #4]
        add     r7, r12, #2
        str     r1, [r6, +r5, lsl #3]
        ldr     r5, [r4, +r7, lsl #3]
        add     r1, r4, r7, lsl #3
        str     r5, [r0, +r7, lsl #3]
        ldr     r1, [r1, #4]
        add     r5, r12, #3
        add     r12, r12, #4
        str     r1, [r6, +r7, lsl #3]
        ldr     r7, [r4, +r5, lsl #3]
        add     r1, r4, r5, lsl #3
        cmp     r12, r11
        str     r7, [r0, +r5, lsl #3]
        ldr     r1, [r1, #4]
        str     r1, [r6, +r5, lsl #3]
        ble     LCLX5
LCLX6:
        mov     r5, r12, lsl #3
        sub     r5, r5, #4
        add     r4, r5, r4
        add     r6, r6, r12, lsl #3
LCLX7:
        ldr     r1, [r4, #4]
        str     r1, [r0, +r12, lsl #3]
        ldr     r1, [r4, #8]!
        add     r12, r12, #1
        cmp     r12, lr
        str     r1, [r6], #8
        blt     LCLX7
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCLX8:
        bic     lr, r8, #1
        ldr     lr, [r4, +lr, lsl #2]
        mov     r8, r8, asr #1
        cmp     r8, #1
        str     lr, [r6, #4]
        add     r0, r6, #4
        ble     LCLX12
        sub     lr, r8, #1
        cmp     lr, #5
        blt     LCLX10
        sub     r11, r8, #5
        sub     r10, r4, #0x14
        add     r9, r6, #8
        add     r7, r6, #0xC
LCLX9:
        ldr     lr, [r10, #0x1C]
        str     lr, [r9], #0x20
        ldr     lr, [r10, #0x20]!
        str     lr, [r7], #0x20
        add     lr, r12, #1
        ldr     r1, [r4, +lr, lsl #3]
        add     r5, r4, lr, lsl #3
        str     r1, [r6, +lr, lsl #3]
        ldr     r1, [r5, #4]
        add     r5, r12, #2
        str     r1, [r0, +lr, lsl #3]
        ldr     r1, [r4, +r5, lsl #3]
        add     lr, r4, r5, lsl #3
        str     r1, [r6, +r5, lsl #3]
        ldr     r1, [lr, #4]
        add     lr, r12, #3
        add     r12, r12, #4
        str     r1, [r0, +r5, lsl #3]
        ldr     r1, [r4, +lr, lsl #3]
        add     r5, r4, lr, lsl #3
        cmp     r12, r11
        str     r1, [r6, +lr, lsl #3]
        ldr     r5, [r5, #4]
        str     r5, [r0, +lr, lsl #3]
        ble     LCLX9
LCLX10:
        mov     lr, r12, lsl #3
        sub     lr, lr, #4
        add     r4, lr, r4
        add     r6, r6, r12, lsl #3
        add     r0, r0, r12, lsl #3
LCLX11:
        ldr     r1, [r4, #4]
        add     r12, r12, #1
        cmp     r12, r8
        str     r1, [r6], #8
        ldr     r1, [r4, #8]!
        str     r1, [r0], #8
        blt     LCLX11
LCLX12:
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}


