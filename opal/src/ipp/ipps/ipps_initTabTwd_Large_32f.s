        .text
        .align  4
        .globl  _ipps_initTabTwd_Large_32f


_ipps_initTabTwd_Large_32f:
        stmdb   sp!, {r4 - r10, lr}
        sub     sp, sp, #0x10
        mov     r7, r0
        ldr     r0, [r7, #0x20]
        ldr     r8, [sp, #0x30]
        ldr     r10, [sp, #0x34]
        mov     r6, r1
        mov     r1, r0
        mov     r0, r6
        mov     r5, r2
        mov     r4, r3
        bl      _ipps_initTabBitRev
        ldr     r12, [pc, #0x674]
        mov     r9, #0
        add     r12, r12, r6, lsl #2
        ldr     r12, [r12, #-0x24]
        cmp     r12, #0
        bne     LBYZ0
        str     r8, [r7, #0x24]
        mov     r3, r8
        mov     r0, #0xA
        mov     r2, r4
        mov     r1, r5
        bl      _ipps_initTabTwd_L1_32f
        mov     r3, r0
        str     r3, [r7, #0x28]
        mov     r0, r6
        mov     r2, r4
        mov     r1, r5
        bl      LBYZ_initTabTwd_L2
        str     r9, [r7, #0x18]
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r10, pc}
LBYZ0:
        str     r10, [sp, #8]
        str     r8, [sp, #4]
        str     r9, [sp]
        mov     r0, r7
        mov     r3, r4
        mov     r2, r5
        mov     r1, r6
        bl      LBYZ_initTabTwd_Step
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r10, pc}
LBYZ_initTabTwd_Step:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x84
        ldr     lr, [sp, #0xA8]
        ldr     r12, [pc, #0x5EC]
        mov     r11, r1
        str     lr, [sp, #0x10]
        ldr     r1, [sp, #0xAC]
        ldr     r7, [sp, #0xB0]
        add     lr, r12, r11, lsl #2
        ldr     r10, [lr, #-0x24]
        mov     r9, r0
        mov     r8, r2
        mov     r6, r3
        sub     r5, r11, r10
        cmp     r5, #0xA
        mov     r4, #0
        ble     LBYZ14
        add     r12, r12, r5, lsl #2
        ldr     r12, [r12, #-0x24]
        cmp     r12, #0
        bne     LBYZ1
        str     r1, [r9, #0x24]
        mov     r3, r1
        mov     r0, #0xA
        mov     r2, r6
        mov     r1, r8
        bl      _ipps_initTabTwd_L1_32f
        mov     r3, r0
        str     r3, [r9, #0x28]
        mov     r0, r5
        mov     r2, r6
        mov     r1, r8
        bl      LBYZ_initTabTwd_L2
        str     r4, [r9, #0x18]
        b       LBYZ2
LBYZ1:
        str     r1, [sp, #4]
        str     r7, [sp, #8]
        ldr     r12, [sp, #0x10]
        mov     r0, r9
        mov     r3, r6
        add     r12, r12, #1
        str     r12, [sp]
        mov     r2, r8
        mov     r1, r5
        bl      LBYZ_initTabTwd_Step
LBYZ2:
        ldr     r12, [sp, #0x10]
        mov     r3, r0
        mov     r1, r8
        add     r12, r9, r12, lsl #2
        str     r12, [sp, #0x80]
        str     r0, [r12, #0x38]
        mov     r2, r6
        mov     r0, r10
        bl      _ipps_initTabTwd_L1_32f
        ldr     r12, [sp, #0x80]
        str     r0, [sp, #0x14]
        str     r0, [r12, #0x44]
        mov     r12, #1
        mov     r5, r12, lsl r5
        str     r5, [sp, #0x10]
        mov     r5, r12, lsl r10
        mov     r0, r10
        mov     r3, r5, lsl #5
        add     r1, r7, r3
        str     r1, [sp, #0x2C]
        str     r3, [sp, #0x44]
        sub     r6, r6, r11
        mov     r11, r12, lsl r11
        mov     r6, r12, lsl r6
        bl      _ipps_initTabBitRev
        ldr     r3, [sp, #0x10]
        cmp     r3, #0
        ldr     r3, [sp, #0x14]
        add     r3, r3, r11, lsl #3
        str     r3, [sp, #0x40]
        ble     LBYZ13
        mul     r3, r6, r11
        mov     r0, r4
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
        mul     r12, r6, r10
        rsb     r3, r10, #0
        mul     r3, r6, r3
        add     r0, r11, r0
        str     r12, [sp, #0x20]
        mov     r11, r0, asr #1
        mul     r1, r6, r11
        mul     r0, r6, lr
        str     r3, [sp, #0x1C]
        rsb     r3, r11, #0
        mul     r3, r6, r3
        mov     r12, r5, lsl #1
        str     r0, [sp, #0x6C]
        ldr     r0, [sp, #0x24]
        str     r3, [sp, #0x18]
        rsb     r3, lr, #0
        mul     r2, r6, r3
        add     r3, r5, r5, lsl #1
        str     lr, [sp, #0x58]
        str     r1, [sp, #0x70]
        str     r2, [sp, #0x5C]
        ldr     r2, [sp, #0x10]
        str     r11, [sp, #0x54]
        str     r10, [sp, #0x80]
        str     r8, [sp, #0x34]
        str     r9, [sp, #0x30]
LBYZ3:
        mov     r10, #0
        mov     r8, r0
        mov     lr, r10
        mov     r9, lr
        str     lr, [sp, #0x4C]
        str     r10, [sp, #0x50]
        str     r3, [sp, #0x74]
        str     r12, [sp, #0x78]
        str     r0, [sp, #0x24]
        str     r4, [sp, #0x38]
        str     r7, [sp, #0x7C]
LBYZ4:
        cmp     r5, #0
        ldrle   r0, [sp, #0x7C]
        addle   r0, r0, r9, lsl #3
        ble     LBYZ10
        rsb     r0, r8, #0
        mul     r4, r6, r0
        ldr     r0, [sp, #0x7C]
        ldr     lr, [sp, #0x6C]
        ldr     r12, [sp, #0x20]
        ldr     r3, [sp, #0x28]
        ldr     r2, [sp, #0x70]
        str     r6, [sp, #0x48]
        str     r5, [sp, #0x3C]
        ldr     r5, [sp, #0x80]
        ldr     r6, [sp, #0x34]
        mov     r1, #0
        add     r0, r0, r9, lsl #3
        mov     r11, r1
        mov     r10, r11
        sub     r7, r0, #4
        str     r0, [sp, #0x60]
        str     r8, [sp, #0x64]
        str     r9, [sp, #0x68]
LBYZ5:
        add     r0, r10, r1
        cmp     r0, r5
        ldrle   r8, [r6, +r12, lsl #2]
        ble     LBYZ7
        ldr     r8, [sp, #0x54]
        cmp     r0, r8
        bgt     LBYZ6
        ldr     r8, [sp, #0x38]
        ldr     r9, [sp, #0x50]
        add     r8, r9, r8
        ldr     r9, [sp, #0x1C]
        mla     r9, r8, r11, r9
        ldr     r8, [r6, +r9, lsl #2]
        eor     r8, r8, #2, 2
        b       LBYZ7
LBYZ6:
        ldr     r8, [sp, #0x58]
        cmp     r0, r8
        ldrle   r8, [r6, +lr, lsl #2]
        eorle   r8, r8, #2, 2
        ble     LBYZ7
        ldr     r8, [sp, #0x38]
        ldr     r9, [sp, #0x50]
        add     r8, r9, r8
        ldr     r9, [sp, #0x5C]
        mla     r9, r8, r11, r9
        ldr     r8, [r6, +r9, lsl #2]
LBYZ7:
        cmp     r0, r5
        str     r8, [r7, #4]
        bgt     LBYZ8
        ldr     r0, [sp, #0x38]
        ldr     r8, [sp, #0x50]
        add     r0, r8, r0
        mul     r0, r0, r11
        ldr     r0, [r6, +r0, lsl #2]
        eor     r0, r0, #2, 2
        b       LBYZ9
LBYZ8:
        ldr     r8, [sp, #0x54]
        cmp     r0, r8
        ldrle   r0, [r6, +r2, lsl #2]
        eorle   r0, r0, #2, 2
        ble     LBYZ9
        ldr     r8, [sp, #0x58]
        cmp     r0, r8
        ldrgt   r0, [r6, +r3, lsl #2]
        bgt     LBYZ9
        ldr     r0, [sp, #0x38]
        ldr     r8, [sp, #0x50]
        add     r0, r8, r0
        ldr     r8, [sp, #0x18]
        mla     r8, r0, r11, r8
        ldr     r0, [r6, +r8, lsl #2]
LBYZ9:
        str     r0, [r7, #8]!
        ldr     r0, [sp, #0x3C]
        add     r11, r11, #1
        add     lr, lr, r4
        cmp     r11, r0
        ldr     r0, [sp, #0x24]
        add     r12, r12, r4
        add     r3, r3, r4
        add     r10, r10, r0
        ldr     r0, [sp, #0x4C]
        add     r2, r2, r4
        add     r1, r1, r0
        blt     LBYZ5
        ldr     r0, [sp, #0x60]
        ldr     r8, [sp, #0x64]
        ldr     r9, [sp, #0x68]
        ldr     r6, [sp, #0x48]
        ldr     r5, [sp, #0x3C]
LBYZ10:
        ldr     r2, [sp, #0x2C]
        mov     r1, r5
        bl      _ipps_BitRev1_8
        ldr     r0, [sp, #0x4C]
        add     r9, r9, r5
        add     r8, r8, #1
        add     r0, r0, #1
        cmp     r0, #4
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0x50]
        add     r0, r0, r6
        str     r0, [sp, #0x50]
        blt     LBYZ4
        ldr     r3, [sp, #0x74]
        ldr     r12, [sp, #0x78]
        ldr     r0, [sp, #0x24]
        ldr     r2, [sp, #0x10]
        ldr     r4, [sp, #0x38]
        ldr     r7, [sp, #0x7C]
        cmp     r5, #0
        ble     LBYZ12
        mov     r11, r5
        mov     r10, r12
        mov     r9, r3
        str     r5, [sp, #0x3C]
        ldr     r5, [sp, #0x14]
        sub     r8, r7, #4
        mov     lr, r11
        str     r6, [sp, #0x48]
        str     r4, [sp, #0x38]
LBYZ11:
        ldr     r4, [r8, #4]
        add     r1, r7, r11, lsl #3
        add     r2, r7, r10, lsl #3
        str     r4, [r5]
        ldr     r6, [r8, #8]!
        add     r4, r7, r9, lsl #3
        str     r6, [r5, #4]
        ldr     r6, [r7, +r11, lsl #3]
        add     r11, r11, #1
        subs    lr, lr, #1
        str     r6, [r5, #8]
        ldr     r1, [r1, #4]
        str     r1, [r5, #0xC]
        ldr     r1, [r7, +r10, lsl #3]
        add     r10, r10, #1
        str     r1, [r5, #0x10]
        ldr     r2, [r2, #4]
        str     r2, [r5, #0x14]
        ldr     r1, [r7, +r9, lsl #3]
        add     r9, r9, #1
        str     r1, [r5, #0x18]
        ldr     r4, [r4, #4]
        str     r4, [r5, #0x1C]
        add     r5, r5, #0x20
        bne     LBYZ11
        str     r5, [sp, #0x14]
        ldr     r6, [sp, #0x48]
        ldr     r5, [sp, #0x3C]
        ldr     r2, [sp, #0x10]
        ldr     r4, [sp, #0x38]
LBYZ12:
        add     r0, r0, #4
        cmp     r0, r2
        add     r4, r4, r6, lsl #2
        blt     LBYZ3
        ldr     r9, [sp, #0x30]
LBYZ13:
        ldr     r2, [r9, #0x18]
        cmp     r2, r5, lsl #5
        ldrlt   r1, [sp, #0x44]
        strlt   r1, [r9, #0x18]
        ldr     r0, [sp, #0x40]
        add     sp, sp, #0x84
        ldmia   sp!, {r4 - r11, pc}
LBYZ14:
        str     r1, [r9, #0x24]
        mov     r3, r1
        mov     r0, r5
        mov     r2, r6
        mov     r1, r8
        bl      _ipps_initTabTwd_L1_32f
        str     r4, [r9, #0x18]
        b       LBYZ2
LBYZ_initTabTwd_L2:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        mov     lr, #1
        mov     r12, lr, lsl r0
        mov     r4, r12, asr #1
        add     r4, r12, r4, lsr #30
        mov     r12, r4, asr #2
        sub     r2, r2, r0
        add     r0, r3, r12, lsl #3
        and     r4, r0, #0x1F
        rsb     r4, r4, #0
        and     r4, r4, #0x1F
        cmp     r12, #0
        add     r0, r0, r4
        mov     r2, lr, lsl r2
        ble     LBYZ18
        cmp     r12, #4
        mov     r7, #0
        mullt   r8, r2, r12
        movlt   r9, r7
        blt     LBYZ16
        mul     r8, r2, r12
        add     lr, r2, r2, lsl #1
        str     lr, [sp]
        sub     r6, r12, #4
        str     r12, [sp, #8]
        ldr     r12, [sp]
        rsb     r11, r2, r8
        sub     r10, r8, r2, lsl #1
        mov     r9, r7
        mov     r5, r2, lsl #1
        sub     r4, r3, #4
        mov     lr, r2
        str     r10, [sp, #0x10]
        str     r11, [sp, #0x14]
        str     r0, [sp, #0xC]
        str     r3, [sp, #4]
LBYZ15:
        rsb     r0, r9, #0
        mul     r10, r2, r0
        ldr     r11, [sp, #0x10]
        add     r9, r9, #3
        cmp     r9, r6
        add     r0, r8, r10
        ldr     r3, [r1, +r0, lsl #2]
        ldr     r0, [sp, #0x14]
        str     r3, [r4, #4]
        ldr     r3, [r1, +r7, lsl #2]
        add     r7, r7, r12
        add     r0, r10, r0
        add     r10, r10, r11
        eor     r3, r3, #2, 2
        str     r3, [r4, #8]
        ldr     r0, [r1, +r0, lsl #2]
        str     r0, [r4, #0xC]
        ldr     r0, [r1, +lr, lsl #2]
        add     lr, lr, r12
        eor     r0, r0, #2, 2
        str     r0, [r4, #0x10]
        ldr     r10, [r1, +r10, lsl #2]
        str     r10, [r4, #0x14]
        ldr     r0, [r1, +r5, lsl #2]
        add     r5, r5, r12
        eor     r0, r0, #2, 2
        str     r0, [r4, #0x18]!
        ble     LBYZ15
        ldr     r0, [sp, #0xC]
        ldr     r12, [sp, #8]
        ldr     r3, [sp, #4]
LBYZ16:
        mul     lr, r9, r2
        mov     r4, r9, lsl #3
        sub     r4, r4, #4
        add     r3, r4, r3
LBYZ17:
        rsb     r4, r9, #0
        mla     r4, r2, r4, r8
        add     r9, r9, #1
        cmp     r9, r12
        ldr     r4, [r1, +r4, lsl #2]
        str     r4, [r3, #4]
        ldr     r4, [r1, +lr, lsl #2]
        add     lr, lr, r2
        eor     r4, r4, #2, 2
        str     r4, [r3, #8]!
        blt     LBYZ17
LBYZ18:
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
        .long   LBYZ_tbl_blk_order


        .data
        .align  4


LBYZ_tbl_blk_order:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x05,0x00,0x00,0x00,0x06,0x00,0x00,0x00,0x07,0x00,0x00,0x00,0x08,0x00,0x00,0x00
        .byte   0x08,0x00,0x00,0x00,0x08,0x00,0x00,0x00,0x0A,0x00,0x00,0x00,0x0A,0x00,0x00,0x00
        .byte   0x0A,0x00,0x00,0x00,0x0A,0x00,0x00,0x00,0x08,0x00,0x00,0x00,0x08,0x00,0x00,0x00
        .byte   0x0A,0x00,0x00,0x00,0x0A,0x00,0x00,0x00,0x0A,0x00,0x00,0x00,0x0A,0x00,0x00,0x00
        .byte   0x0A,0x00,0x00,0x00,0x0A,0x00,0x00,0x00


