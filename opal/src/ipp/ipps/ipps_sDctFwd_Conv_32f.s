        .text
        .align  4
        .globl  _ipps_sDctFwd_Conv_32f


_ipps_sDctFwd_Conv_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x3C
        mov     r8, r0
        ldr     r5, [r8, #4]
        ldr     r0, [r8, #0x44]
        ldr     r7, [r8, #0x30]
        mov     r4, r3
        mov     r10, r1
        mov     r3, r5, asr #1
        mov     r6, r2
        mov     r2, r4
        bl      _ipps_cbMpy3_32fc
        ands    r9, r5, #1
        beq     LCSG0
        ldr     r12, [r8, #0x44]
        bic     r11, r5, #1
        sub     r10, r10, #4
        ldr     r1, [r12, +r11, lsl #2]
        ldr     r0, [r10, +r5, lsl #2]
        add     r12, r4, r11, lsl #2
        str     r12, [sp, #0x10]
        bl      __mulsf3
        str     r0, [r4, +r11, lsl #2]
        ldr     r12, [r8, #0x44]
        ldr     r0, [r10, +r5, lsl #2]
        add     r11, r12, r11, lsl #2
        ldr     r1, [r11, #4]
        bl      __mulsf3
        ldr     r12, [sp, #0x10]
        str     r0, [r12, #4]
LCSG0:
        rsb     r12, r9, #0
        sub     r12, r12, r5
        add     lr, r4, r5, lsl #2
        add     r0, lr, r9, lsl #2
        add     r1, r12, r7, lsl #1
        bl      _ippsZero_32f
        ldr     r2, [r8, #0x50]
        add     r10, r4, r7, lsl #3
        mov     r0, r4
        mov     r3, r10
        mov     r1, r4
        bl      _ippsFFTFwd_CToC_32fc
        cmp     r0, #0
        addne   sp, sp, #0x3C
        ldmneia sp!, {r4 - r11, pc}
        ldr     r0, [r8, #0x48]
        mov     r3, r7
        mov     r2, r4
        mov     r1, r4
        bl      _ipps_cbMpy3_32fc
        ldr     r2, [r8, #0x50]
        mov     r3, r10
        mov     r0, r4
        mov     r1, r4
        bl      _ippsFFTInv_CToC_32fc
        cmp     r0, #0
        addne   sp, sp, #0x3C
        ldmneia sp!, {r4 - r11, pc}
        ldr     r0, [r8, #0x44]
        mov     r3, r5
        mov     r2, r4
        mov     r1, r4
        bl      _ipps_cbMpy3_32fc
        ldr     r12, [r8, #0x40]
        ldr     r10, [r4]
        ldr     r11, [r4, #4]
        str     r12, [sp, #8]
        add     r7, r4, #4
        mov     r1, r10
        mov     r0, r11
        bl      __addsf3
        str     r0, [sp, #4]
        mov     r0, r10
        mov     r1, r11
        bl      __subsf3
        ldr     r12, [sp, #4]
        str     r0, [r4, #4]
        str     r12, [r4]
        mov     r12, r5, lsl #1
        cmp     r5, #2
        sub     lr, r12, #2
        ble     LCSG2
        ldr     r2, [sp, #8]
        add     r1, r7, lr, lsl #2
        add     r0, r4, lr, lsl #2
        add     lr, r2, #8
        mov     r12, #2
        add     r2, r2, #0xC
        str     r7, [sp, #0x10]
        str     r8, [sp, #0x20]
        add     r11, r4, #8
        add     r10, r4, #0xC
        str     r2, [sp, #8]
        str     lr, [sp, #4]
        str     r12, [sp]
        str     r9, [sp, #0x14]
        str     r5, [sp, #0xC]
        str     r4, [sp, #0x18]
        str     r6, [sp, #0x1C]
        mov     r8, r0
        mov     r7, r1
LCSG1:
        ldr     r2, [sp]
        add     r2, r2, #2
        str     r2, [sp]
        ldr     r0, [r11]
        str     r0, [sp, #0x24]
        ldr     r1, [r8]
        str     r1, [sp, #0x28]
        bl      __subsf3
        ldr     r6, [r10]
        ldr     r2, [r7]
        mov     r4, r0
        mov     r0, r6
        str     r2, [sp, #0x2C]
        ldr     r1, [sp, #0x2C]
        bl      __addsf3
        ldr     r2, [sp, #4]
        ldr     r9, [r2]
        ldr     r2, [sp, #8]
        ldr     r2, [r2]
        str     r0, [sp, #0x34]
        mov     r0, r4
        str     r2, [sp, #0x30]
        ldr     r1, [sp, #0x30]
        bl      __mulsf3
        str     r0, [sp, #0x38]
        ldr     r0, [sp, #0x34]
        mov     r1, r9
        bl      __mulsf3
        ldr     r1, [sp, #0x38]
        bl      __addsf3
        ldr     r1, [sp, #0x30]
        mov     r5, r0
        ldr     r0, [sp, #0x34]
        bl      __mulsf3
        str     r0, [sp, #0x38]
        mov     r0, r4
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x38]
        bl      __subsf3
        mov     r4, r0
        ldr     r0, [sp, #0x24]
        mov     r1, r5
        bl      __subsf3
        str     r0, [sp, #0x38]
        ldr     r0, [sp, #0x28]
        mov     r1, r5
        bl      __addsf3
        mov     r5, r0
        mov     r1, r6
        mov     r0, r4
        bl      __subsf3
        ldr     r1, [sp, #0x2C]
        mov     r6, r0
        mov     r0, r4
        bl      __subsf3
        str     r5, [r11], #8
        ldr     r2, [sp, #0x38]
        str     r2, [r8], #-8
        str     r0, [r10], #8
        str     r6, [r7], #-8
        ldr     r2, [sp, #4]
        ldr     r3, [sp]
        add     r2, r2, #8
        str     r2, [sp, #4]
        ldr     r2, [sp, #8]
        add     r2, r2, #8
        str     r2, [sp, #8]
        ldr     r2, [sp, #0xC]
        cmp     r3, r2
        blt     LCSG1
        ldr     r7, [sp, #0x10]
        ldr     r9, [sp, #0x14]
        ldr     r5, [sp, #0xC]
        ldr     r4, [sp, #0x18]
        ldr     r6, [sp, #0x1C]
        ldr     r8, [sp, #0x20]
LCSG2:
        cmp     r9, #0
        bne     LCSG3
        ldr     r12, [r7, +r5, lsl #2]
        eor     r12, r12, #2, 2
        str     r12, [r7, +r5, lsl #2]
LCSG3:
        ldr     r12, [r8, #0x3C]
        cmp     r5, #0
        ble     LCSG7
        cmp     r5, #4
        mov     r10, #0
        addlt   r11, r12, #4
        blt     LCSG5
        add     r11, r12, #4
        sub     lr, r5, #4
        mov     r1, r4
        mov     r0, r12
        mov     r2, r6
        str     r5, [sp, #0xC]
        str     r4, [sp, #0x18]
        mov     r8, r7
        mov     r9, r11
        str     r11, [sp, #8]
        str     r2, [sp, #0x14]
        str     lr, [sp, #0x20]
        str     r12, [sp, #4]
        str     r6, [sp, #0x1C]
        mov     r4, r0
        mov     r5, r1
LCSG4:
        ldr     r0, [r5], #0x18
        ldr     r1, [r4], #0x18
        add     r11, r10, #1
        bl      __mulsf3
        ldr     r1, [r9], #0x18
        ldr     r2, [r8], #0x18
        str     r0, [sp, #0x38]
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #0x38]
        bl      __addsf3
        ldr     r2, [sp, #0x14]
        str     r0, [r2], #0xC
        str     r2, [sp, #0x14]
        ldr     r2, [sp, #0x18]
        ldr     r0, [r2, +r11, lsl #3]
        ldr     r2, [sp, #4]
        add     r6, r10, #2
        add     r10, r10, #3
        ldr     r1, [r2, +r11, lsl #3]
        bl      __mulsf3
        ldr     r2, [sp, #8]
        ldr     r1, [r2, +r11, lsl #3]
        str     r0, [sp, #0x38]
        ldr     r0, [r7, +r11, lsl #3]
        bl      __mulsf3
        ldr     r1, [sp, #0x38]
        bl      __addsf3
        ldr     r2, [sp, #0x1C]
        str     r0, [r2, +r11, lsl #2]
        ldr     r2, [sp, #0x18]
        ldr     r0, [r2, +r6, lsl #3]
        ldr     r2, [sp, #4]
        ldr     r1, [r2, +r6, lsl #3]
        bl      __mulsf3
        ldr     r2, [sp, #8]
        mov     r11, r0
        ldr     r0, [r7, +r6, lsl #3]
        ldr     r1, [r2, +r6, lsl #3]
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r2, [sp, #0x20]
        cmp     r10, r2
        ldr     r2, [sp, #0x1C]
        str     r0, [r2, +r6, lsl #2]
        ble     LCSG4
        ldr     r11, [sp, #8]
        ldr     r12, [sp, #4]
        ldr     r5, [sp, #0xC]
        ldr     r4, [sp, #0x18]
        ldr     r6, [sp, #0x1C]
LCSG5:
        add     r8, r4, r10, lsl #3
        add     r4, r12, r10, lsl #3
        add     r7, r7, r10, lsl #3
        add     r9, r6, r10, lsl #2
LCSG6:
        ldr     r0, [r8], #8
        ldr     r1, [r4], #8
        bl      __mulsf3
        ldr     r1, [r11, +r10, lsl #3]
        ldr     r2, [r7], #8
        mov     r6, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        add     r10, r10, #1
        str     r0, [r9], #4
        cmp     r10, r5
        blt     LCSG6
LCSG7:
        mov     r0, #0
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}


