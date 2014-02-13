        .text
        .align  4
        .globl  _ipps_cDftInv_OutOrd_32fc


_ipps_cDftInv_OutOrd_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x40
        mov     r9, r0
        ldr     r12, [r9, #0x58]
        ldr     lr, [r9, #0x5C]
        ldr     r11, [r9, #0x50]
        str     r1, [sp, #0x30]
        mul     r6, r12, lr
        rsb     r12, r11, r11, lsl #2
        mov     r4, r2
        add     r12, r9, r12, lsl #3
        ldr     r5, [r12, #0x5C]
        mov     r0, r6
        mov     r8, r3
        mov     r7, #0
        mov     r1, r5
        bl      __intel_idiv
        cmp     r6, #0x7D, 28
        mov     r10, r11
        mov     r2, r0
        ble     LCLA9
        cmp     r11, #1
        ble     LCLA9
        cmp     r5, #0
        ble     LCLA13
        rsb     r12, r11, r11, lsl #2
        str     r8, [sp, #0x28]
        add     r0, r9, r12, lsl #3
        mov     r6, r11
        str     r10, [sp, #0x1C]
        str     r9, [sp, #0x20]
        mov     r11, r0
        mov     r8, r2
LCLA0:
        ldr     r10, [r11, #0x58]
        ldr     r9, [sp, #0x30]
        mov     r0, r8
        mov     r1, r10
        bl      __intel_idiv
        cmp     r8, #0x7D, 28
        ble     LCLA3
        cmp     r6, #1
        ble     LCLA3
        mul     r1, r7, r10
        cmp     r10, #0
        ble     LCLA2
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
LCLA1:
        str     r11, [sp, #8]
        str     r9, [sp, #4]
        str     r6, [sp]
        mov     r3, r5
        mov     r2, r4
        mov     r1, r7
        mov     r0, r8
        bl      LCLA_cDftInv_OutOrd_Step
        subs    r10, r10, #1
        add     r6, r6, #1
        bne     LCLA1
        mov     r0, r5
        ldr     r5, [sp, #0x14]
        ldr     r8, [sp, #0x34]
        ldr     r11, [sp, #0x38]
        ldr     r6, [sp, #0x3C]
        ldr     r7, [sp, #0x24]
LCLA2:
        mov     r1, r6
        mov     r9, r4
        b       LCLA4
LCLA3:
        mov     r1, #0
        mov     r0, #1
LCLA4:
        cmp     r1, r6
        bgt     LCLA8
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
LCLA5:
        ldr     r2, [r10, #0x64]
        ldr     r9, [r10, #0x58]
        ldr     r1, [r10, #0x6C]
        mul     r3, r7, r2
        cmp     r9, #2
        beq     LCLA17
        cmp     r9, #3
        beq     LCLA16
        cmp     r9, #4
        beq     LCLA15
        cmp     r9, #5
        beq     LCLA14
        ldr     r12, [r10, #0x68]
        cmp     r2, #0
        ble     LCLA7
        str     r10, [sp, #0x18]
        str     r8, [sp, #0x10]
        str     r6, [sp, #0x3C]
        str     r7, [sp, #0x24]
        str     r12, [sp, #0x2C]
        mov     r6, r0
        mov     r10, r1
        mov     r8, r2
        mov     r7, r3
LCLA6:
        str     r11, [sp, #0xC]
        str     r10, [sp, #8]
        ldr     r12, [sp, #0x2C]
        str     r7, [sp]
        mov     r3, r5
        str     r12, [sp, #4]
        mov     r2, r9
        mov     r1, r4
        mov     r0, r6
        bl      _ipps_cDftOutOrdInv_Fact_32fc
        subs    r8, r8, #1
        add     r7, r7, #1
        bne     LCLA6
        ldr     r10, [sp, #0x18]
        ldr     r8, [sp, #0x10]
        ldr     r6, [sp, #0x3C]
        ldr     r7, [sp, #0x24]
LCLA7:
        mul     r5, r5, r9
        add     r8, r8, #1
        cmp     r8, r6
        add     r10, r10, #0x18
        mov     r0, r4
        ble     LCLA5
        ldr     r5, [sp, #0x14]
        ldr     r8, [sp, #0x34]
        ldr     r11, [sp, #0x38]
LCLA8:
        add     r7, r7, #1
        cmp     r7, r5
        blt     LCLA0
        mov     r2, r8
        ldr     r10, [sp, #0x1C]
        ldr     r8, [sp, #0x28]
        ldr     r9, [sp, #0x20]
        b       LCLA13
LCLA9:
        cmp     r11, #0
        mov     r2, #1
        blt     LCLA13
        mov     r0, r9
        ldr     r5, [sp, #0x30]
        str     r10, [sp, #0x1C]
        str     r8, [sp, #0x28]
        str     r9, [sp, #0x20]
        mov     r10, r0
        mov     r8, r2
        mov     r9, r7
LCLA10:
        ldr     r12, [r10, #0x5C]
        ldr     r7, [r10, #0x58]
        mov     r0, r6
        str     r12, [sp, #0x14]
        ldr     r12, [r10, #0x6C]
        mov     r1, r7
        str     r12, [sp, #0x2C]
        bl      __intel_idiv
        cmp     r7, #2
        mov     r6, r0
        beq     LCLA23
        cmp     r7, #3
        beq     LCLA22
        cmp     r7, #4
        beq     LCLA21
        cmp     r7, #5
        beq     LCLA20
        ldr     r12, [r10, #0x68]
        cmp     r6, #0
        ble     LCLA12
        str     r10, [sp, #0x18]
        str     r9, [sp, #0x24]
        ldr     r9, [sp, #0x2C]
        ldr     r10, [sp, #0x28]
        mov     r11, #0
        str     r12, [sp, #0x10]
LCLA11:
        str     r10, [sp, #0xC]
        str     r9, [sp, #8]
        ldr     r12, [sp, #0x10]
        str     r11, [sp]
        mov     r3, r8
        str     r12, [sp, #4]
        mov     r2, r7
        mov     r1, r4
        mov     r0, r5
        bl      _ipps_cDftOutOrdInv_Fact_32fc
        add     r11, r11, #1
        cmp     r11, r6
        blt     LCLA11
        ldr     r12, [sp, #0x20]
        ldr     r10, [sp, #0x18]
        ldr     r9, [sp, #0x24]
        ldr     r11, [r12, #0x50]
LCLA12:
        mul     r8, r7, r8
        add     r9, r9, #1
        cmp     r9, r11
        add     r10, r10, #0x18
        mov     r5, r4
        ble     LCLA10
        mov     r2, r8
        ldr     r5, [sp, #0x14]
        ldr     r10, [sp, #0x1C]
        ldr     r8, [sp, #0x28]
        ldr     r9, [sp, #0x20]
LCLA13:
        cmp     r5, #3
        beq     LCLA19
        cmp     r5, #5
        beq     LCLA18
        rsb     r10, r10, r10, lsl #2
        mov     r3, r2
        add     r10, r9, r10, lsl #3
        ldr     r12, [r10, #0x80]
        str     r8, [sp, #4]
        mov     r2, r5
        str     r12, [sp]
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftOutOrdInv_Prime_32fc
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LCLA14:
        str     r1, [sp, #4]
        str     r2, [sp]
        mov     r2, r5
        mov     r1, r4
        bl      _ipps_cDftOutOrdInv_Fact5_32fc
        b       LCLA7
LCLA15:
        str     r1, [sp, #4]
        str     r2, [sp]
        mov     r2, r5
        mov     r1, r4
        bl      _ipps_cDftOutOrdInv_Fact4_32fc
        b       LCLA7
LCLA16:
        str     r1, [sp, #4]
        str     r2, [sp]
        mov     r2, r5
        mov     r1, r4
        bl      _ipps_cDftOutOrdInv_Fact3_32fc
        b       LCLA7
LCLA17:
        str     r1, [sp, #4]
        str     r2, [sp]
        mov     r2, r5
        mov     r1, r4
        bl      _ipps_cDftOutOrdInv_Fact2_32fc
        b       LCLA7
LCLA18:
        mov     r1, r4
        mov     r0, r4
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, lr}
        b       _ipps_cDftOutOrdInv_Prime5_32fc
LCLA19:
        mov     r1, r4
        mov     r0, r4
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, lr}
        b       _ipps_cDftOutOrdInv_Prime3_32fc
LCLA20:
        ldr     r12, [sp, #0x2C]
        str     r6, [sp]
        mov     r0, r5
        str     r12, [sp, #4]
        mov     r3, #0
        mov     r2, r8
        mov     r1, r4
        bl      _ipps_cDftOutOrdInv_Fact5_32fc
        ldr     r12, [sp, #0x20]
        ldr     r11, [r12, #0x50]
        b       LCLA12
LCLA21:
        ldr     r12, [sp, #0x2C]
        str     r6, [sp]
        mov     r0, r5
        str     r12, [sp, #4]
        mov     r3, #0
        mov     r2, r8
        mov     r1, r4
        bl      _ipps_cDftOutOrdInv_Fact4_32fc
        ldr     r12, [sp, #0x20]
        ldr     r11, [r12, #0x50]
        b       LCLA12
LCLA22:
        ldr     r12, [sp, #0x2C]
        str     r6, [sp]
        mov     r0, r5
        str     r12, [sp, #4]
        mov     r3, #0
        mov     r2, r8
        mov     r1, r4
        bl      _ipps_cDftOutOrdInv_Fact3_32fc
        ldr     r12, [sp, #0x20]
        ldr     r11, [r12, #0x50]
        b       LCLA12
LCLA23:
        ldr     r12, [sp, #0x2C]
        str     r6, [sp]
        mov     r0, r5
        str     r12, [sp, #4]
        mov     r3, #0
        mov     r2, r8
        mov     r1, r4
        bl      _ipps_cDftOutOrdInv_Fact2_32fc
        ldr     r12, [sp, #0x20]
        ldr     r11, [r12, #0x50]
        b       LCLA12
LCLA_cDftInv_OutOrd_Step:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x24
        ldr     r8, [sp, #0x4C]
        ldr     r9, [sp, #0x48]
        ldr     r7, [sp, #0x50]
        rsb     r12, r8, r8, lsl #2
        mov     r11, r0
        mov     r4, r1
        add     r12, r11, r12, lsl #3
        ldr     r10, [r12, #0x58]
        mov     r5, r3
        mov     r0, r5
        mov     r6, r2
        mov     r1, r10
        bl      __intel_idiv
        cmp     r5, #0x7D, 28
        mov     r5, r0
        ble     LCLA26
        cmp     r8, #1
        ble     LCLA26
        mul     r1, r9, r10
        cmp     r10, #0
        ble     LCLA25
        sub     r0, r8, #1
        str     r8, [sp, #0x1C]
        str     r9, [sp, #0x20]
        mov     r8, r0
        mov     r9, r1
LCLA24:
        str     r8, [sp, #4]
        str     r7, [sp, #8]
        str     r9, [sp]
        mov     r3, r5
        mov     r2, r6
        mov     r1, r4
        mov     r0, r11
        bl      LCLA_cDftInv_OutOrd_Step
        subs    r10, r10, #1
        add     r9, r9, #1
        bne     LCLA24
        ldr     r8, [sp, #0x1C]
        ldr     r9, [sp, #0x20]
LCLA25:
        mov     r0, r8
        mov     r4, r6
        b       LCLA27
LCLA26:
        mov     r0, #0
        mov     r5, #1
LCLA27:
        cmp     r0, r8
        bgt     LCLA31
        rsb     r12, r0, r0, lsl #2
        add     r10, r11, r12, lsl #3
        mov     r11, r9
        mov     r9, r8
        mov     r8, r0
        mov     r0, r4
LCLA28:
        ldr     r2, [r10, #0x64]
        ldr     r4, [r10, #0x58]
        ldr     r1, [r10, #0x6C]
        mul     r3, r11, r2
        cmp     r4, #2
        beq     LCLA35
        cmp     r4, #3
        beq     LCLA34
        cmp     r4, #4
        beq     LCLA33
        cmp     r4, #5
        beq     LCLA32
        ldr     r12, [r10, #0x68]
        cmp     r2, #0
        ble     LCLA30
        str     r10, [sp, #0x14]
        str     r8, [sp, #0x18]
        str     r9, [sp, #0x1C]
        str     r11, [sp, #0x20]
        str     r12, [sp, #0x10]
        mov     r8, r0
        mov     r10, r1
        mov     r11, r2
        mov     r9, r3
LCLA29:
        ldr     r12, [sp, #0x10]
        str     r7, [sp, #0xC]
        str     r10, [sp, #8]
        str     r12, [sp, #4]
        str     r9, [sp]
        mov     r3, r5
        mov     r2, r4
        mov     r1, r6
        mov     r0, r8
        bl      _ipps_cDftOutOrdInv_Fact_32fc
        subs    r11, r11, #1
        add     r9, r9, #1
        bne     LCLA29
        ldr     r10, [sp, #0x14]
        ldr     r8, [sp, #0x18]
        ldr     r9, [sp, #0x1C]
        ldr     r11, [sp, #0x20]
LCLA30:
        mul     r5, r5, r4
        add     r8, r8, #1
        cmp     r8, r9
        add     r10, r10, #0x18
        mov     r0, r6
        ble     LCLA28
LCLA31:
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LCLA32:
        str     r1, [sp, #4]
        str     r2, [sp]
        mov     r2, r5
        mov     r1, r6
        bl      _ipps_cDftOutOrdInv_Fact5_32fc
        b       LCLA30
LCLA33:
        str     r1, [sp, #4]
        str     r2, [sp]
        mov     r2, r5
        mov     r1, r6
        bl      _ipps_cDftOutOrdInv_Fact4_32fc
        b       LCLA30
LCLA34:
        str     r1, [sp, #4]
        str     r2, [sp]
        mov     r2, r5
        mov     r1, r6
        bl      _ipps_cDftOutOrdInv_Fact3_32fc
        b       LCLA30
LCLA35:
        str     r1, [sp, #4]
        str     r2, [sp]
        mov     r2, r5
        mov     r1, r6
        bl      _ipps_cDftOutOrdInv_Fact2_32fc
        b       LCLA30


