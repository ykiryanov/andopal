        .text
        .align  4
        .globl  _ipps_cDftFwd_OutOrd_32fc


_ipps_cDftFwd_OutOrd_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x38
        mov     r7, r0
        ldr     r12, [r7, #0x5C]
        ldr     lr, [r7, #0x58]
        ldr     r9, [r7, #0x50]
        str     r1, [sp, #0x10]
        mul     r10, lr, r12
        rsb     r11, r9, r9, lsl #2
        mov     r4, r2
        add     r12, r7, r11, lsl #3
        ldr     r8, [r12, #0x5C]
        mov     r0, r10
        mov     r6, r3
        mov     r1, r8
        bl      __intel_idiv
        cmp     r8, #3
        mov     r5, r0
        beq     LCLK25
        cmp     r8, #5
        beq     LCLK24
        add     r11, r7, r11, lsl #3
        ldr     r12, [r11, #0x80]
        str     r6, [sp, #4]
        ldr     r0, [sp, #0x10]
        str     r12, [sp]
        mov     r3, r5
        mov     r2, r8
        mov     r1, r4
        bl      _ipps_cDftOutOrdFwd_Prime_32fc
LCLK0:
        cmp     r10, #0x7D, 28
        ble     LCLK11
        cmp     r9, #1
        ble     LCLK11
        cmp     r8, #0
        ble     LCLK15
        sub     lr, r9, #1
        mov     r12, #0
        str     lr, [sp, #0x1C]
        str     r6, [sp, #0x34]
        mov     r0, r9
LCLK1:
        cmp     r5, #0x7D, 28
        mov     r6, r5
        ble     LCLK3
        cmp     r0, #1
        ble     LCLK2
        cmp     r0, r0
        mov     lr, r0
        movlt   r9, #0
        bge     LCLK4
        b       LCLK8
LCLK2:
        cmp     r0, #0
        movlt   r9, #0
        movge   lr, #0
        bge     LCLK4
        b       LCLK8
LCLK3:
        cmp     r0, #0
        movlt   r9, #0
        movge   lr, #0
        blt     LCLK8
LCLK4:
        mov     r11, r0
        str     lr, [sp, #0x18]
        rsb     r10, r11, r11, lsl #2
        str     r12, [sp, #0x20]
        add     r10, r7, r10, lsl #3
        str     r5, [sp, #0x24]
        str     r8, [sp, #0x28]
        str     r0, [sp, #0x2C]
        str     r7, [sp, #0x30]
LCLK5:
        ldr     r9, [r10, #0x58]
        ldr     r12, [sp, #0x20]
        ldr     r7, [r10, #0x64]
        ldr     r8, [r10, #0x6C]
        mov     r0, r6
        mul     r5, r12, r7
        mov     r1, r9
        bl      __intel_idiv
        cmp     r9, #2
        mov     r6, r0
        beq     LCLK19
        cmp     r9, #3
        beq     LCLK18
        cmp     r9, #4
        beq     LCLK17
        cmp     r9, #5
        beq     LCLK16
        ldr     r0, [r10, #0x68]
        cmp     r7, #0
        ble     LCLK7
        str     r11, [sp, #0x10]
        ldr     r11, [sp, #0x34]
        str     r10, [sp, #0x14]
        mov     r10, r0
LCLK6:
        str     r11, [sp, #0xC]
        str     r8, [sp, #8]
        str     r10, [sp, #4]
        str     r5, [sp]
        mov     r3, r6
        mov     r2, r9
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftOutOrdFwd_Fact_32fc
        subs    r7, r7, #1
        add     r5, r5, #1
        bne     LCLK6
        ldr     r10, [sp, #0x14]
        ldr     r11, [sp, #0x10]
LCLK7:
        ldr     r12, [sp, #0x18]
        sub     r11, r11, #1
        sub     r10, r10, #0x18
        cmp     r11, r12
        bge     LCLK5
        ldr     r12, [sp, #0x20]
        ldr     r5, [sp, #0x24]
        ldr     r8, [sp, #0x28]
        ldr     r0, [sp, #0x2C]
        ldr     r7, [sp, #0x30]
LCLK8:
        cmp     r5, #0x7D, 28
        ble     LCLK10
        cmp     r0, #1
        ble     LCLK10
        mul     r11, r12, r9
        cmp     r9, #0
        ble     LCLK10
        str     r5, [sp, #0x24]
        str     r8, [sp, #0x28]
        ldr     r5, [sp, #0x1C]
        ldr     r8, [sp, #0x34]
        mov     r10, #0
        str     r12, [sp, #0x20]
        str     r0, [sp, #0x2C]
LCLK9:
        str     r5, [sp, #4]
        str     r8, [sp, #8]
        str     r11, [sp]
        mov     r3, r6
        mov     r2, r4
        mov     r1, r4
        mov     r0, r7
        bl      LCLK_cDftFwd_OutOrd_Step
        add     r10, r10, #1
        cmp     r10, r9
        add     r11, r11, #1
        blt     LCLK9
        ldr     r12, [sp, #0x20]
        ldr     r5, [sp, #0x24]
        ldr     r8, [sp, #0x28]
        ldr     r0, [sp, #0x2C]
LCLK10:
        add     r12, r12, #1
        cmp     r12, r8
        blt     LCLK1
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCLK11:
        ldr     r9, [r7, #0x50]
        cmp     r9, #0
        blt     LCLK15
        rsb     r12, r9, r9, lsl #2
        add     r11, r7, r12, lsl #3
LCLK12:
        ldr     r7, [r11, #0x58]
        ldr     r10, [r11, #0x6C]
        mov     r0, r5
        mov     r1, r7
        bl      __intel_idiv
        cmp     r7, #2
        mov     r5, r0
        beq     LCLK23
        cmp     r7, #3
        beq     LCLK22
        cmp     r7, #4
        beq     LCLK21
        cmp     r7, #5
        beq     LCLK20
        ldr     r1, [r11, #0x68]
        cmp     r8, #0
        ble     LCLK14
        str     r11, [sp, #0x14]
        mov     r0, #0
        str     r9, [sp, #0x10]
        mov     r11, r10
        mov     r9, r0
        mov     r10, r1
LCLK13:
        str     r10, [sp, #4]
        str     r6, [sp, #0xC]
        str     r11, [sp, #8]
        str     r9, [sp]
        mov     r3, r5
        mov     r2, r7
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftOutOrdFwd_Fact_32fc
        add     r9, r9, #1
        cmp     r9, r8
        blt     LCLK13
        ldr     r11, [sp, #0x14]
        ldr     r9, [sp, #0x10]
LCLK14:
        mul     r8, r7, r8
        subs    r9, r9, #1
        sub     r11, r11, #0x18
        bpl     LCLK12
LCLK15:
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCLK16:
        str     r8, [sp, #4]
        str     r7, [sp]
        mov     r3, r5
        mov     r2, r6
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftOutOrdFwd_Fact5_32fc
        b       LCLK7
LCLK17:
        str     r8, [sp, #4]
        str     r7, [sp]
        mov     r3, r5
        mov     r2, r6
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftOutOrdFwd_Fact4_32fc
        b       LCLK7
LCLK18:
        str     r8, [sp, #4]
        str     r7, [sp]
        mov     r3, r5
        mov     r2, r6
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftOutOrdFwd_Fact3_32fc
        b       LCLK7
LCLK19:
        str     r8, [sp, #4]
        str     r7, [sp]
        mov     r3, r5
        mov     r2, r6
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftOutOrdFwd_Fact2_32fc
        b       LCLK7
LCLK20:
        str     r10, [sp, #4]
        str     r8, [sp]
        mov     r3, #0
        mov     r2, r5
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftOutOrdFwd_Fact5_32fc
        b       LCLK14
LCLK21:
        str     r10, [sp, #4]
        str     r8, [sp]
        mov     r3, #0
        mov     r2, r5
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftOutOrdFwd_Fact4_32fc
        b       LCLK14
LCLK22:
        str     r10, [sp, #4]
        str     r8, [sp]
        mov     r3, #0
        mov     r2, r5
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftOutOrdFwd_Fact3_32fc
        b       LCLK14
LCLK23:
        str     r10, [sp, #4]
        str     r8, [sp]
        mov     r3, #0
        mov     r2, r5
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftOutOrdFwd_Fact2_32fc
        b       LCLK14
LCLK24:
        ldr     r0, [sp, #0x10]
        mov     r2, r5
        mov     r1, r4
        bl      _ipps_cDftOutOrdFwd_Prime5_32fc
        b       LCLK0
LCLK25:
        ldr     r0, [sp, #0x10]
        mov     r2, r5
        mov     r1, r4
        bl      _ipps_cDftOutOrdFwd_Prime3_32fc
        b       LCLK0
LCLK_cDftFwd_OutOrd_Step:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x30
        ldr     lr, [sp, #0x54]
        ldr     r12, [sp, #0x58]
        ldr     r9, [sp, #0x5C]
        mov     r5, r3
        mov     r6, r0
        cmp     r5, #0x7D, 28
        mov     r4, r1
        mov     r7, #0
        mov     r0, r5
        movle   r11, r7
        ble     LCLK26
        cmp     r12, #1
        movle   r11, r7
        movgt   r11, r12
LCLK26:
        cmp     r12, r11
        mov     r10, r12
        blt     LCLK30
        rsb     r7, r10, r10, lsl #2
        str     r11, [sp, #0x18]
        add     r8, r6, r7, lsl #3
        str     r0, [sp, #0x1C]
        str     r9, [sp, #0x2C]
        str     r12, [sp, #0x20]
        str     lr, [sp, #0x24]
        str     r6, [sp, #0x28]
LCLK27:
        ldr     r7, [r8, #0x58]
        ldr     r12, [sp, #0x24]
        ldr     r9, [r8, #0x64]
        ldr     r11, [r8, #0x6C]
        mov     r0, r5
        mul     r6, r12, r9
        mov     r1, r7
        bl      __intel_idiv
        cmp     r7, #2
        mov     r5, r0
        beq     LCLK36
        cmp     r7, #3
        beq     LCLK35
        cmp     r7, #4
        beq     LCLK34
        cmp     r7, #5
        beq     LCLK33
        ldr     r0, [r8, #0x68]
        cmp     r9, #0
        ble     LCLK29
        str     r10, [sp, #0x14]
        ldr     r10, [sp, #0x2C]
        str     r8, [sp, #0x10]
        mov     r8, r0
LCLK28:
        str     r10, [sp, #0xC]
        str     r11, [sp, #8]
        str     r8, [sp, #4]
        str     r6, [sp]
        mov     r3, r5
        mov     r2, r7
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftOutOrdFwd_Fact_32fc
        subs    r9, r9, #1
        add     r6, r6, #1
        bne     LCLK28
        ldr     r8, [sp, #0x10]
        ldr     r10, [sp, #0x14]
LCLK29:
        ldr     r12, [sp, #0x18]
        sub     r10, r10, #1
        sub     r8, r8, #0x18
        cmp     r10, r12
        bge     LCLK27
        ldr     r0, [sp, #0x1C]
        ldr     r9, [sp, #0x2C]
        ldr     r12, [sp, #0x20]
        ldr     lr, [sp, #0x24]
        ldr     r6, [sp, #0x28]
LCLK30:
        cmp     r0, #0x7D, 28
        ble     LCLK32
        cmp     r12, #1
        ble     LCLK32
        mul     r8, lr, r7
        cmp     r7, #0
        ble     LCLK32
        sub     r10, r12, #1
        mov     r11, #0
LCLK31:
        str     r10, [sp, #4]
        str     r9, [sp, #8]
        str     r8, [sp]
        mov     r3, r5
        mov     r2, r4
        mov     r1, r4
        mov     r0, r6
        bl      LCLK_cDftFwd_OutOrd_Step
        add     r11, r11, #1
        cmp     r11, r7
        add     r8, r8, #1
        blt     LCLK31
LCLK32:
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LCLK33:
        str     r11, [sp, #4]
        str     r9, [sp]
        mov     r3, r6
        mov     r2, r5
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftOutOrdFwd_Fact5_32fc
        b       LCLK29
LCLK34:
        str     r11, [sp, #4]
        str     r9, [sp]
        mov     r3, r6
        mov     r2, r5
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftOutOrdFwd_Fact4_32fc
        b       LCLK29
LCLK35:
        str     r11, [sp, #4]
        str     r9, [sp]
        mov     r3, r6
        mov     r2, r5
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftOutOrdFwd_Fact3_32fc
        b       LCLK29
LCLK36:
        str     r11, [sp, #4]
        str     r9, [sp]
        mov     r3, r6
        mov     r2, r5
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftOutOrdFwd_Fact2_32fc
        b       LCLK29


