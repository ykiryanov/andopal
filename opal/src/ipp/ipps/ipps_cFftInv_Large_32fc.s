        .text
        .align  4
        .globl  _ipps_cFftInv_Large_32fc


_ipps_cFftInv_Large_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        mov     r6, r0
        ldr     r8, [sp, #0x38]
        ldr     r0, [r6, #0x20]
        mov     r4, r2
        mov     r7, r3
        mov     r12, #1
        cmp     r1, r4
        mov     r5, r12, lsl r7
        beq     LBZE8
        mov     r3, r0
        mov     r0, r1
        mov     r2, r5
        mov     r1, r4
        bl      _ipps_BitRev2_8
LBZE0:
        ldr     r12, [pc, #0xCDC]
        add     r12, r12, r7, lsl #2
        ldr     r12, [r12, #-0x24]
        cmp     r12, #0
        bne     LBZE6
        mov     r7, #1, 18
        cmp     r5, #1, 18
        movlt   r7, r5
        cmp     r5, #0
        ble     LBZE5
        mov     r8, #0
        mov     r11, #0
        sub     r10, r7, #1, 22
        mov     r9, #1, 24
LBZE1:
        cmp     r10, #0
        mov     r2, r10
        add     r0, r4, r11, lsl #3
        blt     LBZE4
        str     r7, [sp, #0x10]
        add     r1, r0, r2, lsl #3
        str     r5, [sp, #0xC]
        str     r4, [sp, #8]
        mov     r7, r8
        mov     r5, r0
        mov     r4, r1
        mov     r8, r2
LBZE2:
        ldr     r2, [r6, #0x24]
        mov     r1, #1, 22
        mov     r0, r4
        bl      _ipps_cRadix4Inv_32fc
        ldr     r3, [r6, #0xC]
        cmp     r3, #0
        beq     LBZE3
        ldr     r0, [r6, #0x10]
        mov     r2, #2, 22
        mov     r1, r4
        bl      _ipps_rbMpy1_32f
LBZE3:
        subs    r8, r8, #1, 22
        sub     r4, r4, #2, 20
        bpl     LBZE2
        mov     r0, r5
        mov     r8, r7
        ldr     r7, [sp, #0x10]
        ldr     r5, [sp, #0xC]
        ldr     r4, [sp, #8]
LBZE4:
        str     r9, [sp, #4]
        str     r8, [sp]
        ldr     r3, [r6, #0x28]
        mov     r2, #1, 22
        mov     r1, r7
        bl      LBZE_cFft_Blk_R2
        add     r11, r7, r11
        cmp     r11, r5
        blt     LBZE1
LBZE5:
        cmp     r5, r7
        ble     LBZE7
        mov     r3, #1, 24
        str     r3, [sp, #4]
        mov     r3, #0
        str     r3, [sp]
        ldr     r3, [r6, #0x2C]
        mov     r2, r7
        mov     r1, r5
        mov     r0, r4
        bl      LBZE_cFft_Blk_R2
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LBZE6:
        str     r8, [sp]
        mov     r2, r7
        mov     r1, r4
        mov     r0, r6
        mov     r3, #0
        bl      LBZE_cFftInv_BlkStep
LBZE7:
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LBZE8:
        mov     r2, r0
        mov     r1, r5
        mov     r0, r4
        bl      _ipps_BitRev1_8
        b       LBZE0
LBZE_cFft_Blk_R2:
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
        ble     LBZE16
LBZE9:
        cmp     r7, #0
        mov     r3, r5
        ble     LBZE15
        mvn     r1, #6, 2
        mov     r11, #0
        mov     lr, r0, lsl #2
        and     r1, r6, r1
        mov     r10, r11
        sub     r9, r12, #1
        mov     r8, r0, lsl #7
        mov     r2, r6, lsl #2
        str     lr, [sp, #4]
        str     r12, [sp, #0x34]
        str     r0, [sp, #0x3C]
        str     r6, [sp, #0x40]
        str     r5, [sp, #0x48]
LBZE10:
        cmp     r9, #0
        mov     lr, r3
        mov     r12, r9
        blt     LBZE14
        add     r0, r4, r10, lsl #2
        str     r8, [sp, #0x20]
        str     r9, [sp, #0x24]
        str     r10, [sp, #0x28]
        str     r11, [sp, #0x2C]
        str     r3, [sp, #0x30]
        str     r7, [sp, #0x38]
        str     r4, [sp, #0x44]
LBZE11:
        add     r9, r2, lr
        add     r3, r9, #0xC
        add     r11, lr, #8
        mov     r10, r0
        mov     r8, #0
        add     r7, r9, #4
        add     r6, lr, #4
        add     r5, r9, #8
        add     r4, lr, #0xC
        str     r11, [sp]
        str     r3, [sp, #8]
        str     r0, [sp, #0x10]
        str     r12, [sp, #0x14]
        str     lr, [sp, #0xC]
        str     r1, [sp, #0x18]
        str     r2, [sp, #0x1C]
LBZE12:
        ldr     r0, [r9]
        str     r0, [sp, #0x4C]
        ldr     r0, [r10]
        str     r0, [sp, #0x50]
        ldr     r0, [sp, #4]
        ldr     r1, [sp, #0x50]
        add     r0, r10, r0
        str     r0, [sp, #0x54]
        ldr     r0, [sp, #0x4C]
        bl      __mulsf3
        ldr     r1, [r7]
        str     r1, [sp, #0x58]
        ldr     r11, [r10, #4]
        str     r0, [sp, #0x5C]
        ldr     r0, [sp, #0x58]
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x5C]
        bl      __addsf3
        ldr     r1, [sp, #0x50]
        str     r0, [sp, #0x5C]
        ldr     r0, [sp, #0x58]
        bl      __mulsf3
        str     r0, [sp, #0x58]
        ldr     r0, [sp, #0x4C]
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x58]
        bl      __subsf3
        ldr     r1, [sp, #0xC]
        ldr     r1, [r1, +r8, lsl #2]
        str     r0, [sp, #0x50]
        str     r1, [sp, #0x58]
        ldr     r0, [sp, #0x58]
        ldr     r1, [sp, #0x5C]
        bl      __addsf3
        ldr     r11, [r6]
        ldr     r1, [sp, #0x50]
        str     r0, [sp, #0x4C]
        mov     r0, r11
        bl      __addsf3
        ldr     r1, [sp, #0x5C]
        str     r0, [sp, #0x60]
        ldr     r0, [sp, #0x58]
        bl      __subsf3
        ldr     r1, [sp, #0x50]
        str     r0, [sp, #0x5C]
        mov     r0, r11
        bl      __subsf3
        ldr     r1, [sp, #0xC]
        ldr     r2, [sp, #0x4C]
        str     r2, [r1, +r8, lsl #2]
        ldr     r1, [sp, #0x60]
        add     r8, r8, #4
        str     r1, [r6], #0x10
        ldr     r1, [sp, #0x5C]
        str     r1, [r9], #0x10
        str     r0, [r7], #0x10
        ldr     r0, [r5]
        str     r0, [sp, #0x60]
        ldr     r0, [sp, #4]
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
        ldr     r1, [sp, #0x58]
        bl      __addsf3
        str     r0, [sp, #0x58]
        ldr     r0, [sp, #0x60]
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x5C]
        mov     r11, r0
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r11
        bl      __subsf3
        ldr     r1, [sp]
        ldr     r11, [r1]
        ldr     r1, [sp, #0x58]
        str     r0, [sp, #0x60]
        mov     r0, r11
        bl      __addsf3
        ldr     r1, [r4]
        ldr     r3, [sp, #0x54]
        ldr     r2, [sp, #4]
        str     r1, [sp, #0x5C]
        str     r0, [sp, #0x50]
        ldr     r1, [sp, #0x60]
        ldr     r0, [sp, #0x5C]
        add     r10, r3, r2
        bl      __addsf3
        ldr     r1, [sp, #0x58]
        str     r0, [sp, #0x54]
        mov     r0, r11
        bl      __subsf3
        mov     r11, r0
        ldr     r0, [sp, #0x5C]
        ldr     r1, [sp, #0x60]
        bl      __subsf3
        ldr     r1, [sp]
        ldr     r2, [sp, #0x50]
        cmp     r8, #1, 24
        str     r2, [r1]
        ldr     r1, [sp, #0x54]
        str     r1, [r4], #0x10
        str     r11, [r5], #0x10
        ldr     r1, [sp, #8]
        str     r0, [r1], #0x10
        ldr     r0, [sp]
        str     r1, [sp, #8]
        add     r0, r0, #0x10
        str     r0, [sp]
        blt     LBZE12
        ldr     lr, [sp, #0xC]
        ldr     r1, [sp, #0x18]
        ldr     r2, [sp, #0x1C]
        ldr     r0, [sp, #0x10]
        ldr     r12, [sp, #0x14]
        add     r5, lr, r1, lsl #1
        add     r4, r2, r5
        add     lr, r4, #0xC
        str     r4, [sp, #0xC]
        mov     r3, #0
        add     r10, r4, #4
        add     r8, r4, #8
        add     r11, r5, #8
        mov     r6, r0
        add     r9, r5, #4
        add     r7, r5, #0xC
        str     r11, [sp, #0x4C]
        str     lr, [sp]
        str     r3, [sp, #8]
        str     r0, [sp, #0x10]
        str     r12, [sp, #0x14]
        str     r1, [sp, #0x18]
        str     r2, [sp, #0x1C]
LBZE13:
        ldr     r0, [r6]
        str     r0, [sp, #0x60]
        ldr     r0, [r10]
        ldr     r1, [sp, #0x60]
        str     r0, [sp, #0x5C]
        ldr     r0, [r4]
        str     r0, [sp, #0x58]
        ldr     r0, [sp, #4]
        add     r0, r6, r0
        str     r0, [sp, #0x54]
        ldr     r0, [sp, #0x5C]
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
        bl      __subsf3
        str     r0, [sp, #0x50]
        ldr     r0, [sp, #0x58]
        ldr     r1, [sp, #0x60]
        bl      __mulsf3
        str     r0, [sp, #0x60]
        ldr     r0, [sp, #0x5C]
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x60]
        bl      __addsf3
        ldr     r2, [r5]
        ldr     r1, [sp, #0x50]
        mov     r11, r0
        str     r2, [sp, #0x60]
        ldr     r0, [sp, #0x60]
        bl      __addsf3
        ldr     r2, [r9]
        str     r0, [sp, #0x58]
        str     r2, [sp, #0x5C]
        ldr     r0, [sp, #0x5C]
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [sp, #0x50]
        str     r0, [sp, #0x64]
        ldr     r0, [sp, #0x60]
        bl      __subsf3
        str     r0, [sp, #0x60]
        ldr     r0, [sp, #0x5C]
        mov     r1, r11
        bl      __subsf3
        ldr     r1, [sp, #0x58]
        str     r1, [r5], #0x10
        ldr     r1, [sp, #0x64]
        str     r1, [r9], #0x10
        ldr     r1, [sp, #0x60]
        str     r1, [r4], #0x10
        str     r0, [r10], #0x10
        ldr     r0, [r8]
        str     r0, [sp, #0x64]
        ldr     r0, [sp, #0x54]
        ldr     r1, [r0, #4]
        ldr     r0, [sp, #4]
        str     r1, [sp, #0x60]
        ldr     r11, [r6, +r0]
        ldr     r0, [sp, #0x64]
        bl      __mulsf3
        ldr     r2, [sp]
        mov     r1, r11
        ldr     r6, [r2]
        str     r0, [sp, #0x5C]
        mov     r0, r6
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x5C]
        bl      __subsf3
        str     r0, [sp, #0x5C]
        ldr     r0, [sp, #0x64]
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x60]
        mov     r11, r0
        mov     r0, r6
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r2, [sp, #0x4C]
        ldr     r1, [sp, #0x5C]
        mov     r6, r0
        ldr     r11, [r2]
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
        ldr     r2, [sp, #0x4C]
        str     r1, [r2]
        ldr     r1, [sp, #0x58]
        str     r1, [r7], #0x10
        str     r11, [r8], #0x10
        ldr     r1, [sp]
        str     r0, [r1]
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #4]
        cmp     r0, #1, 24
        ldr     r0, [sp, #0x4C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x4C]
        ldr     r0, [sp]
        add     r0, r0, #0x10
        str     r0, [sp]
        ldr     r0, [sp, #0x54]
        add     r6, r0, r1
        blt     LBZE13
        ldr     r12, [sp, #0x14]
        ldr     r1, [sp, #0x18]
        ldr     r3, [sp, #0xC]
        ldr     r0, [sp, #0x10]
        ldr     r2, [sp, #0x1C]
        subs    r12, r12, #1
        add     lr, r3, r1, lsl #1
        bpl     LBZE11
        ldr     r8, [sp, #0x20]
        ldr     r9, [sp, #0x24]
        ldr     r10, [sp, #0x28]
        ldr     r11, [sp, #0x2C]
        ldr     r3, [sp, #0x30]
        ldr     r7, [sp, #0x38]
        ldr     r4, [sp, #0x44]
LBZE14:
        add     r11, r11, #1
        cmp     r11, r7
        add     r10, r8, r10
        add     r3, r3, #1, 22
        blt     LBZE10
        ldr     r12, [sp, #0x34]
        ldr     r0, [sp, #0x3C]
        ldr     r6, [sp, #0x40]
        ldr     r5, [sp, #0x48]
LBZE15:
        mov     r12, r12, asr #1
        cmp     r12, #0
        mov     r6, r6, lsl #1
        mov     r7, r7, lsl #1
        mov     r0, r0, asr #1
        bgt     LBZE9
LBZE16:
        add     sp, sp, #0x68
        ldmia   sp!, {r4 - r11, pc}
LBZE_cFftInv_BlkStep:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x4C
        ldr     r12, [pc, #0x5D8]
        ldr     r5, [sp, #0x70]
        mov     r7, r0
        add     lr, r12, r2, lsl #2
        ldr     lr, [lr, #-0x24]
        mov     r6, r1
        mov     r8, #1
        sub     r2, r2, lr
        cmp     r2, #0xA
        mov     r10, r3
        mov     r4, r8, lsl lr
        mov     r1, r8, lsl r2
        mov     r9, r6
        bgt     LBZE19
        cmp     r4, #0
        ble     LBZE29
        mov     r8, r4
        mov     r11, r6
        mov     r6, r5
        mov     r5, r1
LBZE17:
        ldr     r2, [r7, #0x24]
        mov     r1, r5
        mov     r0, r9
        bl      _ipps_cRadix4Inv_32fc
        ldr     r2, [r7, #0xC]
        cmp     r2, #0
        beq     LBZE18
        ldr     r0, [r7, #0x10]
        mov     r2, r5, lsl #1
        mov     r1, r9
        bl      _ipps_rbMpy1_32f
LBZE18:
        subs    r8, r8, #1
        add     r9, r9, r5, lsl #3
        bne     LBZE17
        mov     r1, r5
        mov     r5, r6
        mov     r6, r11
        b       LBZE29
LBZE19:
        add     r12, r12, r2, lsl #2
        ldr     r12, [r12, #-0x24]
        cmp     r12, #0
        bne     LBZE27
        cmp     r4, #0
        ble     LBZE29
        mov     r2, #1, 18
        cmp     r1, #1, 18
        movlt   r2, r1
        sub     r3, r2, #1, 22
        mov     r0, #1, 24
        mov     r8, r4
        str     r4, [sp, #0x34]
        str     r5, [sp, #0x38]
        str     r10, [sp, #0x40]
        str     r6, [sp, #0x3C]
        mov     r11, #0
        mov     r10, r0
        mov     r5, r1
        mov     r4, r2
        mov     r6, r3
LBZE20:
        cmp     r5, #0
        ble     LBZE25
        mov     r0, #0
        str     r8, [sp, #0x28]
        mov     r8, r0
LBZE21:
        cmp     r6, #0
        mov     r2, r6
        add     r0, r9, r8, lsl #3
        blt     LBZE24
        add     r1, r0, r2, lsl #3
        str     r4, [sp, #0x2C]
        str     r9, [sp, #0x30]
        str     r5, [sp, #0x18]
        mov     r5, r0
        mov     r4, r1
        mov     r9, r2
LBZE22:
        ldr     r2, [r7, #0x24]
        mov     r1, #1, 22
        mov     r0, r4
        bl      _ipps_cRadix4Inv_32fc
        ldr     r12, [r7, #0xC]
        cmp     r12, #0
        beq     LBZE23
        ldr     r0, [r7, #0x10]
        mov     r2, #2, 22
        mov     r1, r4
        bl      _ipps_rbMpy1_32f
LBZE23:
        subs    r9, r9, #1, 22
        sub     r4, r4, #2, 20
        bpl     LBZE22
        mov     r0, r5
        ldr     r4, [sp, #0x2C]
        ldr     r9, [sp, #0x30]
        ldr     r5, [sp, #0x18]
LBZE24:
        str     r10, [sp, #4]
        str     r11, [sp]
        ldr     r3, [r7, #0x28]
        mov     r2, #1, 22
        mov     r1, r4
        bl      LBZE_cFft_Blk_R2
        add     r8, r4, r8
        cmp     r8, r5
        blt     LBZE21
        ldr     r8, [sp, #0x28]
LBZE25:
        cmp     r5, r4
        ble     LBZE26
        str     r10, [sp, #4]
        str     r11, [sp]
        ldr     r3, [r7, #0x2C]
        mov     r2, r4
        mov     r1, r5
        mov     r0, r9
        bl      LBZE_cFft_Blk_R2
LBZE26:
        subs    r8, r8, #1
        add     r9, r9, r5, lsl #3
        bne     LBZE20
        mov     r1, r5
        ldr     r4, [sp, #0x34]
        ldr     r5, [sp, #0x38]
        ldr     r10, [sp, #0x40]
        ldr     r6, [sp, #0x3C]
        b       LBZE29
LBZE27:
        cmp     r4, #0
        ble     LBZE29
        add     r11, r10, #1
        str     r10, [sp, #0x40]
        str     r6, [sp, #0x3C]
        mov     r8, r4
        mov     r6, r1
        mov     r10, r2
LBZE28:
        str     r5, [sp]
        mov     r3, r11
        mov     r2, r10
        mov     r1, r9
        mov     r0, r7
        bl      LBZE_cFftInv_BlkStep
        subs    r8, r8, #1
        add     r9, r9, r6, lsl #3
        bne     LBZE28
        mov     r1, r6
        ldr     r10, [sp, #0x40]
        ldr     r6, [sp, #0x3C]
LBZE29:
        add     r10, r7, r10, lsl #2
        ldr     r2, [r10, #0x44]
        add     r9, r5, r4, lsl #3
        add     r8, r9, r4, lsl #3
        cmp     r1, #0
        add     r7, r8, r4, lsl #3
        ble     LBZE34
        mov     r11, #0
        str     r2, [sp, #0x40]
        str     r1, [sp, #0x18]
LBZE30:
        add     r0, r6, r11, lsl #3
        str     r0, [sp, #0x1C]
        cmp     r4, #0
        ble     LBZE32
        str     r6, [sp, #0x3C]
        ldr     r6, [sp, #0x40]
        sub     r2, r5, #4
        mov     lr, r4
        sub     r12, r7, #4
        sub     r3, r8, #4
        sub     r1, r9, #4
        str     r4, [sp, #0x34]
        str     r5, [sp, #0x38]
        str     lr, [sp, #0x10]
        str     r2, [sp, #0xC]
        str     r3, [sp, #8]
        str     r12, [sp, #0x14]
        str     r11, [sp, #0x20]
        str     r7, [sp, #0x24]
        str     r8, [sp, #0x28]
        str     r9, [sp, #0x2C]
        str     r10, [sp, #0x30]
        mov     r4, r0
        mov     r5, r1
LBZE31:
        ldr     r8, [r6]
        ldr     r11, [r4]
        ldr     r10, [r6, #4]
        ldr     r9, [r4, #4]
        mov     r1, r8
        mov     r0, r11
        bl      __mulsf3
        mov     r7, r0
        mov     r1, r10
        mov     r0, r9
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        str     r0, [sp, #0x44]
        mov     r1, r8
        mov     r0, r9
        bl      __mulsf3
        mov     r7, r0
        mov     r1, r10
        mov     r0, r11
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r7
        bl      __subsf3
        ldr     r9, [r4, #8]
        ldr     r7, [r6, #8]
        ldr     r10, [r6, #0xC]
        ldr     r8, [r4, #0xC]
        str     r0, [sp, #0x48]
        mov     r0, r9
        mov     r1, r7
        bl      __mulsf3
        mov     r11, r0
        mov     r0, r8
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        mov     r11, r0
        mov     r1, r7
        mov     r0, r8
        bl      __mulsf3
        mov     r7, r0
        mov     r0, r9
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r7
        bl      __subsf3
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #0x44]
        str     r3, [r2, #4]
        ldr     r3, [sp, #0x48]
        str     r3, [r2, #8]
        str     r0, [r5, #8]
        str     r11, [r5, #4]
        ldr     r9, [r6, #0x10]
        ldr     r11, [r4, #0x10]
        ldr     r10, [r6, #0x14]
        ldr     r8, [r4, #0x14]
        mov     r1, r9
        mov     r0, r11
        bl      __mulsf3
        mov     r7, r0
        mov     r1, r10
        mov     r0, r8
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        str     r0, [sp, #0x48]
        mov     r0, r8
        mov     r1, r9
        bl      __mulsf3
        mov     r7, r0
        mov     r1, r10
        mov     r0, r11
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r7
        bl      __subsf3
        ldr     r10, [r4, #0x18]
        ldr     r8, [r6, #0x18]
        ldr     r7, [r4, #0x1C]
        ldr     r9, [r6, #0x1C]
        str     r0, [sp, #0x44]
        mov     r1, r8
        mov     r0, r10
        bl      __mulsf3
        mov     r11, r0
        mov     r1, r9
        mov     r0, r7
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        mov     r11, r0
        mov     r0, r7
        mov     r1, r8
        bl      __mulsf3
        mov     r7, r0
        mov     r0, r10
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r7
        bl      __subsf3
        ldr     r3, [sp, #0x48]
        ldr     r2, [sp, #8]
        add     r6, r6, #0x20
        add     r5, r5, #8
        str     r3, [r2, #4]
        ldr     r3, [sp, #0x44]
        str     r3, [r2, #8]
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
        ldr     r2, [sp, #8]
        add     r2, r2, #8
        str     r2, [sp, #8]
        ldr     r2, [sp, #0xC]
        add     r2, r2, #8
        str     r2, [sp, #0xC]
        ldr     r2, [sp, #0x10]
        bne     LBZE31
        str     r6, [sp, #0x40]
        ldr     r11, [sp, #0x20]
        ldr     r7, [sp, #0x24]
        ldr     r8, [sp, #0x28]
        ldr     r9, [sp, #0x2C]
        ldr     r10, [sp, #0x30]
        ldr     r4, [sp, #0x34]
        ldr     r5, [sp, #0x38]
        ldr     r6, [sp, #0x3C]
LBZE32:
        ldr     r2, [r10, #0x38]
        mov     r1, r4
        mov     r0, r5
        bl      _ipps_cRadix4Inv_32fc
        ldr     r2, [r10, #0x38]
        mov     r1, r4
        mov     r0, r9
        bl      _ipps_cRadix4Inv_32fc
        ldr     r2, [r10, #0x38]
        mov     r1, r4
        mov     r0, r8
        bl      _ipps_cRadix4Inv_32fc
        ldr     r2, [r10, #0x38]
        mov     r1, r4
        mov     r0, r7
        bl      _ipps_cRadix4Inv_32fc
        cmp     r4, #0
        ble     LBZE35
        sub     r3, r5, #4
        str     r5, [sp, #0x38]
        str     r6, [sp, #0x3C]
        ldr     r5, [sp, #0x1C]
        ldr     r6, [sp, #0x18]
        sub     r0, r7, #4
        sub     lr, r8, #4
        sub     r12, r9, #4
        mov     r2, r4
LBZE33:
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
        bne     LBZE33
        str     r6, [sp, #0x18]
        ldr     r2, [sp, #0x18]
        ldr     r5, [sp, #0x38]
        ldr     r6, [sp, #0x3C]
        add     r11, r11, #4
        cmp     r11, r2
        blt     LBZE30
LBZE34:
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LBZE35:
        ldr     r2, [sp, #0x18]
        add     r11, r11, #4
        cmp     r11, r2
        blt     LBZE30
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
        .long   LBZE_tbl_blk_order


        .data
        .align  4


LBZE_tbl_blk_order:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x05,0x00,0x00,0x00,0x06,0x00,0x00,0x00,0x07,0x00,0x00,0x00,0x08,0x00,0x00,0x00
        .byte   0x08,0x00,0x00,0x00,0x08,0x00,0x00,0x00,0x0A,0x00,0x00,0x00,0x0A,0x00,0x00,0x00
        .byte   0x0A,0x00,0x00,0x00,0x0A,0x00,0x00,0x00,0x08,0x00,0x00,0x00,0x08,0x00,0x00,0x00
        .byte   0x0A,0x00,0x00,0x00,0x0A,0x00,0x00,0x00,0x0A,0x00,0x00,0x00,0x0A,0x00,0x00,0x00
        .byte   0x0A,0x00,0x00,0x00,0x0A,0x00,0x00,0x00


