        .text
        .align  4
        .globl  _ipps_crFftInv_Large_64f


_ipps_crFftInv_Large_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        ldr     r9, [sp, #0x48]
        mov     r8, r0
        ldr     r7, [sp, #0x44]
        ldr     r10, [sp, #0x4C]
        ldr     r0, [r8, #0x24]
        mov     r5, r3
        mov     r12, #1
        cmp     r1, r5
        mov     r6, r2
        mov     r4, r12, lsl r9
        beq     LCEJ10
        mov     r3, r0
        mov     r0, r1
        mov     r2, r4
        mov     r1, r5
        bl      _ipps_BitRev2_8
LCEJ0:
        ldr     r2, [r8, #0x24]
        cmp     r6, r7
        beq     LCEJ9
        mov     r3, r2
        mov     r0, r6
        mov     r2, r4
        mov     r1, r7
        bl      _ipps_BitRev2_8
LCEJ1:
        ldr     lr, [pc, #0xD98]
        mov     r12, #0
        add     lr, lr, r9, lsl #2
        ldr     lr, [lr, #-0x24]
        cmp     lr, #0
        bne     LCEJ7
        mov     r6, #2, 20
        cmp     r4, #2, 20
        movlt   r6, r4
        cmp     r4, #0
        ble     LCEJ6
        mov     r11, #0
        mov     r10, r11
        mov     r9, #0x80
LCEJ2:
        cmp     r6, #0
        add     r0, r5, r11, lsl #3
        add     r1, r7, r11, lsl #3
        ble     LCEJ5
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
LCEJ3:
        ldr     r3, [r8, #0x28]
        mov     r2, #2, 24
        mov     r1, r5
        mov     r0, r4
        bl      _ipps_crRadix4Inv_64f
        ldr     lr, [r8, #0xC]
        cmp     lr, #0
        beq     LCEJ4
        ldr     r0, [r8, #0x10]
        ldr     r1, [r8, #0x14]
        mov     r3, #2, 24
        mov     r2, r4
        bl      _ipps_rbMpy1_64f
        ldr     r0, [r8, #0x10]
        ldr     r1, [r8, #0x14]
        mov     r3, #2, 24
        mov     r2, r5
        bl      _ipps_rbMpy1_64f
LCEJ4:
        add     r10, r10, #2, 24
        cmp     r10, r6
        add     r5, r5, #1, 20
        add     r4, r4, #1, 20
        blt     LCEJ3
        mov     r1, r7
        mov     r0, r9
        mov     r9, r11
        ldr     r11, [sp, #0x1C]
        ldr     r4, [sp, #0x18]
        ldr     r7, [sp, #0x14]
        ldr     r5, [sp, #0x10]
        mov     r10, #0
LCEJ5:
        str     r9, [sp, #8]
        str     r10, [sp, #4]
        ldr     r12, [r8, #0x2C]
        str     r12, [sp]
        mov     r3, #2, 24
        mov     r2, r6
        bl      LCEJ_crFft_Blk_R2
        add     r11, r6, r11
        cmp     r11, r4
        blt     LCEJ2
LCEJ6:
        cmp     r4, r6
        ble     LCEJ8
        mov     r12, #0x80
        str     r12, [sp, #8]
        mov     r12, #0
        str     r12, [sp, #4]
        ldr     r8, [r8, #0x30]
        mov     r3, r6
        mov     r2, r4
        str     r8, [sp]
        mov     r1, r7
        mov     r0, r5
        bl      LCEJ_crFft_Blk_R2
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LCEJ7:
        str     r12, [sp]
        str     r10, [sp, #4]
        mov     r3, r9
        mov     r2, r7
        mov     r1, r5
        mov     r0, r8
        bl      LCEJ_crFftInv_BlkStep
LCEJ8:
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LCEJ9:
        mov     r1, r4
        mov     r0, r7
        bl      _ipps_BitRev1_8
        b       LCEJ1
LCEJ10:
        mov     r2, r0
        mov     r1, r4
        mov     r0, r5
        bl      _ipps_BitRev1_8
        b       LCEJ0
LCEJ_crFft_Blk_R2:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x88
        ldr     r8, [sp, #0xAC]
        mov     r5, r0
        mov     r0, r2
        mov     r4, r3
        mov     r7, r1
        mov     r1, r4
        bl      __intel_idiv
        mov     r2, #6, 2
        smull   r12, r2, r4, r2
        add     r2, r4, r2
        mov     r1, r0, asr #1
        mov     r12, r4, asr #31
        cmp     r1, #0
        rsb     r6, r12, r2, asr #6
        ble     LCEJ18
        str     r8, [sp]
        str     r7, [sp, #8]
LCEJ11:
        ldr     lr, [sp, #8]
        cmp     r6, #0
        mov     r11, r5
        ble     LCEJ17
        mvn     r2, #7, 2
        and     r2, r4, r2
        mov     r12, r4, lsl #3
        str     r4, [sp, #0xC]
        ldr     r4, [sp]
        mov     r10, #0
        mov     r3, r0, lsl #3
        mov     r9, r10
        sub     r8, r1, #1
        mov     r7, r0, lsl #6
        str     r3, [sp, #0x38]
        str     r1, [sp, #0x14]
        str     r0, [sp, #0x10]
        str     r5, [sp, #4]
LCEJ12:
        cmp     r8, #0
        mov     r1, r11
        mov     r3, lr
        mov     r0, r8
        blt     LCEJ16
        add     r5, r4, r9, lsl #3
        str     r5, [sp, #0x3C]
        str     r7, [sp, #0x4C]
        str     r8, [sp, #0x50]
        str     r9, [sp, #0x54]
        str     r10, [sp, #0x58]
        str     lr, [sp, #0x5C]
        str     r11, [sp, #0x60]
        str     r6, [sp, #0x64]
LCEJ13:
        ldr     r5, [sp, #0x3C]
        add     r6, r12, r1
        add     lr, r12, r3
        sub     r11, r3, #0xC
        sub     r8, lr, #4
        sub     r7, r6, #4
        str     r11, [sp, #0x68]
        sub     r10, r3, #4
        sub     r9, r1, #4
        sub     r11, r1, #0xC
        sub     lr, lr, #0xC
        sub     r6, r6, #0xC
        mov     r4, #0
        str     r11, [sp, #0x6C]
        str     r6, [sp, #0x2C]
        str     lr, [sp, #0x20]
        str     r7, [sp, #0x18]
        str     r8, [sp, #0x1C]
        str     r9, [sp, #0x24]
        str     r10, [sp, #0x28]
        str     r0, [sp, #0x40]
        str     r3, [sp, #0x34]
        str     r1, [sp, #0x30]
        str     r2, [sp, #0x44]
        str     r12, [sp, #0x48]
LCEJ14:
        ldr     r0, [sp, #0x2C]
        ldr     r1, [r0, #0xC]
        str     r1, [sp, #0x70]
        ldr     r0, [r0, #0x10]
        ldr     r1, [sp, #0x20]
        str     r0, [sp, #0x74]
        ldr     r0, [r5]
        str     r0, [sp, #0x78]
        ldr     r0, [r5, #4]
        ldr     r2, [sp, #0x78]
        str     r0, [sp, #0x7C]
        ldr     r9, [r1, #0xC]
        ldr     r8, [r1, #0x10]
        ldr     r0, [sp, #0x70]
        ldr     r1, [sp, #0x74]
        ldr     r3, [sp, #0x7C]
        bl      __muldf3
        ldr     r11, [r5, #8]
        ldr     r10, [r5, #0xC]
        mov     r6, r0
        mov     r7, r1
        mov     r0, r9
        mov     r1, r8
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        ldr     r2, [sp, #0x78]
        ldr     r3, [sp, #0x7C]
        mov     r7, r1
        mov     r6, r0
        mov     r0, r9
        mov     r1, r8
        bl      __muldf3
        mov     r8, r0
        ldr     r0, [sp, #0x70]
        mov     r9, r1
        ldr     r1, [sp, #0x74]
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        mov     r3, r1
        mov     r2, r0
        mov     r0, r8
        mov     r1, r9
        bl      __subdf3
        ldr     r12, [sp, #0x30]
        mov     r8, r1
        mov     r9, r0
        mov     r2, r6
        ldr     r12, [r12, +r4, lsl #3]
        mov     r3, r7
        str     r12, [sp, #0x7C]
        ldr     r12, [sp, #0x6C]
        ldr     r0, [sp, #0x7C]
        ldr     r12, [r12, #0x10]
        str     r12, [sp, #0x78]
        ldr     r1, [sp, #0x78]
        bl      __subdf3
        ldr     r12, [sp, #0x34]
        ldr     r10, [r12, +r4, lsl #3]
        ldr     r12, [sp, #0x68]
        mov     r3, r8
        mov     r2, r9
        ldr     r11, [r12, #0x10]
        str     r1, [sp, #0x70]
        str     r0, [sp, #0x74]
        mov     r0, r10
        mov     r1, r11
        bl      __subdf3
        str     r1, [sp, #0x84]
        ldr     r1, [sp, #0x78]
        str     r0, [sp, #0x80]
        ldr     r0, [sp, #0x7C]
        mov     r3, r7
        mov     r2, r6
        bl      __adddf3
        mov     r6, r0
        mov     r7, r1
        mov     r3, r8
        mov     r0, r10
        mov     r2, r9
        mov     r1, r11
        bl      __adddf3
        ldr     r3, [sp, #0x74]
        ldr     r2, [sp, #0x2C]
        str     r3, [r2, #0xC]
        ldr     r3, [sp, #0x70]
        str     r3, [r2, #0x10]
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x80]
        str     r3, [r2, #0xC]
        ldr     r3, [sp, #0x84]
        str     r3, [r2, #0x10]
        ldr     r2, [sp, #0x30]
        str     r6, [r2, +r4, lsl #3]
        ldr     r2, [sp, #0x6C]
        str     r7, [r2, #0x10]
        ldr     r2, [sp, #0x34]
        str     r0, [r2, +r4, lsl #3]
        ldr     r0, [sp, #0x68]
        add     r4, r4, #2
        str     r1, [r0, #0x10]
        ldr     r1, [sp, #0x18]
        ldr     r0, [r1, #0xC]
        str     r0, [sp, #0x84]
        ldr     r0, [sp, #0x38]
        ldr     r2, [r5, +r0]
        add     r0, r5, r0
        str     r2, [sp, #0x80]
        ldr     r1, [r1, #0x10]
        ldr     r2, [sp, #0x80]
        str     r0, [sp, #0x78]
        str     r1, [sp, #0x7C]
        ldr     r9, [r0, #8]
        ldr     r10, [r0, #4]
        ldr     r7, [r0, #0xC]
        ldr     r0, [sp, #0x84]
        ldr     r1, [sp, #0x7C]
        mov     r3, r10
        bl      __muldf3
        ldr     r12, [sp, #0x1C]
        mov     r6, r1
        mov     r5, r0
        mov     r2, r9
        ldr     r11, [r12, #0xC]
        ldr     r8, [r12, #0x10]
        mov     r3, r7
        mov     r0, r11
        mov     r1, r8
        bl      __muldf3
        mov     r3, r6
        mov     r2, r5
        bl      __adddf3
        mov     r5, r0
        ldr     r0, [sp, #0x84]
        mov     r6, r1
        ldr     r1, [sp, #0x7C]
        mov     r3, r7
        mov     r2, r9
        bl      __muldf3
        ldr     r2, [sp, #0x80]
        mov     r9, r1
        mov     r7, r0
        mov     r3, r10
        mov     r0, r11
        mov     r1, r8
        bl      __muldf3
        mov     r3, r9
        mov     r2, r7
        bl      __subdf3
        ldr     r12, [sp, #0x24]
        mov     r7, r0
        ldr     r10, [r12, #0x10]
        ldr     r11, [r12, #0xC]
        str     r1, [sp, #0x84]
        mov     r2, r5
        mov     r1, r10
        mov     r0, r11
        mov     r3, r6
        bl      __subdf3
        ldr     r12, [sp, #0x28]
        ldr     r3, [sp, #0x84]
        mov     r2, r7
        ldr     r9, [r12, #0xC]
        ldr     r8, [r12, #0x10]
        str     r0, [sp, #0x80]
        str     r1, [sp, #0x7C]
        mov     r0, r9
        mov     r1, r8
        bl      __subdf3
        str     r1, [sp, #0x70]
        str     r0, [sp, #0x74]
        mov     r0, r11
        mov     r1, r10
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        ldr     r3, [sp, #0x84]
        mov     r5, r1
        mov     r6, r0
        mov     r0, r9
        mov     r1, r8
        mov     r2, r7
        bl      __adddf3
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0x80]
        str     r3, [r2, #0xC]
        ldr     r3, [sp, #0x7C]
        cmp     r4, #0x40
        str     r3, [r2, #0x10]
        ldr     r3, [sp, #0x74]
        ldr     r2, [sp, #0x1C]
        str     r3, [r2, #0xC]
        ldr     r3, [sp, #0x70]
        str     r3, [r2, #0x10]
        ldr     r2, [sp, #0x24]
        str     r5, [r2, #0x10]
        str     r6, [r2, #0xC]
        ldr     r2, [sp, #0x28]
        str     r0, [r2, #0xC]
        str     r1, [r2, #0x10]
        ldr     r0, [sp, #0x38]
        ldr     r1, [sp, #0x78]
        add     r5, r1, r0
        ldr     r0, [sp, #0x28]
        add     r0, r0, #0x10
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x24]
        add     r0, r0, #0x10
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x1C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x1C]
        ldr     r0, [sp, #0x18]
        add     r0, r0, #0x10
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x68]
        add     r0, r0, #0x10
        str     r0, [sp, #0x68]
        ldr     r0, [sp, #0x6C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x6C]
        ldr     r0, [sp, #0x20]
        add     r0, r0, #0x10
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x2C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x2C]
        blt     LCEJ14
        ldr     r2, [sp, #0x44]
        ldr     r1, [sp, #0x30]
        ldr     r3, [sp, #0x34]
        ldr     r12, [sp, #0x48]
        ldr     r0, [sp, #0x40]
        ldr     r4, [sp, #0x3C]
        add     r1, r1, r2, lsl #2
        add     lr, r3, r2, lsl #2
        add     r9, r12, r1
        add     r3, r12, lr
        sub     r10, r9, #4
        sub     r7, lr, #4
        sub     r6, r1, #4
        str     r10, [sp, #0x68]
        mov     r8, #0
        sub     r5, r3, #4
        sub     lr, lr, #0xC
        sub     r1, r1, #0xC
        sub     r11, r3, #0xC
        sub     r10, r9, #0xC
        str     r10, [sp, #0x1C]
        str     r11, [sp, #0x28]
        str     r1, [sp, #0x18]
        str     lr, [sp, #0x70]
        str     r5, [sp, #0x24]
        str     r6, [sp, #0x20]
        str     r7, [sp, #0x2C]
        str     r8, [sp, #0x30]
        str     r3, [sp, #0x34]
        str     r9, [sp, #0x6C]
        str     r0, [sp, #0x40]
        str     r2, [sp, #0x44]
        str     r12, [sp, #0x48]
LCEJ15:
        ldr     r1, [sp, #0x1C]
        ldr     r2, [r4]
        ldr     r12, [sp, #0x28]
        ldr     r10, [r1, #0xC]
        ldr     r7, [r1, #0x10]
        str     r2, [sp, #0x84]
        ldr     r2, [r12, #0xC]
        ldr     r11, [r4, #4]
        str     r2, [sp, #0x80]
        ldr     r12, [r12, #0x10]
        ldr     r2, [sp, #0x84]
        ldr     r0, [sp, #0x80]
        mov     r3, r11
        str     r12, [sp, #0x7C]
        ldr     r1, [sp, #0x7C]
        bl      __muldf3
        ldr     r9, [r4, #0xC]
        ldr     r8, [r4, #8]
        mov     r6, r0
        mov     r5, r1
        mov     r3, r9
        mov     r2, r8
        mov     r1, r7
        mov     r0, r10
        bl      __muldf3
        mov     r3, r5
        mov     r2, r6
        bl      __subdf3
        ldr     r2, [sp, #0x84]
        mov     r5, r0
        mov     r6, r1
        mov     r0, r10
        mov     r1, r7
        mov     r3, r11
        bl      __muldf3
        mov     r7, r0
        ldr     r0, [sp, #0x80]
        mov     r10, r1
        ldr     r1, [sp, #0x7C]
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        mov     r3, r10
        mov     r2, r7
        bl      __adddf3
        ldr     r12, [sp, #0x18]
        mov     r2, r5
        ldr     r11, [r12, #0xC]
        ldr     r10, [r12, #0x10]
        str     r0, [sp, #0x84]
        mov     r7, r1
        mov     r0, r11
        mov     r1, r10
        mov     r3, r6
        bl      __subdf3
        ldr     r12, [sp, #0x70]
        ldr     r2, [sp, #0x84]
        ldr     r9, [r12, #0xC]
        ldr     r8, [r12, #0x10]
        str     r0, [sp, #0x80]
        str     r1, [sp, #0x7C]
        mov     r3, r7
        mov     r0, r9
        mov     r1, r8
        bl      __subdf3
        str     r0, [sp, #0x78]
        str     r1, [sp, #0x74]
        mov     r2, r5
        mov     r1, r10
        mov     r0, r11
        mov     r3, r6
        bl      __adddf3
        ldr     r2, [sp, #0x84]
        mov     r6, r0
        mov     r5, r1
        mov     r3, r7
        mov     r0, r9
        mov     r1, r8
        bl      __adddf3
        ldr     r2, [sp, #0x1C]
        ldr     r3, [sp, #0x80]
        str     r3, [r2, #0xC]
        ldr     r3, [sp, #0x7C]
        str     r3, [r2, #0x10]
        ldr     r2, [sp, #0x28]
        ldr     r3, [sp, #0x78]
        str     r3, [r2, #0xC]
        ldr     r3, [sp, #0x74]
        str     r3, [r2, #0x10]
        ldr     r2, [sp, #0x18]
        str     r5, [r2, #0x10]
        str     r6, [r2, #0xC]
        ldr     r2, [sp, #0x70]
        str     r1, [r2, #0x10]
        str     r0, [r2, #0xC]
        ldr     r1, [sp, #0x68]
        ldr     r0, [r1, #0xC]
        str     r0, [sp, #0x84]
        ldr     r1, [r1, #0x10]
        ldr     r0, [sp, #0x38]
        str     r1, [sp, #0x80]
        ldr     r1, [sp, #0x80]
        ldr     r5, [r4, +r0]
        add     r4, r4, r0
        str     r4, [sp, #0x7C]
        ldr     r11, [r4, #8]
        ldr     r10, [r4, #0xC]
        ldr     r0, [sp, #0x84]
        ldr     r7, [r4, #4]
        mov     r3, r10
        mov     r2, r11
        bl      __muldf3
        ldr     r12, [sp, #0x24]
        mov     r4, r0
        mov     r6, r1
        ldr     r9, [r12, #0xC]
        ldr     r8, [r12, #0x10]
        mov     r2, r5
        mov     r3, r7
        mov     r0, r9
        mov     r1, r8
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r1, r6
        mov     r0, r4
        bl      __subdf3
        mov     r4, r0
        ldr     r0, [sp, #0x84]
        mov     r6, r1
        ldr     r1, [sp, #0x80]
        mov     r3, r7
        mov     r2, r5
        bl      __muldf3
        mov     r7, r0
        mov     r5, r1
        mov     r3, r10
        mov     r2, r11
        mov     r0, r9
        mov     r1, r8
        bl      __muldf3
        mov     r2, r7
        mov     r3, r5
        bl      __adddf3
        ldr     r12, [sp, #0x20]
        mov     r7, r0
        mov     r5, r1
        ldr     r11, [r12, #0xC]
        ldr     r10, [r12, #0x10]
        mov     r2, r4
        mov     r3, r6
        mov     r0, r11
        mov     r1, r10
        bl      __subdf3
        ldr     r12, [sp, #0x2C]
        mov     r2, r7
        mov     r3, r5
        ldr     r9, [r12, #0xC]
        ldr     r8, [r12, #0x10]
        str     r0, [sp, #0x84]
        str     r1, [sp, #0x80]
        mov     r0, r9
        mov     r1, r8
        bl      __subdf3
        str     r0, [sp, #0x78]
        str     r1, [sp, #0x74]
        mov     r0, r11
        mov     r1, r10
        mov     r2, r4
        mov     r3, r6
        bl      __adddf3
        mov     r4, r1
        mov     r6, r0
        mov     r0, r9
        mov     r1, r8
        mov     r2, r7
        mov     r3, r5
        bl      __adddf3
        ldr     r2, [sp, #0x68]
        ldr     r3, [sp, #0x84]
        str     r3, [r2, #0xC]
        ldr     r3, [sp, #0x80]
        str     r3, [r2, #0x10]
        ldr     r3, [sp, #0x78]
        ldr     r2, [sp, #0x24]
        str     r3, [r2, #0xC]
        ldr     r3, [sp, #0x74]
        str     r3, [r2, #0x10]
        ldr     r2, [sp, #0x20]
        str     r4, [r2, #0x10]
        str     r6, [r2, #0xC]
        ldr     r2, [sp, #0x30]
        add     r2, r2, #2
        str     r2, [sp, #0x30]
        ldr     r2, [sp, #0x2C]
        str     r0, [r2, #0xC]
        str     r1, [r2, #0x10]
        ldr     r0, [sp, #0x30]
        ldr     r1, [sp, #0x38]
        cmp     r0, #0x40
        ldr     r0, [sp, #0x7C]
        add     r4, r0, r1
        ldr     r0, [sp, #0x2C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x20]
        add     r0, r0, #0x10
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x24]
        add     r0, r0, #0x10
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x68]
        add     r0, r0, #0x10
        str     r0, [sp, #0x68]
        ldr     r0, [sp, #0x70]
        add     r0, r0, #0x10
        str     r0, [sp, #0x70]
        ldr     r0, [sp, #0x18]
        add     r0, r0, #0x10
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x28]
        add     r0, r0, #0x10
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x1C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x1C]
        blt     LCEJ15
        ldr     r0, [sp, #0x40]
        ldr     r3, [sp, #0x34]
        ldr     r2, [sp, #0x44]
        ldr     r9, [sp, #0x6C]
        ldr     r12, [sp, #0x48]
        subs    r0, r0, #1
        add     r3, r3, r2, lsl #2
        add     r1, r9, r2, lsl #2
        bpl     LCEJ13
        ldr     r7, [sp, #0x4C]
        ldr     r8, [sp, #0x50]
        ldr     r9, [sp, #0x54]
        ldr     r10, [sp, #0x58]
        ldr     lr, [sp, #0x5C]
        ldr     r11, [sp, #0x60]
        ldr     r6, [sp, #0x64]
        ldr     r4, [sp]
LCEJ16:
        add     r10, r10, #1
        cmp     r10, r6
        add     r11, r11, #2, 24
        add     lr, lr, #2, 24
        add     r9, r7, r9
        blt     LCEJ12
        ldr     r1, [sp, #0x14]
        ldr     r0, [sp, #0x10]
        ldr     r4, [sp, #0xC]
        ldr     r5, [sp, #4]
LCEJ17:
        mov     r1, r1, asr #1
        cmp     r1, #0
        mov     r4, r4, lsl #1
        mov     r6, r6, lsl #1
        mov     r0, r0, asr #1
        bgt     LCEJ11
LCEJ18:
        add     sp, sp, #0x88
        ldmia   sp!, {r4 - r11, pc}
LCEJ_crFftInv_BlkStep:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x7C
        ldr     r12, [pc, #0x280]
        ldr     r7, [sp, #0xA0]
        ldr     r5, [sp, #0xA4]
        add     lr, r12, r3, lsl #2
        ldr     lr, [lr, #-0x24]
        mov     r9, r2
        sub     r8, r3, lr
        mov     r10, #1
        mov     r6, r0
        cmp     r8, #9
        mov     r4, r10, lsl lr
        mov     r2, r10, lsl r8
        mov     r3, r1
        mov     r0, r9
        bgt     LCEJ21
        cmp     r4, #0
        ble     LCEJ31
        mov     r10, r4
        str     r9, [sp, #0x18]
        mov     r11, r5
        str     r1, [sp, #0x1C]
        mov     r5, r0
        mov     r8, r2
        mov     r9, r3
LCEJ19:
        ldr     r3, [r6, #0x28]
        mov     r2, r8
        mov     r1, r5
        mov     r0, r9
        bl      _ipps_crRadix4Inv_64f
        ldr     r12, [r6, #0xC]
        cmp     r12, #0
        beq     LCEJ20
        ldr     r0, [r6, #0x10]
        ldr     r1, [r6, #0x14]
        mov     r3, r8
        mov     r2, r9
        bl      _ipps_rbMpy1_64f
        ldr     r0, [r6, #0x10]
        ldr     r1, [r6, #0x14]
        mov     r3, r8
        mov     r2, r5
        bl      _ipps_rbMpy1_64f
LCEJ20:
        subs    r10, r10, #1
        add     r9, r9, r8, lsl #3
        add     r5, r5, r8, lsl #3
        bne     LCEJ19
        mov     r2, r8
        mov     r5, r11
        ldr     r9, [sp, #0x18]
        ldr     r1, [sp, #0x1C]
        b       LCEJ31
LCEJ21:
        add     r12, r12, r8, lsl #2
        ldr     r12, [r12, #-0x24]
        cmp     r12, #0
        bne     LCEJ29
        cmp     r4, #0
        ble     LCEJ31
        mov     r8, #2, 20
        cmp     r2, #2, 20
        mov     r10, r4
        str     r9, [sp, #0x18]
        movlt   r8, r2
        mov     r11, #0x80
        str     r4, [sp, #0x10]
        mov     r9, r10
        mov     r12, #0
        str     r5, [sp, #0x28]
        str     r7, [sp, #0x14]
        mov     r4, r8
        mov     r10, r11
        str     r1, [sp, #0x1C]
        mov     r5, r0
        mov     r8, r2
        mov     r7, r3
        mov     r11, r12
LCEJ22:
        cmp     r8, #0
        ble     LCEJ27
        mov     r0, #0
        str     r9, [sp, #0x4C]
        mov     r9, r0
LCEJ23:
        cmp     r4, #0
        add     r0, r7, r9, lsl #3
        add     r1, r5, r9, lsl #3
        ble     LCEJ26
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
LCEJ24:
        ldr     r3, [r7, #0x28]
        mov     r2, #2, 24
        mov     r1, r6
        mov     r0, r5
        bl      _ipps_crRadix4Inv_64f
        ldr     lr, [r7, #0xC]
        cmp     lr, #0
        beq     LCEJ25
        ldr     r0, [r7, #0x10]
        ldr     r1, [r7, #0x14]
        mov     r3, #2, 24
        mov     r2, r5
        bl      _ipps_rbMpy1_64f
        ldr     r0, [r7, #0x10]
        ldr     r1, [r7, #0x14]
        mov     r3, #2, 24
        mov     r2, r6
        bl      _ipps_rbMpy1_64f
LCEJ25:
        add     r11, r11, #2, 24
        cmp     r11, r4
        add     r6, r6, #1, 20
        add     r5, r5, #1, 20
        blt     LCEJ24
        mov     r6, r7
        mov     r1, r8
        mov     r0, r9
        mov     r9, r10
        ldr     r5, [sp, #0x50]
        ldr     r7, [sp, #0x54]
        ldr     r8, [sp, #0x44]
        mov     r10, #0x80
        mov     r11, #0
LCEJ26:
        str     r10, [sp, #8]
        str     r11, [sp, #4]
        ldr     lr, [r6, #0x2C]
        mov     r3, #2, 24
        mov     r2, r4
        str     lr, [sp]
        bl      LCEJ_crFft_Blk_R2
        add     r9, r4, r9
        cmp     r9, r8
        blt     LCEJ23
        ldr     r9, [sp, #0x4C]
LCEJ27:
        cmp     r8, r4
        ble     LCEJ28
        str     r10, [sp, #8]
        str     r11, [sp, #4]
        ldr     lr, [r6, #0x30]
        mov     r3, r4
        mov     r2, r8
        str     lr, [sp]
        mov     r1, r5
        mov     r0, r7
        bl      LCEJ_crFft_Blk_R2
LCEJ28:
        subs    r9, r9, #1
        add     r7, r7, r8, lsl #3
        add     r5, r5, r8, lsl #3
        bne     LCEJ22
        mov     r2, r8
        ldr     r4, [sp, #0x10]
        ldr     r5, [sp, #0x28]
        ldr     r7, [sp, #0x14]
        ldr     r9, [sp, #0x18]
        ldr     r1, [sp, #0x1C]
        b       LCEJ31
        .long   LCEJ_tbl_blk_order
LCEJ29:
        cmp     r4, #0
        ble     LCEJ31
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
LCEJ30:
        str     r10, [sp]
        str     r11, [sp, #4]
        mov     r3, r4
        mov     r2, r5
        mov     r1, r7
        mov     r0, r6
        bl      LCEJ_crFftInv_BlkStep
        subs    r9, r9, #1
        add     r7, r7, r8, lsl #3
        add     r5, r5, r8, lsl #3
        bne     LCEJ30
        mov     r2, r8
        mov     r5, r11
        ldr     r4, [sp, #0x10]
        ldr     r7, [sp, #0x14]
        ldr     r9, [sp, #0x18]
        ldr     r1, [sp, #0x1C]
LCEJ31:
        add     r10, r6, r7, lsl #2
        ldr     r12, [r10, #0x48]
        add     r8, r5, r4, lsl #4
        add     r7, r8, r4, lsl #4
        cmp     r2, #0
        add     r6, r7, r4, lsl #4
        ble     LCEJ36
        mov     r11, #0
        str     r12, [sp, #0x20]
        str     r2, [sp, #0x44]
        str     r1, [sp, #0x1C]
LCEJ32:
        ldr     r3, [sp, #0x1C]
        add     r0, r9, r11, lsl #3
        str     r0, [sp, #0x40]
        add     r1, r3, r11, lsl #3
        str     r1, [sp, #0x3C]
        cmp     r4, #0
        ble     LCEJ34
        sub     r2, r5, #4
        sub     lr, r6, #4
        str     r6, [sp, #0x34]
        ldr     r6, [sp, #0x20]
        str     r2, [sp, #0x14]
        mov     r2, r4
        sub     r12, r7, #4
        sub     r3, r8, #4
        str     r4, [sp, #0x10]
        str     r5, [sp, #0x28]
        str     r2, [sp, #0x4C]
        str     r3, [sp, #0x54]
        str     r12, [sp, #0x50]
        str     lr, [sp, #0x48]
        str     r11, [sp, #0x38]
        str     r7, [sp, #0x30]
        str     r8, [sp, #0x2C]
        str     r10, [sp, #0x24]
        str     r9, [sp, #0x18]
        mov     r4, r0
        mov     r5, r1
LCEJ33:
        ldr     r2, [r6]
        str     r2, [sp, #0x58]
        ldr     r3, [r6, #4]
        str     r3, [sp, #0x5C]
        ldr     r0, [r5]
        ldr     r3, [sp, #0x5C]
        str     r0, [sp, #0x60]
        ldr     r7, [r5, #4]
        ldr     r11, [r4, #4]
        ldr     r8, [r6, #8]
        ldr     r9, [r6, #0xC]
        ldr     r10, [r4]
        mov     r1, r7
        bl      __muldf3
        str     r0, [sp, #0x64]
        str     r1, [sp, #0x68]
        mov     r2, r8
        mov     r3, r9
        mov     r1, r11
        mov     r0, r10
        bl      __muldf3
        ldr     r2, [sp, #0x64]
        ldr     r3, [sp, #0x68]
        bl      __adddf3
        ldr     r2, [sp, #0x58]
        ldr     r3, [sp, #0x5C]
        str     r0, [sp, #0x68]
        str     r1, [sp, #0x64]
        mov     r1, r11
        mov     r0, r10
        bl      __muldf3
        mov     r10, r0
        ldr     r0, [sp, #0x60]
        mov     r11, r1
        mov     r1, r7
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        mov     r3, r1
        mov     r2, r0
        mov     r1, r11
        mov     r0, r10
        bl      __subdf3
        ldr     r2, [r6, #0x10]
        ldr     r10, [r5, #8]
        ldr     r11, [r5, #0xC]
        str     r2, [sp, #0x60]
        ldr     r2, [r6, #0x14]
        str     r2, [sp, #0x5C]
        ldr     r2, [r4, #8]
        ldr     r3, [sp, #0x5C]
        str     r2, [sp, #0x58]
        ldr     r9, [r6, #0x1C]
        ldr     r7, [r4, #0xC]
        ldr     r8, [r6, #0x18]
        ldr     r2, [sp, #0x60]
        str     r0, [sp, #0x6C]
        str     r1, [sp, #0x70]
        mov     r1, r11
        mov     r0, r10
        bl      __muldf3
        str     r0, [sp, #0x74]
        ldr     r0, [sp, #0x58]
        str     r1, [sp, #0x78]
        mov     r3, r9
        mov     r2, r8
        mov     r1, r7
        bl      __muldf3
        ldr     r2, [sp, #0x74]
        ldr     r3, [sp, #0x78]
        bl      __adddf3
        ldr     r2, [sp, #0x60]
        ldr     r3, [sp, #0x5C]
        str     r0, [sp, #0x78]
        ldr     r0, [sp, #0x58]
        str     r1, [sp, #0x74]
        mov     r1, r7
        bl      __muldf3
        str     r0, [sp, #0x60]
        mov     r7, r1
        mov     r3, r9
        mov     r1, r11
        mov     r0, r10
        mov     r2, r8
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x60]
        mov     r3, r1
        mov     r1, r7
        bl      __subdf3
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp, #0x68]
        str     r3, [r2, #4]
        ldr     r3, [sp, #0x64]
        str     r3, [r2, #8]
        ldr     r3, [sp, #0x6C]
        str     r3, [r2, #0xC]
        ldr     r3, [sp, #0x70]
        str     r3, [r2, #0x10]
        ldr     r2, [sp, #0x54]
        ldr     r3, [sp, #0x78]
        str     r3, [r2, #4]
        ldr     r3, [sp, #0x74]
        str     r3, [r2, #8]
        ldr     r2, [sp, #0x54]
        str     r0, [r2, #0xC]
        ldr     r2, [sp, #0x54]
        str     r1, [r2, #0x10]
        ldr     r2, [r6, #0x20]
        str     r2, [sp, #0x78]
        ldr     r0, [r5, #0x10]
        str     r0, [sp, #0x74]
        ldr     r10, [r5, #0x14]
        ldr     r3, [r6, #0x24]
        mov     r1, r10
        str     r3, [sp, #0x70]
        ldr     r7, [r4, #0x10]
        ldr     r8, [r4, #0x14]
        ldr     r11, [r6, #0x28]
        ldr     r9, [r6, #0x2C]
        bl      __muldf3
        str     r0, [sp, #0x6C]
        str     r1, [sp, #0x68]
        mov     r1, r8
        mov     r3, r9
        mov     r0, r7
        mov     r2, r11
        bl      __muldf3
        ldr     r2, [sp, #0x6C]
        ldr     r3, [sp, #0x68]
        bl      __adddf3
        ldr     r2, [sp, #0x78]
        ldr     r3, [sp, #0x70]
        str     r0, [sp, #0x6C]
        str     r1, [sp, #0x68]
        mov     r1, r8
        mov     r0, r7
        bl      __muldf3
        mov     r7, r0
        ldr     r0, [sp, #0x74]
        mov     r8, r1
        mov     r3, r9
        mov     r2, r11
        mov     r1, r10
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r1, r8
        mov     r0, r7
        bl      __subdf3
        ldr     r2, [r5, #0x18]
        str     r2, [sp, #0x78]
        ldr     r9, [r4, #0x18]
        ldr     r7, [r5, #0x1C]
        ldr     r11, [r4, #0x1C]
        ldr     r10, [r6, #0x30]
        ldr     r3, [r6, #0x34]
        str     r3, [sp, #0x74]
        ldr     r3, [r6, #0x3C]
        ldr     r8, [r6, #0x38]
        str     r0, [sp, #0x64]
        str     r3, [sp, #0x70]
        ldr     r3, [sp, #0x74]
        ldr     r0, [sp, #0x78]
        str     r1, [sp, #0x60]
        mov     r1, r7
        mov     r2, r10
        bl      __muldf3
        ldr     r3, [sp, #0x70]
        str     r0, [sp, #0x5C]
        str     r1, [sp, #0x58]
        mov     r2, r8
        mov     r1, r11
        mov     r0, r9
        bl      __muldf3
        ldr     r2, [sp, #0x5C]
        ldr     r3, [sp, #0x58]
        bl      __adddf3
        ldr     r3, [sp, #0x74]
        str     r0, [sp, #0x5C]
        str     r1, [sp, #0x58]
        mov     r1, r11
        mov     r2, r10
        mov     r0, r9
        bl      __muldf3
        ldr     r3, [sp, #0x70]
        mov     r9, r0
        ldr     r0, [sp, #0x78]
        mov     r10, r1
        mov     r1, r7
        mov     r2, r8
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r9
        mov     r1, r10
        bl      __subdf3
        ldr     r3, [sp, #0x6C]
        ldr     r2, [sp, #0x50]
        str     r3, [r2, #4]
        ldr     r3, [sp, #0x68]
        add     r6, r6, #0x40
        str     r3, [r2, #8]
        ldr     r3, [sp, #0x64]
        str     r3, [r2, #0xC]
        ldr     r3, [sp, #0x60]
        str     r3, [r2, #0x10]
        ldr     r3, [sp, #0x5C]
        ldr     r2, [sp, #0x48]
        str     r3, [r2, #4]
        ldr     r3, [sp, #0x58]
        str     r0, [r2, #0xC]
        str     r1, [r2, #0x10]
        str     r3, [r2, #8]
        ldr     r2, [sp, #0x4C]
        subs    r2, r2, #1
        str     r2, [sp, #0x4C]
        ldr     r2, [sp, #0x44]
        add     r5, r5, r2, lsl #3
        add     r4, r4, r2, lsl #3
        ldr     r2, [sp, #0x48]
        add     r2, r2, #0x10
        str     r2, [sp, #0x48]
        ldr     r2, [sp, #0x50]
        add     r2, r2, #0x10
        str     r2, [sp, #0x50]
        ldr     r2, [sp, #0x54]
        add     r2, r2, #0x10
        str     r2, [sp, #0x54]
        ldr     r2, [sp, #0x14]
        add     r2, r2, #0x10
        str     r2, [sp, #0x14]
        ldr     r2, [sp, #0x4C]
        bne     LCEJ33
        str     r6, [sp, #0x20]
        ldr     r11, [sp, #0x38]
        ldr     r6, [sp, #0x34]
        ldr     r7, [sp, #0x30]
        ldr     r8, [sp, #0x2C]
        ldr     r10, [sp, #0x24]
        ldr     r4, [sp, #0x10]
        ldr     r5, [sp, #0x28]
        ldr     r9, [sp, #0x18]
LCEJ34:
        ldr     r2, [r10, #0x3C]
        mov     r1, r4
        mov     r0, r5
        bl      _ipps_cRadix4Inv_64fc
        ldr     r2, [r10, #0x3C]
        mov     r1, r4
        mov     r0, r8
        bl      _ipps_cRadix4Inv_64fc
        ldr     r2, [r10, #0x3C]
        mov     r1, r4
        mov     r0, r7
        bl      _ipps_cRadix4Inv_64fc
        ldr     r2, [r10, #0x3C]
        mov     r1, r4
        mov     r0, r6
        bl      _ipps_cRadix4Inv_64fc
        cmp     r4, #0
        ble     LCEJ37
        sub     r12, r5, #4
        mov     r3, r4
        str     r4, [sp, #0x10]
        str     r5, [sp, #0x28]
        ldr     r2, [sp, #0x40]
        ldr     r4, [sp, #0x3C]
        ldr     r5, [sp, #0x44]
        sub     r1, r6, #4
        sub     r0, r7, #4
        sub     lr, r8, #4
        str     r10, [sp, #0x24]
        str     r9, [sp, #0x18]
LCEJ35:
        ldr     r10, [r12, #4]
        ldr     r9, [r12, #8]
        subs    r3, r3, #1
        str     r10, [r4]
        str     r9, [r4, #4]
        ldr     r10, [r12, #0xC]
        ldr     r9, [r12, #0x10]!
        str     r10, [r2]
        str     r9, [r2, #4]
        ldr     r10, [lr, #4]
        ldr     r9, [lr, #8]
        str     r10, [r4, #8]
        str     r9, [r4, #0xC]
        ldr     r10, [lr, #0xC]
        ldr     r9, [lr, #0x10]!
        str     r10, [r2, #8]
        str     r9, [r2, #0xC]
        ldr     r10, [r0, #4]
        ldr     r9, [r0, #8]
        str     r10, [r4, #0x10]
        str     r9, [r4, #0x14]
        ldr     r10, [r0, #0xC]
        ldr     r9, [r0, #0x10]!
        str     r10, [r2, #0x10]
        str     r9, [r2, #0x14]
        ldr     r10, [r1, #4]
        ldr     r9, [r1, #8]
        str     r10, [r4, #0x18]
        str     r9, [r4, #0x1C]
        ldr     r10, [r1, #0xC]
        ldr     r9, [r1, #0x10]!
        add     r4, r4, r5, lsl #3
        str     r10, [r2, #0x18]
        str     r9, [r2, #0x1C]
        add     r2, r2, r5, lsl #3
        bne     LCEJ35
        str     r5, [sp, #0x44]
        ldr     r3, [sp, #0x44]
        ldr     r10, [sp, #0x24]
        ldr     r4, [sp, #0x10]
        ldr     r5, [sp, #0x28]
        ldr     r9, [sp, #0x18]
        add     r11, r11, #4
        cmp     r11, r3
        blt     LCEJ32
LCEJ36:
        add     sp, sp, #0x7C
        ldmia   sp!, {r4 - r11, pc}
LCEJ37:
        ldr     r3, [sp, #0x44]
        add     r11, r11, #4
        cmp     r11, r3
        blt     LCEJ32
        add     sp, sp, #0x7C
        ldmia   sp!, {r4 - r11, pc}


        .data
        .align  4


LCEJ_tbl_blk_order:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x04,0x00,0x00,0x00
        .byte   0x05,0x00,0x00,0x00,0x06,0x00,0x00,0x00,0x07,0x00,0x00,0x00,0x07,0x00,0x00,0x00
        .byte   0x08,0x00,0x00,0x00,0x09,0x00,0x00,0x00,0x09,0x00,0x00,0x00,0x09,0x00,0x00,0x00
        .byte   0x08,0x00,0x00,0x00,0x08,0x00,0x00,0x00,0x09,0x00,0x00,0x00,0x09,0x00,0x00,0x00
        .byte   0x09,0x00,0x00,0x00,0x09,0x00,0x00,0x00,0x09,0x00,0x00,0x00,0x09,0x00,0x00,0x00
        .byte   0x09,0x00,0x00,0x00,0x09,0x00,0x00,0x00


