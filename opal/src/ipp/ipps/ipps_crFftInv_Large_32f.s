        .text
        .align  4
        .globl  _ipps_crFftInv_Large_32f


_ipps_crFftInv_Large_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        ldr     r9, [sp, #0x48]
        mov     r8, r0
        ldr     r7, [sp, #0x44]
        ldr     r10, [sp, #0x4C]
        ldr     r0, [r8, #0x20]
        mov     r5, r3
        mov     r12, #1
        cmp     r1, r5
        mov     r6, r2
        mov     r4, r12, lsl r9
        beq     LBZC10
        mov     r3, r0
        mov     r0, r1
        mov     r2, r4
        mov     r1, r5
        bl      _ipps_BitRev2_4
LBZC0:
        ldr     r2, [r8, #0x20]
        cmp     r6, r7
        beq     LBZC9
        mov     r3, r2
        mov     r0, r6
        mov     r2, r4
        mov     r1, r7
        bl      _ipps_BitRev2_4
LBZC1:
        ldr     lr, [pc, #0xE4C]
        mov     r12, #0
        add     lr, lr, r9, lsl #2
        ldr     lr, [lr, #-0x24]
        cmp     lr, #0
        bne     LBZC7
        mov     r6, #1, 18
        cmp     r4, #1, 18
        movlt   r6, r4
        cmp     r4, #0
        ble     LBZC6
        mov     r11, #0
        mov     r10, r11
        mov     r9, #1, 24
LBZC2:
        cmp     r6, #0
        add     r0, r5, r11, lsl #2
        add     r1, r7, r11, lsl #2
        ble     LBZC5
        mov     r3, r1
        mov     r2, r0
        str     r11, [sp, #0x1C]
        mov     r12, #0
        str     r4, [sp, #0x18]
        str     r7, [sp, #0x14]
        str     r5, [sp, #0x10]
        mov     r11, r9
        mov     r9, r0
        mov     r7, r1
        mov     r4, r2
        mov     r5, r3
        mov     r10, r12
LBZC3:
        ldr     r3, [r8, #0x24]
        mov     r2, #1, 22
        mov     r1, r5
        mov     r0, r4
        bl      _ipps_crRadix4Inv_32f
        ldr     lr, [r8, #0xC]
        cmp     lr, #0
        beq     LBZC4
        ldr     r0, [r8, #0x10]
        mov     r2, #1, 22
        mov     r1, r4
        bl      _ipps_rbMpy1_32f
        ldr     r0, [r8, #0x10]
        mov     r2, #1, 22
        mov     r1, r5
        bl      _ipps_rbMpy1_32f
LBZC4:
        add     r10, r10, #1, 22
        cmp     r10, r6
        add     r5, r5, #1, 20
        add     r4, r4, #1, 20
        blt     LBZC3
        mov     r1, r7
        mov     r0, r9
        mov     r9, r11
        ldr     r11, [sp, #0x1C]
        ldr     r4, [sp, #0x18]
        ldr     r7, [sp, #0x14]
        ldr     r5, [sp, #0x10]
        mov     r10, #0
LBZC5:
        str     r9, [sp, #8]
        str     r10, [sp, #4]
        ldr     r12, [r8, #0x28]
        str     r12, [sp]
        mov     r3, #1, 22
        mov     r2, r6
        bl      LBZC_crFft_Blk_R2
        add     r11, r6, r11
        cmp     r11, r4
        blt     LBZC2
LBZC6:
        cmp     r4, r6
        ble     LBZC8
        mov     r12, #1, 24
        str     r12, [sp, #8]
        mov     r12, #0
        str     r12, [sp, #4]
        ldr     r8, [r8, #0x2C]
        mov     r3, r6
        mov     r2, r4
        str     r8, [sp]
        mov     r1, r7
        mov     r0, r5
        bl      LBZC_crFft_Blk_R2
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBZC7:
        str     r12, [sp]
        str     r10, [sp, #4]
        mov     r3, r9
        mov     r2, r7
        mov     r1, r5
        mov     r0, r8
        bl      LBZC_crFftInv_BlkStep
LBZC8:
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBZC9:
        mov     r1, r4
        mov     r0, r7
        bl      _ipps_BitRev1_4
        b       LBZC1
LBZC10:
        mov     r2, r0
        mov     r1, r4
        mov     r0, r5
        bl      _ipps_BitRev1_4
        b       LBZC0
LBZC_crFft_Blk_R2:
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
        ble     LBZC18
        mov     r1, r5
        str     r7, [sp]
        str     r6, [sp, #8]
        mov     r5, r2
LBZC11:
        ldr     r6, [sp, #8]
        cmp     r5, #0
        mov     r11, r1
        ble     LBZC17
        mvn     r2, #6, 2
        and     r2, r4, r2
        mov     r12, r4, lsl #2
        str     r4, [sp, #0xC]
        ldr     r4, [sp]
        mov     r10, #0
        mov     r3, r0, lsl #2
        mov     r9, r10
        sub     r8, lr, #1
        mov     r7, r0, lsl #7
        str     r3, [sp, #0x18]
        str     lr, [sp, #0x14]
        str     r0, [sp, #0x10]
        str     r1, [sp, #4]
LBZC12:
        cmp     r8, #0
        mov     lr, r11
        mov     r3, r6
        mov     r1, r8
        blt     LBZC16
        add     r0, r4, r9, lsl #2
        str     r7, [sp, #0x38]
        str     r8, [sp, #0x3C]
        str     r9, [sp, #0x40]
        str     r10, [sp, #0x44]
        str     r6, [sp, #0x48]
        str     r11, [sp, #0x4C]
        str     r5, [sp, #0x50]
LBZC13:
        add     r9, r12, lr
        add     r8, r12, r3
        add     r11, r3, #4
        mov     r10, r0
        mov     r7, #0
        add     r6, r9, #4
        add     r5, r8, #4
        add     r4, lr, #4
        str     r11, [sp, #0x1C]
        str     r0, [sp, #0x28]
        str     r1, [sp, #0x2C]
        str     r3, [sp, #0x20]
        str     lr, [sp, #0x24]
        str     r2, [sp, #0x30]
        str     r12, [sp, #0x34]
LBZC14:
        ldr     r0, [r9]
        str     r0, [sp, #0x58]
        ldr     r1, [r10]
        str     r1, [sp, #0x54]
        ldr     r1, [r8]
        str     r1, [sp, #0x5C]
        ldr     r1, [sp, #0x18]
        add     r1, r10, r1
        str     r1, [sp, #0x60]
        ldr     r1, [sp, #0x54]
        bl      __mulsf3
        ldr     r11, [r10, #4]
        str     r0, [sp, #0x64]
        ldr     r0, [sp, #0x5C]
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x64]
        bl      __addsf3
        ldr     r1, [sp, #0x54]
        str     r0, [sp, #0x64]
        ldr     r0, [sp, #0x5C]
        bl      __mulsf3
        str     r0, [sp, #0x5C]
        ldr     r0, [sp, #0x58]
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x5C]
        bl      __subsf3
        ldr     r1, [sp, #0x24]
        ldr     r1, [r1, +r7, lsl #2]
        str     r0, [sp, #0x58]
        str     r1, [sp, #0x5C]
        ldr     r1, [sp, #0x64]
        ldr     r0, [sp, #0x5C]
        bl      __subsf3
        ldr     r1, [sp, #0x20]
        ldr     r11, [r1, +r7, lsl #2]
        ldr     r1, [sp, #0x58]
        str     r0, [sp, #0x54]
        mov     r0, r11
        bl      __subsf3
        str     r0, [sp, #0x68]
        ldr     r1, [sp, #0x64]
        ldr     r0, [sp, #0x5C]
        bl      __addsf3
        ldr     r1, [sp, #0x58]
        str     r0, [sp, #0x64]
        mov     r0, r11
        bl      __addsf3
        ldr     r1, [sp, #0x54]
        str     r1, [r9], #8
        ldr     r1, [sp, #0x68]
        str     r1, [r8], #8
        ldr     r1, [sp, #0x24]
        ldr     r2, [sp, #0x64]
        str     r2, [r1, +r7, lsl #2]
        ldr     r1, [sp, #0x20]
        str     r0, [r1, +r7, lsl #2]
        ldr     r0, [r6]
        add     r7, r7, #2
        str     r0, [sp, #0x68]
        ldr     r0, [sp, #0x18]
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
        ldr     r1, [sp, #0x5C]
        bl      __addsf3
        str     r0, [sp, #0x5C]
        ldr     r0, [sp, #0x68]
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x64]
        mov     r11, r0
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r11
        bl      __subsf3
        ldr     r11, [r4]
        ldr     r1, [sp, #0x5C]
        ldr     r3, [sp, #0x60]
        ldr     r2, [sp, #0x18]
        str     r0, [sp, #0x68]
        mov     r0, r11
        add     r10, r3, r2
        bl      __subsf3
        ldr     r1, [sp, #0x1C]
        ldr     r1, [r1]
        str     r0, [sp, #0x60]
        str     r1, [sp, #0x64]
        ldr     r1, [sp, #0x68]
        ldr     r0, [sp, #0x64]
        bl      __subsf3
        ldr     r1, [sp, #0x5C]
        str     r0, [sp, #0x58]
        mov     r0, r11
        bl      __addsf3
        mov     r11, r0
        ldr     r0, [sp, #0x64]
        ldr     r1, [sp, #0x68]
        bl      __addsf3
        ldr     r1, [sp, #0x60]
        cmp     r7, #0x80
        str     r1, [r6], #8
        ldr     r1, [sp, #0x58]
        str     r1, [r5], #8
        str     r11, [r4], #8
        ldr     r1, [sp, #0x1C]
        str     r0, [r1], #8
        str     r1, [sp, #0x1C]
        blt     LBZC14
        ldr     r2, [sp, #0x30]
        ldr     r3, [sp, #0x20]
        ldr     lr, [sp, #0x24]
        ldr     r12, [sp, #0x34]
        ldr     r0, [sp, #0x28]
        ldr     r1, [sp, #0x2C]
        add     r6, r3, r2, lsl #1
        add     r7, lr, r2, lsl #1
        add     r4, r12, r6
        add     r5, r12, r7
        add     lr, r4, #4
        str     r5, [sp, #0x24]
        str     r4, [sp, #0x20]
        mov     r3, #0
        add     r10, r5, #4
        add     r11, r6, #4
        mov     r8, r0
        add     r9, r7, #4
        str     r11, [sp, #0x54]
        str     lr, [sp, #0x58]
        str     r3, [sp, #0x1C]
        str     r0, [sp, #0x28]
        str     r1, [sp, #0x2C]
        str     r2, [sp, #0x30]
        str     r12, [sp, #0x34]
LBZC15:
        ldr     r0, [r8]
        str     r0, [sp, #0x68]
        ldr     r0, [r4]
        ldr     r1, [sp, #0x68]
        str     r0, [sp, #0x64]
        ldr     r0, [r5]
        str     r0, [sp, #0x60]
        ldr     r0, [sp, #0x18]
        add     r0, r8, r0
        str     r0, [sp, #0x5C]
        ldr     r0, [sp, #0x64]
        bl      __mulsf3
        ldr     r11, [r8, #4]
        ldr     r2, [sp, #0x1C]
        str     r0, [sp, #0x6C]
        ldr     r0, [sp, #0x60]
        add     r2, r2, #2
        str     r2, [sp, #0x1C]
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x6C]
        bl      __subsf3
        str     r0, [sp, #0x6C]
        ldr     r1, [sp, #0x68]
        ldr     r0, [sp, #0x60]
        bl      __mulsf3
        str     r0, [sp, #0x68]
        ldr     r0, [sp, #0x64]
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x68]
        bl      __addsf3
        ldr     r2, [r7]
        mov     r11, r0
        ldr     r1, [sp, #0x6C]
        str     r2, [sp, #0x68]
        ldr     r0, [sp, #0x68]
        bl      __subsf3
        ldr     r2, [r6]
        str     r0, [sp, #0x60]
        str     r2, [sp, #0x64]
        ldr     r0, [sp, #0x64]
        mov     r1, r11
        bl      __subsf3
        str     r0, [sp, #0x70]
        ldr     r0, [sp, #0x68]
        ldr     r1, [sp, #0x6C]
        bl      __addsf3
        str     r0, [sp, #0x6C]
        ldr     r0, [sp, #0x64]
        mov     r1, r11
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
        ldr     r0, [sp, #0x18]
        str     r1, [sp, #0x6C]
        ldr     r11, [r8, +r0]
        ldr     r0, [sp, #0x70]
        bl      __mulsf3
        ldr     r2, [sp, #0x58]
        mov     r1, r11
        ldr     r8, [r2]
        str     r0, [sp, #0x68]
        mov     r0, r8
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x68]
        bl      __subsf3
        str     r0, [sp, #0x68]
        ldr     r0, [sp, #0x70]
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x6C]
        mov     r11, r0
        mov     r0, r8
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r11, [r9]
        ldr     r1, [sp, #0x68]
        mov     r8, r0
        mov     r0, r11
        bl      __subsf3
        ldr     r2, [sp, #0x54]
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
        ldr     r2, [sp, #0x58]
        str     r1, [r2]
        str     r11, [r9], #8
        ldr     r1, [sp, #0x54]
        str     r0, [r1]
        ldr     r0, [sp, #0x1C]
        ldr     r1, [sp, #0x18]
        cmp     r0, #0x80
        ldr     r0, [sp, #0x58]
        add     r0, r0, #8
        str     r0, [sp, #0x58]
        ldr     r0, [sp, #0x54]
        add     r0, r0, #8
        str     r0, [sp, #0x54]
        ldr     r0, [sp, #0x5C]
        add     r8, r0, r1
        blt     LBZC15
        ldr     r3, [sp, #0x24]
        ldr     r2, [sp, #0x30]
        ldr     r1, [sp, #0x2C]
        ldr     r0, [sp, #0x28]
        ldr     r12, [sp, #0x34]
        add     lr, r3, r2, lsl #1
        ldr     r3, [sp, #0x20]
        subs    r1, r1, #1
        add     r3, r3, r2, lsl #1
        bpl     LBZC13
        ldr     r7, [sp, #0x38]
        ldr     r8, [sp, #0x3C]
        ldr     r9, [sp, #0x40]
        ldr     r10, [sp, #0x44]
        ldr     r6, [sp, #0x48]
        ldr     r11, [sp, #0x4C]
        ldr     r5, [sp, #0x50]
        ldr     r4, [sp]
LBZC16:
        add     r10, r10, #1
        cmp     r10, r5
        add     r11, r11, #2, 24
        add     r6, r6, #2, 24
        add     r9, r7, r9
        blt     LBZC12
        ldr     lr, [sp, #0x14]
        ldr     r0, [sp, #0x10]
        ldr     r4, [sp, #0xC]
        ldr     r1, [sp, #4]
LBZC17:
        mov     lr, lr, asr #1
        cmp     lr, #0
        mov     r4, r4, lsl #1
        mov     r5, r5, lsl #1
        mov     r0, r0, asr #1
        bgt     LBZC11
LBZC18:
        add     sp, sp, #0x74
        ldmia   sp!, {r4 - r11, pc}
LBZC_crFftInv_BlkStep:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x60
        ldr     r12, [pc, #0x6CC]
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
        bgt     LBZC21
        cmp     r4, #0
        ble     LBZC31
        mov     r10, r4
        str     r9, [sp, #0x18]
        mov     r11, r5
        str     r1, [sp, #0x1C]
        mov     r5, r0
        mov     r8, r2
        mov     r9, r3
LBZC19:
        ldr     r3, [r6, #0x24]
        mov     r2, r8
        mov     r1, r5
        mov     r0, r9
        bl      _ipps_crRadix4Inv_32f
        ldr     r12, [r6, #0xC]
        cmp     r12, #0
        beq     LBZC20
        ldr     r0, [r6, #0x10]
        mov     r2, r8
        mov     r1, r9
        bl      _ipps_rbMpy1_32f
        ldr     r0, [r6, #0x10]
        mov     r2, r8
        mov     r1, r5
        bl      _ipps_rbMpy1_32f
LBZC20:
        subs    r10, r10, #1
        add     r9, r9, r8, lsl #2
        add     r5, r5, r8, lsl #2
        bne     LBZC19
        mov     r2, r8
        mov     r5, r11
        ldr     r9, [sp, #0x18]
        ldr     r1, [sp, #0x1C]
        b       LBZC31
LBZC21:
        add     r12, r12, r8, lsl #2
        ldr     r12, [r12, #-0x24]
        cmp     r12, #0
        bne     LBZC29
        cmp     r4, #0
        ble     LBZC31
        mov     r8, #1, 18
        cmp     r2, #1, 18
        mov     r10, r4
        str     r9, [sp, #0x18]
        movlt   r8, r2
        mov     r11, #1, 24
        str     r4, [sp, #0x10]
        mov     r9, r10
        mov     r12, #0
        str     r5, [sp, #0x24]
        str     r7, [sp, #0x14]
        mov     r4, r8
        mov     r10, r11
        str     r1, [sp, #0x1C]
        mov     r5, r0
        mov     r8, r2
        mov     r7, r3
        mov     r11, r12
LBZC22:
        cmp     r8, #0
        ble     LBZC27
        mov     r0, #0
        str     r9, [sp, #0x4C]
        mov     r9, r0
LBZC23:
        cmp     r4, #0
        add     r0, r7, r9, lsl #2
        add     r1, r5, r9, lsl #2
        ble     LBZC26
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
LBZC24:
        ldr     r3, [r7, #0x24]
        mov     r2, #1, 22
        mov     r1, r6
        mov     r0, r5
        bl      _ipps_crRadix4Inv_32f
        ldr     lr, [r7, #0xC]
        cmp     lr, #0
        beq     LBZC25
        ldr     r0, [r7, #0x10]
        mov     r2, #1, 22
        mov     r1, r5
        bl      _ipps_rbMpy1_32f
        ldr     r0, [r7, #0x10]
        mov     r2, #1, 22
        mov     r1, r6
        bl      _ipps_rbMpy1_32f
LBZC25:
        add     r11, r11, #1, 22
        cmp     r11, r4
        add     r6, r6, #1, 20
        add     r5, r5, #1, 20
        blt     LBZC24
        mov     r6, r7
        mov     r1, r8
        mov     r0, r9
        mov     r9, r10
        ldr     r5, [sp, #0x50]
        ldr     r7, [sp, #0x54]
        ldr     r8, [sp, #0x44]
        mov     r10, #1, 24
        mov     r11, #0
LBZC26:
        str     r10, [sp, #8]
        str     r11, [sp, #4]
        ldr     lr, [r6, #0x28]
        mov     r3, #1, 22
        mov     r2, r4
        str     lr, [sp]
        bl      LBZC_crFft_Blk_R2
        add     r9, r4, r9
        cmp     r9, r8
        blt     LBZC23
        ldr     r9, [sp, #0x4C]
LBZC27:
        cmp     r8, r4
        ble     LBZC28
        str     r10, [sp, #8]
        str     r11, [sp, #4]
        ldr     lr, [r6, #0x2C]
        mov     r3, r4
        mov     r2, r8
        str     lr, [sp]
        mov     r1, r5
        mov     r0, r7
        bl      LBZC_crFft_Blk_R2
LBZC28:
        subs    r9, r9, #1
        add     r7, r7, r8, lsl #2
        add     r5, r5, r8, lsl #2
        bne     LBZC22
        mov     r2, r8
        ldr     r4, [sp, #0x10]
        ldr     r5, [sp, #0x24]
        ldr     r7, [sp, #0x14]
        ldr     r9, [sp, #0x18]
        ldr     r1, [sp, #0x1C]
        b       LBZC31
LBZC29:
        cmp     r4, #0
        ble     LBZC31
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
LBZC30:
        str     r10, [sp]
        str     r11, [sp, #4]
        mov     r3, r4
        mov     r2, r5
        mov     r1, r7
        mov     r0, r6
        bl      LBZC_crFftInv_BlkStep
        subs    r9, r9, #1
        add     r7, r7, r8, lsl #2
        add     r5, r5, r8, lsl #2
        bne     LBZC30
        mov     r2, r8
        mov     r5, r11
        ldr     r4, [sp, #0x10]
        ldr     r7, [sp, #0x14]
        ldr     r9, [sp, #0x18]
        ldr     r1, [sp, #0x1C]
LBZC31:
        add     r10, r6, r7, lsl #2
        ldr     r3, [r10, #0x44]
        add     r8, r5, r4, lsl #3
        add     r7, r8, r4, lsl #3
        cmp     r2, #0
        add     r6, r7, r4, lsl #3
        ble     LBZC36
        mov     r11, #0
        str     r3, [sp, #0x14]
        str     r2, [sp, #0x44]
        str     r1, [sp, #0x1C]
LBZC32:
        ldr     r3, [sp, #0x1C]
        add     r0, r9, r11, lsl #2
        str     r0, [sp, #0x40]
        add     r1, r3, r11, lsl #2
        str     r1, [sp, #0x3C]
        cmp     r4, #0
        ble     LBZC34
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
        str     r3, [sp, #0x54]
        str     r12, [sp, #0x50]
        str     lr, [sp, #0x48]
        str     r11, [sp, #0x38]
        str     r7, [sp, #0x30]
        str     r8, [sp, #0x2C]
        str     r10, [sp, #0x28]
        str     r9, [sp, #0x18]
        mov     r4, r0
        mov     r5, r1
LBZC33:
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
        mov     r1, r7
        bl      __addsf3
        str     r0, [sp, #0x58]
        mov     r1, r8
        mov     r0, r9
        bl      __mulsf3
        mov     r7, r0
        mov     r0, r11
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r7
        bl      __subsf3
        ldr     r8, [r4, #4]
        ldr     r7, [r6, #8]
        ldr     r9, [r5, #4]
        ldr     r10, [r6, #0xC]
        str     r0, [sp, #0x5C]
        mov     r1, r7
        mov     r0, r9
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
        mov     r1, r10
        mov     r0, r9
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r7
        bl      __subsf3
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x58]
        str     r3, [r2, #4]
        ldr     r3, [sp, #0x5C]
        str     r3, [r2, #8]
        ldr     r2, [sp, #0x54]
        str     r11, [r2, #4]
        str     r0, [r2, #8]
        ldr     r9, [r6, #0x10]
        ldr     r11, [r5, #8]
        ldr     r10, [r6, #0x14]
        ldr     r8, [r4, #8]
        mov     r1, r9
        mov     r0, r11
        bl      __mulsf3
        mov     r7, r0
        mov     r0, r8
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        str     r0, [sp, #0x5C]
        mov     r0, r8
        mov     r1, r9
        bl      __mulsf3
        mov     r7, r0
        mov     r0, r11
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r7
        bl      __subsf3
        ldr     r8, [r6, #0x18]
        ldr     r10, [r5, #0xC]
        ldr     r7, [r4, #0xC]
        ldr     r9, [r6, #0x1C]
        str     r0, [sp, #0x58]
        mov     r1, r8
        mov     r0, r10
        bl      __mulsf3
        mov     r11, r0
        mov     r0, r7
        mov     r1, r9
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
        ldr     r3, [sp, #0x5C]
        ldr     r2, [sp, #0x50]
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
        ldr     r2, [sp, #0x50]
        add     r2, r2, #8
        str     r2, [sp, #0x50]
        ldr     r2, [sp, #0x54]
        add     r2, r2, #8
        str     r2, [sp, #0x54]
        ldr     r2, [sp, #0x20]
        add     r2, r2, #8
        str     r2, [sp, #0x20]
        ldr     r2, [sp, #0x4C]
        bne     LBZC33
        str     r6, [sp, #0x14]
        ldr     r11, [sp, #0x38]
        ldr     r6, [sp, #0x34]
        ldr     r7, [sp, #0x30]
        ldr     r8, [sp, #0x2C]
        ldr     r10, [sp, #0x28]
        ldr     r4, [sp, #0x10]
        ldr     r5, [sp, #0x24]
        ldr     r9, [sp, #0x18]
LBZC34:
        ldr     r2, [r10, #0x38]
        mov     r1, r4
        mov     r0, r5
        bl      _ipps_cRadix4Inv_32fc
        ldr     r2, [r10, #0x38]
        mov     r1, r4
        mov     r0, r8
        bl      _ipps_cRadix4Inv_32fc
        ldr     r2, [r10, #0x38]
        mov     r1, r4
        mov     r0, r7
        bl      _ipps_cRadix4Inv_32fc
        ldr     r2, [r10, #0x38]
        mov     r1, r4
        mov     r0, r6
        bl      _ipps_cRadix4Inv_32fc
        cmp     r4, #0
        ble     LBZC37
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
LBZC35:
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
        bne     LBZC35
        str     r5, [sp, #0x44]
        ldr     r3, [sp, #0x44]
        ldr     r4, [sp, #0x10]
        ldr     r5, [sp, #0x24]
        ldr     r9, [sp, #0x18]
        add     r11, r11, #4
        cmp     r11, r3
        blt     LBZC32
LBZC36:
        add     sp, sp, #0x60
        ldmia   sp!, {r4 - r11, pc}
LBZC37:
        ldr     r3, [sp, #0x44]
        add     r11, r11, #4
        cmp     r11, r3
        blt     LBZC32
        add     sp, sp, #0x60
        ldmia   sp!, {r4 - r11, pc}
        .long   LBZC_tbl_blk_order


        .data
        .align  4


LBZC_tbl_blk_order:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x05,0x00,0x00,0x00,0x06,0x00,0x00,0x00,0x07,0x00,0x00,0x00,0x08,0x00,0x00,0x00
        .byte   0x08,0x00,0x00,0x00,0x08,0x00,0x00,0x00,0x0A,0x00,0x00,0x00,0x0A,0x00,0x00,0x00
        .byte   0x0A,0x00,0x00,0x00,0x0A,0x00,0x00,0x00,0x08,0x00,0x00,0x00,0x08,0x00,0x00,0x00
        .byte   0x0A,0x00,0x00,0x00,0x0A,0x00,0x00,0x00,0x0A,0x00,0x00,0x00,0x0A,0x00,0x00,0x00
        .byte   0x0A,0x00,0x00,0x00,0x0A,0x00,0x00,0x00


