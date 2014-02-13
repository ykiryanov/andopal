        .text
        .align  4
        .globl  _ipps_crDftInv_PrimeFact_32f


_ipps_crDftInv_PrimeFact_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x3C
        mov     r7, r0
        ldr     r10, [r7, #0x58]
        ldr     r9, [r7, #0x5C]
        ldr     r6, [sp, #0x60]
        ldr     r4, [sp, #0x64]
        ldr     r12, [r7, #0x60]
        mul     r8, r10, r9
        mov     r0, r1
        mov     r1, r2
        mov     r5, r3
        add     lr, r4, r8, lsl #3
        cmp     r8, #0x7D, 28
        and     r8, lr, #0x1F
        rsb     r8, r8, #0
        and     r8, r8, #0x1F
        add     r8, lr, r8
        ldrgt   lr, [r7, #0x50]
        bgt     LCJP5
        ldr     lr, [r7, #0x50]
        cmp     lr, #0
        beq     LCJP5
        cmp     lr, #0
        mov     r9, lr
        blt     LCJP11
        str     r8, [sp, #0x2C]
        str     r6, [sp, #0x18]
        str     r5, [sp, #0x1C]
        str     r1, [sp, #0x20]
        str     r0, [sp, #0x24]
LCJP0:
        rsb     r11, r9, r9, lsl #2
        cmp     r9, lr
        add     r12, r7, r11, lsl #3
        ldr     r8, [r12, #0x58]
        ldr     r5, [r12, #0x5C]
        ldr     r6, [r12, #0x64]
        ldr     r10, [r12, #0x6C]
        bne     LCJP2
        rsb     lr, lr, lr, lsl #2
        ldr     r0, [r7, #0x54]
        add     r12, r7, lr, lsl #3
        ldr     r2, [r12, #0x60]
        cmp     r5, #3
        beq     LCJP10
        cmp     r5, #5
        beq     LCJP9
        mul     r12, r8, r5
        add     lr, r7, lr, lsl #3
        ldr     r1, [lr, #0x80]
        cmp     r6, #0
        ble     LCJP2
        mov     lr, r6
        mov     r3, #0
        str     r10, [sp, #0x34]
        str     r6, [sp, #0x30]
        str     r11, [sp, #0x10]
        str     r9, [sp, #0x14]
        str     r7, [sp, #0x28]
        str     r12, [sp, #0x38]
        mov     r11, r0
        mov     r10, r1
        mov     r6, r2
        mov     r9, r3
        mov     r7, lr
LCJP1:
        ldr     r0, [sp, #0x2C]
        ldr     r12, [r11], #4
        add     r3, r4, r9, lsl #3
        str     r0, [sp, #0xC]
        ldr     r0, [sp, #0x20]
        mov     r2, r6
        add     r1, r0, r12, lsl #2
        ldr     r0, [sp, #0x24]
        str     r10, [sp, #8]
        str     r8, [sp, #4]
        str     r5, [sp]
        add     r0, r0, r12, lsl #2
        bl      _ipps_crDftInv_Prime_32f
        ldr     r12, [sp, #0x38]
        subs    r7, r7, #1
        add     r9, r9, r12
        bne     LCJP1
        ldr     r10, [sp, #0x34]
        ldr     r6, [sp, #0x30]
        ldr     r11, [sp, #0x10]
        ldr     r9, [sp, #0x14]
        ldr     r7, [sp, #0x28]
LCJP2:
        cmp     r9, #0
        ble     LCJP16
        cmp     r8, #2
        beq     LCJP15
        cmp     r8, #3
        beq     LCJP14
        cmp     r8, #4
        beq     LCJP13
        cmp     r8, #5
        beq     LCJP12
        mul     r0, r8, r5
        add     r11, r7, r11, lsl #3
        ldr     r12, [r11, #0x68]
        cmp     r6, #0
        ble     LCJP4
        str     r9, [sp, #0x14]
        ldr     r9, [sp, #0x2C]
        str     r7, [sp, #0x28]
        mov     r11, #0
        str     r12, [sp, #0x10]
        mov     r7, r0
LCJP3:
        str     r9, [sp, #8]
        str     r10, [sp, #4]
        ldr     r12, [sp, #0x10]
        add     r0, r4, r11, lsl #3
        mov     r1, r0
        str     r12, [sp]
        mov     r3, r5
        mov     r2, r8
        bl      _ipps_cDftInv_Fact_32fc
        subs    r6, r6, #1
        add     r11, r11, r7
        bne     LCJP3
        ldr     r9, [sp, #0x14]
        ldr     r7, [sp, #0x28]
LCJP4:
        subs    r9, r9, #1
        ldrpl   lr, [r7, #0x50]
        bpl     LCJP0
        b       LCJP11
LCJP5:
        cmp     lr, #0
        bne     LCJP6
        ldr     lr, [r7, #0x54]
        cmp     r9, #3
        beq     LCJP22
        cmp     r9, #5
        beq     LCJP21
        ldr     lr, [r7, #0x80]
        str     r8, [sp, #0xC]
        str     r10, [sp, #4]
        str     lr, [sp, #8]
        str     r9, [sp]
        mov     r2, r12
        mov     r3, r4
        bl      _ipps_crDftInv_Prime_32f
        b       LCJP8
LCJP6:
        cmp     r10, #0
        ble     LCJP8
        mov     r11, r10
        mov     r3, #0
        mov     r2, r3
        str     r10, [sp, #0x38]
        str     r6, [sp, #0x18]
        str     r5, [sp, #0x1C]
        str     r7, [sp, #0x28]
        mov     lr, #1
        str     r1, [sp, #0x20]
        mov     r5, r0
        mov     r7, r2
        mov     r10, r3
        mov     r6, r12
LCJP7:
        ldr     lr, [sp, #0x20]
        str     r8, [sp, #4]
        add     r3, r4, r10, lsl #3
        add     r2, lr, r7, lsl #2
        mov     lr, #1
        str     lr, [sp]
        ldr     r0, [sp, #0x28]
        add     r1, r5, r7, lsl #2
        bl      LCJP_crDftInv_StepPrimeFact
        subs    r11, r11, #1
        add     r7, r7, r6
        add     r10, r10, r9
        bne     LCJP7
        ldr     r10, [sp, #0x38]
        ldr     r6, [sp, #0x18]
        ldr     r5, [sp, #0x1C]
        ldr     r7, [sp, #0x28]
LCJP8:
        ldr     r12, [r7, #0x6C]
        cmp     r10, #2
        beq     LCJP26
        cmp     r10, #3
        beq     LCJP25
        cmp     r10, #4
        beq     LCJP24
        cmp     r10, #5
        beq     LCJP23
        ldr     r7, [r7, #0x68]
        str     r12, [sp, #8]
        str     r8, [sp, #0xC]
        str     r7, [sp, #4]
        str     r9, [sp]
        mov     r3, r10
        mov     r2, r6
        mov     r1, r5
        mov     r0, r4
        bl      _ipps_crDftInv_Fact_32f
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LCJP9:
        str     r0, [sp, #8]
        str     r6, [sp, #4]
        str     r8, [sp]
        ldr     r1, [sp, #0x20]
        ldr     r0, [sp, #0x24]
        mov     r3, r4
        bl      _ipps_crDftInv_Prime5_32f
        b       LCJP2
LCJP10:
        str     r0, [sp, #8]
        str     r6, [sp, #4]
        str     r8, [sp]
        ldr     r1, [sp, #0x20]
        ldr     r0, [sp, #0x24]
        mov     r3, r4
        bl      _ipps_crDftInv_Prime3_32f
        b       LCJP2
LCJP11:
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LCJP12:
        str     r10, [sp]
        mov     r3, r6
        mov     r2, r5
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftInv_Fact5_32fc
        b       LCJP4
LCJP13:
        str     r10, [sp]
        mov     r3, r6
        mov     r2, r5
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftInv_Fact4_32fc
        b       LCJP4
LCJP14:
        str     r10, [sp]
        mov     r3, r6
        mov     r2, r5
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftInv_Fact3_32fc
        b       LCJP4
LCJP15:
        str     r10, [sp]
        mov     r3, r6
        mov     r2, r5
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftInv_Fact2_32fc
        b       LCJP4
LCJP16:
        cmp     r8, #2
        beq     LCJP20
        cmp     r8, #3
        beq     LCJP19
        cmp     r8, #4
        beq     LCJP18
        cmp     r8, #5
        beq     LCJP17
        ldr     r12, [r7, #0x68]
        str     r10, [sp, #8]
        str     r5, [sp]
        str     r12, [sp, #4]
        ldr     r12, [sp, #0x2C]
        mov     r3, r8
        mov     r0, r4
        str     r12, [sp, #0xC]
        ldr     r2, [sp, #0x18]
        ldr     r1, [sp, #0x1C]
        bl      _ipps_crDftInv_Fact_32f
        b       LCJP4
LCJP17:
        str     r10, [sp]
        ldr     r2, [sp, #0x18]
        ldr     r1, [sp, #0x1C]
        mov     r3, r5
        mov     r0, r4
        bl      _ipps_crDftInv_Fact5_32f
        b       LCJP4
LCJP18:
        str     r10, [sp]
        ldr     r2, [sp, #0x18]
        ldr     r1, [sp, #0x1C]
        mov     r3, r5
        mov     r0, r4
        bl      _ipps_crDftInv_Fact4_32f
        b       LCJP4
LCJP19:
        str     r10, [sp]
        ldr     r2, [sp, #0x18]
        ldr     r1, [sp, #0x1C]
        mov     r3, r5
        mov     r0, r4
        bl      _ipps_crDftInv_Fact3_32f
        b       LCJP4
LCJP20:
        str     r10, [sp]
        ldr     r2, [sp, #0x18]
        ldr     r1, [sp, #0x1C]
        mov     r3, r5
        mov     r0, r4
        bl      _ipps_crDftInv_Fact2_32f
        b       LCJP4
LCJP21:
        str     lr, [sp, #8]
        mov     lr, #1
        str     lr, [sp, #4]
        str     r10, [sp]
        mov     r2, r12
        mov     r3, r4
        bl      _ipps_crDftInv_Prime5_32f
        b       LCJP8
LCJP22:
        str     lr, [sp, #8]
        mov     lr, #1
        str     lr, [sp, #4]
        str     r10, [sp]
        mov     r2, r12
        mov     r3, r4
        bl      _ipps_crDftInv_Prime3_32f
        b       LCJP8
LCJP23:
        str     r12, [sp]
        mov     r3, r9
        mov     r2, r6
        mov     r1, r5
        mov     r0, r4
        bl      _ipps_crDftInv_Fact5_32f
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LCJP24:
        str     r12, [sp]
        mov     r3, r9
        mov     r2, r6
        mov     r1, r5
        mov     r0, r4
        bl      _ipps_crDftInv_Fact4_32f
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LCJP25:
        str     r12, [sp]
        mov     r3, r9
        mov     r2, r6
        mov     r1, r5
        mov     r0, r4
        bl      _ipps_crDftInv_Fact3_32f
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LCJP26:
        str     r12, [sp]
        mov     r3, r9
        mov     r2, r6
        mov     r1, r5
        mov     r0, r4
        bl      _ipps_crDftInv_Fact2_32f
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LCJP_crDftInv_StepPrimeFact:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x38
        ldr     r12, [sp, #0x5C]
        mov     r5, r0
        ldr     r6, [sp, #0x60]
        rsb     r11, r12, r12, lsl #2
        mov     r0, r1
        add     lr, r5, r11, lsl #3
        ldr     r8, [lr, #0x58]
        ldr     r7, [lr, #0x5C]
        ldr     lr, [lr, #0x60]
        mov     r1, r2
        mul     r9, r8, r7
        mov     r4, r3
        cmp     r9, #0x7D, 28
        ldrgt   r2, [r5, #0x50]
        bgt     LCJP32
        ldr     r2, [r5, #0x50]
        cmp     r12, r2
        beq     LCJP32
        cmp     r2, r12
        mov     r7, r2
        blt     LCJP38
        str     r6, [sp, #0x30]
        str     r12, [sp, #0x34]
        str     r1, [sp, #0x10]
        str     r0, [sp, #0x14]
LCJP27:
        rsb     r11, r7, r7, lsl #2
        cmp     r7, r2
        add     r12, r5, r11, lsl #3
        ldr     r10, [r12, #0x58]
        ldr     r6, [r12, #0x5C]
        ldr     r8, [r12, #0x64]
        ldr     r9, [r12, #0x6C]
        bne     LCJP29
        rsb     lr, r2, r2, lsl #2
        ldr     r0, [r5, #0x54]
        add     r12, r5, lr, lsl #3
        ldr     r2, [r12, #0x60]
        cmp     r6, #3
        beq     LCJP37
        cmp     r6, #5
        beq     LCJP36
        mul     r12, r10, r6
        add     lr, r5, lr, lsl #3
        ldr     r1, [lr, #0x80]
        cmp     r8, #0
        ble     LCJP29
        mov     r3, r8
        mov     lr, #0
        str     r9, [sp, #0x1C]
        str     r8, [sp, #0x24]
        str     r11, [sp, #0x28]
        str     r7, [sp, #0x2C]
        str     r5, [sp, #0x18]
        str     r12, [sp, #0x20]
        mov     r11, r0
        mov     r9, r1
        mov     r5, r2
        mov     r7, r3
        mov     r8, lr
LCJP28:
        ldr     r0, [sp, #0x30]
        ldr     r12, [r11], #4
        add     r3, r4, r8, lsl #3
        str     r0, [sp, #0xC]
        ldr     r0, [sp, #0x10]
        mov     r2, r5
        add     r1, r0, r12, lsl #2
        ldr     r0, [sp, #0x14]
        str     r9, [sp, #8]
        str     r10, [sp, #4]
        str     r6, [sp]
        add     r0, r0, r12, lsl #2
        bl      _ipps_crDftInv_Prime_32f
        ldr     r12, [sp, #0x20]
        subs    r7, r7, #1
        add     r8, r8, r12
        bne     LCJP28
        ldr     r9, [sp, #0x1C]
        ldr     r8, [sp, #0x24]
        ldr     r11, [sp, #0x28]
        ldr     r7, [sp, #0x2C]
        ldr     r5, [sp, #0x18]
LCJP29:
        cmp     r10, #2
        beq     LCJP42
        cmp     r10, #3
        beq     LCJP41
        cmp     r10, #4
        beq     LCJP40
        cmp     r10, #5
        beq     LCJP39
        mul     r0, r10, r6
        add     r11, r5, r11, lsl #3
        ldr     r12, [r11, #0x68]
        cmp     r8, #0
        ble     LCJP31
        str     r7, [sp, #0x2C]
        ldr     r7, [sp, #0x30]
        str     r5, [sp, #0x18]
        mov     r11, #0
        str     r12, [sp, #0x28]
        mov     r5, r0
LCJP30:
        str     r7, [sp, #8]
        str     r9, [sp, #4]
        ldr     r12, [sp, #0x28]
        add     r0, r4, r11, lsl #3
        mov     r1, r0
        str     r12, [sp]
        mov     r3, r6
        mov     r2, r10
        bl      _ipps_cDftInv_Fact_32fc
        subs    r8, r8, #1
        add     r11, r11, r5
        bne     LCJP30
        ldr     r7, [sp, #0x2C]
        ldr     r5, [sp, #0x18]
LCJP31:
        ldr     r2, [sp, #0x34]
        sub     r7, r7, #1
        cmp     r7, r2
        ldrge   r2, [r5, #0x50]
        bge     LCJP27
        b       LCJP38
LCJP32:
        cmp     r12, r2
        bne     LCJP33
        ldr     r12, [r5, #0x54]
        cmp     r7, #3
        mov     r9, #1
        beq     LCJP44
        cmp     r7, #5
        beq     LCJP43
        add     r12, r5, r11, lsl #3
        ldr     r12, [r12, #0x80]
        str     r6, [sp, #0xC]
        str     r8, [sp, #4]
        str     r12, [sp, #8]
        str     r7, [sp]
        mov     r2, lr
        mov     r3, r4
        bl      _ipps_crDftInv_Prime_32f
        b       LCJP35
LCJP33:
        cmp     r8, #0
        ble     LCJP35
        mov     r2, #0
        add     r12, r12, #1
        mov     r9, r8
        str     r8, [sp, #0x1C]
        str     r11, [sp, #0x20]
        str     r5, [sp, #0x18]
        mov     r10, r2
        str     r1, [sp, #0x10]
        str     r0, [sp, #0x14]
        mov     r8, r2
        mov     r11, r12
        mov     r5, lr
LCJP34:
        str     r11, [sp]
        str     r6, [sp, #4]
        ldr     r0, [sp, #0x10]
        add     r3, r4, r8, lsl #3
        add     r2, r0, r10, lsl #2
        ldr     r0, [sp, #0x14]
        add     r1, r0, r10, lsl #2
        ldr     r0, [sp, #0x18]
        bl      LCJP_crDftInv_StepPrimeFact
        subs    r9, r9, #1
        add     r10, r10, r5
        add     r8, r8, r7
        bne     LCJP34
        ldr     r8, [sp, #0x1C]
        ldr     r11, [sp, #0x20]
        ldr     r5, [sp, #0x18]
LCJP35:
        add     r12, r5, r11, lsl #3
        ldr     r12, [r12, #0x6C]
        cmp     r8, #2
        beq     LCJP48
        cmp     r8, #3
        beq     LCJP47
        cmp     r8, #4
        beq     LCJP46
        cmp     r8, #5
        beq     LCJP45
        add     r11, r5, r11, lsl #3
        ldr     lr, [r11, #0x68]
        str     r12, [sp, #4]
        str     r6, [sp, #8]
        str     lr, [sp]
        mov     r3, r7
        mov     r2, r8
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftInv_Fact_32fc
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCJP36:
        str     r0, [sp, #8]
        str     r8, [sp, #4]
        str     r10, [sp]
        ldr     r1, [sp, #0x10]
        ldr     r0, [sp, #0x14]
        mov     r3, r4
        bl      _ipps_crDftInv_Prime5_32f
        b       LCJP29
LCJP37:
        str     r0, [sp, #8]
        str     r8, [sp, #4]
        str     r10, [sp]
        ldr     r1, [sp, #0x10]
        ldr     r0, [sp, #0x14]
        mov     r3, r4
        bl      _ipps_crDftInv_Prime3_32f
        b       LCJP29
LCJP38:
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCJP39:
        str     r9, [sp]
        mov     r3, r8
        mov     r2, r6
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftInv_Fact5_32fc
        b       LCJP31
LCJP40:
        str     r9, [sp]
        mov     r3, r8
        mov     r2, r6
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftInv_Fact4_32fc
        b       LCJP31
LCJP41:
        str     r9, [sp]
        mov     r3, r8
        mov     r2, r6
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftInv_Fact3_32fc
        b       LCJP31
LCJP42:
        str     r9, [sp]
        mov     r3, r8
        mov     r2, r6
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftInv_Fact2_32fc
        b       LCJP31
LCJP43:
        str     r12, [sp, #8]
        str     r9, [sp, #4]
        str     r8, [sp]
        mov     r2, lr
        mov     r3, r4
        bl      _ipps_crDftInv_Prime5_32f
        b       LCJP35
LCJP44:
        str     r12, [sp, #8]
        str     r9, [sp, #4]
        str     r8, [sp]
        mov     r2, lr
        mov     r3, r4
        bl      _ipps_crDftInv_Prime3_32f
        b       LCJP35
LCJP45:
        str     r12, [sp]
        mov     r2, r7
        mov     r3, #1
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftInv_Fact5_32fc
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCJP46:
        str     r12, [sp]
        mov     r2, r7
        mov     r3, #1
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftInv_Fact4_32fc
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCJP47:
        str     r12, [sp]
        mov     r2, r7
        mov     r3, #1
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftInv_Fact3_32fc
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCJP48:
        str     r12, [sp]
        mov     r2, r7
        mov     r3, #1
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftInv_Fact2_32fc
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}


