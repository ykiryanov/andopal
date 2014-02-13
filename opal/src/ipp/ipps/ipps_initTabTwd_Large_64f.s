        .text
        .align  4
        .globl  _ipps_initTabTwd_Large_64f


_ipps_initTabTwd_Large_64f:
        stmdb   sp!, {r4 - r10, lr}
        sub     sp, sp, #0x10
        mov     r7, r0
        ldr     r0, [r7, #0x24]
        ldr     r8, [sp, #0x30]
        ldr     r10, [sp, #0x34]
        mov     r6, r1
        mov     r1, r0
        mov     r0, r6
        mov     r5, r2
        mov     r4, r3
        bl      _ipps_initTabBitRev
        ldr     r12, [pc, #0x7BC]
        mov     r9, #0
        add     r12, r12, r6, lsl #2
        ldr     r12, [r12, #-0x24]
        cmp     r12, #0
        bne     LCEG0
        str     r8, [r7, #0x28]
        mov     r3, r8
        mov     r0, #9
        mov     r2, r4
        mov     r1, r5
        bl      _ipps_initTabTwd_L1_64f
        mov     r3, r0
        str     r3, [r7, #0x2C]
        mov     r0, r6
        mov     r2, r4
        mov     r1, r5
        bl      LCEG_initTabTwd_L2
        str     r9, [r7, #0x1C]
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r10, pc}
LCEG0:
        str     r10, [sp, #8]
        str     r8, [sp, #4]
        str     r9, [sp]
        mov     r0, r7
        mov     r3, r4
        mov     r2, r5
        mov     r1, r6
        bl      LCEG_initTabTwd_Step
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r10, pc}
LCEG_initTabTwd_Step:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x88
        ldr     lr, [sp, #0xAC]
        ldr     r12, [pc, #0x734]
        mov     r11, r1
        str     lr, [sp, #0x10]
        ldr     r1, [sp, #0xB0]
        ldr     r7, [sp, #0xB4]
        add     lr, r12, r11, lsl #2
        ldr     r10, [lr, #-0x24]
        mov     r9, r0
        mov     r8, r2
        mov     r5, r3
        sub     r4, r11, r10
        cmp     r4, #9
        mov     r6, #0
        ble     LCEG18
        add     r12, r12, r4, lsl #2
        ldr     r12, [r12, #-0x24]
        cmp     r12, #0
        bne     LCEG1
        str     r1, [r9, #0x28]
        mov     r3, r1
        mov     r0, #9
        mov     r2, r5
        mov     r1, r8
        bl      _ipps_initTabTwd_L1_64f
        mov     r3, r0
        str     r3, [r9, #0x2C]
        mov     r0, r4
        mov     r2, r5
        mov     r1, r8
        bl      LCEG_initTabTwd_L2
        str     r6, [r9, #0x1C]
        b       LCEG2
LCEG1:
        str     r1, [sp, #4]
        str     r7, [sp, #8]
        ldr     r12, [sp, #0x10]
        mov     r0, r9
        mov     r3, r5
        add     r12, r12, #1
        str     r12, [sp]
        mov     r2, r8
        mov     r1, r4
        bl      LCEG_initTabTwd_Step
LCEG2:
        ldr     r12, [sp, #0x10]
        mov     r3, r0
        mov     r1, r8
        add     r12, r9, r12, lsl #2
        str     r12, [sp, #0x80]
        str     r0, [r12, #0x3C]
        mov     r2, r5
        mov     r0, r10
        bl      _ipps_initTabTwd_L1_64f
        ldr     r12, [sp, #0x80]
        str     r0, [sp, #0x14]
        str     r0, [r12, #0x48]
        mov     r12, #1
        mov     r4, r12, lsl r4
        str     r4, [sp, #0x10]
        mov     r4, r12, lsl r10
        mov     r0, r10
        mov     r3, r4, lsl #6
        add     r1, r7, r3
        str     r1, [sp, #0x2C]
        str     r3, [sp, #0x44]
        sub     r5, r5, r11
        mov     r11, r12, lsl r11
        mov     r5, r12, lsl r5
        bl      _ipps_initTabBitRev
        ldr     r3, [sp, #0x10]
        cmp     r3, #0
        ldr     r3, [sp, #0x14]
        add     r3, r3, r11, lsl #4
        str     r3, [sp, #0x40]
        ble     LCEG17
        mul     r3, r5, r11
        mov     r0, r6
        str     r0, [sp, #0x24]
        cmp     r11, #0
        mov     lr, #1
        str     r3, [sp, #0x28]
        add     r3, r11, r11, lsl #1
        movlt   r0, lr
        mov     lr, r3, asr #1
        mov     r12, r11, asr #1
        add     r3, r3, lr, lsr #30
        add     r12, r11, r12, lsr #30
        mov     lr, r3, asr #2
        mov     r10, r12, asr #2
        mul     r12, r5, r10
        rsb     r3, r10, #0
        mul     r3, r5, r3
        add     r0, r11, r0
        str     r12, [sp, #0x20]
        mov     r11, r0, asr #1
        mul     r1, r5, r11
        mul     r0, r5, lr
        str     r3, [sp, #0x1C]
        rsb     r3, r11, #0
        mul     r3, r5, r3
        mov     r12, r4, lsl #1
        str     r0, [sp, #0x6C]
        ldr     r0, [sp, #0x24]
        str     r3, [sp, #0x18]
        rsb     r3, lr, #0
        mul     r2, r5, r3
        add     r3, r4, r4, lsl #1
        str     lr, [sp, #0x58]
        str     r1, [sp, #0x70]
        str     r2, [sp, #0x5C]
        ldr     r2, [sp, #0x10]
        str     r11, [sp, #0x4C]
        str     r10, [sp, #0x80]
        str     r8, [sp, #0x34]
        str     r9, [sp, #0x30]
LCEG3:
        mov     r10, #0
        mov     r8, r0
        mov     lr, r10
        mov     r9, lr
        str     lr, [sp, #0x50]
        str     r10, [sp, #0x54]
        str     r3, [sp, #0x74]
        str     r12, [sp, #0x78]
        str     r0, [sp, #0x24]
        str     r6, [sp, #0x38]
        str     r7, [sp, #0x7C]
LCEG4:
        cmp     r4, #0
        ldrle   r0, [sp, #0x7C]
        addle   r0, r0, r9, lsl #4
        ble     LCEG14
        rsb     r0, r8, #0
        mul     r6, r5, r0
        ldr     r0, [sp, #0x7C]
        ldr     lr, [sp, #0x6C]
        ldr     r12, [sp, #0x20]
        ldr     r3, [sp, #0x28]
        ldr     r2, [sp, #0x70]
        str     r5, [sp, #0x48]
        str     r4, [sp, #0x3C]
        ldr     r4, [sp, #0x80]
        ldr     r5, [sp, #0x34]
        mov     r1, #0
        add     r0, r0, r9, lsl #4
        mov     r11, r1
        mov     r10, r11
        sub     r7, r0, #4
        str     r0, [sp, #0x60]
        str     r8, [sp, #0x64]
        str     r9, [sp, #0x68]
LCEG5:
        add     r0, r10, r1
        cmp     r0, r4
        bgt     LCEG6
        add     r9, r5, r12, lsl #3
        ldr     r8, [r5, +r12, lsl #3]
        ldr     r9, [r9, #4]
        b       LCEG9
LCEG6:
        ldr     r8, [sp, #0x4C]
        cmp     r0, r8
        bgt     LCEG7
        ldr     r8, [sp, #0x38]
        ldr     r9, [sp, #0x54]
        add     r8, r9, r8
        ldr     r9, [sp, #0x1C]
        mla     r8, r8, r11, r9
        add     r9, r5, r8, lsl #3
        ldr     r9, [r9, #4]
        str     r9, [sp, #0x84]
        ldr     r9, [sp, #0x84]
        ldr     r8, [r5, +r8, lsl #3]
        eor     r9, r9, #2, 2
        b       LCEG9
LCEG7:
        ldr     r8, [sp, #0x58]
        cmp     r0, r8
        bgt     LCEG8
        add     r8, r5, lr, lsl #3
        ldr     r9, [r8, #4]
        ldr     r8, [r5, +lr, lsl #3]
        eor     r9, r9, #2, 2
        b       LCEG9
LCEG8:
        ldr     r8, [sp, #0x38]
        ldr     r9, [sp, #0x54]
        add     r8, r9, r8
        ldr     r9, [sp, #0x5C]
        mla     r9, r8, r11, r9
        str     r9, [sp, #0x84]
        add     r8, r5, r9, lsl #3
        ldr     r9, [r8, #4]
        ldr     r8, [sp, #0x84]
        ldr     r8, [r5, +r8, lsl #3]
LCEG9:
        cmp     r0, r4
        str     r8, [r7, #4]
        str     r9, [r7, #8]
        bgt     LCEG10
        ldr     r0, [sp, #0x38]
        ldr     r8, [sp, #0x54]
        add     r0, r8, r0
        mul     r0, r0, r11
        add     r8, r5, r0, lsl #3
        ldr     r8, [r8, #4]
        ldr     r0, [r5, +r0, lsl #3]
        eor     r8, r8, #2, 2
        b       LCEG13
LCEG10:
        ldr     r8, [sp, #0x4C]
        cmp     r0, r8
        bgt     LCEG11
        add     r0, r5, r2, lsl #3
        ldr     r8, [r0, #4]
        ldr     r0, [r5, +r2, lsl #3]
        eor     r8, r8, #2, 2
        b       LCEG13
LCEG11:
        ldr     r8, [sp, #0x58]
        cmp     r0, r8
        bgt     LCEG12
        ldr     r0, [sp, #0x38]
        ldr     r8, [sp, #0x54]
        add     r0, r8, r0
        ldr     r8, [sp, #0x18]
        mla     r0, r0, r11, r8
        add     r8, r5, r0, lsl #3
        ldr     r8, [r8, #4]
        ldr     r0, [r5, +r0, lsl #3]
        b       LCEG13
LCEG12:
        add     r8, r5, r3, lsl #3
        ldr     r0, [r5, +r3, lsl #3]
        ldr     r8, [r8, #4]
LCEG13:
        str     r0, [r7, #0xC]
        str     r8, [r7, #0x10]!
        ldr     r0, [sp, #0x3C]
        add     r11, r11, #1
        add     lr, lr, r6
        cmp     r11, r0
        ldr     r0, [sp, #0x24]
        add     r12, r12, r6
        add     r3, r3, r6
        add     r10, r10, r0
        ldr     r0, [sp, #0x50]
        add     r2, r2, r6
        add     r1, r1, r0
        blt     LCEG5
        ldr     r0, [sp, #0x60]
        ldr     r8, [sp, #0x64]
        ldr     r9, [sp, #0x68]
        ldr     r5, [sp, #0x48]
        ldr     r4, [sp, #0x3C]
LCEG14:
        ldr     r2, [sp, #0x2C]
        mov     r1, r4
        bl      _ipps_BitRev1_16
        ldr     r0, [sp, #0x50]
        add     r9, r9, r4
        add     r8, r8, #1
        add     r0, r0, #1
        cmp     r0, #4
        str     r0, [sp, #0x50]
        ldr     r0, [sp, #0x54]
        add     r0, r0, r5
        str     r0, [sp, #0x54]
        blt     LCEG4
        ldr     r3, [sp, #0x74]
        ldr     r12, [sp, #0x78]
        ldr     r0, [sp, #0x24]
        ldr     r2, [sp, #0x10]
        ldr     r6, [sp, #0x38]
        ldr     r7, [sp, #0x7C]
        cmp     r4, #0
        ble     LCEG16
        mov     r11, r4
        mov     r10, r12
        mov     r9, r3
        str     r4, [sp, #0x3C]
        ldr     r4, [sp, #0x14]
        sub     r8, r7, #4
        mov     lr, r11
        str     r0, [sp, #0x24]
        str     r5, [sp, #0x48]
        str     r6, [sp, #0x38]
LCEG15:
        ldr     r1, [r8, #4]
        ldr     r2, [r8, #8]
        add     r0, r7, r11, lsl #4
        str     r1, [r4]
        add     r1, r7, r10, lsl #4
        str     r2, [r4, #4]
        ldr     r5, [r8, #0xC]
        ldr     r6, [r8, #0x10]!
        add     r2, r7, r9, lsl #4
        str     r5, [r4, #8]
        str     r6, [r4, #0xC]
        ldr     r5, [r7, +r11, lsl #4]
        ldr     r6, [r0, #4]
        add     r11, r11, #1
        str     r5, [r4, #0x10]
        subs    lr, lr, #1
        str     r6, [r4, #0x14]
        ldr     r5, [r0, #8]
        ldr     r0, [r0, #0xC]
        str     r5, [r4, #0x18]
        str     r0, [r4, #0x1C]
        ldr     r0, [r7, +r10, lsl #4]
        ldr     r5, [r1, #4]
        add     r10, r10, #1
        str     r0, [r4, #0x20]
        str     r5, [r4, #0x24]
        ldr     r0, [r1, #8]
        ldr     r1, [r1, #0xC]
        str     r0, [r4, #0x28]
        str     r1, [r4, #0x2C]
        ldr     r0, [r7, +r9, lsl #4]
        ldr     r1, [r2, #4]
        add     r9, r9, #1
        str     r0, [r4, #0x30]
        str     r1, [r4, #0x34]
        ldr     r0, [r2, #8]
        ldr     r2, [r2, #0xC]
        str     r0, [r4, #0x38]
        str     r2, [r4, #0x3C]
        add     r4, r4, #0x40
        bne     LCEG15
        str     r4, [sp, #0x14]
        ldr     r0, [sp, #0x24]
        ldr     r5, [sp, #0x48]
        ldr     r4, [sp, #0x3C]
        ldr     r2, [sp, #0x10]
        ldr     r6, [sp, #0x38]
LCEG16:
        add     r0, r0, #4
        cmp     r0, r2
        add     r6, r6, r5, lsl #2
        blt     LCEG3
        ldr     r9, [sp, #0x30]
LCEG17:
        ldr     r2, [r9, #0x1C]
        cmp     r2, r4, lsl #6
        ldrlt   r1, [sp, #0x44]
        strlt   r1, [r9, #0x1C]
        ldr     r0, [sp, #0x40]
        add     sp, sp, #0x88
        ldmia   sp!, {r4 - r11, pc}
LCEG18:
        str     r1, [r9, #0x28]
        mov     r3, r1
        mov     r0, r4
        mov     r2, r5
        mov     r1, r8
        bl      _ipps_initTabTwd_L1_64f
        str     r6, [r9, #0x1C]
        b       LCEG2
LCEG_initTabTwd_L2:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x2C
        mov     r12, #1
        mov     lr, r12, lsl r0
        mov     r4, lr, asr #1
        add     r4, lr, r4, lsr #30
        mov     r6, r4, asr #2
        sub     r2, r2, r0
        add     r0, r3, r6, lsl #4
        and     lr, r0, #0x1F
        rsb     lr, lr, #0
        and     lr, lr, #0x1F
        cmp     r6, #0
        add     r0, r0, lr
        mov     r7, r12, lsl r2
        ble     LCEG22
        cmp     r6, #4
        mov     r4, #0
        mullt   r8, r7, r6
        movlt   r5, r4
        blt     LCEG20
        mul     r8, r7, r6
        add     r2, r7, r7, lsl #1
        str     r2, [sp]
        mov     r5, r4
        sub     r9, r8, r7, lsl #1
        str     r9, [sp, #0x10]
        ldr     r9, [sp]
        sub     r11, r6, #4
        rsb     r10, r7, r8
        mov     lr, r7, lsl #1
        sub     r12, r3, #4
        mov     r2, r7
        str     r8, [sp, #0x1C]
        str     r10, [sp, #0x18]
        str     r11, [sp, #0x14]
        str     r7, [sp, #0x20]
        str     r0, [sp, #0xC]
        str     r6, [sp, #8]
        str     r3, [sp, #4]
LCEG19:
        ldr     r0, [sp, #0x20]
        rsb     r3, r5, #0
        add     r7, r1, r4, lsl #3
        mul     r10, r0, r3
        add     r0, r1, lr, lsl #3
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x1C]
        add     r8, r1, r2, lsl #3
        add     r5, r5, #3
        add     r3, r0, r10
        ldr     r6, [r1, +r3, lsl #3]
        ldr     r0, [sp, #0x18]
        add     r3, r1, r3, lsl #3
        ldr     r3, [r3, #4]
        str     r6, [r12, #4]
        ldr     r11, [sp, #0x10]
        str     r3, [r12, #8]
        ldr     r7, [r7, #4]
        ldr     r3, [r1, +r4, lsl #3]
        add     r0, r10, r0
        add     r10, r10, r11
        add     r6, r1, r0, lsl #3
        eor     r7, r7, #2, 2
        add     r11, r1, r10, lsl #3
        str     r11, [sp, #0x28]
        str     r3, [r12, #0xC]
        str     r7, [r12, #0x10]
        ldr     r0, [r1, +r0, lsl #3]
        ldr     r6, [r6, #4]
        add     r4, r4, r9
        str     r0, [r12, #0x14]
        str     r6, [r12, #0x18]
        ldr     r8, [r8, #4]
        ldr     r0, [r1, +r2, lsl #3]
        add     r2, r2, r9
        eor     r8, r8, #2, 2
        str     r8, [r12, #0x20]
        str     r0, [r12, #0x1C]
        ldr     r0, [sp, #0x28]
        ldr     r10, [r1, +r10, lsl #3]
        ldr     r3, [sp, #0x14]
        ldr     r0, [r0, #4]
        str     r10, [r12, #0x24]
        cmp     r5, r3
        str     r0, [r12, #0x28]
        ldr     r0, [sp, #0x24]
        ldr     r3, [r0, #4]
        ldr     r0, [r1, +lr, lsl #3]
        add     lr, lr, r9
        eor     r3, r3, #2, 2
        str     r3, [r12, #0x30]
        str     r0, [r12, #0x2C]
        add     r12, r12, #0x30
        ble     LCEG19
        ldr     r8, [sp, #0x1C]
        ldr     r7, [sp, #0x20]
        ldr     r0, [sp, #0xC]
        ldr     r6, [sp, #8]
        ldr     r3, [sp, #4]
LCEG20:
        mul     r2, r5, r7
        mov     r12, r5, lsl #4
        sub     r12, r12, #4
        add     r3, r12, r3
LCEG21:
        rsb     r12, r5, #0
        mla     lr, r7, r12, r8
        add     r5, r5, #1
        cmp     r5, r6
        add     r12, r1, r2, lsl #3
        add     r4, r1, lr, lsl #3
        ldr     lr, [r1, +lr, lsl #3]
        ldr     r4, [r4, #4]
        str     lr, [r3, #4]
        str     r4, [r3, #8]
        ldr     lr, [r12, #4]
        ldr     r12, [r1, +r2, lsl #3]
        add     r2, r2, r7
        eor     lr, lr, #2, 2
        str     lr, [r3, #0x10]
        str     r12, [r3, #0xC]
        add     r3, r3, #0x10
        blt     LCEG21
LCEG22:
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
        .long   LCEG_tbl_blk_order


        .data
        .align  4


LCEG_tbl_blk_order:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x04,0x00,0x00,0x00
        .byte   0x05,0x00,0x00,0x00,0x06,0x00,0x00,0x00,0x07,0x00,0x00,0x00,0x07,0x00,0x00,0x00
        .byte   0x08,0x00,0x00,0x00,0x09,0x00,0x00,0x00,0x09,0x00,0x00,0x00,0x09,0x00,0x00,0x00
        .byte   0x08,0x00,0x00,0x00,0x08,0x00,0x00,0x00,0x09,0x00,0x00,0x00,0x09,0x00,0x00,0x00
        .byte   0x09,0x00,0x00,0x00,0x09,0x00,0x00,0x00,0x09,0x00,0x00,0x00,0x09,0x00,0x00,0x00
        .byte   0x09,0x00,0x00,0x00,0x09,0x00,0x00,0x00


