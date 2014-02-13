        .text
        .align  4
        .globl  _ipps_cDftFwd_OutOrd_64fc


_ipps_cDftFwd_OutOrd_64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x38
        mov     r7, r0
        ldr     r12, [r7, #0x60]
        ldr     lr, [r7, #0x5C]
        ldr     r9, [r7, #0x54]
        str     r1, [sp, #0x10]
        mul     r10, lr, r12
        rsb     r11, r9, r9, lsl #2
        mov     r4, r2
        add     r12, r7, r11, lsl #3
        ldr     r8, [r12, #0x60]
        mov     r0, r10
        mov     r6, r3
        mov     r1, r8
        bl      __intel_idiv
        cmp     r8, #3
        mov     r5, r0
        beq     LCPV25
        cmp     r8, #5
        beq     LCPV24
        add     r11, r7, r11, lsl #3
        ldr     r12, [r11, #0x84]
        str     r6, [sp, #4]
        ldr     r0, [sp, #0x10]
        str     r12, [sp]
        mov     r3, r5
        mov     r2, r8
        mov     r1, r4
        bl      _ipps_cDftOutOrdFwd_Prime_64fc
LCPV0:
        cmp     r10, #0x7D, 30
        ble     LCPV11
        cmp     r9, #1
        ble     LCPV11
        cmp     r8, #0
        ble     LCPV15
        sub     lr, r9, #1
        mov     r12, #0
        str     lr, [sp, #0x1C]
        str     r6, [sp, #0x34]
        mov     r0, r9
LCPV1:
        cmp     r5, #0x7D, 30
        mov     r6, r5
        ble     LCPV3
        cmp     r0, #1
        ble     LCPV2
        cmp     r0, r0
        mov     lr, r0
        movlt   r9, #0
        bge     LCPV4
        b       LCPV8
LCPV2:
        cmp     r0, #0
        movlt   r9, #0
        movge   lr, #0
        bge     LCPV4
        b       LCPV8
LCPV3:
        cmp     r0, #0
        movlt   r9, #0
        movge   lr, #0
        blt     LCPV8
LCPV4:
        mov     r11, r0
        str     lr, [sp, #0x18]
        rsb     r10, r11, r11, lsl #2
        str     r12, [sp, #0x20]
        add     r10, r7, r10, lsl #3
        str     r5, [sp, #0x24]
        str     r8, [sp, #0x28]
        str     r0, [sp, #0x2C]
        str     r7, [sp, #0x30]
LCPV5:
        ldr     r9, [r10, #0x5C]
        ldr     r12, [sp, #0x20]
        ldr     r7, [r10, #0x68]
        ldr     r8, [r10, #0x70]
        mov     r0, r6
        mul     r5, r12, r7
        mov     r1, r9
        bl      __intel_idiv
        cmp     r9, #2
        mov     r6, r0
        beq     LCPV19
        cmp     r9, #3
        beq     LCPV18
        cmp     r9, #4
        beq     LCPV17
        cmp     r9, #5
        beq     LCPV16
        ldr     r0, [r10, #0x6C]
        cmp     r7, #0
        ble     LCPV7
        str     r11, [sp, #0x10]
        ldr     r11, [sp, #0x34]
        str     r10, [sp, #0x14]
        mov     r10, r0
LCPV6:
        str     r11, [sp, #0xC]
        str     r8, [sp, #8]
        str     r10, [sp, #4]
        str     r5, [sp]
        mov     r3, r6
        mov     r2, r9
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftOutOrdFwd_Fact_64fc
        subs    r7, r7, #1
        add     r5, r5, #1
        bne     LCPV6
        ldr     r10, [sp, #0x14]
        ldr     r11, [sp, #0x10]
LCPV7:
        ldr     r12, [sp, #0x18]
        sub     r11, r11, #1
        sub     r10, r10, #0x18
        cmp     r11, r12
        bge     LCPV5
        ldr     r12, [sp, #0x20]
        ldr     r5, [sp, #0x24]
        ldr     r8, [sp, #0x28]
        ldr     r0, [sp, #0x2C]
        ldr     r7, [sp, #0x30]
LCPV8:
        cmp     r5, #0x7D, 30
        ble     LCPV10
        cmp     r0, #1
        ble     LCPV10
        mul     r11, r12, r9
        cmp     r9, #0
        ble     LCPV10
        str     r5, [sp, #0x24]
        str     r8, [sp, #0x28]
        ldr     r5, [sp, #0x1C]
        ldr     r8, [sp, #0x34]
        mov     r10, #0
        str     r12, [sp, #0x20]
        str     r0, [sp, #0x2C]
LCPV9:
        str     r5, [sp, #4]
        str     r8, [sp, #8]
        str     r11, [sp]
        mov     r3, r6
        mov     r2, r4
        mov     r1, r4
        mov     r0, r7
        bl      LCPV_cDftFwd_OutOrd_Step
        add     r10, r10, #1
        cmp     r10, r9
        add     r11, r11, #1
        blt     LCPV9
        ldr     r12, [sp, #0x20]
        ldr     r5, [sp, #0x24]
        ldr     r8, [sp, #0x28]
        ldr     r0, [sp, #0x2C]
LCPV10:
        add     r12, r12, #1
        cmp     r12, r8
        blt     LCPV1
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCPV11:
        ldr     r9, [r7, #0x54]
        cmp     r9, #0
        blt     LCPV15
        rsb     r12, r9, r9, lsl #2
        add     r11, r7, r12, lsl #3
LCPV12:
        ldr     r7, [r11, #0x5C]
        ldr     r10, [r11, #0x70]
        mov     r0, r5
        mov     r1, r7
        bl      __intel_idiv
        cmp     r7, #2
        mov     r5, r0
        beq     LCPV23
        cmp     r7, #3
        beq     LCPV22
        cmp     r7, #4
        beq     LCPV21
        cmp     r7, #5
        beq     LCPV20
        ldr     r1, [r11, #0x6C]
        cmp     r8, #0
        ble     LCPV14
        str     r11, [sp, #0x14]
        mov     r0, #0
        str     r9, [sp, #0x10]
        mov     r11, r10
        mov     r9, r0
        mov     r10, r1
LCPV13:
        str     r10, [sp, #4]
        str     r6, [sp, #0xC]
        str     r11, [sp, #8]
        str     r9, [sp]
        mov     r3, r5
        mov     r2, r7
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftOutOrdFwd_Fact_64fc
        add     r9, r9, #1
        cmp     r9, r8
        blt     LCPV13
        ldr     r11, [sp, #0x14]
        ldr     r9, [sp, #0x10]
LCPV14:
        mul     r8, r7, r8
        subs    r9, r9, #1
        sub     r11, r11, #0x18
        bpl     LCPV12
LCPV15:
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCPV16:
        str     r8, [sp, #4]
        str     r7, [sp]
        mov     r3, r5
        mov     r2, r6
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftOutOrdFwd_Fact5_64fc
        b       LCPV7
LCPV17:
        str     r8, [sp, #4]
        str     r7, [sp]
        mov     r3, r5
        mov     r2, r6
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftOutOrdFwd_Fact4_64fc
        b       LCPV7
LCPV18:
        str     r8, [sp, #4]
        str     r7, [sp]
        mov     r3, r5
        mov     r2, r6
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftOutOrdFwd_Fact3_64fc
        b       LCPV7
LCPV19:
        str     r8, [sp, #4]
        str     r7, [sp]
        mov     r3, r5
        mov     r2, r6
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftOutOrdFwd_Fact2_64fc
        b       LCPV7
LCPV20:
        str     r10, [sp, #4]
        str     r8, [sp]
        mov     r3, #0
        mov     r2, r5
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftOutOrdFwd_Fact5_64fc
        b       LCPV14
LCPV21:
        str     r10, [sp, #4]
        str     r8, [sp]
        mov     r3, #0
        mov     r2, r5
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftOutOrdFwd_Fact4_64fc
        b       LCPV14
LCPV22:
        str     r10, [sp, #4]
        str     r8, [sp]
        mov     r3, #0
        mov     r2, r5
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftOutOrdFwd_Fact3_64fc
        b       LCPV14
LCPV23:
        str     r10, [sp, #4]
        str     r8, [sp]
        mov     r3, #0
        mov     r2, r5
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftOutOrdFwd_Fact2_64fc
        b       LCPV14
LCPV24:
        ldr     r0, [sp, #0x10]
        mov     r2, r5
        mov     r1, r4
        bl      _ipps_cDftOutOrdFwd_Prime5_64fc
        b       LCPV0
LCPV25:
        ldr     r0, [sp, #0x10]
        mov     r2, r5
        mov     r1, r4
        bl      _ipps_cDftOutOrdFwd_Prime3_64fc
        b       LCPV0
LCPV_cDftFwd_OutOrd_Step:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x30
        ldr     lr, [sp, #0x54]
        ldr     r12, [sp, #0x58]
        ldr     r9, [sp, #0x5C]
        mov     r5, r3
        mov     r6, r0
        cmp     r5, #0x7D, 30
        mov     r4, r1
        mov     r7, #0
        mov     r0, r5
        movle   r11, r7
        ble     LCPV26
        cmp     r12, #1
        movle   r11, r7
        movgt   r11, r12
LCPV26:
        cmp     r12, r11
        mov     r10, r12
        blt     LCPV30
        rsb     r7, r10, r10, lsl #2
        str     r11, [sp, #0x18]
        add     r8, r6, r7, lsl #3
        str     r0, [sp, #0x1C]
        str     r9, [sp, #0x2C]
        str     r12, [sp, #0x20]
        str     lr, [sp, #0x24]
        str     r6, [sp, #0x28]
LCPV27:
        ldr     r7, [r8, #0x5C]
        ldr     r12, [sp, #0x24]
        ldr     r9, [r8, #0x68]
        ldr     r11, [r8, #0x70]
        mov     r0, r5
        mul     r6, r12, r9
        mov     r1, r7
        bl      __intel_idiv
        cmp     r7, #2
        mov     r5, r0
        beq     LCPV36
        cmp     r7, #3
        beq     LCPV35
        cmp     r7, #4
        beq     LCPV34
        cmp     r7, #5
        beq     LCPV33
        ldr     r0, [r8, #0x6C]
        cmp     r9, #0
        ble     LCPV29
        str     r10, [sp, #0x14]
        ldr     r10, [sp, #0x2C]
        str     r8, [sp, #0x10]
        mov     r8, r0
LCPV28:
        str     r10, [sp, #0xC]
        str     r11, [sp, #8]
        str     r8, [sp, #4]
        str     r6, [sp]
        mov     r3, r5
        mov     r2, r7
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftOutOrdFwd_Fact_64fc
        subs    r9, r9, #1
        add     r6, r6, #1
        bne     LCPV28
        ldr     r8, [sp, #0x10]
        ldr     r10, [sp, #0x14]
LCPV29:
        ldr     r12, [sp, #0x18]
        sub     r10, r10, #1
        sub     r8, r8, #0x18
        cmp     r10, r12
        bge     LCPV27
        ldr     r0, [sp, #0x1C]
        ldr     r9, [sp, #0x2C]
        ldr     r12, [sp, #0x20]
        ldr     lr, [sp, #0x24]
        ldr     r6, [sp, #0x28]
LCPV30:
        cmp     r0, #0x7D, 30
        ble     LCPV32
        cmp     r12, #1
        ble     LCPV32
        mul     r8, lr, r7
        cmp     r7, #0
        ble     LCPV32
        sub     r10, r12, #1
        mov     r11, #0
LCPV31:
        str     r10, [sp, #4]
        str     r9, [sp, #8]
        str     r8, [sp]
        mov     r3, r5
        mov     r2, r4
        mov     r1, r4
        mov     r0, r6
        bl      LCPV_cDftFwd_OutOrd_Step
        add     r11, r11, #1
        cmp     r11, r7
        add     r8, r8, #1
        blt     LCPV31
LCPV32:
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LCPV33:
        str     r11, [sp, #4]
        str     r9, [sp]
        mov     r3, r6
        mov     r2, r5
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftOutOrdFwd_Fact5_64fc
        b       LCPV29
LCPV34:
        str     r11, [sp, #4]
        str     r9, [sp]
        mov     r3, r6
        mov     r2, r5
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftOutOrdFwd_Fact4_64fc
        b       LCPV29
LCPV35:
        str     r11, [sp, #4]
        str     r9, [sp]
        mov     r3, r6
        mov     r2, r5
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftOutOrdFwd_Fact3_64fc
        b       LCPV29
LCPV36:
        str     r11, [sp, #4]
        str     r9, [sp]
        mov     r3, r6
        mov     r2, r5
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftOutOrdFwd_Fact2_64fc
        b       LCPV29


