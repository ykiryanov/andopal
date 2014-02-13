        .text
        .align  4
        .globl  _ipps_cDftInv_PrimeFact_64fc


_ipps_cDftInv_PrimeFact_64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x38
        mov     r7, r0
        ldr     r9, [r7, #0x5C]
        ldr     r6, [r7, #0x60]
        mov     r0, r1
        ldr     r1, [r7, #0x64]
        mov     r5, r2
        mul     r12, r9, r6
        cmp     r0, r5
        mov     r8, r3
        movne   r4, r5
        beq     LCPI23
LCPI0:
        cmp     r12, #0x7D, 30
        ldrgt   r12, [r7, #0x54]
        bgt     LCPI6
        ldr     r12, [r7, #0x54]
        cmp     r12, #0
        beq     LCPI6
        cmp     r12, #0
        mov     r6, r4
        mov     r9, r12
        blt     LCPI12
        str     r4, [sp, #0x10]
        str     r8, [sp, #0x30]
        str     r5, [sp, #0x18]
        str     r0, [sp, #0x34]
LCPI1:
        rsb     r11, r9, r9, lsl #2
        cmp     r9, r12
        add     lr, r7, r11, lsl #3
        ldr     r8, [lr, #0x5C]
        ldr     r4, [lr, #0x60]
        ldr     r5, [lr, #0x68]
        ldr     r10, [lr, #0x70]
        bne     LCPI3
        rsb     r12, r12, r12, lsl #2
        ldr     r0, [r7, #0x58]
        add     lr, r7, r12, lsl #3
        ldr     r1, [lr, #0x64]
        cmp     r4, #3
        beq     LCPI11
        cmp     r4, #5
        beq     LCPI10
        mul     r2, r8, r4
        add     r12, r7, r12, lsl #3
        ldr     r3, [r12, #0x84]
        cmp     r5, #0
        ble     LCPI3
        mov     r12, r5
        mov     lr, #0
        str     r10, [sp, #0x2C]
        str     r5, [sp, #0x28]
        str     r11, [sp, #0x14]
        str     r9, [sp, #0x1C]
        str     r6, [sp, #0x24]
        str     r7, [sp, #0x20]
        mov     r6, r0
        mov     r5, r1
        mov     r11, r2
        mov     r10, r3
        mov     r7, r12
        mov     r9, lr
LCPI2:
        ldr     r0, [sp, #0x30]
        str     r10, [sp, #4]
        str     r8, [sp]
        str     r0, [sp, #8]
        ldr     r1, [sp, #0x10]
        ldr     r0, [r6], #4
        add     r2, r1, r9, lsl #4
        ldr     r1, [sp, #0x34]
        mov     r3, r4
        add     r0, r1, r0, lsl #4
        mov     r1, r5
        bl      _ipps_cDftInv_Prime_64fc
        subs    r7, r7, #1
        add     r9, r9, r11
        bne     LCPI2
        ldr     r10, [sp, #0x2C]
        ldr     r5, [sp, #0x28]
        ldr     r11, [sp, #0x14]
        ldr     r9, [sp, #0x1C]
        ldr     r6, [sp, #0x24]
        ldr     r7, [sp, #0x20]
LCPI3:
        cmp     r9, #0
        ldreq   r6, [sp, #0x18]
        cmp     r8, #2
        beq     LCPI16
        cmp     r8, #3
        beq     LCPI15
        cmp     r8, #4
        beq     LCPI14
        cmp     r8, #5
        beq     LCPI13
        mul     r0, r8, r4
        add     r11, r7, r11, lsl #3
        ldr     r12, [r11, #0x6C]
        cmp     r5, #0
        ble     LCPI5
        str     r9, [sp, #0x1C]
        ldr     r9, [sp, #0x10]
        str     r7, [sp, #0x20]
        mov     r11, #0
        str     r12, [sp, #0x14]
        mov     r7, r0
LCPI4:
        ldr     r12, [sp, #0x30]
        str     r10, [sp, #4]
        add     r1, r6, r11, lsl #4
        str     r12, [sp, #8]
        ldr     r12, [sp, #0x14]
        add     r0, r9, r11, lsl #4
        mov     r3, r4
        str     r12, [sp]
        mov     r2, r8
        bl      _ipps_cDftInv_Fact_64fc
        subs    r5, r5, #1
        add     r11, r11, r7
        bne     LCPI4
        ldr     r9, [sp, #0x1C]
        ldr     r7, [sp, #0x20]
LCPI5:
        subs    r9, r9, #1
        ldrpl   r12, [r7, #0x54]
        bpl     LCPI1
        b       LCPI12
LCPI6:
        cmp     r12, #0
        bne     LCPI7
        ldr     r12, [r7, #0x58]
        cmp     r6, #3
        mov     lr, #1
        beq     LCPI18
        cmp     r6, #5
        beq     LCPI17
        ldr     r12, [r7, #0x84]
        str     r8, [sp, #8]
        str     r9, [sp]
        str     r12, [sp, #4]
        mov     r3, r6
        mov     r2, r4
        bl      _ipps_cDftInv_Prime_64fc
        b       LCPI9
LCPI7:
        cmp     r9, #0
        ble     LCPI9
        mov     r11, r9
        mov     r2, #0
        str     r4, [sp, #0x10]
        str     r9, [sp, #0x14]
        str     r5, [sp, #0x18]
        mov     r10, r2
        mov     r4, r0
        mov     r5, r1
        mov     r9, r2
LCPI8:
        str     r8, [sp]
        ldr     r12, [sp, #0x10]
        add     r1, r4, r9, lsl #4
        add     r2, r12, r10, lsl #4
        mov     r3, #1
        mov     r0, r7
        bl      LCPI_cDftInv_StepPrimeFact
        subs    r11, r11, #1
        add     r10, r10, r6
        add     r9, r9, r5
        bne     LCPI8
        ldr     r4, [sp, #0x10]
        ldr     r9, [sp, #0x14]
        ldr     r5, [sp, #0x18]
LCPI9:
        ldr     r12, [r7, #0x70]
        cmp     r9, #2
        beq     LCPI22
        cmp     r9, #3
        beq     LCPI21
        cmp     r9, #4
        beq     LCPI20
        cmp     r9, #5
        beq     LCPI19
        ldr     r7, [r7, #0x6C]
        str     r12, [sp, #4]
        str     r8, [sp, #8]
        str     r7, [sp]
        mov     r3, r6
        mov     r2, r9
        mov     r1, r5
        mov     r0, r4
        bl      _ipps_cDftInv_Fact_64fc
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCPI10:
        str     r0, [sp, #4]
        str     r5, [sp]
        ldr     r2, [sp, #0x10]
        ldr     r0, [sp, #0x34]
        mov     r3, r8
        bl      _ipps_cDftInv_Prime5_64fc
        b       LCPI3
LCPI11:
        str     r0, [sp, #4]
        str     r5, [sp]
        ldr     r2, [sp, #0x10]
        ldr     r0, [sp, #0x34]
        mov     r3, r8
        bl      _ipps_cDftInv_Prime3_64fc
        b       LCPI3
LCPI12:
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCPI13:
        str     r10, [sp]
        ldr     r0, [sp, #0x10]
        mov     r3, r5
        mov     r2, r4
        mov     r1, r6
        bl      _ipps_cDftInv_Fact5_64fc
        b       LCPI5
LCPI14:
        str     r10, [sp]
        ldr     r0, [sp, #0x10]
        mov     r3, r5
        mov     r2, r4
        mov     r1, r6
        bl      _ipps_cDftInv_Fact4_64fc
        b       LCPI5
LCPI15:
        str     r10, [sp]
        ldr     r0, [sp, #0x10]
        mov     r3, r5
        mov     r2, r4
        mov     r1, r6
        bl      _ipps_cDftInv_Fact3_64fc
        b       LCPI5
LCPI16:
        str     r10, [sp]
        ldr     r0, [sp, #0x10]
        mov     r3, r5
        mov     r2, r4
        mov     r1, r6
        bl      _ipps_cDftInv_Fact2_64fc
        b       LCPI5
LCPI17:
        str     r12, [sp, #4]
        str     lr, [sp]
        mov     r3, r9
        mov     r2, r4
        bl      _ipps_cDftInv_Prime5_64fc
        b       LCPI9
LCPI18:
        str     r12, [sp, #4]
        str     lr, [sp]
        mov     r3, r9
        mov     r2, r4
        bl      _ipps_cDftInv_Prime3_64fc
        b       LCPI9
LCPI19:
        str     r12, [sp]
        mov     r2, r6
        mov     r1, r5
        mov     r0, r4
        mov     r3, #1
        bl      _ipps_cDftInv_Fact5_64fc
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCPI20:
        str     r12, [sp]
        mov     r2, r6
        mov     r1, r5
        mov     r0, r4
        mov     r3, #1
        bl      _ipps_cDftInv_Fact4_64fc
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCPI21:
        str     r12, [sp]
        mov     r2, r6
        mov     r1, r5
        mov     r0, r4
        mov     r3, #1
        bl      _ipps_cDftInv_Fact3_64fc
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCPI22:
        str     r12, [sp]
        mov     r2, r6
        mov     r1, r5
        mov     r0, r4
        mov     r3, #1
        bl      _ipps_cDftInv_Fact2_64fc
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCPI23:
        add     lr, r8, r12, lsl #4
        and     r10, lr, #0x1F
        rsb     r10, r10, #0
        and     r10, r10, #0x1F
        mov     r4, r8
        add     r8, lr, r10
        b       LCPI0
LCPI_cDftInv_StepPrimeFact:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x34
        ldr     r6, [sp, #0x58]
        mov     r5, r0
        mov     r0, r1
        rsb     r11, r3, r3, lsl #2
        mov     r4, r2
        add     r12, r5, r11, lsl #3
        ldr     r8, [r12, #0x5C]
        ldr     r7, [r12, #0x60]
        ldr     r1, [r12, #0x64]
        mul     r12, r8, r7
        cmp     r12, #0x7D, 30
        ldrgt   r12, [r5, #0x54]
        bgt     LCPI29
        ldr     r12, [r5, #0x54]
        cmp     r3, r12
        beq     LCPI29
        cmp     r12, r3
        mov     r7, r12
        blt     LCPI35
        str     r6, [sp, #0x28]
        str     r3, [sp, #0x30]
        str     r0, [sp, #0x2C]
LCPI24:
        rsb     r11, r7, r7, lsl #2
        cmp     r7, r12
        add     lr, r5, r11, lsl #3
        ldr     r9, [lr, #0x5C]
        ldr     r6, [lr, #0x60]
        ldr     r8, [lr, #0x68]
        ldr     r10, [lr, #0x70]
        bne     LCPI26
        rsb     lr, r12, r12, lsl #2
        ldr     r0, [r5, #0x58]
        add     r12, r5, lr, lsl #3
        ldr     r1, [r12, #0x64]
        cmp     r6, #3
        beq     LCPI34
        cmp     r6, #5
        beq     LCPI33
        mul     r12, r9, r6
        add     lr, r5, lr, lsl #3
        ldr     r2, [lr, #0x84]
        cmp     r8, #0
        ble     LCPI26
        mov     r3, r8
        mov     lr, #0
        str     r10, [sp, #0x18]
        str     r8, [sp, #0x14]
        str     r11, [sp, #0x20]
        str     r7, [sp, #0x24]
        str     r5, [sp, #0x10]
        str     r12, [sp, #0x1C]
        mov     r7, r0
        mov     r5, r1
        mov     r11, r2
        mov     r8, r3
        mov     r10, lr
LCPI25:
        ldr     r12, [sp, #0x28]
        str     r11, [sp, #4]
        str     r9, [sp]
        str     r12, [sp, #8]
        ldr     r0, [sp, #0x2C]
        ldr     r12, [r7], #4
        add     r2, r4, r10, lsl #4
        mov     r3, r6
        add     r0, r0, r12, lsl #4
        mov     r1, r5
        bl      _ipps_cDftInv_Prime_64fc
        ldr     r12, [sp, #0x1C]
        subs    r8, r8, #1
        add     r10, r10, r12
        bne     LCPI25
        ldr     r10, [sp, #0x18]
        ldr     r8, [sp, #0x14]
        ldr     r11, [sp, #0x20]
        ldr     r7, [sp, #0x24]
        ldr     r5, [sp, #0x10]
LCPI26:
        cmp     r9, #2
        beq     LCPI39
        cmp     r9, #3
        beq     LCPI38
        cmp     r9, #4
        beq     LCPI37
        cmp     r9, #5
        beq     LCPI36
        mul     r0, r9, r6
        add     r11, r5, r11, lsl #3
        ldr     r12, [r11, #0x6C]
        cmp     r8, #0
        ble     LCPI28
        str     r7, [sp, #0x24]
        ldr     r7, [sp, #0x28]
        str     r5, [sp, #0x10]
        mov     r11, #0
        str     r12, [sp, #0x20]
        mov     r5, r0
LCPI27:
        ldr     r12, [sp, #0x20]
        add     r0, r4, r11, lsl #4
        mov     r1, r0
        str     r12, [sp]
        str     r7, [sp, #8]
        str     r10, [sp, #4]
        mov     r3, r6
        mov     r2, r9
        bl      _ipps_cDftInv_Fact_64fc
        subs    r8, r8, #1
        add     r11, r11, r5
        bne     LCPI27
        ldr     r7, [sp, #0x24]
        ldr     r5, [sp, #0x10]
LCPI28:
        ldr     r3, [sp, #0x30]
        sub     r7, r7, #1
        cmp     r7, r3
        ldrge   r12, [r5, #0x54]
        bge     LCPI24
        b       LCPI35
LCPI29:
        cmp     r3, r12
        bne     LCPI30
        ldr     r12, [r5, #0x58]
        cmp     r7, #3
        mov     lr, #1
        beq     LCPI41
        cmp     r7, #5
        beq     LCPI40
        add     r12, r5, r11, lsl #3
        ldr     r12, [r12, #0x84]
        str     r6, [sp, #8]
        str     r8, [sp]
        str     r12, [sp, #4]
        mov     r3, r7
        mov     r2, r4
        bl      _ipps_cDftInv_Prime_64fc
        b       LCPI32
LCPI30:
        cmp     r8, #0
        ble     LCPI32
        mov     r2, #0
        add     r3, r3, #1
        mov     r10, r8
        str     r8, [sp, #0x18]
        str     r11, [sp, #0x1C]
        str     r5, [sp, #0x10]
        mov     r9, r2
        str     r3, [sp, #0x14]
        mov     r5, r0
        mov     r8, r1
        mov     r11, r2
LCPI31:
        str     r6, [sp]
        ldr     r3, [sp, #0x14]
        ldr     r0, [sp, #0x10]
        add     r2, r4, r9, lsl #4
        add     r1, r5, r11, lsl #4
        bl      LCPI_cDftInv_StepPrimeFact
        subs    r10, r10, #1
        add     r9, r9, r7
        add     r11, r11, r8
        bne     LCPI31
        ldr     r8, [sp, #0x18]
        ldr     r11, [sp, #0x1C]
        ldr     r5, [sp, #0x10]
LCPI32:
        add     r12, r5, r11, lsl #3
        ldr     r12, [r12, #0x70]
        cmp     r8, #2
        beq     LCPI45
        cmp     r8, #3
        beq     LCPI44
        cmp     r8, #4
        beq     LCPI43
        cmp     r8, #5
        beq     LCPI42
        add     r11, r5, r11, lsl #3
        ldr     lr, [r11, #0x6C]
        str     r12, [sp, #4]
        str     r6, [sp, #8]
        str     lr, [sp]
        mov     r3, r7
        mov     r2, r8
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftInv_Fact_64fc
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LCPI33:
        str     r0, [sp, #4]
        str     r8, [sp]
        ldr     r0, [sp, #0x2C]
        mov     r3, r9
        mov     r2, r4
        bl      _ipps_cDftInv_Prime5_64fc
        b       LCPI26
LCPI34:
        str     r0, [sp, #4]
        str     r8, [sp]
        ldr     r0, [sp, #0x2C]
        mov     r3, r9
        mov     r2, r4
        bl      _ipps_cDftInv_Prime3_64fc
        b       LCPI26
LCPI35:
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LCPI36:
        str     r10, [sp]
        mov     r3, r8
        mov     r2, r6
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftInv_Fact5_64fc
        b       LCPI28
LCPI37:
        str     r10, [sp]
        mov     r3, r8
        mov     r2, r6
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftInv_Fact4_64fc
        b       LCPI28
LCPI38:
        str     r10, [sp]
        mov     r3, r8
        mov     r2, r6
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftInv_Fact3_64fc
        b       LCPI28
LCPI39:
        str     r10, [sp]
        mov     r3, r8
        mov     r2, r6
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftInv_Fact2_64fc
        b       LCPI28
LCPI40:
        str     r12, [sp, #4]
        str     lr, [sp]
        mov     r3, r8
        mov     r2, r4
        bl      _ipps_cDftInv_Prime5_64fc
        b       LCPI32
LCPI41:
        str     r12, [sp, #4]
        str     lr, [sp]
        mov     r3, r8
        mov     r2, r4
        bl      _ipps_cDftInv_Prime3_64fc
        b       LCPI32
LCPI42:
        str     r12, [sp]
        mov     r2, r7
        mov     r3, #1
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftInv_Fact5_64fc
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LCPI43:
        str     r12, [sp]
        mov     r2, r7
        mov     r3, #1
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftInv_Fact4_64fc
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LCPI44:
        str     r12, [sp]
        mov     r2, r7
        mov     r3, #1
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftInv_Fact3_64fc
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LCPI45:
        str     r12, [sp]
        mov     r2, r7
        mov     r3, #1
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_cDftInv_Fact2_64fc
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}


