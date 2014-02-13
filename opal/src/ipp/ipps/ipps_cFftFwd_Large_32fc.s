        .text
        .align  4
        .globl  _ipps_cFftFwd_Large_32fc


_ipps_cFftFwd_Large_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        mov     r6, r0
        ldr     r9, [sp, #0x34]
        ldr     r0, [r6, #0x20]
        mov     r4, r2
        mov     r8, r3
        mov     r7, #1
        cmp     r1, r4
        mov     r5, r7, lsl r8
        beq     LBZF8
        mov     r3, r0
        mov     r0, r1
        mov     r2, r5
        mov     r1, r4
        bl      _ipps_BitRev2_8
LBZF0:
        ldr     r12, [pc, #0xCC4]
        add     r12, r12, r8, lsl #2
        ldr     r12, [r12, #-0x24]
        cmp     r12, #0
        bne     LBZF6
        mov     r8, #1, 18
        cmp     r5, #1, 18
        movlt   r8, r5
        cmp     r5, #0
        ble     LBZF5
        mov     r9, #0
        sub     r11, r8, #1, 22
        mov     r10, #1, 24
LBZF1:
        cmp     r11, #0
        mov     r2, r11
        add     r0, r4, r9, lsl #3
        blt     LBZF4
        add     r1, r0, r2, lsl #3
        str     r5, [sp, #0xC]
        str     r4, [sp, #8]
        mov     r7, r9
        mov     r5, r0
        mov     r4, r1
        mov     r9, r2
LBZF2:
        ldr     r2, [r6, #0x24]
        mov     r1, #1, 22
        mov     r0, r4
        bl      _ipps_cRadix4Fwd_32fc
        ldr     r3, [r6, #8]
        cmp     r3, #0
        beq     LBZF3
        ldr     r0, [r6, #0x10]
        mov     r2, #2, 22
        mov     r1, r4
        bl      _ipps_rbMpy1_32f
LBZF3:
        subs    r9, r9, #1, 22
        sub     r4, r4, #2, 20
        bpl     LBZF2
        mov     r0, r5
        mov     r9, r7
        ldr     r5, [sp, #0xC]
        ldr     r4, [sp, #8]
        mov     r7, #1
LBZF4:
        str     r10, [sp, #4]
        str     r7, [sp]
        ldr     r3, [r6, #0x28]
        mov     r2, #1, 22
        mov     r1, r8
        bl      LBZF_cFft_Blk_R2
        add     r9, r8, r9
        cmp     r9, r5
        blt     LBZF1
LBZF5:
        cmp     r5, r8
        ble     LBZF7
        mov     r3, #1, 24
        str     r3, [sp, #4]
        mov     r3, #1
        str     r3, [sp]
        ldr     r3, [r6, #0x2C]
        mov     r2, r8
        mov     r1, r5
        mov     r0, r4
        bl      LBZF_cFft_Blk_R2
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LBZF6:
        str     r9, [sp]
        mov     r2, r8
        mov     r1, r4
        mov     r0, r6
        mov     r3, #0
        bl      LBZF_cFftFwd_BlkStep
LBZF7:
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LBZF8:
        mov     r2, r0
        mov     r1, r5
        mov     r0, r4
        bl      _ipps_BitRev1_8
        b       LBZF0
LBZF_cFft_Blk_R2:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x68
        mov     r4, r1
        mov     r1, r2
        mov     r5, r0
        mov     r0, r4
        mov     r6, r1, lsl #1
        mov     r4, r3
        bl      __intel_idiv
        mov     r1, #6, 2
        smull   r2, r1, r6, r1
        add     r1, r6, r1
        mov     r12, r0, asr #1
        mov     r2, r6, asr #31
        cmp     r12, #0
        rsb     r7, r2, r1, asr #8
        ble     LBZF16
LBZF9:
        cmp     r7, #0
        mov     r3, r5
        ble     LBZF15
        mvn     r1, #6, 2
        mov     r11, #0
        mov     lr, r0, lsl #2
        and     r1, r6, r1
        mov     r10, r11
        sub     r9, r12, #1
        mov     r8, r0, lsl #7
        mov     r2, r6, lsl #2
        str     lr, [sp, #0x4C]
        str     r12, [sp, #0x34]
        str     r0, [sp, #0x2C]
        str     r6, [sp, #0x28]
        str     r5, [sp, #0x20]
LBZF10:
        cmp     r9, #0
        mov     lr, r3
        mov     r12, r9
        blt     LBZF14
        add     r0, r4, r10, lsl #2
        str     r8, [sp, #0x48]
        str     r9, [sp, #0x44]
        str     r10, [sp, #0x40]
        str     r11, [sp, #0x3C]
        str     r3, [sp, #0x38]
        str     r7, [sp, #0x30]
        str     r4, [sp, #0x24]
LBZF11:
        add     r9, r2, lr
        add     r11, r9, #8
        add     r3, r9, #0xC
        mov     r10, r0
        mov     r8, #0
        add     r7, r9, #4
        add     r6, lr, #4
        add     r5, lr, #8
        add     r4, lr, #0xC
        str     r3, [sp, #8]
        str     r11, [sp, #4]
        str     r0, [sp, #0x10]
        str     r12, [sp, #0x14]
        str     lr, [sp, #0xC]
        str     r1, [sp, #0x18]
        str     r2, [sp, #0x1C]
LBZF12:
        ldr     r0, [r9]
        str     r0, [sp]
        ldr     r0, [r10]
        str     r0, [sp, #0x50]
        ldr     r0, [sp, #0x4C]
        ldr     r1, [sp, #0x50]
        add     r0, r10, r0
        str     r0, [sp, #0x54]
        ldr     r0, [sp]
        bl      __mulsf3
        ldr     r11, [r10, #4]
        ldr     r2, [r7]
        str     r0, [sp, #0x5C]
        mov     r1, r11
        str     r2, [sp, #0x58]
        ldr     r0, [sp, #0x58]
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x5C]
        bl      __subsf3
        str     r0, [sp, #0x5C]
        ldr     r1, [sp, #0x50]
        ldr     r0, [sp, #0x58]
        bl      __mulsf3
        str     r0, [sp, #0x58]
        ldr     r0, [sp]
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x58]
        bl      __addsf3
        ldr     r2, [sp, #0xC]
        ldr     r1, [sp, #0x5C]
        mov     r11, r0
        ldr     r2, [r2, +r8, lsl #2]
        str     r2, [sp, #0x58]
        ldr     r0, [sp, #0x58]
        bl      __addsf3
        ldr     r2, [r6]
        str     r0, [sp]
        str     r2, [sp, #0x50]
        ldr     r0, [sp, #0x50]
        mov     r1, r11
        bl      __addsf3
        str     r0, [sp, #0x60]
        ldr     r0, [sp, #0x58]
        ldr     r1, [sp, #0x5C]
        bl      __subsf3
        str     r0, [sp, #0x5C]
        ldr     r0, [sp, #0x50]
        mov     r1, r11
        bl      __subsf3
        ldr     r2, [sp, #0xC]
        ldr     r1, [sp]
        str     r1, [r2, +r8, lsl #2]
        ldr     r1, [sp, #0x60]
        add     r8, r8, #4
        str     r1, [r6], #0x10
        ldr     r1, [sp, #0x5C]
        str     r1, [r9], #0x10
        str     r0, [r7], #0x10
        ldr     r0, [sp, #4]
        ldr     r0, [r0]
        str     r0, [sp, #0x60]
        ldr     r0, [sp, #0x4C]
        ldr     r0, [r10, +r0]
        str     r0, [sp, #0x5C]
        ldr     r0, [sp, #0x54]
        ldr     r1, [sp, #0x5C]
        ldr     r11, [r0, #4]
        ldr     r0, [sp, #0x60]
        bl      __mulsf3
        ldr     r2, [sp, #8]
        mov     r1, r11
        ldr     r10, [r2]
        str     r0, [sp, #0x58]
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x58]
        bl      __subsf3
        str     r0, [sp, #0x58]
        ldr     r0, [sp, #0x60]
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x5C]
        mov     r11, r0
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r11, [r5]
        ldr     r1, [sp, #0x58]
        str     r0, [sp, #0x60]
        mov     r0, r11
        bl      __addsf3
        ldr     r1, [r4]
        ldr     r2, [sp, #0x54]
        ldr     r3, [sp, #0x4C]
        str     r1, [sp, #0x5C]
        ldr     r1, [sp, #0x60]
        str     r0, [sp, #0x50]
        ldr     r0, [sp, #0x5C]
        add     r10, r2, r3
        bl      __addsf3
        ldr     r1, [sp, #0x58]
        str     r0, [sp, #0x54]
        mov     r0, r11
        bl      __subsf3
        mov     r11, r0
        ldr     r0, [sp, #0x5C]
        ldr     r1, [sp, #0x60]
        bl      __subsf3
        ldr     r1, [sp, #0x50]
        cmp     r8, #1, 24
        str     r1, [r5], #0x10
        ldr     r1, [sp, #0x54]
        str     r1, [r4], #0x10
        ldr     r1, [sp, #4]
        str     r11, [r1]
        ldr     r1, [sp, #8]
        str     r0, [r1], #0x10
        ldr     r0, [sp, #4]
        str     r1, [sp, #8]
        add     r0, r0, #0x10
        str     r0, [sp, #4]
        blt     LBZF12
        ldr     lr, [sp, #0xC]
        ldr     r1, [sp, #0x18]
        ldr     r2, [sp, #0x1C]
        ldr     r0, [sp, #0x10]
        ldr     r12, [sp, #0x14]
        add     r5, lr, r1, lsl #1
        add     r4, r2, r5
        add     lr, r4, #8
        add     r11, r4, #0xC
        str     r4, [sp, #0xC]
        mov     r3, #0
        add     r10, r4, #4
        mov     r6, r0
        add     r9, r5, #4
        add     r8, r5, #8
        add     r7, r5, #0xC
        str     r11, [sp, #4]
        str     lr, [sp]
        str     r3, [sp, #8]
        str     r0, [sp, #0x10]
        str     r12, [sp, #0x14]
        str     r1, [sp, #0x18]
        str     r2, [sp, #0x1C]
LBZF13:
        ldr     r0, [r10]
        str     r0, [sp, #0x60]
        ldr     r1, [r6]
        str     r1, [sp, #0x5C]
        ldr     r1, [r4]
        str     r1, [sp, #0x58]
        ldr     r1, [sp, #0x4C]
        add     r1, r6, r1
        str     r1, [sp, #0x54]
        ldr     r1, [sp, #0x5C]
        bl      __mulsf3
        ldr     r11, [r6, #4]
        ldr     r2, [sp, #8]
        str     r0, [sp, #0x50]
        ldr     r0, [sp, #0x58]
        add     r2, r2, #4
        str     r2, [sp, #8]
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x50]
        bl      __addsf3
        str     r0, [sp, #0x50]
        ldr     r0, [sp, #0x58]
        ldr     r1, [sp, #0x5C]
        bl      __mulsf3
        str     r0, [sp, #0x5C]
        ldr     r0, [sp, #0x60]
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x5C]
        bl      __subsf3
        ldr     r1, [r5]
        str     r0, [sp, #0x5C]
        str     r1, [sp, #0x60]
        ldr     r0, [sp, #0x60]
        ldr     r1, [sp, #0x50]
        bl      __addsf3
        ldr     r11, [r9]
        ldr     r1, [sp, #0x5C]
        str     r0, [sp, #0x58]
        mov     r0, r11
        bl      __addsf3
        str     r0, [sp, #0x64]
        ldr     r0, [sp, #0x60]
        ldr     r1, [sp, #0x50]
        bl      __subsf3
        ldr     r1, [sp, #0x5C]
        str     r0, [sp, #0x60]
        mov     r0, r11
        bl      __subsf3
        ldr     r1, [sp, #0x58]
        str     r1, [r5], #0x10
        ldr     r1, [sp, #0x64]
        str     r1, [r9], #0x10
        ldr     r1, [sp, #0x60]
        str     r1, [r4], #0x10
        str     r0, [r10], #0x10
        ldr     r0, [sp]
        ldr     r0, [r0]
        str     r0, [sp, #0x64]
        ldr     r0, [sp, #0x54]
        ldr     r1, [r0, #4]
        ldr     r0, [sp, #0x4C]
        str     r1, [sp, #0x60]
        ldr     r11, [r6, +r0]
        ldr     r0, [sp, #0x64]
        bl      __mulsf3
        ldr     r2, [sp, #4]
        mov     r1, r11
        ldr     r6, [r2]
        str     r0, [sp, #0x5C]
        mov     r0, r6
        bl      __mulsf3
        ldr     r1, [sp, #0x5C]
        bl      __addsf3
        str     r0, [sp, #0x5C]
        ldr     r0, [sp, #0x64]
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x60]
        mov     r11, r0
        mov     r0, r6
        bl      __mulsf3
        mov     r1, r11
        bl      __subsf3
        ldr     r1, [sp, #0x5C]
        ldr     r11, [r8]
        mov     r6, r0
        mov     r0, r11
        bl      __addsf3
        ldr     r2, [r7]
        str     r0, [sp, #0x60]
        str     r2, [sp, #0x64]
        ldr     r0, [sp, #0x64]
        mov     r1, r6
        bl      __addsf3
        ldr     r1, [sp, #0x5C]
        str     r0, [sp, #0x58]
        mov     r0, r11
        bl      __subsf3
        mov     r11, r0
        ldr     r0, [sp, #0x64]
        mov     r1, r6
        bl      __subsf3
        ldr     r1, [sp, #0x60]
        str     r1, [r8], #0x10
        ldr     r1, [sp, #0x58]
        str     r1, [r7], #0x10
        ldr     r1, [sp]
        str     r11, [r1]
        ldr     r1, [sp, #4]
        str     r0, [r1]
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #0x54]
        cmp     r0, #1, 24
        ldr     r0, [sp]
        add     r0, r0, #0x10
        str     r0, [sp]
        ldr     r0, [sp, #4]
        add     r0, r0, #0x10
        str     r0, [sp, #4]
        ldr     r0, [sp, #0x4C]
        add     r6, r1, r0
        blt     LBZF13
        ldr     r12, [sp, #0x14]
        ldr     r1, [sp, #0x18]
        ldr     r3, [sp, #0xC]
        ldr     r0, [sp, #0x10]
        ldr     r2, [sp, #0x1C]
        subs    r12, r12, #1
        add     lr, r3, r1, lsl #1
        bpl     LBZF11
        ldr     r8, [sp, #0x48]
        ldr     r9, [sp, #0x44]
        ldr     r10, [sp, #0x40]
        ldr     r11, [sp, #0x3C]
        ldr     r3, [sp, #0x38]
        ldr     r7, [sp, #0x30]
        ldr     r4, [sp, #0x24]
LBZF14:
        add     r11, r11, #1
        cmp     r11, r7
        add     r10, r8, r10
        add     r3, r3, #1, 22
        blt     LBZF10
        ldr     r12, [sp, #0x34]
        ldr     r0, [sp, #0x2C]
        ldr     r6, [sp, #0x28]
        ldr     r5, [sp, #0x20]
LBZF15:
        mov     r12, r12, asr #1
        cmp     r12, #0
        mov     r6, r6, lsl #1
        mov     r7, r7, lsl #1
        mov     r0, r0, asr #1
        bgt     LBZF9
LBZF16:
        add     sp, sp, #0x68
        ldmia   sp!, {r4 - r11, pc}
LBZF_cFftFwd_BlkStep:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x4C
        ldr     r12, [pc, #0x5CC]
        ldr     r5, [sp, #0x70]
        mov     r7, r0
        add     lr, r12, r2, lsl #2
        ldr     lr, [lr, #-0x24]
        mov     r6, r1
        mov     r0, #1
        sub     r2, r2, lr
        cmp     r2, #0xA
        mov     r10, r3
        mov     r4, r0, lsl lr
        mov     r1, r0, lsl r2
        mov     r9, r6
        bgt     LBZF19
        cmp     r4, #0
        ble     LBZF29
        mov     r8, r4
        mov     r11, r6
        mov     r6, r5
        mov     r5, r1
LBZF17:
        ldr     r2, [r7, #0x24]
        mov     r1, r5
        mov     r0, r9
        bl      _ipps_cRadix4Fwd_32fc
        ldr     r2, [r7, #8]
        cmp     r2, #0
        beq     LBZF18
        ldr     r0, [r7, #0x10]
        mov     r2, r5, lsl #1
        mov     r1, r9
        bl      _ipps_rbMpy1_32f
LBZF18:
        subs    r8, r8, #1
        add     r9, r9, r5, lsl #3
        bne     LBZF17
        mov     r1, r5
        mov     r5, r6
        mov     r6, r11
        b       LBZF29
LBZF19:
        add     r12, r12, r2, lsl #2
        ldr     r12, [r12, #-0x24]
        cmp     r12, #0
        bne     LBZF27
        cmp     r4, #0
        ble     LBZF29
        mov     r2, #1, 18
        cmp     r1, #1, 18
        movlt   r2, r1
        mov     r3, #1, 24
        mov     r8, r4
        str     r4, [sp, #0x34]
        str     r5, [sp, #0x38]
        str     r10, [sp, #0x40]
        str     r6, [sp, #0x3C]
        sub     r11, r2, #1, 22
        mov     r6, r0
        mov     r5, r1
        mov     r4, r2
        mov     r10, r3
LBZF20:
        cmp     r5, #0
        ble     LBZF25
        mov     r0, #0
        str     r8, [sp, #0x2C]
        mov     r8, r0
LBZF21:
        cmp     r11, #0
        mov     r2, r11
        add     r0, r9, r8, lsl #3
        blt     LBZF24
        add     r1, r0, r2, lsl #3
        str     r9, [sp, #0x30]
        str     r5, [sp, #0x18]
        mov     r6, r0
        mov     r5, r1
        mov     r9, r2
LBZF22:
        ldr     r2, [r7, #0x24]
        mov     r1, #1, 22
        mov     r0, r5
        bl      _ipps_cRadix4Fwd_32fc
        ldr     r12, [r7, #8]
        cmp     r12, #0
        beq     LBZF23
        ldr     r0, [r7, #0x10]
        mov     r2, #2, 22
        mov     r1, r5
        bl      _ipps_rbMpy1_32f
LBZF23:
        subs    r9, r9, #1, 22
        sub     r5, r5, #2, 20
        bpl     LBZF22
        mov     r0, r6
        ldr     r9, [sp, #0x30]
        ldr     r5, [sp, #0x18]
        mov     r6, #1
LBZF24:
        str     r10, [sp, #4]
        str     r6, [sp]
        ldr     r3, [r7, #0x28]
        mov     r2, #1, 22
        mov     r1, r4
        bl      LBZF_cFft_Blk_R2
        add     r8, r4, r8
        cmp     r8, r5
        blt     LBZF21
        ldr     r8, [sp, #0x2C]
LBZF25:
        cmp     r5, r4
        ble     LBZF26
        str     r10, [sp, #4]
        str     r6, [sp]
        ldr     r3, [r7, #0x2C]
        mov     r2, r4
        mov     r1, r5
        mov     r0, r9
        bl      LBZF_cFft_Blk_R2
LBZF26:
        subs    r8, r8, #1
        add     r9, r9, r5, lsl #3
        bne     LBZF20
        mov     r1, r5
        ldr     r4, [sp, #0x34]
        ldr     r5, [sp, #0x38]
        ldr     r10, [sp, #0x40]
        ldr     r6, [sp, #0x3C]
        b       LBZF29
LBZF27:
        cmp     r4, #0
        ble     LBZF29
        add     r11, r10, #1
        str     r10, [sp, #0x40]
        str     r6, [sp, #0x3C]
        mov     r8, r4
        mov     r6, r1
        mov     r10, r2
LBZF28:
        str     r5, [sp]
        mov     r3, r11
        mov     r2, r10
        mov     r1, r9
        mov     r0, r7
        bl      LBZF_cFftFwd_BlkStep
        subs    r8, r8, #1
        add     r9, r9, r6, lsl #3
        bne     LBZF28
        mov     r1, r6
        ldr     r10, [sp, #0x40]
        ldr     r6, [sp, #0x3C]
LBZF29:
        add     r10, r7, r10, lsl #2
        ldr     r2, [r10, #0x44]
        add     r9, r5, r4, lsl #3
        add     r8, r9, r4, lsl #3
        cmp     r1, #0
        add     r7, r8, r4, lsl #3
        ble     LBZF34
        mov     r11, #0
        str     r2, [sp, #0x40]
        str     r1, [sp, #0x18]
LBZF30:
        add     r0, r6, r11, lsl #3
        str     r0, [sp, #0x1C]
        cmp     r4, #0
        ble     LBZF32
        str     r6, [sp, #0x3C]
        ldr     r6, [sp, #0x40]
        sub     r2, r5, #4
        mov     lr, r4
        sub     r12, r7, #4
        sub     r1, r8, #4
        sub     r3, r9, #4
        str     r4, [sp, #0x34]
        str     r5, [sp, #0x38]
        str     lr, [sp, #0x10]
        str     r2, [sp, #8]
        str     r3, [sp, #0xC]
        str     r12, [sp, #0x14]
        str     r11, [sp, #0x20]
        str     r7, [sp, #0x24]
        str     r8, [sp, #0x28]
        str     r9, [sp, #0x2C]
        str     r10, [sp, #0x30]
        mov     r4, r0
        mov     r5, r1
LBZF31:
        ldr     r11, [r4]
        ldr     r8, [r6]
        ldr     r10, [r6, #4]
        ldr     r9, [r4, #4]
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
        str     r0, [sp, #0x44]
        mov     r1, r8
        mov     r0, r9
        bl      __mulsf3
        mov     r7, r0
        mov     r1, r10
        mov     r0, r11
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r7, [r6, #8]
        ldr     r9, [r4, #8]
        ldr     r10, [r6, #0xC]
        ldr     r8, [r4, #0xC]
        str     r0, [sp, #0x48]
        mov     r1, r7
        mov     r0, r9
        bl      __mulsf3
        mov     r11, r0
        mov     r0, r8
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        mov     r11, r0
        mov     r1, r7
        mov     r0, r8
        bl      __mulsf3
        mov     r7, r0
        mov     r0, r9
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #0x44]
        str     r3, [r2, #4]
        ldr     r3, [sp, #0x48]
        str     r3, [r2, #8]
        ldr     r2, [sp, #0xC]
        str     r0, [r2, #8]
        str     r11, [r2, #4]
        ldr     r11, [r4, #0x10]
        ldr     r8, [r6, #0x10]
        ldr     r10, [r6, #0x14]
        ldr     r9, [r4, #0x14]
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
        str     r0, [sp, #0x48]
        mov     r1, r8
        mov     r0, r9
        bl      __mulsf3
        mov     r7, r0
        mov     r1, r10
        mov     r0, r11
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r9, [r6, #0x1C]
        ldr     r8, [r6, #0x18]
        ldr     r10, [r4, #0x18]
        ldr     r7, [r4, #0x1C]
        str     r0, [sp, #0x44]
        mov     r1, r8
        mov     r0, r10
        bl      __mulsf3
        mov     r11, r0
        mov     r0, r7
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        mov     r11, r0
        mov     r0, r7
        mov     r1, r8
        bl      __mulsf3
        mov     r7, r0
        mov     r0, r10
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r2, [sp, #0x48]
        add     r6, r6, #0x20
        str     r2, [r5, #4]
        ldr     r2, [sp, #0x44]
        str     r2, [r5, #8]!
        ldr     r2, [sp, #0x14]
        str     r11, [r2, #4]
        str     r0, [r2, #8]
        ldr     r2, [sp, #0x10]
        subs    r2, r2, #1
        str     r2, [sp, #0x10]
        ldr     r2, [sp, #0x18]
        add     r4, r4, r2, lsl #3
        ldr     r2, [sp, #0x14]
        add     r2, r2, #8
        str     r2, [sp, #0x14]
        ldr     r2, [sp, #0xC]
        add     r2, r2, #8
        str     r2, [sp, #0xC]
        ldr     r2, [sp, #8]
        add     r2, r2, #8
        str     r2, [sp, #8]
        ldr     r2, [sp, #0x10]
        bne     LBZF31
        str     r6, [sp, #0x40]
        ldr     r11, [sp, #0x20]
        ldr     r7, [sp, #0x24]
        ldr     r8, [sp, #0x28]
        ldr     r9, [sp, #0x2C]
        ldr     r10, [sp, #0x30]
        ldr     r4, [sp, #0x34]
        ldr     r5, [sp, #0x38]
        ldr     r6, [sp, #0x3C]
LBZF32:
        ldr     r2, [r10, #0x38]
        mov     r1, r4
        mov     r0, r5
        bl      _ipps_cRadix4Fwd_32fc
        ldr     r2, [r10, #0x38]
        mov     r1, r4
        mov     r0, r9
        bl      _ipps_cRadix4Fwd_32fc
        ldr     r2, [r10, #0x38]
        mov     r1, r4
        mov     r0, r8
        bl      _ipps_cRadix4Fwd_32fc
        ldr     r2, [r10, #0x38]
        mov     r1, r4
        mov     r0, r7
        bl      _ipps_cRadix4Fwd_32fc
        cmp     r4, #0
        ble     LBZF35
        sub     r3, r5, #4
        str     r5, [sp, #0x38]
        str     r6, [sp, #0x3C]
        ldr     r5, [sp, #0x1C]
        ldr     r6, [sp, #0x18]
        sub     r0, r7, #4
        sub     lr, r8, #4
        sub     r12, r9, #4
        mov     r2, r4
LBZF33:
        ldr     r1, [r3, #4]
        subs    r2, r2, #1
        str     r1, [r5]
        ldr     r1, [r3, #8]!
        str     r1, [r5, #4]
        ldr     r1, [r12, #4]
        str     r1, [r5, #8]
        ldr     r1, [r12, #8]!
        str     r1, [r5, #0xC]
        ldr     r1, [lr, #4]
        str     r1, [r5, #0x10]
        ldr     r1, [lr, #8]!
        str     r1, [r5, #0x14]
        ldr     r1, [r0, #4]
        str     r1, [r5, #0x18]
        ldr     r1, [r0, #8]!
        str     r1, [r5, #0x1C]
        add     r5, r5, r6, lsl #3
        bne     LBZF33
        str     r6, [sp, #0x18]
        ldr     r2, [sp, #0x18]
        ldr     r5, [sp, #0x38]
        ldr     r6, [sp, #0x3C]
        add     r11, r11, #4
        cmp     r11, r2
        blt     LBZF30
LBZF34:
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LBZF35:
        ldr     r2, [sp, #0x18]
        add     r11, r11, #4
        cmp     r11, r2
        blt     LBZF30
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
        .long   LBZF_tbl_blk_order


        .data
        .align  4


LBZF_tbl_blk_order:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x05,0x00,0x00,0x00,0x06,0x00,0x00,0x00,0x07,0x00,0x00,0x00,0x08,0x00,0x00,0x00
        .byte   0x08,0x00,0x00,0x00,0x08,0x00,0x00,0x00,0x0A,0x00,0x00,0x00,0x0A,0x00,0x00,0x00
        .byte   0x0A,0x00,0x00,0x00,0x0A,0x00,0x00,0x00,0x08,0x00,0x00,0x00,0x08,0x00,0x00,0x00
        .byte   0x0A,0x00,0x00,0x00,0x0A,0x00,0x00,0x00,0x0A,0x00,0x00,0x00,0x0A,0x00,0x00,0x00
        .byte   0x0A,0x00,0x00,0x00,0x0A,0x00,0x00,0x00


