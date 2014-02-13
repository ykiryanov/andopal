        .text
        .align  4
        .globl  _ipps_rDftInv_Conv_64f


_ipps_rDftInv_Conv_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        mov     r6, r0
        ldr     r12, [r1, #4]
        ldr     r9, [r6, #4]
        ldr     lr, [r1]
        ldr     r7, [r6, #0x30]
        mov     r4, r3
        str     r12, [r4, #4]
        mov     r12, #0
        tst     r9, #1
        str     lr, [r4]
        mov     r5, r2
        str     r12, [r4, #8]
        str     r12, [r4, #0xC]
        mov     r0, #1
        beq     LCQH1
        add     r12, r9, #1
        mov     r12, r12, asr #1
        cmp     r12, #1
        ble     LCQH4
        sub     lr, r1, #8
        add     r1, r1, #4
        add     lr, lr, #4
        add     r2, r4, r9, lsl #4
        add     r11, r4, #0xC
LCQH0:
        ldr     r10, [lr, #0xC]
        ldr     r8, [lr, #0x10]
        str     r10, [r11, #4]
        str     r8, [r11, #8]
        ldr     r10, [r1, #0x10]
        ldr     r8, [r1, #0xC]
        eor     r10, r10, #2, 2
        str     r10, [r11, #0x10]
        str     r8, [r11, #0xC]
        ldr     r3, [lr, #0xC]
        ldr     r10, [lr, #0x10]!
        rsb     r8, r0, #0
        str     r3, [r2, +r8, lsl #4]
        add     r8, r2, r8, lsl #4
        str     r10, [r8, #4]
        ldr     r3, [r1, #0xC]
        ldr     r10, [r1, #0x10]!
        add     r0, r0, #1
        cmp     r0, r12
        add     r11, r11, #0x10
        str     r3, [r8, #8]
        str     r10, [r8, #0xC]
        blt     LCQH0
        b       LCQH4
LCQH1:
        mov     r11, r9, asr #1
        cmp     r11, #1
        ble     LCQH3
        add     r10, r4, r9, lsl #4
        add     r8, r1, #4
        add     lr, r4, #0xC
        add     r12, r1, #0xC
        str     r1, [sp, #4]
        str     r6, [sp]
LCQH2:
        ldr     r6, [r8, #0x10]
        ldr     r2, [r8, #0xC]
        rsb     r1, r0, #0
        str     r6, [lr, #8]
        add     r0, r0, #1
        str     r2, [lr, #4]
        ldr     r3, [r12, #0x10]
        ldr     r6, [r12, #0xC]
        add     r2, r10, r1, lsl #4
        eor     r3, r3, #2, 2
        str     r3, [lr, #0x10]
        str     r6, [lr, #0xC]
        ldr     r6, [r8, #0xC]
        ldr     r3, [r8, #0x10]!
        str     r6, [r10, +r1, lsl #4]
        add     lr, lr, #0x10
        str     r3, [r2, #4]
        ldr     r6, [r12, #0xC]
        ldr     r1, [r12, #0x10]!
        cmp     r0, r11
        str     r6, [r2, #8]
        str     r1, [r2, #0xC]
        blt     LCQH2
        ldr     r1, [sp, #4]
        ldr     r6, [sp]
LCQH3:
        ldr     r12, [r1, #8]
        ldr     r1, [r1, #0xC]
        bic     lr, r9, #1
        str     r12, [r4, +lr, lsl #3]
        add     r12, r4, lr, lsl #3
        mov     lr, #0
        str     r1, [r12, #4]
        str     lr, [r12, #8]
        str     lr, [r12, #0xC]
LCQH4:
        ldr     r0, [r6, #0x40]
        mov     r3, r9
        mov     r2, r4
        mov     r1, r4
        bl      _ipps_cbMpy3_64fc
        cmp     r9, r7
        bge     LCQH5
        sub     r1, r7, r9
        add     r0, r4, r9, lsl #4
        bl      _ipps_cbZero_64fc
LCQH5:
        ldr     r2, [r6, #0x4C]
        add     r8, r4, r7, lsl #4
        mov     r0, r4
        mov     r3, r8
        mov     r1, r4
        bl      _ippsFFTFwd_CToC_64fc
        cmp     r0, #0
        addne   sp, sp, #0x20
        ldmneia sp!, {r4 - r11, pc}
        ldr     r0, [r6, #0x44]
        mov     r3, r7
        mov     r2, r4
        mov     r1, r4
        bl      _ipps_cbMpy3_64fc
        ldr     r2, [r6, #0x4C]
        mov     r3, r8
        mov     r0, r4
        mov     r1, r4
        bl      _ippsFFTInv_CToC_64fc
        cmp     r0, #0
        addne   sp, sp, #0x20
        ldmneia sp!, {r4 - r11, pc}
        cmp     r9, #0
        ble     LCQH9
        cmp     r9, #4
        mov     r12, #0
        movlt   r8, r12
        blt     LCQH7
        mov     r8, r12
        sub     r10, r9, #4
        sub     lr, r5, #0x14
        sub     r7, r4, #0x24
        str     lr, [sp, #0xC]
        str     r10, [sp, #4]
        str     r12, [sp, #0x10]
        str     r9, [sp, #8]
LCQH6:
        ldr     lr, [r6, #0x40]
        ldr     r12, [sp, #0x10]
        ldr     r0, [r7, #0x24]
        ldr     r2, [lr, +r8, lsl #4]
        ldr     r1, [r7, #0x28]
        add     lr, r12, lr
        ldr     r12, [sp, #0x10]
        str     lr, [sp, #0x14]
        add     r12, r12, #0x30
        str     r12, [sp, #0x10]
        ldr     r12, [sp, #0x14]
        add     r10, r8, #1
        ldr     r3, [r12, #4]
        add     r11, r8, #2
        add     r9, r4, r10, lsl #4
        add     r8, r8, #3
        bl      __muldf3
        ldr     r12, [r7, #0x2C]
        ldr     lr, [sp, #0x14]
        str     r12, [sp, #0x18]
        ldr     r2, [lr, #8]
        ldr     r3, [lr, #0xC]
        ldr     r12, [r7, #0x30]!
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0x18]
        str     r1, [sp, #0x1C]
        mov     r1, r12
        bl      __muldf3
        mov     r3, r1
        ldr     r1, [sp, #0x1C]
        mov     r2, r0
        ldr     r0, [sp, #0x14]
        bl      __subdf3
        ldr     r12, [sp, #0xC]
        str     r1, [r12, #0x18]
        str     r0, [r12, #0x14]
        add     r12, r12, #0x18
        str     r12, [sp, #0xC]
        ldr     r12, [r6, #0x40]
        ldr     r0, [r4, +r10, lsl #4]
        ldr     r2, [r12, +r10, lsl #4]
        add     r12, r12, r10, lsl #4
        str     r12, [sp, #0x1C]
        ldr     r1, [r9, #4]
        ldr     r3, [r12, #4]
        bl      __muldf3
        ldr     r12, [sp, #0x1C]
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x14]
        ldr     r2, [r12, #8]
        ldr     r3, [r12, #0xC]
        ldr     r0, [r9, #8]
        ldr     r1, [r9, #0xC]
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x18]
        mov     r3, r1
        ldr     r1, [sp, #0x14]
        bl      __subdf3
        str     r0, [r5, +r10, lsl #3]
        add     r10, r5, r10, lsl #3
        str     r1, [r10, #4]
        ldr     r12, [r6, #0x40]
        ldr     r0, [r4, +r11, lsl #4]
        add     r10, r4, r11, lsl #4
        ldr     r2, [r12, +r11, lsl #4]
        ldr     r1, [r10, #4]
        add     r9, r12, r11, lsl #4
        ldr     r3, [r9, #4]
        add     r12, r5, r11, lsl #3
        str     r12, [sp, #0x1C]
        bl      __muldf3
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x14]
        ldr     r0, [r10, #8]
        ldr     r1, [r10, #0xC]
        ldr     r2, [r9, #8]
        ldr     r3, [r9, #0xC]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #0x14]
        bl      __subdf3
        ldr     r12, [sp, #4]
        str     r0, [r5, +r11, lsl #3]
        cmp     r8, r12
        ldr     r12, [sp, #0x1C]
        str     r1, [r12, #4]
        ble     LCQH6
        ldr     r9, [sp, #8]
LCQH7:
        mov     r12, r8, lsl #3
        mov     r7, r8, lsl #4
        sub     r12, r12, #4
        sub     lr, r7, #4
        add     r4, lr, r4
        add     r5, r12, r5
        str     r9, [sp, #8]
LCQH8:
        ldr     r2, [r6, #0x40]
        ldr     r0, [r4, #4]
        ldr     r1, [r4, #8]
        add     r11, r7, r2
        ldr     r2, [r2, +r8, lsl #4]
        ldr     r3, [r11, #4]
        bl      __muldf3
        ldr     r2, [r4, #0xC]
        ldr     r12, [r4, #0x10]!
        ldr     r3, [r11, #0xC]
        ldr     lr, [r11, #8]
        mov     r9, r0
        mov     r0, r2
        mov     r10, r1
        mov     r1, r12
        mov     r2, lr
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r9
        mov     r1, r10
        bl      __subdf3
        str     r1, [r5, #8]
        str     r0, [r5, #4]
        ldr     r1, [sp, #8]
        add     r8, r8, #1
        add     r7, r7, #0x10
        cmp     r8, r1
        add     r5, r5, #8
        blt     LCQH8
LCQH9:
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}


