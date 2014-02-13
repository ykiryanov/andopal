        .text
        .align  4
        .globl  _ipps_crFftFwd_Large_32f


_ipps_crFftFwd_Large_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        ldr     r9, [sp, #0x48]
        mov     r8, r0
        ldr     r7, [sp, #0x44]
        ldr     r10, [sp, #0x4C]
        ldr     r0, [r8, #0x20]
        mov     r5, r3
        mov     r11, #1
        cmp     r1, r5
        mov     r6, r2
        mov     r4, r11, lsl r9
        beq     LBZD10
        mov     r3, r0
        mov     r0, r1
        mov     r2, r4
        mov     r1, r5
        bl      _ipps_BitRev2_4
LBZD0:
        ldr     r2, [r8, #0x20]
        cmp     r6, r7
        beq     LBZD9
        mov     r3, r2
        mov     r0, r6
        mov     r2, r4
        mov     r1, r7
        bl      _ipps_BitRev2_4
LBZD1:
        ldr     lr, [pc, #0xE38]
        mov     r12, #0
        add     lr, lr, r9, lsl #2
        ldr     lr, [lr, #-0x24]
        cmp     lr, #0
        bne     LBZD7
        mov     r6, #1, 18
        cmp     r4, #1, 18
        movlt   r6, r4
        cmp     r4, #0
        ble     LBZD6
        mov     r10, #0
        mov     r9, #1, 24
LBZD2:
        cmp     r6, #0
        add     r0, r5, r10, lsl #2
        add     r1, r7, r10, lsl #2
        ble     LBZD5
        mov     r3, r1
        mov     r2, r0
        mov     r12, #0
        str     r10, [sp, #0x1C]
        str     r4, [sp, #0x18]
        str     r7, [sp, #0x14]
        str     r5, [sp, #0x10]
        mov     r11, r9
        mov     r9, r0
        mov     r7, r1
        mov     r4, r2
        mov     r5, r3
        mov     r10, r12
LBZD3:
        ldr     r3, [r8, #0x24]
        mov     r2, #1, 22
        mov     r1, r5
        mov     r0, r4
        bl      _ipps_crRadix4Fwd_32f
        ldr     lr, [r8, #8]
        cmp     lr, #0
        beq     LBZD4
        ldr     r0, [r8, #0x10]
        mov     r2, #1, 22
        mov     r1, r4
        bl      _ipps_rbMpy1_32f
        ldr     r0, [r8, #0x10]
        mov     r2, #1, 22
        mov     r1, r5
        bl      _ipps_rbMpy1_32f
LBZD4:
        add     r10, r10, #1, 22
        cmp     r10, r6
        add     r5, r5, #1, 20
        add     r4, r4, #1, 20
        blt     LBZD3
        mov     r1, r7
        mov     r0, r9
        mov     r9, r11
        ldr     r10, [sp, #0x1C]
        ldr     r4, [sp, #0x18]
        ldr     r7, [sp, #0x14]
        ldr     r5, [sp, #0x10]
        mov     r11, #1
LBZD5:
        str     r9, [sp, #8]
        str     r11, [sp, #4]
        ldr     r12, [r8, #0x28]
        str     r12, [sp]
        mov     r3, #1, 22
        mov     r2, r6
        bl      LBZD_crFft_Blk_R2
        add     r10, r6, r10
        cmp     r10, r4
        blt     LBZD2
LBZD6:
        cmp     r4, r6
        ble     LBZD8
        mov     r12, #1, 24
        str     r12, [sp, #8]
        mov     r12, #1
        str     r12, [sp, #4]
        ldr     r8, [r8, #0x2C]
        mov     r3, r6
        mov     r2, r4
        str     r8, [sp]
        mov     r1, r7
        mov     r0, r5
        bl      LBZD_crFft_Blk_R2
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBZD7:
        str     r12, [sp]
        str     r10, [sp, #4]
        mov     r3, r9
        mov     r2, r7
        mov     r1, r5
        mov     r0, r8
        bl      LBZD_crFftFwd_BlkStep
LBZD8:
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBZD9:
        mov     r1, r4
        mov     r0, r7
        bl      _ipps_BitRev1_4
        b       LBZD1
LBZD10:
        mov     r2, r0
        mov     r1, r4
        mov     r0, r5
        bl      _ipps_BitRev1_4
        b       LBZD0
LBZD_crFft_Blk_R2:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x74
        ldr     r7, [sp, #0x98]
        mov     r5, r0
        mov     r0, r2
        mov     r4, r3
        mov     r6, r1
        mov     r1, r4
        bl      __intel_idiv
        mov     r2, #6, 2
        smull   r12, r2, r4, r2
        add     r2, r4, r2
        mov     lr, r0, asr #1
        mov     r12, r4, asr #31
        cmp     lr, #0
        rsb     r2, r12, r2, asr #7
        ble     LBZD18
        mov     r1, r5
        str     r7, [sp]
        str     r6, [sp, #0x2C]
        mov     r5, r2
LBZD11:
        ldr     r6, [sp, #0x2C]
        cmp     r5, #0
        mov     r11, r1
        ble     LBZD17
        mvn     r2, #6, 2
        and     r2, r4, r2
        mov     r12, r4, lsl #2
        str     r4, [sp, #0x30]
        ldr     r4, [sp]
        mov     r10, #0
        mov     r3, r0, lsl #2
        mov     r9, r10
        sub     r8, lr, #1
        mov     r7, r0, lsl #7
        str     r3, [sp, #0x58]
        str     lr, [sp, #0x3C]
        str     r0, [sp, #0x34]
        str     r1, [sp, #0x28]
LBZD12:
        cmp     r8, #0
        mov     lr, r11
        mov     r3, r6
        mov     r1, r8
        blt     LBZD16
        add     r0, r4, r9, lsl #2
        str     r7, [sp, #0x54]
        str     r8, [sp, #0x50]
        str     r9, [sp, #0x4C]
        str     r10, [sp, #0x48]
        str     r6, [sp, #0x44]
        str     r11, [sp, #0x40]
        str     r5, [sp, #0x38]
LBZD13:
        add     r9, r12, lr
        add     r8, r12, r3
        add     r11, r3, #4
        mov     r10, r0
        mov     r7, #0
        add     r6, r9, #4
        add     r5, r8, #4
        add     r4, lr, #4
        str     r11, [sp, #0xC]
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x1C]
        str     r3, [sp, #0x10]
        str     lr, [sp, #0x14]
        str     r2, [sp, #0x20]
        str     r12, [sp, #0x24]
LBZD14:
        ldr     r0, [r10]
        str     r0, [sp, #8]
        ldr     r0, [r9]
        ldr     r1, [sp, #8]
        str     r0, [sp, #4]
        ldr     r0, [r8]
        str     r0, [sp, #0x5C]
        ldr     r0, [sp, #0x58]
        add     r0, r10, r0
        str     r0, [sp, #0x60]
        ldr     r0, [sp, #4]
        bl      __mulsf3
        ldr     r11, [r10, #4]
        str     r0, [sp, #0x64]
        ldr     r0, [sp, #0x5C]
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x64]
        bl      __subsf3
        str     r0, [sp, #0x64]
        ldr     r0, [sp, #0x5C]
        ldr     r1, [sp, #8]
        bl      __mulsf3
        str     r0, [sp, #0x5C]
        ldr     r0, [sp, #4]
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x5C]
        bl      __addsf3
        ldr     r2, [sp, #0x14]
        ldr     r1, [sp, #0x64]
        mov     r11, r0
        ldr     r2, [r2, +r7, lsl #2]
        str     r2, [sp, #0x5C]
        ldr     r0, [sp, #0x5C]
        bl      __subsf3
        ldr     r2, [sp, #0x10]
        mov     r1, r11
        ldr     r2, [r2, +r7, lsl #2]
        str     r0, [sp, #4]
        str     r2, [sp, #8]
        ldr     r0, [sp, #8]
        bl      __subsf3
        ldr     r1, [sp, #0x64]
        str     r0, [sp, #0x68]
        ldr     r0, [sp, #0x5C]
        bl      __addsf3
        str     r0, [sp, #0x64]
        ldr     r0, [sp, #8]
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [sp, #4]
        str     r1, [r9], #8
        ldr     r1, [sp, #0x68]
        str     r1, [r8], #8
        ldr     r1, [sp, #0x64]
        ldr     r2, [sp, #0x14]
        str     r1, [r2, +r7, lsl #2]
        ldr     r1, [sp, #0x10]
        str     r0, [r1, +r7, lsl #2]
        ldr     r0, [r6]
        add     r7, r7, #2
        str     r0, [sp, #0x68]
        ldr     r0, [sp, #0x58]
        ldr     r0, [r10, +r0]
        str     r0, [sp, #0x64]
        ldr     r0, [sp, #0x60]
        ldr     r1, [sp, #0x64]
        ldr     r11, [r0, #4]
        ldr     r0, [sp, #0x68]
        bl      __mulsf3
        ldr     r10, [r5]
        str     r0, [sp, #0x5C]
        mov     r1, r11
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x5C]
        bl      __subsf3
        str     r0, [sp, #0x5C]
        ldr     r0, [sp, #0x68]
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x64]
        mov     r11, r0
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r11, [r4]
        ldr     r1, [sp, #0x5C]
        ldr     r2, [sp, #0x60]
        ldr     r3, [sp, #0x58]
        str     r0, [sp, #0x68]
        mov     r0, r11
        add     r10, r2, r3
        bl      __subsf3
        ldr     r1, [sp, #0xC]
        ldr     r1, [r1]
        str     r0, [sp, #0x60]
        str     r1, [sp, #0x64]
        ldr     r1, [sp, #0x68]
        ldr     r0, [sp, #0x64]
        bl      __subsf3
        ldr     r1, [sp, #0x5C]
        str     r0, [sp, #8]
        mov     r0, r11
        bl      __addsf3
        mov     r11, r0
        ldr     r0, [sp, #0x64]
        ldr     r1, [sp, #0x68]
        bl      __addsf3
        ldr     r1, [sp, #0x60]
        cmp     r7, #0x80
        str     r1, [r6], #8
        ldr     r1, [sp, #8]
        str     r1, [r5], #8
        str     r11, [r4], #8
        ldr     r1, [sp, #0xC]
        str     r0, [r1], #8
        str     r1, [sp, #0xC]
        blt     LBZD14
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x10]
        ldr     lr, [sp, #0x14]
        ldr     r12, [sp, #0x24]
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #0x1C]
        add     r7, lr, r2, lsl #1
        add     r6, r3, r2, lsl #1
        add     r5, r12, r7
        add     r4, r12, r6
        str     r5, [sp, #0x14]
        str     r4, [sp, #0x10]
        mov     r3, #0
        add     r10, r5, #4
        add     r9, r4, #4
        add     lr, r7, #4
        add     r11, r6, #4
        mov     r8, r0
        str     r11, [sp, #0xC]
        str     lr, [sp, #4]
        str     r3, [sp, #8]
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x1C]
        str     r2, [sp, #0x20]
        str     r12, [sp, #0x24]
LBZD15:
        ldr     r0, [r4]
        str     r0, [sp, #0x68]
        ldr     r1, [r8]
        str     r1, [sp, #0x64]
        ldr     r1, [r5]
        str     r1, [sp, #0x60]
        ldr     r1, [sp, #0x58]
        add     r1, r8, r1
        str     r1, [sp, #0x5C]
        ldr     r1, [sp, #0x64]
        bl      __mulsf3
        ldr     r11, [r8, #4]
        ldr     r2, [sp, #8]
        str     r0, [sp, #0x6C]
        ldr     r0, [sp, #0x60]
        add     r2, r2, #2
        str     r2, [sp, #8]
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x6C]
        bl      __addsf3
        ldr     r1, [sp, #0x64]
        str     r0, [sp, #0x6C]
        ldr     r0, [sp, #0x60]
        bl      __mulsf3
        str     r0, [sp, #0x64]
        ldr     r0, [sp, #0x68]
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x64]
        bl      __subsf3
        ldr     r1, [r7]
        str     r0, [sp, #0x64]
        str     r1, [sp, #0x68]
        ldr     r0, [sp, #0x68]
        ldr     r1, [sp, #0x6C]
        bl      __subsf3
        ldr     r11, [r6]
        ldr     r1, [sp, #0x64]
        str     r0, [sp, #0x60]
        mov     r0, r11
        bl      __subsf3
        str     r0, [sp, #0x70]
        ldr     r1, [sp, #0x6C]
        ldr     r0, [sp, #0x68]
        bl      __addsf3
        ldr     r1, [sp, #0x64]
        str     r0, [sp, #0x6C]
        mov     r0, r11
        bl      __addsf3
        ldr     r1, [sp, #0x60]
        str     r1, [r5], #8
        ldr     r1, [sp, #0x70]
        str     r1, [r4], #8
        ldr     r1, [sp, #0x6C]
        str     r1, [r7], #8
        str     r0, [r6], #8
        ldr     r0, [r10]
        str     r0, [sp, #0x70]
        ldr     r0, [sp, #0x5C]
        ldr     r1, [r0, #4]
        ldr     r0, [sp, #0x58]
        str     r1, [sp, #0x6C]
        ldr     r11, [r8, +r0]
        ldr     r0, [sp, #0x70]
        bl      __mulsf3
        ldr     r8, [r9]
        str     r0, [sp, #0x68]
        mov     r0, r8
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x68]
        bl      __addsf3
        str     r0, [sp, #0x68]
        ldr     r0, [sp, #0x70]
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x6C]
        mov     r11, r0
        mov     r0, r8
        bl      __mulsf3
        mov     r1, r11
        bl      __subsf3
        ldr     r2, [sp, #4]
        ldr     r1, [sp, #0x68]
        mov     r8, r0
        ldr     r11, [r2]
        mov     r0, r11
        bl      __subsf3
        ldr     r2, [sp, #0xC]
        mov     r1, r8
        ldr     r2, [r2]
        str     r0, [sp, #0x6C]
        str     r2, [sp, #0x70]
        ldr     r0, [sp, #0x70]
        bl      __subsf3
        ldr     r1, [sp, #0x68]
        str     r0, [sp, #0x64]
        mov     r0, r11
        bl      __addsf3
        mov     r11, r0
        ldr     r0, [sp, #0x70]
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [sp, #0x6C]
        str     r1, [r10], #8
        ldr     r1, [sp, #0x64]
        str     r1, [r9], #8
        ldr     r1, [sp, #4]
        str     r11, [r1]
        ldr     r1, [sp, #0xC]
        str     r0, [r1], #8
        ldr     r0, [sp, #8]
        str     r1, [sp, #0xC]
        cmp     r0, #0x80
        ldr     r0, [sp, #4]
        ldr     r1, [sp, #0x5C]
        add     r0, r0, #8
        str     r0, [sp, #4]
        ldr     r0, [sp, #0x58]
        add     r8, r1, r0
        blt     LBZD15
        ldr     r3, [sp, #0x14]
        ldr     r2, [sp, #0x20]
        ldr     r1, [sp, #0x1C]
        ldr     r0, [sp, #0x18]
        ldr     r12, [sp, #0x24]
        add     lr, r3, r2, lsl #1
        ldr     r3, [sp, #0x10]
        subs    r1, r1, #1
        add     r3, r3, r2, lsl #1
        bpl     LBZD13
        ldr     r7, [sp, #0x54]
        ldr     r8, [sp, #0x50]
        ldr     r9, [sp, #0x4C]
        ldr     r10, [sp, #0x48]
        ldr     r6, [sp, #0x44]
        ldr     r11, [sp, #0x40]
        ldr     r5, [sp, #0x38]
        ldr     r4, [sp]
LBZD16:
        add     r10, r10, #1
        cmp     r10, r5
        add     r11, r11, #2, 24
        add     r6, r6, #2, 24
        add     r9, r7, r9
        blt     LBZD12
        ldr     lr, [sp, #0x3C]
        ldr     r0, [sp, #0x34]
        ldr     r4, [sp, #0x30]
        ldr     r1, [sp, #0x28]
LBZD17:
        mov     lr, lr, asr #1
        cmp     lr, #0
        mov     r4, r4, lsl #1
        mov     r5, r5, lsl #1
        mov     r0, r0, asr #1
        bgt     LBZD11
LBZD18:
        add     sp, sp, #0x74
        ldmia   sp!, {r4 - r11, pc}
LBZD_crFftFwd_BlkStep:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x60
        ldr     r12, [pc, #0x6C4]
        ldr     r7, [sp, #0x84]
        ldr     r5, [sp, #0x88]
        add     lr, r12, r3, lsl #2
        ldr     lr, [lr, #-0x24]
        mov     r9, r2
        sub     r8, r3, lr
        mov     r10, #1
        mov     r6, r0
        cmp     r8, #0xA
        mov     r4, r10, lsl lr
        mov     r2, r10, lsl r8
        mov     r3, r1
        mov     r0, r9
        bgt     LBZD21
        cmp     r4, #0
        ble     LBZD31
        mov     r10, r4
        str     r9, [sp, #0x18]
        mov     r11, r5
        str     r1, [sp, #0x1C]
        mov     r5, r0
        mov     r8, r2
        mov     r9, r3
LBZD19:
        ldr     r3, [r6, #0x24]
        mov     r2, r8
        mov     r1, r5
        mov     r0, r9
        bl      _ipps_crRadix4Fwd_32f
        ldr     r12, [r6, #8]
        cmp     r12, #0
        beq     LBZD20
        ldr     r0, [r6, #0x10]
        mov     r2, r8
        mov     r1, r9
        bl      _ipps_rbMpy1_32f
        ldr     r0, [r6, #0x10]
        mov     r2, r8
        mov     r1, r5
        bl      _ipps_rbMpy1_32f
LBZD20:
        subs    r10, r10, #1
        add     r9, r9, r8, lsl #2
        add     r5, r5, r8, lsl #2
        bne     LBZD19
        mov     r2, r8
        mov     r5, r11
        ldr     r9, [sp, #0x18]
        ldr     r1, [sp, #0x1C]
        b       LBZD31
LBZD21:
        add     r12, r12, r8, lsl #2
        ldr     r12, [r12, #-0x24]
        cmp     r12, #0
        bne     LBZD29
        cmp     r4, #0
        ble     LBZD31
        mov     r8, #1, 18
        cmp     r2, #1, 18
        mov     r11, r4
        movlt   r8, r2
        str     r4, [sp, #0x10]
        str     r9, [sp, #0x18]
        mov     r12, #1, 24
        str     r5, [sp, #0x24]
        str     r7, [sp, #0x14]
        mov     r4, r8
        mov     r9, r11
        str     r1, [sp, #0x1C]
        mov     r5, r0
        mov     r8, r2
        mov     r7, r3
        mov     r11, r12
LBZD22:
        cmp     r8, #0
        ble     LBZD27
        mov     r0, #0
        str     r9, [sp, #0x4C]
        mov     r9, r0
LBZD23:
        cmp     r4, #0
        add     r0, r7, r9, lsl #2
        add     r1, r5, r9, lsl #2
        ble     LBZD26
        mov     r3, r1
        mov     r2, r0
        str     r7, [sp, #0x54]
        mov     r12, #0
        str     r5, [sp, #0x50]
        str     r8, [sp, #0x44]
        mov     r10, r9
        mov     r7, r6
        mov     r9, r0
        mov     r8, r1
        mov     r5, r2
        mov     r6, r3
        mov     r11, r12
LBZD24:
        ldr     r3, [r7, #0x24]
        mov     r2, #1, 22
        mov     r1, r6
        mov     r0, r5
        bl      _ipps_crRadix4Fwd_32f
        ldr     lr, [r7, #8]
        cmp     lr, #0
        beq     LBZD25
        ldr     r0, [r7, #0x10]
        mov     r2, #1, 22
        mov     r1, r5
        bl      _ipps_rbMpy1_32f
        ldr     r0, [r7, #0x10]
        mov     r2, #1, 22
        mov     r1, r6
        bl      _ipps_rbMpy1_32f
LBZD25:
        add     r11, r11, #1, 22
        cmp     r11, r4
        add     r6, r6, #1, 20
        add     r5, r5, #1, 20
        blt     LBZD24
        mov     r6, r7
        mov     r1, r8
        mov     r0, r9
        mov     r9, r10
        ldr     r5, [sp, #0x50]
        ldr     r7, [sp, #0x54]
        ldr     r8, [sp, #0x44]
        mov     r11, #1, 24
        mov     r10, #1
LBZD26:
        str     r11, [sp, #8]
        str     r10, [sp, #4]
        ldr     lr, [r6, #0x28]
        mov     r3, #1, 22
        mov     r2, r4
        str     lr, [sp]
        bl      LBZD_crFft_Blk_R2
        add     r9, r4, r9
        cmp     r9, r8
        blt     LBZD23
        ldr     r9, [sp, #0x4C]
LBZD27:
        cmp     r8, r4
        ble     LBZD28
        str     r11, [sp, #8]
        str     r10, [sp, #4]
        ldr     lr, [r6, #0x2C]
        mov     r3, r4
        mov     r2, r8
        str     lr, [sp]
        mov     r1, r5
        mov     r0, r7
        bl      LBZD_crFft_Blk_R2
LBZD28:
        subs    r9, r9, #1
        add     r7, r7, r8, lsl #2
        add     r5, r5, r8, lsl #2
        bne     LBZD22
        mov     r2, r8
        ldr     r4, [sp, #0x10]
        ldr     r5, [sp, #0x24]
        ldr     r7, [sp, #0x14]
        ldr     r9, [sp, #0x18]
        ldr     r1, [sp, #0x1C]
        b       LBZD31
LBZD29:
        cmp     r4, #0
        ble     LBZD31
        mov     r11, r4
        str     r9, [sp, #0x18]
        str     r4, [sp, #0x10]
        mov     r9, r11
        add     r10, r7, #1
        str     r7, [sp, #0x14]
        mov     r11, r5
        mov     r4, r8
        str     r1, [sp, #0x1C]
        mov     r5, r0
        mov     r8, r2
        mov     r7, r3
LBZD30:
        str     r10, [sp]
        str     r11, [sp, #4]
        mov     r3, r4
        mov     r2, r5
        mov     r1, r7
        mov     r0, r6
        bl      LBZD_crFftFwd_BlkStep
        subs    r9, r9, #1
        add     r7, r7, r8, lsl #2
        add     r5, r5, r8, lsl #2
        bne     LBZD30
        mov     r2, r8
        mov     r5, r11
        ldr     r4, [sp, #0x10]
        ldr     r7, [sp, #0x14]
        ldr     r9, [sp, #0x18]
        ldr     r1, [sp, #0x1C]
LBZD31:
        add     r10, r6, r7, lsl #2
        ldr     r3, [r10, #0x44]
        add     r8, r5, r4, lsl #3
        add     r7, r8, r4, lsl #3
        cmp     r2, #0
        add     r6, r7, r4, lsl #3
        ble     LBZD36
        mov     r11, #0
        str     r3, [sp, #0x14]
        str     r2, [sp, #0x44]
        str     r1, [sp, #0x1C]
LBZD32:
        ldr     r3, [sp, #0x1C]
        add     r0, r9, r11, lsl #2
        str     r0, [sp, #0x40]
        add     r1, r3, r11, lsl #2
        str     r1, [sp, #0x3C]
        cmp     r4, #0
        ble     LBZD34
        sub     r2, r5, #4
        sub     lr, r6, #4
        str     r6, [sp, #0x34]
        ldr     r6, [sp, #0x14]
        str     r2, [sp, #0x20]
        mov     r2, r4
        sub     r12, r7, #4
        sub     r3, r8, #4
        str     r4, [sp, #0x10]
        str     r5, [sp, #0x24]
        str     r2, [sp, #0x4C]
        str     r3, [sp, #0x50]
        str     r12, [sp, #0x54]
        str     lr, [sp, #0x48]
        str     r11, [sp, #0x38]
        str     r7, [sp, #0x30]
        str     r8, [sp, #0x2C]
        str     r10, [sp, #0x28]
        str     r9, [sp, #0x18]
        mov     r4, r0
        mov     r5, r1
LBZD33:
        ldr     r11, [r5]
        ldr     r8, [r6]
        ldr     r10, [r6, #4]
        ldr     r9, [r4]
        mov     r0, r11
        mov     r1, r8
        bl      __mulsf3
        mov     r7, r0
        mov     r0, r9
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r7
        bl      __subsf3
        str     r0, [sp, #0x58]
        mov     r0, r9
        mov     r1, r8
        bl      __mulsf3
        mov     r7, r0
        mov     r0, r11
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r9, [r5, #4]
        ldr     r7, [r6, #8]
        ldr     r8, [r4, #4]
        ldr     r10, [r6, #0xC]
        str     r0, [sp, #0x5C]
        mov     r1, r7
        mov     r0, r9
        bl      __mulsf3
        mov     r11, r0
        mov     r1, r10
        mov     r0, r8
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        mov     r11, r0
        mov     r1, r7
        mov     r0, r8
        bl      __mulsf3
        mov     r7, r0
        mov     r1, r10
        mov     r0, r9
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r3, [sp, #0x58]
        ldr     r2, [sp, #0x20]
        str     r3, [r2, #4]
        ldr     r3, [sp, #0x5C]
        str     r3, [r2, #8]
        ldr     r2, [sp, #0x50]
        str     r11, [r2, #4]
        str     r0, [r2, #8]
        ldr     r11, [r5, #8]
        ldr     r8, [r6, #0x10]
        ldr     r9, [r4, #8]
        ldr     r10, [r6, #0x14]
        mov     r0, r11
        mov     r1, r8
        bl      __mulsf3
        mov     r7, r0
        mov     r1, r10
        mov     r0, r9
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r7
        bl      __subsf3
        str     r0, [sp, #0x5C]
        mov     r1, r8
        mov     r0, r9
        bl      __mulsf3
        mov     r7, r0
        mov     r0, r11
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r8, [r6, #0x18]
        ldr     r10, [r5, #0xC]
        ldr     r9, [r6, #0x1C]
        ldr     r7, [r4, #0xC]
        str     r0, [sp, #0x58]
        mov     r1, r8
        mov     r0, r10
        bl      __mulsf3
        mov     r11, r0
        mov     r1, r9
        mov     r0, r7
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        mov     r11, r0
        mov     r1, r8
        mov     r0, r7
        bl      __mulsf3
        mov     r7, r0
        mov     r0, r10
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r3, [sp, #0x5C]
        ldr     r2, [sp, #0x54]
        add     r6, r6, #0x20
        str     r3, [r2, #4]
        ldr     r3, [sp, #0x58]
        str     r3, [r2, #8]
        ldr     r2, [sp, #0x48]
        str     r11, [r2, #4]
        str     r0, [r2, #8]
        ldr     r2, [sp, #0x4C]
        subs    r2, r2, #1
        str     r2, [sp, #0x4C]
        ldr     r2, [sp, #0x44]
        add     r5, r5, r2, lsl #2
        add     r4, r4, r2, lsl #2
        ldr     r2, [sp, #0x48]
        add     r2, r2, #8
        str     r2, [sp, #0x48]
        ldr     r2, [sp, #0x54]
        add     r2, r2, #8
        str     r2, [sp, #0x54]
        ldr     r2, [sp, #0x50]
        add     r2, r2, #8
        str     r2, [sp, #0x50]
        ldr     r2, [sp, #0x20]
        add     r2, r2, #8
        str     r2, [sp, #0x20]
        ldr     r2, [sp, #0x4C]
        bne     LBZD33
        str     r6, [sp, #0x14]
        ldr     r11, [sp, #0x38]
        ldr     r6, [sp, #0x34]
        ldr     r7, [sp, #0x30]
        ldr     r8, [sp, #0x2C]
        ldr     r10, [sp, #0x28]
        ldr     r4, [sp, #0x10]
        ldr     r5, [sp, #0x24]
        ldr     r9, [sp, #0x18]
LBZD34:
        ldr     r2, [r10, #0x38]
        mov     r1, r4
        mov     r0, r5
        bl      _ipps_cRadix4Fwd_32fc
        ldr     r2, [r10, #0x38]
        mov     r1, r4
        mov     r0, r8
        bl      _ipps_cRadix4Fwd_32fc
        ldr     r2, [r10, #0x38]
        mov     r1, r4
        mov     r0, r7
        bl      _ipps_cRadix4Fwd_32fc
        ldr     r2, [r10, #0x38]
        mov     r1, r4
        mov     r0, r6
        bl      _ipps_cRadix4Fwd_32fc
        cmp     r4, #0
        ble     LBZD37
        sub     r12, r5, #4
        mov     r3, r4
        str     r4, [sp, #0x10]
        str     r5, [sp, #0x24]
        ldr     r2, [sp, #0x40]
        ldr     r4, [sp, #0x3C]
        ldr     r5, [sp, #0x44]
        sub     r1, r6, #4
        sub     r0, r7, #4
        sub     lr, r8, #4
        str     r9, [sp, #0x18]
LBZD35:
        ldr     r9, [r12, #4]
        subs    r3, r3, #1
        str     r9, [r4]
        ldr     r9, [r12, #8]!
        str     r9, [r2]
        ldr     r9, [lr, #4]
        str     r9, [r4, #4]
        ldr     r9, [lr, #8]!
        str     r9, [r2, #4]
        ldr     r9, [r0, #4]
        str     r9, [r4, #8]
        ldr     r9, [r0, #8]!
        str     r9, [r2, #8]
        ldr     r9, [r1, #4]
        str     r9, [r4, #0xC]
        ldr     r9, [r1, #8]!
        add     r4, r4, r5, lsl #2
        str     r9, [r2, #0xC]
        add     r2, r2, r5, lsl #2
        bne     LBZD35
        str     r5, [sp, #0x44]
        ldr     r3, [sp, #0x44]
        ldr     r4, [sp, #0x10]
        ldr     r5, [sp, #0x24]
        ldr     r9, [sp, #0x18]
        add     r11, r11, #4
        cmp     r11, r3
        blt     LBZD32
LBZD36:
        add     sp, sp, #0x60
        ldmia   sp!, {r4 - r11, pc}
LBZD37:
        ldr     r3, [sp, #0x44]
        add     r11, r11, #4
        cmp     r11, r3
        blt     LBZD32
        add     sp, sp, #0x60
        ldmia   sp!, {r4 - r11, pc}
        .long   LBZD_tbl_blk_order


        .data
        .align  4


LBZD_tbl_blk_order:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x05,0x00,0x00,0x00,0x06,0x00,0x00,0x00,0x07,0x00,0x00,0x00,0x08,0x00,0x00,0x00
        .byte   0x08,0x00,0x00,0x00,0x08,0x00,0x00,0x00,0x0A,0x00,0x00,0x00,0x0A,0x00,0x00,0x00
        .byte   0x0A,0x00,0x00,0x00,0x0A,0x00,0x00,0x00,0x08,0x00,0x00,0x00,0x08,0x00,0x00,0x00
        .byte   0x0A,0x00,0x00,0x00,0x0A,0x00,0x00,0x00,0x0A,0x00,0x00,0x00,0x0A,0x00,0x00,0x00
        .byte   0x0A,0x00,0x00,0x00,0x0A,0x00,0x00,0x00


