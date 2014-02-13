        .text
        .align  4
        .globl  _ipps_rDftInv_PrimeFact_64f


_ipps_rDftInv_PrimeFact_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x34
        mov     r5, r0
        ldr     r11, [r5, #0x5C]
        ldr     r7, [r5, #0x60]
        ldr     r8, [r5, #0x64]
        mov     r0, r1
        mov     r9, r2
        mul     lr, r11, r7
        mov     r4, r3
        mov     r6, #0
        cmp     lr, #0x7D, 30
        add     r10, r4, lr, lsl #3
        bgt     LCNL7
        ldr     r12, [r5, #0x54]
        cmp     r12, #0
        beq     LCNL7
        tst     r12, #1
        moveq   r8, r9
        beq     LCNL0
        cmp     r0, r9
        mov     r8, r4
        moveq   r4, r10
        addeq   r10, r10, lr, lsl #3
        movne   r4, r9
LCNL0:
        cmp     r12, #0
        blt     LCNL6
        mov     r7, r5
        str     r10, [sp, #0x30]
        str     r9, [sp, #0x10]
LCNL1:
        ldr     r10, [r7, #0x5C]
        ldr     r9, [r7, #0x60]
        ldr     r11, [r7, #0x68]
        ldr     r1, [r7, #0x70]
        cmp     r10, #3
        beq     LCNL15
        cmp     r10, #5
        beq     LCNL14
        mul     r2, r10, r9
        ldr     lr, [r7, #0x6C]
        cmp     r11, #0
        ble     LCNL3
        mov     r12, r11
        str     r11, [sp, #0x24]
        ldr     r11, [sp, #0x30]
        mov     r3, #0
        str     r7, [sp, #0x20]
        str     r8, [sp, #0x1C]
        str     r5, [sp, #0x14]
        str     r6, [sp, #0x18]
        str     lr, [sp, #0x2C]
        str     r2, [sp, #0x28]
        mov     r5, r0
        mov     r8, r1
        mov     r7, r3
        mov     r6, r12
LCNL2:
        str     r11, [sp, #8]
        str     r8, [sp, #4]
        ldr     lr, [sp, #0x2C]
        add     r1, r4, r7, lsl #3
        add     r0, r5, r7, lsl #3
        str     lr, [sp]
        mov     r3, r9
        mov     r2, r10
        bl      _ipps_rDftInv_Fact_64f
        ldr     lr, [sp, #0x28]
        subs    r6, r6, #1
        add     r7, r7, lr
        bne     LCNL2
        ldr     r5, [sp, #0x14]
        ldr     r11, [sp, #0x24]
        ldr     r7, [sp, #0x20]
        ldr     r8, [sp, #0x1C]
        ldr     r6, [sp, #0x18]
        ldr     r12, [r5, #0x54]
LCNL3:
        cmp     r6, r12
        bne     LCNL5
        rsb     lr, r12, r12, lsl #2
        ldr     r0, [r5, #0x58]
        add     r1, r5, lr, lsl #3
        ldr     r1, [r1, #0x64]
        cmp     r9, #3
        beq     LCNL13
        cmp     r9, #5
        beq     LCNL12
        mul     r2, r10, r9
        add     lr, r5, lr, lsl #3
        ldr     lr, [lr, #0x84]
        cmp     r11, #0
        ble     LCNL5
        mov     r3, #0
        str     r7, [sp, #0x20]
        str     r8, [sp, #0x1C]
        str     r5, [sp, #0x14]
        str     r6, [sp, #0x18]
        str     lr, [sp, #0x2C]
        mov     r6, r0
        mov     r5, r1
        mov     r8, r2
        mov     r7, r3
LCNL4:
        ldr     r12, [sp, #0x30]
        add     r0, r4, r7, lsl #3
        mov     r3, r9
        str     r12, [sp, #8]
        ldr     r12, [sp, #0x2C]
        str     r10, [sp]
        mov     r1, r5
        str     r12, [sp, #4]
        ldr     lr, [r6], #4
        ldr     r12, [sp, #0x10]
        add     r2, r12, lr, lsl #3
        bl      _ipps_rDftInv_Prime_64f
        subs    r11, r11, #1
        add     r7, r7, r8
        bne     LCNL4
        ldr     r5, [sp, #0x14]
        ldr     r7, [sp, #0x20]
        ldr     r8, [sp, #0x1C]
        ldr     r6, [sp, #0x18]
        ldr     r12, [r5, #0x54]
LCNL5:
        mov     r0, r4
        add     r6, r6, #1
        mov     r4, r8
        cmp     r6, r12
        add     r7, r7, #0x18
        mov     r8, r0
        ble     LCNL1
LCNL6:
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LCNL7:
        ldr     lr, [r5, #0x70]
        cmp     r11, #3
        beq     LCNL19
        cmp     r11, #5
        beq     LCNL18
        ldr     r12, [r5, #0x6C]
        str     lr, [sp, #4]
        str     r10, [sp, #8]
        str     r12, [sp]
        mov     r3, r7
        mov     r2, r11
        mov     r1, r4
        bl      _ipps_rDftInv_Fact_64f
LCNL8:
        ldr     r12, [r5, #0x54]
        cmp     r12, #0
        bne     LCNL9
        ldr     r12, [r5, #0x58]
        cmp     r7, #3
        mov     lr, #1
        beq     LCNL17
        cmp     r7, #5
        beq     LCNL16
        ldr     r5, [r5, #0x84]
        str     r10, [sp, #8]
        str     r11, [sp]
        str     r5, [sp, #4]
        mov     r3, r7
        mov     r2, r9
        mov     r1, r8
        mov     r0, r4
        bl      _ipps_rDftInv_Prime_64f
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LCNL9:
        cmp     r11, #0
        ble     LCNL11
        mov     r0, r6
        str     r9, [sp, #0x10]
        mov     r1, r0
        str     r5, [sp, #0x14]
        mov     r9, r6
        mov     r6, r0
        mov     r5, r1
LCNL10:
        str     r10, [sp]
        ldr     r12, [sp, #0x10]
        ldr     r0, [sp, #0x14]
        add     r1, r4, r9, lsl #3
        add     r2, r12, r5, lsl #3
        mov     r3, #1
        bl      LCNL_rDftInv_StepPrimeFact
        add     r6, r6, #1
        cmp     r6, r11
        add     r5, r5, r8
        add     r9, r9, r7
        blt     LCNL10
LCNL11:
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LCNL12:
        str     r0, [sp, #4]
        str     r11, [sp]
        ldr     r2, [sp, #0x10]
        mov     r3, r10
        mov     r0, r4
        bl      _ipps_rDftInv_Prime5_64f
        ldr     r12, [r5, #0x54]
        b       LCNL5
LCNL13:
        str     r0, [sp, #4]
        str     r11, [sp]
        ldr     r2, [sp, #0x10]
        mov     r3, r10
        mov     r0, r4
        bl      _ipps_rDftInv_Prime3_64f
        ldr     r12, [r5, #0x54]
        b       LCNL5
LCNL14:
        str     r1, [sp]
        mov     r3, r11
        mov     r2, r9
        mov     r1, r4
        bl      _ipps_rDftInv_Fact5_64f
        ldr     r12, [r5, #0x54]
        b       LCNL3
LCNL15:
        str     r1, [sp]
        mov     r3, r11
        mov     r2, r9
        mov     r1, r4
        bl      _ipps_rDftInv_Fact3_64f
        ldr     r12, [r5, #0x54]
        b       LCNL3
LCNL16:
        str     r12, [sp, #4]
        str     lr, [sp]
        mov     r3, r11
        mov     r2, r9
        mov     r1, r8
        mov     r0, r4
        bl      _ipps_rDftInv_Prime5_64f
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LCNL17:
        str     r12, [sp, #4]
        str     lr, [sp]
        mov     r3, r11
        mov     r2, r9
        mov     r1, r8
        mov     r0, r4
        bl      _ipps_rDftInv_Prime3_64f
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LCNL18:
        str     lr, [sp]
        mov     r3, #1
        mov     r2, r7
        mov     r1, r4
        bl      _ipps_rDftInv_Fact5_64f
        b       LCNL8
LCNL19:
        str     lr, [sp]
        mov     r3, #1
        mov     r2, r7
        mov     r1, r4
        bl      _ipps_rDftInv_Fact3_64f
        b       LCNL8
LCNL_rDftInv_StepPrimeFact:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x38
        mov     r7, r3
        mov     r8, r0
        ldr     r4, [sp, #0x5C]
        rsb     r11, r7, r7, lsl #2
        mov     r0, r1
        mov     r5, r2
        add     r12, r8, r11, lsl #3
        ldr     r10, [r12, #0x5C]
        ldr     r9, [r12, #0x60]
        ldr     r12, [r12, #0x64]
        str     r12, [sp, #0x1C]
        mul     r12, r10, r9
        cmp     r12, #0x7D, 30
        add     r6, r4, r12, lsl #3
        bgt     LCNL26
        ldr     r12, [r8, #0x54]
        cmp     r7, r12
        beq     LCNL26
        cmp     r7, r12
        mov     r10, r0
        bgt     LCNL25
        rsb     lr, r7, r7, lsl #2
        str     r6, [sp, #0x34]
        add     r9, r8, lr, lsl #3
        str     r5, [sp, #0x14]
LCNL20:
        ldr     r6, [r9, #0x5C]
        ldr     r5, [r9, #0x60]
        ldr     r11, [r9, #0x68]
        ldr     r1, [r9, #0x70]
        cmp     r6, #3
        beq     LCNL34
        cmp     r6, #5
        beq     LCNL33
        mul     r2, r6, r5
        ldr     lr, [r9, #0x6C]
        cmp     r11, #0
        ble     LCNL22
        mov     r12, r11
        str     r11, [sp, #0x28]
        ldr     r11, [sp, #0x34]
        mov     r3, #0
        str     r9, [sp, #0x24]
        str     r10, [sp, #0x1C]
        str     r7, [sp, #0x20]
        str     r8, [sp, #0x18]
        str     lr, [sp, #0x30]
        str     r2, [sp, #0x2C]
        mov     r7, r0
        mov     r10, r1
        mov     r9, r3
        mov     r8, r12
LCNL21:
        str     r11, [sp, #8]
        str     r10, [sp, #4]
        ldr     lr, [sp, #0x30]
        add     r1, r4, r9, lsl #3
        add     r0, r7, r9, lsl #3
        str     lr, [sp]
        mov     r3, r5
        mov     r2, r6
        bl      _ipps_rDftInv_Fact_64f
        ldr     lr, [sp, #0x2C]
        subs    r8, r8, #1
        add     r9, r9, lr
        bne     LCNL21
        ldr     r8, [sp, #0x18]
        ldr     r11, [sp, #0x28]
        ldr     r9, [sp, #0x24]
        ldr     r10, [sp, #0x1C]
        ldr     r7, [sp, #0x20]
        ldr     r12, [r8, #0x54]
LCNL22:
        cmp     r7, r12
        bne     LCNL24
        rsb     lr, r12, r12, lsl #2
        ldr     r0, [r8, #0x58]
        add     r1, r8, lr, lsl #3
        ldr     r1, [r1, #0x64]
        cmp     r5, #3
        beq     LCNL32
        cmp     r5, #5
        beq     LCNL31
        mul     r2, r6, r5
        add     lr, r8, lr, lsl #3
        ldr     lr, [lr, #0x84]
        cmp     r11, #0
        ble     LCNL24
        str     r7, [sp, #0x20]
        mov     r3, #0
        str     r9, [sp, #0x24]
        str     r10, [sp, #0x1C]
        str     r8, [sp, #0x18]
        mov     r7, r6
        str     lr, [sp, #0x30]
        mov     r8, r0
        mov     r6, r1
        mov     r10, r2
        mov     r9, r3
LCNL23:
        ldr     r12, [sp, #0x34]
        add     r0, r4, r9, lsl #3
        mov     r3, r5
        str     r12, [sp, #8]
        ldr     r12, [sp, #0x30]
        str     r7, [sp]
        mov     r1, r6
        str     r12, [sp, #4]
        ldr     lr, [r8], #4
        ldr     r12, [sp, #0x14]
        add     r2, r12, lr, lsl #3
        bl      _ipps_rDftInv_Prime_64f
        subs    r11, r11, #1
        add     r9, r9, r10
        bne     LCNL23
        ldr     r8, [sp, #0x18]
        ldr     r9, [sp, #0x24]
        ldr     r10, [sp, #0x1C]
        ldr     r7, [sp, #0x20]
        ldr     r12, [r8, #0x54]
LCNL24:
        mov     r0, r4
        add     r7, r7, #1
        mov     r4, r10
        cmp     r7, r12
        add     r9, r9, #0x18
        mov     r10, r0
        ble     LCNL20
LCNL25:
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCNL26:
        add     r12, r8, r11, lsl #3
        ldr     r12, [r12, #0x70]
        cmp     r10, #3
        beq     LCNL38
        cmp     r10, #5
        beq     LCNL37
        add     lr, r8, r11, lsl #3
        ldr     lr, [lr, #0x6C]
        str     r12, [sp, #4]
        str     r6, [sp, #8]
        str     lr, [sp]
        mov     r3, r9
        mov     r2, r10
        mov     r1, r4
        bl      _ipps_rDftInv_Fact_64f
LCNL27:
        ldr     r12, [r8, #0x54]
        cmp     r7, r12
        bne     LCNL28
        ldr     r12, [r8, #0x58]
        cmp     r9, #3
        mov     lr, #1
        beq     LCNL36
        cmp     r9, #5
        beq     LCNL35
        add     r11, r8, r11, lsl #3
        ldr     r12, [r11, #0x84]
        str     r6, [sp, #8]
        str     r10, [sp]
        str     r12, [sp, #4]
        ldr     r1, [sp, #0x1C]
        mov     r3, r9
        mov     r2, r5
        mov     r0, r4
        bl      _ipps_rDftInv_Prime_64f
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCNL28:
        cmp     r10, #0
        ble     LCNL30
        str     r8, [sp, #0x18]
        ldr     r8, [sp, #0x1C]
        mov     r0, #0
        add     r3, r7, #1
        mov     r11, r0
        str     r4, [sp, #0x10]
        str     r5, [sp, #0x14]
        mov     r7, r11
        mov     r5, r0
        mov     r4, r3
LCNL29:
        str     r6, [sp]
        ldr     r1, [sp, #0x14]
        ldr     r0, [sp, #0x18]
        mov     r3, r4
        add     r2, r1, r7, lsl #3
        ldr     r1, [sp, #0x10]
        add     r1, r1, r5, lsl #3
        bl      LCNL_rDftInv_StepPrimeFact
        add     r11, r11, #1
        cmp     r11, r10
        add     r7, r7, r8
        add     r5, r5, r9
        blt     LCNL29
LCNL30:
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCNL31:
        str     r0, [sp, #4]
        str     r11, [sp]
        ldr     r2, [sp, #0x14]
        mov     r3, r6
        mov     r0, r4
        bl      _ipps_rDftInv_Prime5_64f
        ldr     r12, [r8, #0x54]
        b       LCNL24
LCNL32:
        str     r0, [sp, #4]
        str     r11, [sp]
        ldr     r2, [sp, #0x14]
        mov     r3, r6
        mov     r0, r4
        bl      _ipps_rDftInv_Prime3_64f
        ldr     r12, [r8, #0x54]
        b       LCNL24
LCNL33:
        str     r1, [sp]
        mov     r3, r11
        mov     r2, r5
        mov     r1, r4
        bl      _ipps_rDftInv_Fact5_64f
        ldr     r12, [r8, #0x54]
        b       LCNL22
LCNL34:
        str     r1, [sp]
        mov     r3, r11
        mov     r2, r5
        mov     r1, r4
        bl      _ipps_rDftInv_Fact3_64f
        ldr     r12, [r8, #0x54]
        b       LCNL22
LCNL35:
        str     r12, [sp, #4]
        str     lr, [sp]
        ldr     r1, [sp, #0x1C]
        mov     r3, r10
        mov     r2, r5
        mov     r0, r4
        bl      _ipps_rDftInv_Prime5_64f
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCNL36:
        str     r12, [sp, #4]
        str     lr, [sp]
        ldr     r1, [sp, #0x1C]
        mov     r3, r10
        mov     r2, r5
        mov     r0, r4
        bl      _ipps_rDftInv_Prime3_64f
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCNL37:
        str     r12, [sp]
        mov     r3, #1
        mov     r2, r9
        mov     r1, r4
        bl      _ipps_rDftInv_Fact5_64f
        b       LCNL27
LCNL38:
        str     r12, [sp]
        mov     r3, #1
        mov     r2, r9
        mov     r1, r4
        bl      _ipps_rDftInv_Fact3_64f
        b       LCNL27


