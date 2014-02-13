        .text
        .align  4
        .globl  _ipps_cDftInv_OutOrd_64fc


_ipps_cDftInv_OutOrd_64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x40
        mov     r9, r0
        ldr     r12, [r9, #0x5C]
        ldr     lr, [r9, #0x60]
        ldr     r11, [r9, #0x54]
        str     r1, [sp, #0x30]
        mul     r6, r12, lr
        rsb     r12, r11, r11, lsl #2
        mov     r4, r2
        add     r12, r9, r12, lsl #3
        ldr     r5, [r12, #0x60]
        mov     r0, r6
        mov     r8, r3
        mov     r7, #0
        mov     r1, r5
        bl      __intel_idiv
        cmp     r6, #0x7D, 30
        mov     r10, r11
        mov     r2, r0
        ble     LCPL9
        cmp     r11, #1
        ble     LCPL9
        cmp     r5, #0
        ble     LCPL13
        rsb     r12, r11, r11, lsl #2
        str     r8, [sp, #0x28]
        add     r0, r9, r12, lsl #3
        mov     r6, r11
        str     r10, [sp, #0x1C]
        str     r9, [sp, #0x20]
        mov     r11, r0
        mov     r8, r2
LCPL0:
        ldr     r10, [r11, #0x5C]
        ldr     r9, [sp, #0x30]
        mov     r0, r8
        mov     r1, r10
        bl      __intel_idiv
        cmp     r8, #0x7D, 30
        ble     LCPL3
        cmp     r6, #1
        ble     LCPL3
        mul     r1, r7, r10
        cmp     r10, #0
        ble     LCPL2
        str     r8, [sp, #0x34]
        str     r11, [sp, #0x38]
        str     r7, [sp, #0x24]
        ldr     r11, [sp, #0x28]
        ldr     r7, [sp, #0x30]
        ldr     r8, [sp, #0x20]
        sub     r9, r6, #1
        str     r5, [sp, #0x14]
        str     r6, [sp, #0x3C]
        mov     r5, r0
        mov     r6, r1
LCPL1:
        str     r11, [sp, #8]
        str     r9, [sp, #4]
        str     r6, [sp]
        mov     r3, r5
        mov     r2, r4
        mov     r1, r7
        mov     r0, r8
        bl      LCPL_cDftInv_OutOrd_Step
        subs    r10, r10, #1
        add     r6, r6, #1
        bne     LCPL1
        mov     r0, r5
        ldr     r5, [sp, #0x14]
        ldr     r8, [sp, #0x34]
        ldr     r11, [sp, #0x38]
        ldr     r6, [sp, #0x3C]
        ldr     r7, [sp, #0x24]
LCPL2:
        mov     r1, r6
        mov     r9, r4
        b       LCPL4
LCPL3:
        mov     r1, #0
        mov     r0, #1
LCPL4:
        cmp     r1, r6
        bgt     LCPL8
        ldr     r12, [sp, #0x20]
        str     r11, [sp, #0x38]
        ldr     r11, [sp, #0x28]
        str     r5, [sp, #0x14]
        rsb     lr, r1, r1, lsl #2
        str     r8, [sp, #0x34]
        mov     r5, r0
        add     r10, r12, lr, lsl #3
        mov     r0, r9
        mov     r8, r1
LCPL5:
        ldr     r2, [r10, #0x68]
        ldr     r9, [r10, #0x5C]
        ldr     r1, [r10, #0x70]
        mul     r3, r7, r2
        cmp     r9, #2
        beq     LCPL17
        cmp     r9, #3
        beq     LCPL16
        cmp     r9, #4
        beq     LCPL15
        cmp     r9, #5
        beq     LCPL14
        ldr     r12, [r10, #0x6C]
        cmp     r2, #0
        ble     LCPL7
        str     r10, [sp, #0x18]
        str     r8, [sp, #0x10]
        str     r6, [sp, #0x3C]
        str     r7, [sp, #0x24]
        str     r12, [sp, #0x2C]
        mov     r6, r0
        mov     r10, r1
        mov     r8, r2
        mov     r7, r3
LCPL6:
        str     r11, [sp, #0xC]
        str     r10, [sp, #8]
        ldr     r12, [sp, #0x2C]
        str     r7, [sp]
        mov     r3, r5
        str     r12, [sp, #4]
        mov     r2, r9
        mov     r1, r4
        mov     r0, r6
        bl      _ipps_cDftOutOrdInv_Fact_64fc
        subs    r8, r8, #1
        add     r7, r7, #1
        bne     LCPL6
        ldr     r10, [sp, #0x18]
        ldr     r8, [sp, #0x10]
        ldr     r6, [sp, #0x3C]
        ldr     r7, [sp, #0x24]
LCPL7:
        mul     r5, r5, r9
        add     r8, r8, #1
        cmp     r8, r6
        add     r10, r10, #0x18
        mov     r0, r4
        ble     LCPL5
        ldr     r5, [sp, #0x14]
        ldr     r8, [sp, #0x34]
        ldr     r11, [sp, #0x38]
LCPL8:
        add     r7, r7, #1
        cmp     r7, r5
        blt     LCPL0
        mov     r2, r8
        ldr     r10, [sp, #0x1C]
        ldr     r8, [sp, #0x28]
        ldr     r9, [sp, #0x20]
        b       LCPL13
LCPL9:
        cmp     r11, #0
        mov     r2, #1
        blt     LCPL13
        mov     r0, r9
        ldr     r5, [sp, #0x30]
        str     r10, [sp, #0x1C]
        str     r8, [sp, #0x28]
        str     r9, [sp, #0x20]
        mov     r10, r0
        mov     r8, r2
        mov     r9, r7
LCPL10:
        ldr     r12, [r10, #0x60]
        ldr     r7, [r10, #0x5C]
        mov     r0, r6
        str     r12, [sp, #0x14]
        ldr     r12, [r10, #0x70]
        mov     r1, r7
        str     r12, [sp, #0x2C]
        bl      __intel_idiv
        cmp     r7, #2
        mov     r6, r0
        beq     LCPL23
        cmp     r7, #3
        beq     LCPL22
        cmp     r7, #4
        beq     LCPL21
        cmp     r7, #5
        beq     LCPL20
        ldr     r12, [r10, #0x6C]
        cmp     r6, #0
        ble     LCPL12
        str     r10, [sp, #0x18]
        str     r9, [sp, #0x24]
        ldr     r9, [sp, #0x2C]
        ldr     r10, [sp, #0x28]
        mov     r11, #0
        str     r12, [sp, #0x10]
LCPL11:
        str     r10, [sp, #0xC]
        str     r9, [sp, #8]
        ldr     r12, [sp, #0x10]
        str     r11, [sp]
        mov     r3, r8
        str     r12, [sp, #4]
        mov     r2, r7
        mov     r1, r4
        mov     r0, r5
        bl      _ipps_cDftOutOrdInv_Fact_64fc
        add     r11, r11, #1
        cmp     r11, r6
        blt     LCPL11
        ldr     r12, [sp, #0x20]
        ldr     r10, [sp, #0x18]
        ldr     r9, [sp, #0x24]
        ldr     r11, [r12, #0x54]
LCPL12:
        mul     r8, r7, r8
        add     r9, r9, #1
        cmp     r9, r11
        add     r10, r10, #0x18
        mov     r5, r4
        ble     LCPL10
        mov     r2, r8
        ldr     r5, [sp, #0x14]
        ldr     r10, [sp, #0x1C]
        ldr     r8, [sp, #0x28]
        ldr     r9, [sp, #0x20]
LCPL13:
        cmp     r5, #3
        beq     LCPL19
        cmp     r5, #5
        beq     LCPL18
        rsb     r10, r10, r10, lsl #2
        mov     r3, r2
        add     r10, r9, r10, lsl #3
        ldr     r12, [r10, #0x84]
        str     r8, [sp, #4]
        mov     r2, r5
        str     r12, [sp]
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftOutOrdInv_Prime_64fc
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LCPL14:
        str     r1, [sp, #4]
        str     r2, [sp]
        mov     r2, r5
        mov     r1, r4
        bl      _ipps_cDftOutOrdInv_Fact5_64fc
        b       LCPL7
LCPL15:
        str     r1, [sp, #4]
        str     r2, [sp]
        mov     r2, r5
        mov     r1, r4
        bl      _ipps_cDftOutOrdInv_Fact4_64fc
        b       LCPL7
LCPL16:
        str     r1, [sp, #4]
        str     r2, [sp]
        mov     r2, r5
        mov     r1, r4
        bl      _ipps_cDftOutOrdInv_Fact3_64fc
        b       LCPL7
LCPL17:
        str     r1, [sp, #4]
        str     r2, [sp]
        mov     r2, r5
        mov     r1, r4
        bl      _ipps_cDftOutOrdInv_Fact2_64fc
        b       LCPL7
LCPL18:
        mov     r1, r4
        mov     r0, r4
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, lr}
        b       _ipps_cDftOutOrdInv_Prime5_64fc
LCPL19:
        mov     r1, r4
        mov     r0, r4
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, lr}
        b       _ipps_cDftOutOrdInv_Prime3_64fc
LCPL20:
        ldr     r12, [sp, #0x2C]
        str     r6, [sp]
        mov     r0, r5
        str     r12, [sp, #4]
        mov     r3, #0
        mov     r2, r8
        mov     r1, r4
        bl      _ipps_cDftOutOrdInv_Fact5_64fc
        ldr     r12, [sp, #0x20]
        ldr     r11, [r12, #0x54]
        b       LCPL12
LCPL21:
        ldr     r12, [sp, #0x2C]
        str     r6, [sp]
        mov     r0, r5
        str     r12, [sp, #4]
        mov     r3, #0
        mov     r2, r8
        mov     r1, r4
        bl      _ipps_cDftOutOrdInv_Fact4_64fc
        ldr     r12, [sp, #0x20]
        ldr     r11, [r12, #0x54]
        b       LCPL12
LCPL22:
        ldr     r12, [sp, #0x2C]
        str     r6, [sp]
        mov     r0, r5
        str     r12, [sp, #4]
        mov     r3, #0
        mov     r2, r8
        mov     r1, r4
        bl      _ipps_cDftOutOrdInv_Fact3_64fc
        ldr     r12, [sp, #0x20]
        ldr     r11, [r12, #0x54]
        b       LCPL12
LCPL23:
        ldr     r12, [sp, #0x2C]
        str     r6, [sp]
        mov     r0, r5
        str     r12, [sp, #4]
        mov     r3, #0
        mov     r2, r8
        mov     r1, r4
        bl      _ipps_cDftOutOrdInv_Fact2_64fc
        ldr     r12, [sp, #0x20]
        ldr     r11, [r12, #0x54]
        b       LCPL12
LCPL_cDftInv_OutOrd_Step:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x24
        ldr     r8, [sp, #0x4C]
        ldr     r9, [sp, #0x48]
        ldr     r7, [sp, #0x50]
        rsb     r12, r8, r8, lsl #2
        mov     r11, r0
        mov     r4, r1
        add     r12, r11, r12, lsl #3
        ldr     r10, [r12, #0x5C]
        mov     r5, r3
        mov     r0, r5
        mov     r6, r2
        mov     r1, r10
        bl      __intel_idiv
        cmp     r5, #0x7D, 30
        mov     r5, r0
        ble     LCPL26
        cmp     r8, #1
        ble     LCPL26
        mul     r1, r9, r10
        cmp     r10, #0
        ble     LCPL25
        sub     r0, r8, #1
        str     r8, [sp, #0x1C]
        str     r9, [sp, #0x20]
        mov     r8, r0
        mov     r9, r1
LCPL24:
        str     r8, [sp, #4]
        str     r7, [sp, #8]
        str     r9, [sp]
        mov     r3, r5
        mov     r2, r6
        mov     r1, r4
        mov     r0, r11
        bl      LCPL_cDftInv_OutOrd_Step
        subs    r10, r10, #1
        add     r9, r9, #1
        bne     LCPL24
        ldr     r8, [sp, #0x1C]
        ldr     r9, [sp, #0x20]
LCPL25:
        mov     r0, r8
        mov     r4, r6
        b       LCPL27
LCPL26:
        mov     r0, #0
        mov     r5, #1
LCPL27:
        cmp     r0, r8
        bgt     LCPL31
        rsb     r12, r0, r0, lsl #2
        add     r10, r11, r12, lsl #3
        mov     r11, r9
        mov     r9, r8
        mov     r8, r0
        mov     r0, r4
LCPL28:
        ldr     r2, [r10, #0x68]
        ldr     r4, [r10, #0x5C]
        ldr     r1, [r10, #0x70]
        mul     r3, r11, r2
        cmp     r4, #2
        beq     LCPL35
        cmp     r4, #3
        beq     LCPL34
        cmp     r4, #4
        beq     LCPL33
        cmp     r4, #5
        beq     LCPL32
        ldr     r12, [r10, #0x6C]
        cmp     r2, #0
        ble     LCPL30
        str     r10, [sp, #0x14]
        str     r8, [sp, #0x18]
        str     r9, [sp, #0x1C]
        str     r11, [sp, #0x20]
        str     r12, [sp, #0x10]
        mov     r8, r0
        mov     r10, r1
        mov     r11, r2
        mov     r9, r3
LCPL29:
        ldr     r12, [sp, #0x10]
        str     r7, [sp, #0xC]
        str     r10, [sp, #8]
        str     r12, [sp, #4]
        str     r9, [sp]
        mov     r3, r5
        mov     r2, r4
        mov     r1, r6
        mov     r0, r8
        bl      _ipps_cDftOutOrdInv_Fact_64fc
        subs    r11, r11, #1
        add     r9, r9, #1
        bne     LCPL29
        ldr     r10, [sp, #0x14]
        ldr     r8, [sp, #0x18]
        ldr     r9, [sp, #0x1C]
        ldr     r11, [sp, #0x20]
LCPL30:
        mul     r5, r5, r4
        add     r8, r8, #1
        cmp     r8, r9
        add     r10, r10, #0x18
        mov     r0, r6
        ble     LCPL28
LCPL31:
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LCPL32:
        str     r1, [sp, #4]
        str     r2, [sp]
        mov     r2, r5
        mov     r1, r6
        bl      _ipps_cDftOutOrdInv_Fact5_64fc
        b       LCPL30
LCPL33:
        str     r1, [sp, #4]
        str     r2, [sp]
        mov     r2, r5
        mov     r1, r6
        bl      _ipps_cDftOutOrdInv_Fact4_64fc
        b       LCPL30
LCPL34:
        str     r1, [sp, #4]
        str     r2, [sp]
        mov     r2, r5
        mov     r1, r6
        bl      _ipps_cDftOutOrdInv_Fact3_64fc
        b       LCPL30
LCPL35:
        str     r1, [sp, #4]
        str     r2, [sp]
        mov     r2, r5
        mov     r1, r6
        bl      _ipps_cDftOutOrdInv_Fact2_64fc
        b       LCPL30


