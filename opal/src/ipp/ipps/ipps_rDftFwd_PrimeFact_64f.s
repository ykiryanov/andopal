        .text
        .align  4
        .globl  _ipps_rDftFwd_PrimeFact_64f


_ipps_rDftFwd_PrimeFact_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x38
        mov     r6, r0
        ldr     r9, [r6, #0x5C]
        ldr     r8, [r6, #0x60]
        ldr     lr, [r6, #0x64]
        mov     r0, r1
        mov     r5, r2
        mul     r10, r9, r8
        mov     r4, r3
        cmp     r10, #0x7D, 30
        add     r7, r4, r10, lsl #3
        ldrgt   r12, [r6, #0x54]
        bgt     LCNS6
        ldr     r12, [r6, #0x54]
        cmp     r12, #0
        beq     LCNS6
        tst     r12, #1
        moveq   r8, r5
        beq     LCNS0
        cmp     r0, r5
        mov     r8, r4
        moveq   r4, r7
        addeq   r7, r7, r10, lsl #3
        movne   r4, r5
LCNS0:
        cmp     r12, #0
        mov     r9, r12
        blt     LCNS12
        str     r7, [sp, #0x10]
        str     r5, [sp, #0x18]
        str     r0, [sp, #0x34]
LCNS1:
        rsb     lr, r9, r9, lsl #2
        str     lr, [sp, #0x30]
        add     lr, r6, lr, lsl #3
        ldr     r7, [lr, #0x5C]
        ldr     r5, [lr, #0x60]
        ldr     r10, [lr, #0x68]
        ldr     r11, [lr, #0x70]
        cmp     r9, r12
        bne     LCNS3
        rsb     lr, r12, r12, lsl #2
        ldr     r0, [r6, #0x58]
        add     r12, r6, lr, lsl #3
        ldr     r1, [r12, #0x64]
        cmp     r5, #3
        beq     LCNS11
        cmp     r5, #5
        beq     LCNS10
        mul     r12, r7, r5
        add     lr, r6, lr, lsl #3
        ldr     r2, [lr, #0x84]
        cmp     r10, #0
        ble     LCNS3
        mov     r3, r10
        mov     lr, #0
        str     r11, [sp, #0x1C]
        str     r10, [sp, #0x20]
        str     r9, [sp, #0x24]
        str     r8, [sp, #0x28]
        str     r6, [sp, #0x2C]
        str     r12, [sp, #0x14]
        mov     r8, r0
        mov     r6, r1
        mov     r11, r2
        mov     r9, r3
        mov     r10, lr
LCNS2:
        ldr     r12, [sp, #0x10]
        str     r11, [sp, #4]
        str     r7, [sp]
        str     r12, [sp, #8]
        ldr     r0, [sp, #0x34]
        ldr     r12, [r8], #4
        add     r2, r4, r10, lsl #3
        mov     r3, r5
        add     r0, r0, r12, lsl #3
        mov     r1, r6
        bl      _ipps_rDftFwd_Prime_64f
        ldr     r12, [sp, #0x14]
        subs    r9, r9, #1
        add     r10, r10, r12
        bne     LCNS2
        ldr     r11, [sp, #0x1C]
        ldr     r10, [sp, #0x20]
        ldr     r9, [sp, #0x24]
        ldr     r8, [sp, #0x28]
        ldr     r6, [sp, #0x2C]
LCNS3:
        cmp     r9, #0
        ldreq   r8, [sp, #0x18]
        cmp     r7, #3
        beq     LCNS14
        cmp     r7, #5
        beq     LCNS13
        ldr     r12, [sp, #0x30]
        mul     lr, r7, r5
        cmp     r10, #0
        add     r12, r6, r12, lsl #3
        ldr     r12, [r12, #0x6C]
        ble     LCNS5
        str     r9, [sp, #0x24]
        ldr     r9, [sp, #0x10]
        mov     r0, #0
        str     r6, [sp, #0x2C]
        str     r12, [sp, #0x14]
        str     lr, [sp, #0x30]
        mov     r6, r0
LCNS4:
        str     r9, [sp, #8]
        str     r11, [sp, #4]
        ldr     r12, [sp, #0x14]
        add     r1, r8, r6, lsl #3
        add     r0, r4, r6, lsl #3
        str     r12, [sp]
        mov     r3, r5
        mov     r2, r7
        bl      _ipps_rDftFwd_Fact_64f
        ldr     r12, [sp, #0x30]
        subs    r10, r10, #1
        add     r6, r6, r12
        bne     LCNS4
        ldr     r9, [sp, #0x24]
        ldr     r6, [sp, #0x2C]
LCNS5:
        mov     r12, r4
        mov     r4, r8
        subs    r9, r9, #1
        mov     r8, r12
        ldrpl   r12, [r6, #0x54]
        bpl     LCNS1
        b       LCNS12
LCNS6:
        cmp     r12, #0
        bne     LCNS7
        ldr     r12, [r6, #0x58]
        cmp     r8, #3
        mov     r10, #1
        beq     LCNS16
        cmp     r8, #5
        beq     LCNS15
        ldr     r12, [r6, #0x84]
        str     r7, [sp, #8]
        str     r9, [sp]
        str     r12, [sp, #4]
        mov     r1, lr
        mov     r3, r8
        mov     r2, r4
        bl      _ipps_rDftFwd_Prime_64f
        b       LCNS9
LCNS7:
        cmp     r9, #0
        ble     LCNS9
        mov     r11, r9
        mov     r1, #0
        str     r7, [sp, #0x10]
        str     r9, [sp, #0x14]
        str     r5, [sp, #0x18]
        mov     r10, r1
        mov     r5, r0
        mov     r9, r1
        mov     r7, lr
LCNS8:
        ldr     r12, [sp, #0x10]
        add     r2, r4, r10, lsl #3
        add     r1, r5, r9, lsl #3
        str     r12, [sp]
        mov     r3, #1
        mov     r0, r6
        bl      LCNS_rDftFwd_StepPrimeFact
        subs    r11, r11, #1
        add     r10, r10, r8
        add     r9, r9, r7
        bne     LCNS8
        ldr     r7, [sp, #0x10]
        ldr     r9, [sp, #0x14]
        ldr     r5, [sp, #0x18]
LCNS9:
        ldr     r12, [r6, #0x70]
        cmp     r9, #3
        beq     LCNS18
        cmp     r9, #5
        beq     LCNS17
        ldr     r6, [r6, #0x6C]
        str     r12, [sp, #4]
        str     r7, [sp, #8]
        str     r6, [sp]
        mov     r3, r8
        mov     r2, r9
        mov     r1, r5
        mov     r0, r4
        bl      _ipps_rDftFwd_Fact_64f
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCNS10:
        str     r0, [sp, #4]
        str     r10, [sp]
        ldr     r0, [sp, #0x34]
        mov     r3, r7
        mov     r2, r4
        bl      _ipps_rDftFwd_Prime5_64f
        b       LCNS3
LCNS11:
        str     r0, [sp, #4]
        str     r10, [sp]
        ldr     r0, [sp, #0x34]
        mov     r3, r7
        mov     r2, r4
        bl      _ipps_rDftFwd_Prime3_64f
        b       LCNS3
LCNS12:
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCNS13:
        str     r11, [sp]
        mov     r3, r10
        mov     r2, r5
        mov     r1, r8
        mov     r0, r4
        bl      _ipps_rDftFwd_Fact5_64f
        b       LCNS5
LCNS14:
        str     r11, [sp]
        mov     r3, r10
        mov     r2, r5
        mov     r1, r8
        mov     r0, r4
        bl      _ipps_rDftFwd_Fact3_64f
        b       LCNS5
LCNS15:
        str     r12, [sp, #4]
        str     r10, [sp]
        mov     r1, lr
        mov     r3, r9
        mov     r2, r4
        bl      _ipps_rDftFwd_Prime5_64f
        b       LCNS9
LCNS16:
        str     r12, [sp, #4]
        str     r10, [sp]
        mov     r1, lr
        mov     r3, r9
        mov     r2, r4
        bl      _ipps_rDftFwd_Prime3_64f
        b       LCNS9
LCNS17:
        str     r12, [sp]
        mov     r2, r8
        mov     r1, r5
        mov     r0, r4
        mov     r3, #1
        bl      _ipps_rDftFwd_Fact5_64f
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCNS18:
        str     r12, [sp]
        mov     r2, r8
        mov     r1, r5
        mov     r0, r4
        mov     r3, #1
        bl      _ipps_rDftFwd_Fact3_64f
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCNS_rDftFwd_StepPrimeFact:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x38
        ldr     r4, [sp, #0x5C]
        mov     r6, r0
        mov     r0, r1
        rsb     r10, r3, r3, lsl #2
        mov     r5, r2
        add     r12, r6, r10, lsl #3
        ldr     r9, [r12, #0x5C]
        ldr     r8, [r12, #0x60]
        ldr     r1, [r12, #0x64]
        mul     r12, r9, r8
        cmp     r12, #0x7D, 30
        add     r7, r4, r12, lsl #3
        ldrgt   r12, [r6, #0x54]
        bgt     LCNS24
        ldr     r12, [r6, #0x54]
        cmp     r3, r12
        beq     LCNS24
        sub     lr, r12, r3
        tst     lr, #1
        moveq   r8, r4
        moveq   r4, r5
        movne   r8, r5
        cmp     r12, r3
        mov     r5, r12
        blt     LCNS30
        str     r7, [sp, #0x2C]
        str     r3, [sp, #0x34]
        str     r0, [sp, #0x30]
LCNS19:
        rsb     r3, r5, r5, lsl #2
        str     r3, [sp, #0x28]
        add     lr, r6, r3, lsl #3
        ldr     r9, [lr, #0x5C]
        ldr     r7, [lr, #0x60]
        ldr     r10, [lr, #0x68]
        ldr     r11, [lr, #0x70]
        cmp     r5, r12
        bne     LCNS21
        rsb     lr, r12, r12, lsl #2
        ldr     r0, [r6, #0x58]
        add     r12, r6, lr, lsl #3
        ldr     r1, [r12, #0x64]
        cmp     r7, #3
        beq     LCNS29
        cmp     r7, #5
        beq     LCNS28
        mul     r12, r9, r7
        add     lr, r6, lr, lsl #3
        ldr     r2, [lr, #0x84]
        cmp     r10, #0
        ble     LCNS21
        mov     r3, r10
        mov     lr, #0
        str     r11, [sp, #0x1C]
        str     r10, [sp, #0x18]
        str     r5, [sp, #0x14]
        str     r4, [sp, #0x24]
        str     r6, [sp, #0x10]
        str     r12, [sp, #0x20]
        mov     r5, r0
        mov     r4, r1
        mov     r11, r2
        mov     r6, r3
        mov     r10, lr
LCNS20:
        ldr     r12, [sp, #0x2C]
        str     r11, [sp, #4]
        str     r9, [sp]
        str     r12, [sp, #8]
        ldr     r0, [sp, #0x30]
        ldr     r12, [r5], #4
        add     r2, r8, r10, lsl #3
        mov     r3, r7
        add     r0, r0, r12, lsl #3
        mov     r1, r4
        bl      _ipps_rDftFwd_Prime_64f
        ldr     r12, [sp, #0x20]
        subs    r6, r6, #1
        add     r10, r10, r12
        bne     LCNS20
        ldr     r11, [sp, #0x1C]
        ldr     r10, [sp, #0x18]
        ldr     r5, [sp, #0x14]
        ldr     r4, [sp, #0x24]
        ldr     r6, [sp, #0x10]
LCNS21:
        cmp     r9, #3
        beq     LCNS32
        cmp     r9, #5
        beq     LCNS31
        ldr     r12, [sp, #0x28]
        mul     lr, r9, r7
        cmp     r10, #0
        add     r12, r6, r12, lsl #3
        ldr     r12, [r12, #0x6C]
        ble     LCNS23
        str     r6, [sp, #0x10]
        ldr     r6, [sp, #0x2C]
        mov     r0, #0
        str     r5, [sp, #0x14]
        str     r12, [sp, #0x20]
        str     lr, [sp, #0x28]
        mov     r5, r0
LCNS22:
        str     r6, [sp, #8]
        str     r11, [sp, #4]
        ldr     r12, [sp, #0x20]
        add     r1, r4, r5, lsl #3
        add     r0, r8, r5, lsl #3
        str     r12, [sp]
        mov     r3, r7
        mov     r2, r9
        bl      _ipps_rDftFwd_Fact_64f
        ldr     r12, [sp, #0x28]
        subs    r10, r10, #1
        add     r5, r5, r12
        bne     LCNS22
        ldr     r5, [sp, #0x14]
        ldr     r6, [sp, #0x10]
LCNS23:
        mov     r3, r8
        ldr     r12, [sp, #0x34]
        sub     r5, r5, #1
        mov     r8, r4
        cmp     r5, r12
        mov     r4, r3
        ldrge   r12, [r6, #0x54]
        bge     LCNS19
        b       LCNS30
LCNS24:
        cmp     r3, r12
        bne     LCNS25
        ldr     r12, [r6, #0x58]
        cmp     r8, #3
        mov     lr, #1
        beq     LCNS34
        cmp     r8, #5
        beq     LCNS33
        add     r12, r6, r10, lsl #3
        ldr     r12, [r12, #0x84]
        str     r7, [sp, #8]
        str     r9, [sp]
        str     r12, [sp, #4]
        mov     r3, r8
        mov     r2, r4
        bl      _ipps_rDftFwd_Prime_64f
        b       LCNS27
LCNS25:
        cmp     r9, #0
        ble     LCNS27
        add     r12, r3, #1
        mov     r2, #0
        mov     r3, r2
        mov     r11, r9
        str     r9, [sp, #0x18]
        str     r10, [sp, #0x1C]
        str     r5, [sp, #0x20]
        str     r6, [sp, #0x10]
        str     r12, [sp, #0x14]
        mov     r5, r0
        mov     r6, r1
        mov     r10, r2
        mov     r9, r3
LCNS26:
        str     r7, [sp]
        ldr     r3, [sp, #0x14]
        ldr     r0, [sp, #0x10]
        add     r2, r4, r9, lsl #3
        add     r1, r5, r10, lsl #3
        bl      LCNS_rDftFwd_StepPrimeFact
        subs    r11, r11, #1
        add     r9, r9, r8
        add     r10, r10, r6
        bne     LCNS26
        ldr     r9, [sp, #0x18]
        ldr     r10, [sp, #0x1C]
        ldr     r5, [sp, #0x20]
        ldr     r6, [sp, #0x10]
LCNS27:
        add     r12, r6, r10, lsl #3
        ldr     r12, [r12, #0x70]
        cmp     r9, #3
        beq     LCNS36
        cmp     r9, #5
        beq     LCNS35
        add     r10, r6, r10, lsl #3
        ldr     lr, [r10, #0x6C]
        str     r12, [sp, #4]
        str     r7, [sp, #8]
        str     lr, [sp]
        mov     r3, r8
        mov     r2, r9
        mov     r1, r5
        mov     r0, r4
        bl      _ipps_rDftFwd_Fact_64f
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCNS28:
        str     r0, [sp, #4]
        str     r10, [sp]
        ldr     r0, [sp, #0x30]
        mov     r3, r9
        mov     r2, r8
        bl      _ipps_rDftFwd_Prime5_64f
        b       LCNS21
LCNS29:
        str     r0, [sp, #4]
        str     r10, [sp]
        ldr     r0, [sp, #0x30]
        mov     r3, r9
        mov     r2, r8
        bl      _ipps_rDftFwd_Prime3_64f
        b       LCNS21
LCNS30:
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCNS31:
        str     r11, [sp]
        mov     r3, r10
        mov     r2, r7
        mov     r1, r4
        mov     r0, r8
        bl      _ipps_rDftFwd_Fact5_64f
        b       LCNS23
LCNS32:
        str     r11, [sp]
        mov     r3, r10
        mov     r2, r7
        mov     r1, r4
        mov     r0, r8
        bl      _ipps_rDftFwd_Fact3_64f
        b       LCNS23
LCNS33:
        str     r12, [sp, #4]
        str     lr, [sp]
        mov     r3, r9
        mov     r2, r4
        bl      _ipps_rDftFwd_Prime5_64f
        b       LCNS27
LCNS34:
        str     r12, [sp, #4]
        str     lr, [sp]
        mov     r3, r9
        mov     r2, r4
        bl      _ipps_rDftFwd_Prime3_64f
        b       LCNS27
LCNS35:
        str     r12, [sp]
        mov     r2, r8
        mov     r1, r5
        mov     r0, r4
        mov     r3, #1
        bl      _ipps_rDftFwd_Fact5_64f
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCNS36:
        str     r12, [sp]
        mov     r2, r8
        mov     r1, r5
        mov     r0, r4
        mov     r3, #1
        bl      _ipps_rDftFwd_Fact3_64f
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}


