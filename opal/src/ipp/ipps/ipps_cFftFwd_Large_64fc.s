        .text
        .align  4
        .globl  _ipps_cFftFwd_Large_64fc


_ipps_cFftFwd_Large_64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        mov     r6, r0
        ldr     r9, [sp, #0x34]
        ldr     r0, [r6, #0x24]
        mov     r4, r2
        mov     r8, r3
        mov     r7, #1
        cmp     r1, r4
        mov     r5, r7, lsl r8
        beq     LCEM8
        mov     r3, r0
        mov     r0, r1
        mov     r2, r5
        mov     r1, r4
        bl      _ipps_BitRev2_16
LCEM0:
        ldr     r12, [pc, #0xC3C]
        add     r12, r12, r8, lsl #2
        ldr     r12, [r12, #-0x24]
        cmp     r12, #0
        bne     LCEM6
        mov     r8, #2, 20
        cmp     r5, #2, 20
        movlt   r8, r5
        cmp     r5, #0
        ble     LCEM5
        mov     r11, #0
        sub     r10, r8, #2, 24
        mov     r9, #0x80
LCEM1:
        cmp     r10, #0
        mov     r1, r10
        add     r0, r4, r11, lsl #4
        blt     LCEM4
        add     r2, r0, r1, lsl #4
        str     r5, [sp, #0xC]
        str     r4, [sp, #8]
        mov     r5, r0
        mov     r7, r1
        mov     r4, r2
LCEM2:
        ldr     r2, [r6, #0x28]
        mov     r1, #2, 24
        mov     r0, r4
        bl      _ipps_cRadix4Fwd_64fc
        ldr     r3, [r6, #8]
        cmp     r3, #0
        beq     LCEM3
        ldr     r0, [r6, #0x10]
        ldr     r1, [r6, #0x14]
        mov     r3, #1, 22
        mov     r2, r4
        bl      _ipps_rbMpy1_64f
LCEM3:
        subs    r7, r7, #2, 24
        sub     r4, r4, #2, 20
        bpl     LCEM2
        mov     r0, r5
        ldr     r5, [sp, #0xC]
        ldr     r4, [sp, #8]
        mov     r7, #1
LCEM4:
        str     r9, [sp, #4]
        str     r7, [sp]
        ldr     r3, [r6, #0x2C]
        mov     r2, #2, 24
        mov     r1, r8
        bl      LCEM_cFft_Blk_R2
        add     r11, r8, r11
        cmp     r11, r5
        blt     LCEM1
LCEM5:
        cmp     r5, r8
        ble     LCEM7
        mov     r3, #0x80
        str     r3, [sp, #4]
        mov     r3, #1
        str     r3, [sp]
        ldr     r3, [r6, #0x30]
        mov     r2, r8
        mov     r1, r5
        mov     r0, r4
        bl      LCEM_cFft_Blk_R2
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCEM6:
        str     r9, [sp]
        mov     r2, r8
        mov     r1, r4
        mov     r0, r6
        mov     r3, #0
        bl      LCEM_cFftFwd_BlkStep
LCEM7:
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCEM8:
        mov     r2, r0
        mov     r1, r5
        mov     r0, r4
        bl      _ipps_BitRev1_16
        b       LCEM0
LCEM_cFft_Blk_R2:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x80
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
        rsb     r7, r2, r1, asr #7
        ble     LCEM16
LCEM9:
        cmp     r7, #0
        mov     r3, r5
        ble     LCEM15
        mvn     r1, #7, 2
        mov     r11, #0
        mov     lr, r0, lsl #3
        and     r1, r6, r1
        mov     r10, r11
        sub     r9, r12, #1
        mov     r8, r0, lsl #6
        mov     r2, r6, lsl #3
        str     lr, [sp, #0x60]
        str     r12, [sp, #0x48]
        str     r0, [sp, #0x40]
        str     r6, [sp, #0x3C]
        str     r5, [sp, #0x34]
LCEM10:
        cmp     r9, #0
        mov     lr, r3
        mov     r12, r9
        blt     LCEM14
        add     r0, r4, r10, lsl #3
        str     r8, [sp, #0x5C]
        str     r9, [sp, #0x58]
        str     r10, [sp, #0x54]
        str     r11, [sp, #0x50]
        str     r3, [sp, #0x4C]
        str     r7, [sp, #0x44]
        str     r4, [sp, #0x38]
LCEM11:
        add     r3, r2, lr
        sub     r11, lr, #0x1C
        str     r11, [sp, #0x30]
        sub     r6, lr, #0x14
        sub     r11, r3, #0x14
        str     r11, [sp, #0x1C]
        str     r6, [sp]
        ldr     r6, [sp, #0x1C]
        sub     r8, r3, #4
        sub     r7, r3, #0xC
        sub     r10, lr, #4
        sub     r9, lr, #0xC
        sub     r3, r3, #0x1C
        mov     r5, r0
        mov     r4, #0
        str     r3, [sp, #0xC]
        str     r7, [sp, #0x10]
        str     r8, [sp, #4]
        str     r9, [sp, #8]
        str     r10, [sp, #0x14]
        str     r0, [sp, #0x20]
        str     r12, [sp, #0x24]
        str     lr, [sp, #0x18]
        str     r1, [sp, #0x28]
        str     r2, [sp, #0x2C]
LCEM12:
        ldr     r1, [sp, #0xC]
        ldr     r0, [r1, #0x1C]
        str     r0, [sp, #0x64]
        ldr     r1, [r1, #0x20]
        str     r1, [sp, #0x68]
        ldr     r0, [r5]
        ldr     r1, [sp, #0x68]
        str     r0, [sp, #0x6C]
        ldr     r0, [r5, #4]
        ldr     r2, [sp, #0x6C]
        str     r0, [sp, #0x70]
        ldr     r0, [sp, #0x64]
        ldr     r3, [sp, #0x70]
        bl      __muldf3
        ldr     r11, [r5, #8]
        ldr     r10, [r5, #0xC]
        ldr     r8, [r6, #0x1C]
        ldr     r9, [r6, #0x20]
        str     r0, [sp, #0x74]
        mov     r7, r1
        mov     r2, r11
        mov     r1, r9
        mov     r3, r10
        mov     r0, r8
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x74]
        mov     r3, r1
        mov     r1, r7
        bl      __subdf3
        ldr     r2, [sp, #0x6C]
        ldr     r3, [sp, #0x70]
        str     r0, [sp, #0x74]
        mov     r7, r1
        mov     r1, r9
        mov     r0, r8
        bl      __muldf3
        mov     r8, r0
        ldr     r0, [sp, #0x64]
        mov     r9, r1
        ldr     r1, [sp, #0x68]
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        ldr     r12, [sp, #0x18]
        ldr     r2, [sp, #0x74]
        mov     r9, r0
        ldr     r12, [r12, +r4, lsl #3]
        mov     r8, r1
        mov     r3, r7
        str     r12, [sp, #0x70]
        ldr     r12, [sp, #0x30]
        ldr     r0, [sp, #0x70]
        ldr     r12, [r12, #0x20]
        str     r12, [sp, #0x6C]
        ldr     r1, [sp, #0x6C]
        bl      __adddf3
        ldr     r12, [sp]
        mov     r3, r8
        ldr     r11, [r12, #0x1C]
        ldr     r10, [r12, #0x20]
        str     r0, [sp, #0x68]
        str     r1, [sp, #0x64]
        mov     r0, r11
        mov     r2, r9
        mov     r1, r10
        bl      __adddf3
        ldr     r2, [sp, #0x74]
        str     r0, [sp, #0x78]
        ldr     r0, [sp, #0x70]
        str     r1, [sp, #0x7C]
        ldr     r1, [sp, #0x6C]
        mov     r3, r7
        bl      __subdf3
        str     r0, [sp, #0x74]
        mov     r7, r1
        mov     r2, r9
        mov     r1, r10
        mov     r0, r11
        mov     r3, r8
        bl      __subdf3
        ldr     r3, [sp, #0x18]
        ldr     r2, [sp, #0x68]
        str     r2, [r3, +r4, lsl #3]
        ldr     r2, [sp, #0x64]
        ldr     r3, [sp, #0x30]
        add     r4, r4, #4
        str     r2, [r3, #0x20]
        ldr     r2, [sp]
        ldr     r3, [sp, #0x78]
        str     r3, [r2, #0x1C]
        ldr     r3, [sp, #0x7C]
        str     r3, [r2, #0x20]
        ldr     r3, [sp, #0xC]
        ldr     r2, [sp, #0x74]
        str     r7, [r3, #0x20]
        str     r2, [r3, #0x1C]
        str     r0, [r6, #0x1C]
        str     r1, [r6, #0x20]!
        ldr     r1, [sp, #0x60]
        ldr     r2, [sp, #0x10]
        add     r0, r5, r1
        str     r0, [sp, #0x7C]
        ldr     r1, [r5, +r1]
        ldr     r0, [sp, #0x7C]
        str     r1, [sp, #0x78]
        ldr     r1, [r0, #4]
        str     r1, [sp, #0x74]
        ldr     r1, [r2, #0x1C]
        ldr     r3, [sp, #0x74]
        str     r1, [sp, #0x70]
        ldr     r2, [r2, #0x20]
        str     r2, [sp, #0x6C]
        ldr     r10, [r0, #8]
        ldr     r8, [r0, #0xC]
        ldr     r0, [sp, #0x70]
        ldr     r1, [sp, #0x6C]
        ldr     r2, [sp, #0x78]
        bl      __muldf3
        ldr     r12, [sp, #4]
        mov     r2, r10
        mov     r5, r0
        mov     r7, r1
        ldr     r11, [r12, #0x1C]
        ldr     r9, [r12, #0x20]
        mov     r3, r8
        mov     r0, r11
        mov     r1, r9
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r1, r7
        mov     r0, r5
        bl      __subdf3
        mov     r7, r0
        ldr     r0, [sp, #0x70]
        mov     r5, r1
        ldr     r1, [sp, #0x6C]
        mov     r3, r8
        mov     r2, r10
        bl      __muldf3
        ldr     r2, [sp, #0x78]
        ldr     r3, [sp, #0x74]
        mov     r10, r1
        mov     r8, r0
        mov     r0, r11
        mov     r1, r9
        bl      __muldf3
        mov     r3, r10
        mov     r2, r8
        bl      __adddf3
        ldr     r12, [sp, #8]
        mov     r8, r0
        mov     r9, r1
        ldr     r10, [r12, #0x20]
        ldr     r11, [r12, #0x1C]
        mov     r2, r7
        mov     r3, r5
        mov     r0, r11
        mov     r1, r10
        bl      __adddf3
        ldr     lr, [sp, #0x14]
        mov     r2, r8
        ldr     r12, [lr, #0x1C]
        mov     r3, r9
        str     r12, [sp, #0x78]
        ldr     lr, [lr, #0x20]
        str     r0, [sp, #0x70]
        ldr     r0, [sp, #0x78]
        str     lr, [sp, #0x74]
        str     r1, [sp, #0x6C]
        ldr     r1, [sp, #0x74]
        bl      __adddf3
        str     r0, [sp, #0x68]
        str     r1, [sp, #0x64]
        mov     r0, r11
        mov     r1, r10
        mov     r3, r5
        mov     r2, r7
        bl      __subdf3
        mov     r5, r1
        mov     r7, r0
        ldr     r0, [sp, #0x78]
        ldr     r1, [sp, #0x74]
        mov     r2, r8
        mov     r3, r9
        bl      __subdf3
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #0x70]
        str     r3, [r2, #0x1C]
        ldr     r3, [sp, #0x6C]
        cmp     r4, #0x80
        str     r3, [r2, #0x20]
        ldr     r3, [sp, #0x68]
        ldr     r2, [sp, #0x14]
        str     r3, [r2, #0x1C]
        ldr     r3, [sp, #0x64]
        str     r3, [r2, #0x20]
        ldr     r2, [sp, #0x10]
        str     r5, [r2, #0x20]
        str     r7, [r2, #0x1C]
        ldr     r2, [sp, #4]
        str     r0, [r2, #0x1C]
        str     r1, [r2, #0x20]
        ldr     r0, [sp, #0x7C]
        ldr     r1, [sp, #0x60]
        add     r5, r0, r1
        ldr     r0, [sp, #0x14]
        add     r0, r0, #0x20
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #8]
        add     r0, r0, #0x20
        str     r0, [sp, #8]
        ldr     r0, [sp, #4]
        add     r0, r0, #0x20
        str     r0, [sp, #4]
        ldr     r0, [sp, #0x10]
        add     r0, r0, #0x20
        str     r0, [sp, #0x10]
        ldr     r0, [sp]
        add     r0, r0, #0x20
        str     r0, [sp]
        ldr     r0, [sp, #0x30]
        add     r0, r0, #0x20
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0xC]
        add     r0, r0, #0x20
        str     r0, [sp, #0xC]
        blt     LCEM12
        ldr     lr, [sp, #0x18]
        ldr     r1, [sp, #0x28]
        ldr     r2, [sp, #0x2C]
        ldr     r0, [sp, #0x20]
        ldr     r12, [sp, #0x24]
        add     r4, lr, r1, lsl #2
        add     r3, r2, r4
        sub     r9, r3, #0xC
        str     r9, [sp, #0x30]
        sub     r6, r4, #4
        sub     r7, r4, #0xC
        sub     r9, r4, #0x14
        sub     r10, r4, #0x1C
        mov     lr, #0
        sub     r8, r3, #4
        sub     r11, r3, #0x1C
        mov     r5, r0
        sub     r4, r3, #0x14
        str     r11, [sp, #8]
        str     r10, [sp, #4]
        str     r9, [sp]
        str     r8, [sp, #0xC]
        str     r7, [sp, #0x10]
        str     r6, [sp, #0x14]
        str     lr, [sp, #0x18]
        str     r3, [sp, #0x1C]
        str     r0, [sp, #0x20]
        str     r12, [sp, #0x24]
        str     r1, [sp, #0x28]
        str     r2, [sp, #0x2C]
LCEM13:
        ldr     r1, [sp, #8]
        ldr     r2, [r5]
        ldr     r11, [r1, #0x1C]
        ldr     r8, [r1, #0x20]
        str     r2, [sp, #0x7C]
        ldr     r2, [r5, #4]
        str     r2, [sp, #0x78]
        ldr     r0, [r4, #0x1C]
        ldr     r3, [sp, #0x78]
        str     r0, [sp, #0x74]
        ldr     r2, [r4, #0x20]
        str     r2, [sp, #0x70]
        ldr     r1, [sp, #0x70]
        ldr     r2, [sp, #0x7C]
        bl      __muldf3
        ldr     r6, [r5, #8]
        ldr     r7, [r5, #0xC]
        mov     r10, r0
        mov     r9, r1
        mov     r0, r11
        mov     r3, r7
        mov     r2, r6
        mov     r1, r8
        bl      __muldf3
        mov     r3, r9
        mov     r2, r10
        bl      __adddf3
        ldr     r3, [sp, #0x78]
        ldr     r2, [sp, #0x7C]
        str     r0, [sp, #0x6C]
        str     r1, [sp, #0x68]
        mov     r1, r8
        mov     r0, r11
        bl      __muldf3
        mov     r9, r0
        ldr     r0, [sp, #0x74]
        mov     r8, r1
        ldr     r1, [sp, #0x70]
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        mov     r2, r9
        mov     r3, r8
        bl      __subdf3
        ldr     r12, [sp, #4]
        ldr     r2, [sp, #0x6C]
        ldr     r3, [sp, #0x68]
        ldr     r11, [r12, #0x1C]
        ldr     r10, [r12, #0x20]
        mov     r7, r0
        mov     r6, r1
        mov     r1, r10
        mov     r0, r11
        bl      __adddf3
        ldr     r12, [sp]
        mov     r3, r6
        ldr     r8, [r12, #0x20]
        ldr     r9, [r12, #0x1C]
        str     r0, [sp, #0x7C]
        str     r1, [sp, #0x78]
        mov     r0, r9
        mov     r2, r7
        mov     r1, r8
        bl      __adddf3
        ldr     r3, [sp, #0x68]
        ldr     r2, [sp, #0x6C]
        str     r0, [sp, #0x74]
        str     r1, [sp, #0x70]
        mov     r1, r10
        mov     r0, r11
        bl      __subdf3
        mov     r11, r0
        mov     r10, r1
        mov     r0, r9
        mov     r3, r6
        mov     r2, r7
        mov     r1, r8
        bl      __subdf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #0x7C]
        str     r3, [r2, #0x1C]
        ldr     r3, [sp, #0x78]
        str     r3, [r2, #0x20]
        ldr     r2, [sp]
        ldr     r3, [sp, #0x74]
        str     r3, [r2, #0x1C]
        ldr     r3, [sp, #0x70]
        str     r3, [r2, #0x20]
        ldr     r2, [sp, #8]
        str     r11, [r2, #0x1C]
        str     r10, [r2, #0x20]
        str     r0, [r4, #0x1C]
        str     r1, [r4, #0x20]!
        ldr     r0, [sp, #0x60]
        ldr     r1, [sp, #0x30]
        ldr     r6, [r5, +r0]
        add     r0, r5, r0
        ldr     r3, [r1, #0x1C]
        str     r3, [sp, #0x7C]
        ldr     r1, [r1, #0x20]
        str     r0, [sp, #0x74]
        str     r1, [sp, #0x78]
        ldr     r1, [r0, #8]
        ldr     r10, [r0, #4]
        str     r1, [sp, #0x70]
        ldr     r8, [r0, #0xC]
        ldr     r2, [sp, #0x70]
        ldr     r0, [sp, #0x7C]
        ldr     r1, [sp, #0x78]
        mov     r3, r8
        bl      __muldf3
        ldr     r12, [sp, #0xC]
        mov     r3, r10
        mov     r5, r0
        mov     r7, r1
        ldr     r11, [r12, #0x1C]
        ldr     r9, [r12, #0x20]
        mov     r2, r6
        mov     r0, r11
        mov     r1, r9
        bl      __muldf3
        mov     r3, r7
        mov     r2, r5
        bl      __adddf3
        mov     r5, r0
        ldr     r0, [sp, #0x7C]
        mov     r7, r1
        ldr     r1, [sp, #0x78]
        mov     r2, r6
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x70]
        mov     r6, r0
        mov     r10, r1
        mov     r0, r11
        mov     r1, r9
        mov     r3, r8
        bl      __muldf3
        mov     r3, r10
        mov     r2, r6
        bl      __subdf3
        ldr     r12, [sp, #0x10]
        mov     r6, r1
        ldr     r10, [r12, #0x20]
        ldr     r11, [r12, #0x1C]
        str     r0, [sp, #0x7C]
        mov     r2, r5
        mov     r1, r10
        mov     r0, r11
        mov     r3, r7
        bl      __adddf3
        ldr     r12, [sp, #0x14]
        ldr     r2, [sp, #0x7C]
        ldr     r9, [r12, #0x1C]
        ldr     r8, [r12, #0x20]
        str     r1, [sp, #0x70]
        str     r0, [sp, #0x78]
        mov     r0, r9
        mov     r1, r8
        mov     r3, r6
        bl      __adddf3
        str     r1, [sp, #0x68]
        str     r0, [sp, #0x6C]
        mov     r0, r11
        mov     r1, r10
        mov     r2, r5
        mov     r3, r7
        bl      __subdf3
        ldr     r2, [sp, #0x7C]
        mov     r5, r1
        mov     r7, r0
        mov     r0, r9
        mov     r1, r8
        mov     r3, r6
        bl      __subdf3
        ldr     r3, [sp, #0x78]
        ldr     r2, [sp, #0x10]
        str     r3, [r2, #0x1C]
        ldr     r3, [sp, #0x70]
        str     r3, [r2, #0x20]
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp, #0x6C]
        str     r3, [r2, #0x1C]
        ldr     r3, [sp, #0x68]
        str     r3, [r2, #0x20]
        ldr     r2, [sp, #0x30]
        str     r5, [r2, #0x20]
        str     r7, [r2, #0x1C]
        ldr     r2, [sp, #0x18]
        add     r2, r2, #4
        str     r2, [sp, #0x18]
        ldr     r2, [sp, #0xC]
        str     r0, [r2, #0x1C]
        str     r1, [r2, #0x20]
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #0x74]
        cmp     r0, #0x80
        ldr     r0, [sp, #0x60]
        add     r5, r1, r0
        ldr     r0, [sp, #0x14]
        add     r0, r0, #0x20
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0x10]
        add     r0, r0, #0x20
        str     r0, [sp, #0x10]
        ldr     r0, [sp, #0xC]
        add     r0, r0, #0x20
        str     r0, [sp, #0xC]
        ldr     r0, [sp, #0x30]
        add     r0, r0, #0x20
        str     r0, [sp, #0x30]
        ldr     r0, [sp]
        add     r0, r0, #0x20
        str     r0, [sp]
        ldr     r0, [sp, #4]
        add     r0, r0, #0x20
        str     r0, [sp, #4]
        ldr     r0, [sp, #8]
        add     r0, r0, #0x20
        str     r0, [sp, #8]
        blt     LCEM13
        ldr     r12, [sp, #0x24]
        ldr     r3, [sp, #0x1C]
        ldr     r1, [sp, #0x28]
        ldr     r0, [sp, #0x20]
        ldr     r2, [sp, #0x2C]
        subs    r12, r12, #1
        add     lr, r3, r1, lsl #2
        bpl     LCEM11
        ldr     r8, [sp, #0x5C]
        ldr     r9, [sp, #0x58]
        ldr     r10, [sp, #0x54]
        ldr     r11, [sp, #0x50]
        ldr     r3, [sp, #0x4C]
        ldr     r7, [sp, #0x44]
        ldr     r4, [sp, #0x38]
LCEM14:
        add     r11, r11, #1
        cmp     r11, r7
        add     r10, r8, r10
        add     r3, r3, #1, 22
        blt     LCEM10
        ldr     r12, [sp, #0x48]
        ldr     r0, [sp, #0x40]
        ldr     r6, [sp, #0x3C]
        ldr     r5, [sp, #0x34]
LCEM15:
        mov     r12, r12, asr #1
        cmp     r12, #0
        mov     r6, r6, lsl #1
        mov     r7, r7, lsl #1
        mov     r0, r0, asr #1
        bgt     LCEM9
LCEM16:
        add     sp, sp, #0x80
        ldmia   sp!, {r4 - r11, pc}
LCEM_cFftFwd_BlkStep:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x68
        ldr     r12, [pc, #0x1DC]
        ldr     r5, [sp, #0x8C]
        mov     r7, r0
        add     lr, r12, r2, lsl #2
        ldr     lr, [lr, #-0x24]
        mov     r6, r1
        mov     r0, #1
        sub     r2, r2, lr
        cmp     r2, #9
        mov     r10, r3
        mov     r4, r0, lsl lr
        mov     r1, r0, lsl r2
        mov     r9, r6
        bgt     LCEM19
        cmp     r4, #0
        ble     LCEM29
        mov     r8, r4
        mov     r11, r6
        mov     r6, r5
        mov     r5, r1
LCEM17:
        ldr     r2, [r7, #0x28]
        mov     r1, r5
        mov     r0, r9
        bl      _ipps_cRadix4Fwd_64fc
        ldr     r12, [r7, #8]
        cmp     r12, #0
        beq     LCEM18
        ldr     r0, [r7, #0x10]
        ldr     r1, [r7, #0x14]
        mov     r3, r5, lsl #1
        mov     r2, r9
        bl      _ipps_rbMpy1_64f
LCEM18:
        subs    r8, r8, #1
        add     r9, r9, r5, lsl #4
        bne     LCEM17
        mov     r1, r5
        mov     r5, r6
        mov     r6, r11
        b       LCEM29
LCEM19:
        add     r12, r12, r2, lsl #2
        ldr     r12, [r12, #-0x24]
        cmp     r12, #0
        bne     LCEM27
        cmp     r4, #0
        ble     LCEM29
        mov     r2, #2, 20
        cmp     r1, #2, 20
        movlt   r2, r1
        mov     r3, #0x80
        mov     r8, r4
        str     r4, [sp, #0x38]
        str     r5, [sp, #0x3C]
        str     r10, [sp, #0x44]
        str     r6, [sp, #0x40]
        sub     r11, r2, #2, 24
        mov     r6, r0
        mov     r5, r1
        mov     r4, r2
        mov     r10, r3
LCEM20:
        cmp     r5, #0
        ble     LCEM25
        mov     r0, #0
        str     r8, [sp, #0x30]
        mov     r8, r0
LCEM21:
        cmp     r11, #0
        mov     r1, r11
        add     r0, r9, r8, lsl #4
        blt     LCEM24
        add     r2, r0, r1, lsl #4
        str     r9, [sp, #0x34]
        str     r5, [sp, #0x1C]
        mov     r6, r0
        mov     r9, r1
        mov     r5, r2
LCEM22:
        ldr     r2, [r7, #0x28]
        mov     r1, #2, 24
        mov     r0, r5
        bl      _ipps_cRadix4Fwd_64fc
        ldr     r12, [r7, #8]
        cmp     r12, #0
        beq     LCEM23
        ldr     r0, [r7, #0x10]
        ldr     r1, [r7, #0x14]
        mov     r3, #1, 22
        mov     r2, r5
        bl      _ipps_rbMpy1_64f
LCEM23:
        subs    r9, r9, #2, 24
        sub     r5, r5, #2, 20
        bpl     LCEM22
        mov     r0, r6
        ldr     r9, [sp, #0x34]
        ldr     r5, [sp, #0x1C]
        mov     r6, #1
LCEM24:
        str     r10, [sp, #4]
        str     r6, [sp]
        ldr     r3, [r7, #0x2C]
        mov     r2, #2, 24
        mov     r1, r4
        bl      LCEM_cFft_Blk_R2
        add     r8, r4, r8
        cmp     r8, r5
        blt     LCEM21
        ldr     r8, [sp, #0x30]
LCEM25:
        cmp     r5, r4
        ble     LCEM26
        str     r10, [sp, #4]
        str     r6, [sp]
        ldr     r3, [r7, #0x30]
        mov     r2, r4
        mov     r1, r5
        mov     r0, r9
        bl      LCEM_cFft_Blk_R2
LCEM26:
        subs    r8, r8, #1
        add     r9, r9, r5, lsl #4
        bne     LCEM20
        mov     r1, r5
        ldr     r4, [sp, #0x38]
        ldr     r5, [sp, #0x3C]
        ldr     r10, [sp, #0x44]
        ldr     r6, [sp, #0x40]
        b       LCEM29
        .long   LCEM_tbl_blk_order
LCEM27:
        cmp     r4, #0
        ble     LCEM29
        add     r11, r10, #1
        str     r10, [sp, #0x44]
        str     r6, [sp, #0x40]
        mov     r8, r4
        mov     r6, r1
        mov     r10, r2
LCEM28:
        str     r5, [sp]
        mov     r3, r11
        mov     r2, r10
        mov     r1, r9
        mov     r0, r7
        bl      LCEM_cFftFwd_BlkStep
        subs    r8, r8, #1
        add     r9, r9, r6, lsl #4
        bne     LCEM28
        mov     r1, r6
        ldr     r10, [sp, #0x44]
        ldr     r6, [sp, #0x40]
LCEM29:
        add     r10, r7, r10, lsl #2
        ldr     r2, [r10, #0x48]
        add     r9, r5, r4, lsl #4
        add     r8, r9, r4, lsl #4
        cmp     r1, #0
        add     r7, r8, r4, lsl #4
        ble     LCEM34
        mov     r11, #0
        str     r2, [sp, #0x44]
        str     r1, [sp, #0x1C]
LCEM30:
        add     r0, r6, r11, lsl #4
        str     r0, [sp, #0x20]
        cmp     r4, #0
        ble     LCEM32
        sub     r2, r5, #4
        str     r5, [sp, #0x3C]
        ldr     r5, [sp, #0x44]
        mov     r1, r4
        sub     lr, r7, #4
        sub     r12, r8, #4
        sub     r3, r9, #4
        str     r4, [sp, #0x38]
        str     r1, [sp, #0x14]
        str     r2, [sp, #0x10]
        str     r3, [sp, #8]
        str     r12, [sp, #0xC]
        str     lr, [sp, #0x18]
        str     r11, [sp, #0x24]
        str     r7, [sp, #0x28]
        str     r8, [sp, #0x2C]
        str     r9, [sp, #0x30]
        str     r10, [sp, #0x34]
        str     r6, [sp, #0x40]
        mov     r4, r0
LCEM31:
        ldr     r10, [r4, #4]
        ldr     r9, [r4]
        ldr     r2, [r5]
        mov     r1, r10
        str     r2, [sp, #0x48]
        ldr     r3, [r5, #4]
        mov     r0, r9
        str     r3, [sp, #0x4C]
        ldr     r3, [sp, #0x4C]
        ldr     r8, [r5, #0xC]
        ldr     r7, [r4, #0xC]
        ldr     r11, [r5, #8]
        ldr     r6, [r4, #8]
        bl      __muldf3
        str     r1, [sp, #0x54]
        str     r0, [sp, #0x50]
        mov     r1, r7
        mov     r3, r8
        mov     r0, r6
        mov     r2, r11
        bl      __muldf3
        mov     r3, r1
        ldr     r1, [sp, #0x54]
        mov     r2, r0
        ldr     r0, [sp, #0x50]
        bl      __subdf3
        ldr     r3, [sp, #0x4C]
        ldr     r2, [sp, #0x48]
        str     r0, [sp, #0x54]
        str     r1, [sp, #0x50]
        mov     r0, r6
        mov     r1, r7
        bl      __muldf3
        mov     r6, r0
        mov     r7, r1
        mov     r2, r11
        mov     r1, r10
        mov     r3, r8
        mov     r0, r9
        bl      __muldf3
        mov     r3, r7
        mov     r2, r6
        bl      __adddf3
        ldr     r2, [r5, #0x10]
        str     r2, [sp, #0x4C]
        ldr     r2, [r5, #0x14]
        str     r2, [sp, #0x48]
        ldr     r10, [r4, #0x18]
        ldr     r7, [r4, #0x14]
        ldr     r6, [r4, #0x10]
        ldr     r8, [r5, #0x18]
        ldr     r11, [r4, #0x1C]
        ldr     r9, [r5, #0x1C]
        ldr     r2, [sp, #0x4C]
        ldr     r3, [sp, #0x48]
        str     r0, [sp, #0x58]
        str     r1, [sp, #0x5C]
        mov     r1, r7
        mov     r0, r6
        bl      __muldf3
        str     r0, [sp, #0x60]
        str     r1, [sp, #0x64]
        mov     r3, r9
        mov     r1, r11
        mov     r2, r8
        mov     r0, r10
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x60]
        mov     r3, r1
        ldr     r1, [sp, #0x64]
        bl      __subdf3
        ldr     r2, [sp, #0x4C]
        ldr     r3, [sp, #0x48]
        str     r0, [sp, #0x64]
        str     r1, [sp, #0x60]
        mov     r1, r11
        mov     r0, r10
        bl      __muldf3
        mov     r10, r0
        mov     r11, r1
        mov     r3, r9
        mov     r2, r8
        mov     r1, r7
        mov     r0, r6
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        ldr     r3, [sp, #0x54]
        ldr     r2, [sp, #0x10]
        str     r3, [r2, #4]
        ldr     r3, [sp, #0x50]
        str     r3, [r2, #8]
        ldr     r3, [sp, #0x58]
        str     r3, [r2, #0xC]
        ldr     r3, [sp, #0x5C]
        str     r3, [r2, #0x10]
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #0x64]
        str     r3, [r2, #4]
        ldr     r3, [sp, #0x60]
        str     r0, [r2, #0xC]
        str     r1, [r2, #0x10]
        str     r3, [r2, #8]
        ldr     r9, [r4, #0x20]
        ldr     r10, [r4, #0x24]
        ldr     r2, [r5, #0x20]
        mov     r0, r9
        str     r2, [sp, #0x64]
        ldr     r3, [r5, #0x24]
        mov     r1, r10
        str     r3, [sp, #0x60]
        ldr     r7, [r4, #0x2C]
        ldr     r6, [r4, #0x28]
        ldr     r3, [sp, #0x60]
        ldr     r11, [r5, #0x28]
        ldr     r8, [r5, #0x2C]
        bl      __muldf3
        str     r0, [sp, #0x5C]
        str     r1, [sp, #0x58]
        mov     r0, r6
        mov     r3, r8
        mov     r1, r7
        mov     r2, r11
        bl      __muldf3
        mov     r3, r1
        mov     r2, r0
        ldr     r0, [sp, #0x5C]
        ldr     r1, [sp, #0x58]
        bl      __subdf3
        ldr     r2, [sp, #0x64]
        ldr     r3, [sp, #0x60]
        str     r1, [sp, #0x58]
        str     r0, [sp, #0x5C]
        mov     r1, r7
        mov     r0, r6
        bl      __muldf3
        mov     r6, r0
        mov     r7, r1
        mov     r2, r11
        mov     r0, r9
        mov     r1, r10
        mov     r3, r8
        bl      __muldf3
        mov     r3, r7
        mov     r2, r6
        bl      __adddf3
        ldr     r11, [r4, #0x30]
        ldr     r2, [r4, #0x34]
        str     r2, [sp, #0x64]
        ldr     r12, [r4, #0x38]
        ldr     r7, [r5, #0x30]
        ldr     r6, [r5, #0x34]
        str     r12, [sp, #0x60]
        ldr     r8, [r4, #0x3C]
        ldr     r9, [r5, #0x38]
        ldr     r10, [r5, #0x3C]
        str     r1, [sp, #0x50]
        ldr     r1, [sp, #0x64]
        str     r0, [sp, #0x54]
        mov     r0, r11
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0x60]
        str     r1, [sp, #0x48]
        mov     r2, r9
        mov     r3, r10
        mov     r1, r8
        bl      __muldf3
        mov     r3, r1
        ldr     r1, [sp, #0x48]
        mov     r2, r0
        ldr     r0, [sp, #0x4C]
        bl      __subdf3
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0x60]
        str     r1, [sp, #0x48]
        mov     r1, r8
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        mov     r7, r1
        ldr     r1, [sp, #0x64]
        mov     r6, r0
        mov     r0, r11
        mov     r2, r9
        mov     r3, r10
        bl      __muldf3
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        ldr     r3, [sp, #0x5C]
        ldr     r2, [sp, #0xC]
        add     r5, r5, #0x40
        str     r3, [r2, #4]
        ldr     r3, [sp, #0x58]
        str     r3, [r2, #8]
        ldr     r3, [sp, #0x54]
        str     r3, [r2, #0xC]
        ldr     r3, [sp, #0x50]
        str     r3, [r2, #0x10]
        ldr     r3, [sp, #0x4C]
        ldr     r2, [sp, #0x18]
        str     r3, [r2, #4]
        ldr     r3, [sp, #0x48]
        str     r1, [r2, #0x10]
        str     r0, [r2, #0xC]
        str     r3, [r2, #8]
        ldr     r1, [sp, #0x14]
        subs    r1, r1, #1
        str     r1, [sp, #0x14]
        ldr     r1, [sp, #0x1C]
        add     r4, r4, r1, lsl #4
        ldr     r1, [sp, #0x18]
        add     r1, r1, #0x10
        str     r1, [sp, #0x18]
        ldr     r1, [sp, #0xC]
        add     r1, r1, #0x10
        str     r1, [sp, #0xC]
        ldr     r1, [sp, #8]
        add     r1, r1, #0x10
        str     r1, [sp, #8]
        ldr     r1, [sp, #0x10]
        add     r1, r1, #0x10
        str     r1, [sp, #0x10]
        ldr     r1, [sp, #0x14]
        bne     LCEM31
        str     r5, [sp, #0x44]
        ldr     r11, [sp, #0x24]
        ldr     r7, [sp, #0x28]
        ldr     r8, [sp, #0x2C]
        ldr     r9, [sp, #0x30]
        ldr     r10, [sp, #0x34]
        ldr     r4, [sp, #0x38]
        ldr     r5, [sp, #0x3C]
        ldr     r6, [sp, #0x40]
LCEM32:
        ldr     r2, [r10, #0x3C]
        mov     r1, r4
        mov     r0, r5
        bl      _ipps_cRadix4Fwd_64fc
        ldr     r2, [r10, #0x3C]
        mov     r1, r4
        mov     r0, r9
        bl      _ipps_cRadix4Fwd_64fc
        ldr     r2, [r10, #0x3C]
        mov     r1, r4
        mov     r0, r8
        bl      _ipps_cRadix4Fwd_64fc
        ldr     r2, [r10, #0x3C]
        mov     r1, r4
        mov     r0, r7
        bl      _ipps_cRadix4Fwd_64fc
        cmp     r4, #0
        ble     LCEM35
        mov     r2, r4
        str     r4, [sp, #0x38]
        ldr     r1, [sp, #0x20]
        ldr     r4, [sp, #0x1C]
        sub     r0, r7, #4
        sub     lr, r8, #4
        sub     r12, r9, #4
        sub     r3, r5, #4
        str     r5, [sp, #0x3C]
        str     r6, [sp, #0x40]
LCEM33:
        ldr     r6, [r3, #4]
        ldr     r5, [r3, #8]
        subs    r2, r2, #1
        str     r6, [r1]
        str     r5, [r1, #4]
        ldr     r6, [r3, #0xC]
        ldr     r5, [r3, #0x10]!
        str     r6, [r1, #8]
        str     r5, [r1, #0xC]
        ldr     r6, [r12, #4]
        ldr     r5, [r12, #8]
        str     r6, [r1, #0x10]
        str     r5, [r1, #0x14]
        ldr     r6, [r12, #0xC]
        ldr     r5, [r12, #0x10]!
        str     r6, [r1, #0x18]
        str     r5, [r1, #0x1C]
        ldr     r6, [lr, #4]
        ldr     r5, [lr, #8]
        str     r6, [r1, #0x20]
        str     r5, [r1, #0x24]
        ldr     r6, [lr, #0xC]
        ldr     r5, [lr, #0x10]!
        str     r6, [r1, #0x28]
        str     r5, [r1, #0x2C]
        ldr     r6, [r0, #4]
        ldr     r5, [r0, #8]
        str     r6, [r1, #0x30]
        str     r5, [r1, #0x34]
        ldr     r6, [r0, #0xC]
        ldr     r5, [r0, #0x10]!
        str     r6, [r1, #0x38]
        str     r5, [r1, #0x3C]
        add     r1, r1, r4, lsl #4
        bne     LCEM33
        str     r4, [sp, #0x1C]
        ldr     r2, [sp, #0x1C]
        ldr     r4, [sp, #0x38]
        ldr     r5, [sp, #0x3C]
        ldr     r6, [sp, #0x40]
        add     r11, r11, #4
        cmp     r11, r2
        blt     LCEM30
LCEM34:
        add     sp, sp, #0x68
        ldmia   sp!, {r4 - r11, pc}
LCEM35:
        ldr     r2, [sp, #0x1C]
        add     r11, r11, #4
        cmp     r11, r2
        blt     LCEM30
        add     sp, sp, #0x68
        ldmia   sp!, {r4 - r11, pc}


        .data
        .align  4


LCEM_tbl_blk_order:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x04,0x00,0x00,0x00
        .byte   0x05,0x00,0x00,0x00,0x06,0x00,0x00,0x00,0x07,0x00,0x00,0x00,0x07,0x00,0x00,0x00
        .byte   0x08,0x00,0x00,0x00,0x09,0x00,0x00,0x00,0x09,0x00,0x00,0x00,0x09,0x00,0x00,0x00
        .byte   0x08,0x00,0x00,0x00,0x08,0x00,0x00,0x00,0x09,0x00,0x00,0x00,0x09,0x00,0x00,0x00
        .byte   0x09,0x00,0x00,0x00,0x09,0x00,0x00,0x00,0x09,0x00,0x00,0x00,0x09,0x00,0x00,0x00
        .byte   0x09,0x00,0x00,0x00,0x09,0x00,0x00,0x00


