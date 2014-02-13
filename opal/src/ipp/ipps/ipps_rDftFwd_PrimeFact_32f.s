        .text
        .align  4
        .globl  _ipps_rDftFwd_PrimeFact_32f


_ipps_rDftFwd_PrimeFact_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x38
        mov     r6, r0
        ldr     r9, [r6, #0x58]
        ldr     r8, [r6, #0x5C]
        ldr     lr, [r6, #0x60]
        mov     r0, r1
        mov     r5, r2
        mul     r10, r9, r8
        mov     r4, r3
        cmp     r10, #0x7D, 28
        add     r7, r4, r10, lsl #2
        ldrgt   r12, [r6, #0x50]
        bgt     LCJH6
        ldr     r12, [r6, #0x50]
        cmp     r12, #0
        beq     LCJH6
        tst     r12, #1
        moveq   r8, r5
        beq     LCJH0
        cmp     r0, r5
        mov     r8, r4
        moveq   r4, r7
        addeq   r7, r7, r10, lsl #2
        movne   r4, r5
LCJH0:
        cmp     r12, #0
        mov     r9, r12
        blt     LCJH12
        str     r7, [sp, #0x10]
        str     r5, [sp, #0x18]
        str     r0, [sp, #0x34]
LCJH1:
        rsb     lr, r9, r9, lsl #2
        str     lr, [sp, #0x30]
        add     lr, r6, lr, lsl #3
        ldr     r7, [lr, #0x58]
        ldr     r5, [lr, #0x5C]
        ldr     r10, [lr, #0x64]
        ldr     r11, [lr, #0x6C]
        cmp     r9, r12
        bne     LCJH3
        rsb     lr, r12, r12, lsl #2
        ldr     r0, [r6, #0x54]
        add     r12, r6, lr, lsl #3
        ldr     r1, [r12, #0x60]
        cmp     r5, #3
        beq     LCJH11
        cmp     r5, #5
        beq     LCJH10
        mul     r12, r7, r5
        add     lr, r6, lr, lsl #3
        ldr     r2, [lr, #0x80]
        cmp     r10, #0
        ble     LCJH3
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
LCJH2:
        ldr     r12, [sp, #0x10]
        str     r11, [sp, #4]
        str     r7, [sp]
        str     r12, [sp, #8]
        ldr     r0, [sp, #0x34]
        ldr     r12, [r8], #4
        add     r2, r4, r10, lsl #2
        mov     r3, r5
        add     r0, r0, r12, lsl #2
        mov     r1, r6
        bl      _ipps_rDftFwd_Prime_32f
        ldr     r12, [sp, #0x14]
        subs    r9, r9, #1
        add     r10, r10, r12
        bne     LCJH2
        ldr     r11, [sp, #0x1C]
        ldr     r10, [sp, #0x20]
        ldr     r9, [sp, #0x24]
        ldr     r8, [sp, #0x28]
        ldr     r6, [sp, #0x2C]
LCJH3:
        cmp     r9, #0
        ldreq   r8, [sp, #0x18]
        cmp     r7, #3
        beq     LCJH14
        cmp     r7, #5
        beq     LCJH13
        ldr     r12, [sp, #0x30]
        mul     lr, r7, r5
        cmp     r10, #0
        add     r12, r6, r12, lsl #3
        ldr     r12, [r12, #0x68]
        ble     LCJH5
        str     r9, [sp, #0x24]
        ldr     r9, [sp, #0x10]
        mov     r0, #0
        str     r6, [sp, #0x2C]
        str     r12, [sp, #0x14]
        str     lr, [sp, #0x30]
        mov     r6, r0
LCJH4:
        str     r9, [sp, #8]
        str     r11, [sp, #4]
        ldr     r12, [sp, #0x14]
        add     r1, r8, r6, lsl #2
        add     r0, r4, r6, lsl #2
        str     r12, [sp]
        mov     r3, r5
        mov     r2, r7
        bl      _ipps_rDftFwd_Fact_32f
        ldr     r12, [sp, #0x30]
        subs    r10, r10, #1
        add     r6, r6, r12
        bne     LCJH4
        ldr     r9, [sp, #0x24]
        ldr     r6, [sp, #0x2C]
LCJH5:
        mov     r12, r4
        mov     r4, r8
        subs    r9, r9, #1
        mov     r8, r12
        ldrpl   r12, [r6, #0x50]
        bpl     LCJH1
        b       LCJH12
LCJH6:
        cmp     r12, #0
        bne     LCJH7
        ldr     r12, [r6, #0x54]
        cmp     r8, #3
        mov     r10, #1
        beq     LCJH16
        cmp     r8, #5
        beq     LCJH15
        ldr     r12, [r6, #0x80]
        str     r7, [sp, #8]
        str     r9, [sp]
        str     r12, [sp, #4]
        mov     r1, lr
        mov     r3, r8
        mov     r2, r4
        bl      _ipps_rDftFwd_Prime_32f
        b       LCJH9
LCJH7:
        cmp     r9, #0
        ble     LCJH9
        mov     r11, r9
        mov     r1, #0
        str     r7, [sp, #0x10]
        str     r9, [sp, #0x14]
        str     r5, [sp, #0x18]
        mov     r10, r1
        mov     r5, r0
        mov     r9, r1
        mov     r7, lr
LCJH8:
        ldr     r12, [sp, #0x10]
        add     r2, r4, r10, lsl #2
        add     r1, r5, r9, lsl #2
        str     r12, [sp]
        mov     r3, #1
        mov     r0, r6
        bl      LCJH_rDftFwd_StepPrimeFact
        subs    r11, r11, #1
        add     r10, r10, r8
        add     r9, r9, r7
        bne     LCJH8
        ldr     r7, [sp, #0x10]
        ldr     r9, [sp, #0x14]
        ldr     r5, [sp, #0x18]
LCJH9:
        ldr     r12, [r6, #0x6C]
        cmp     r9, #3
        beq     LCJH18
        cmp     r9, #5
        beq     LCJH17
        ldr     r6, [r6, #0x68]
        str     r12, [sp, #4]
        str     r7, [sp, #8]
        str     r6, [sp]
        mov     r3, r8
        mov     r2, r9
        mov     r1, r5
        mov     r0, r4
        bl      _ipps_rDftFwd_Fact_32f
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCJH10:
        str     r0, [sp, #4]
        str     r10, [sp]
        ldr     r0, [sp, #0x34]
        mov     r3, r7
        mov     r2, r4
        bl      _ipps_rDftFwd_Prime5_32f
        b       LCJH3
LCJH11:
        str     r0, [sp, #4]
        str     r10, [sp]
        ldr     r0, [sp, #0x34]
        mov     r3, r7
        mov     r2, r4
        bl      _ipps_rDftFwd_Prime3_32f
        b       LCJH3
LCJH12:
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCJH13:
        str     r11, [sp]
        mov     r3, r10
        mov     r2, r5
        mov     r1, r8
        mov     r0, r4
        bl      _ipps_rDftFwd_Fact5_32f
        b       LCJH5
LCJH14:
        str     r11, [sp]
        mov     r3, r10
        mov     r2, r5
        mov     r1, r8
        mov     r0, r4
        bl      _ipps_rDftFwd_Fact3_32f
        b       LCJH5
LCJH15:
        str     r12, [sp, #4]
        str     r10, [sp]
        mov     r1, lr
        mov     r3, r9
        mov     r2, r4
        bl      _ipps_rDftFwd_Prime5_32f
        b       LCJH9
LCJH16:
        str     r12, [sp, #4]
        str     r10, [sp]
        mov     r1, lr
        mov     r3, r9
        mov     r2, r4
        bl      _ipps_rDftFwd_Prime3_32f
        b       LCJH9
LCJH17:
        str     r12, [sp]
        mov     r2, r8
        mov     r1, r5
        mov     r0, r4
        mov     r3, #1
        bl      _ipps_rDftFwd_Fact5_32f
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCJH18:
        str     r12, [sp]
        mov     r2, r8
        mov     r1, r5
        mov     r0, r4
        mov     r3, #1
        bl      _ipps_rDftFwd_Fact3_32f
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCJH_rDftFwd_StepPrimeFact:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x38
        ldr     r4, [sp, #0x5C]
        mov     r6, r0
        mov     r0, r1
        rsb     r10, r3, r3, lsl #2
        mov     r5, r2
        add     r12, r6, r10, lsl #3
        ldr     r9, [r12, #0x58]
        ldr     r8, [r12, #0x5C]
        ldr     r1, [r12, #0x60]
        mul     r12, r9, r8
        cmp     r12, #0x7D, 28
        add     r7, r4, r12, lsl #2
        ldrgt   r12, [r6, #0x50]
        bgt     LCJH24
        ldr     r12, [r6, #0x50]
        cmp     r3, r12
        beq     LCJH24
        sub     lr, r12, r3
        tst     lr, #1
        moveq   r8, r4
        moveq   r4, r5
        movne   r8, r5
        cmp     r12, r3
        mov     r5, r12
        blt     LCJH30
        str     r7, [sp, #0x2C]
        str     r3, [sp, #0x34]
        str     r0, [sp, #0x30]
LCJH19:
        rsb     r3, r5, r5, lsl #2
        str     r3, [sp, #0x28]
        add     lr, r6, r3, lsl #3
        ldr     r9, [lr, #0x58]
        ldr     r7, [lr, #0x5C]
        ldr     r10, [lr, #0x64]
        ldr     r11, [lr, #0x6C]
        cmp     r5, r12
        bne     LCJH21
        rsb     lr, r12, r12, lsl #2
        ldr     r0, [r6, #0x54]
        add     r12, r6, lr, lsl #3
        ldr     r1, [r12, #0x60]
        cmp     r7, #3
        beq     LCJH29
        cmp     r7, #5
        beq     LCJH28
        mul     r12, r9, r7
        add     lr, r6, lr, lsl #3
        ldr     r2, [lr, #0x80]
        cmp     r10, #0
        ble     LCJH21
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
LCJH20:
        ldr     r12, [sp, #0x2C]
        str     r11, [sp, #4]
        str     r9, [sp]
        str     r12, [sp, #8]
        ldr     r0, [sp, #0x30]
        ldr     r12, [r5], #4
        add     r2, r8, r10, lsl #2
        mov     r3, r7
        add     r0, r0, r12, lsl #2
        mov     r1, r4
        bl      _ipps_rDftFwd_Prime_32f
        ldr     r12, [sp, #0x20]
        subs    r6, r6, #1
        add     r10, r10, r12
        bne     LCJH20
        ldr     r11, [sp, #0x1C]
        ldr     r10, [sp, #0x18]
        ldr     r5, [sp, #0x14]
        ldr     r4, [sp, #0x24]
        ldr     r6, [sp, #0x10]
LCJH21:
        cmp     r9, #3
        beq     LCJH32
        cmp     r9, #5
        beq     LCJH31
        ldr     r12, [sp, #0x28]
        mul     lr, r9, r7
        cmp     r10, #0
        add     r12, r6, r12, lsl #3
        ldr     r12, [r12, #0x68]
        ble     LCJH23
        str     r6, [sp, #0x10]
        ldr     r6, [sp, #0x2C]
        mov     r0, #0
        str     r5, [sp, #0x14]
        str     r12, [sp, #0x20]
        str     lr, [sp, #0x28]
        mov     r5, r0
LCJH22:
        str     r6, [sp, #8]
        str     r11, [sp, #4]
        ldr     r12, [sp, #0x20]
        add     r1, r4, r5, lsl #2
        add     r0, r8, r5, lsl #2
        str     r12, [sp]
        mov     r3, r7
        mov     r2, r9
        bl      _ipps_rDftFwd_Fact_32f
        ldr     r12, [sp, #0x28]
        subs    r10, r10, #1
        add     r5, r5, r12
        bne     LCJH22
        ldr     r5, [sp, #0x14]
        ldr     r6, [sp, #0x10]
LCJH23:
        mov     r3, r8
        ldr     r12, [sp, #0x34]
        sub     r5, r5, #1
        mov     r8, r4
        cmp     r5, r12
        mov     r4, r3
        ldrge   r12, [r6, #0x50]
        bge     LCJH19
        b       LCJH30
LCJH24:
        cmp     r3, r12
        bne     LCJH25
        ldr     r12, [r6, #0x54]
        cmp     r8, #3
        mov     lr, #1
        beq     LCJH34
        cmp     r8, #5
        beq     LCJH33
        add     r12, r6, r10, lsl #3
        ldr     r12, [r12, #0x80]
        str     r7, [sp, #8]
        str     r9, [sp]
        str     r12, [sp, #4]
        mov     r3, r8
        mov     r2, r4
        bl      _ipps_rDftFwd_Prime_32f
        b       LCJH27
LCJH25:
        cmp     r9, #0
        ble     LCJH27
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
LCJH26:
        str     r7, [sp]
        ldr     r3, [sp, #0x14]
        ldr     r0, [sp, #0x10]
        add     r2, r4, r9, lsl #2
        add     r1, r5, r10, lsl #2
        bl      LCJH_rDftFwd_StepPrimeFact
        subs    r11, r11, #1
        add     r9, r9, r8
        add     r10, r10, r6
        bne     LCJH26
        ldr     r9, [sp, #0x18]
        ldr     r10, [sp, #0x1C]
        ldr     r5, [sp, #0x20]
        ldr     r6, [sp, #0x10]
LCJH27:
        add     r12, r6, r10, lsl #3
        ldr     r12, [r12, #0x6C]
        cmp     r9, #3
        beq     LCJH36
        cmp     r9, #5
        beq     LCJH35
        add     r10, r6, r10, lsl #3
        ldr     lr, [r10, #0x68]
        str     r12, [sp, #4]
        str     r7, [sp, #8]
        str     lr, [sp]
        mov     r3, r8
        mov     r2, r9
        mov     r1, r5
        mov     r0, r4
        bl      _ipps_rDftFwd_Fact_32f
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCJH28:
        str     r0, [sp, #4]
        str     r10, [sp]
        ldr     r0, [sp, #0x30]
        mov     r3, r9
        mov     r2, r8
        bl      _ipps_rDftFwd_Prime5_32f
        b       LCJH21
LCJH29:
        str     r0, [sp, #4]
        str     r10, [sp]
        ldr     r0, [sp, #0x30]
        mov     r3, r9
        mov     r2, r8
        bl      _ipps_rDftFwd_Prime3_32f
        b       LCJH21
LCJH30:
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCJH31:
        str     r11, [sp]
        mov     r3, r10
        mov     r2, r7
        mov     r1, r4
        mov     r0, r8
        bl      _ipps_rDftFwd_Fact5_32f
        b       LCJH23
LCJH32:
        str     r11, [sp]
        mov     r3, r10
        mov     r2, r7
        mov     r1, r4
        mov     r0, r8
        bl      _ipps_rDftFwd_Fact3_32f
        b       LCJH23
LCJH33:
        str     r12, [sp, #4]
        str     lr, [sp]
        mov     r3, r9
        mov     r2, r4
        bl      _ipps_rDftFwd_Prime5_32f
        b       LCJH27
LCJH34:
        str     r12, [sp, #4]
        str     lr, [sp]
        mov     r3, r9
        mov     r2, r4
        bl      _ipps_rDftFwd_Prime3_32f
        b       LCJH27
LCJH35:
        str     r12, [sp]
        mov     r2, r8
        mov     r1, r5
        mov     r0, r4
        mov     r3, #1
        bl      _ipps_rDftFwd_Fact5_32f
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCJH36:
        str     r12, [sp]
        mov     r2, r8
        mov     r1, r5
        mov     r0, r4
        mov     r3, #1
        bl      _ipps_rDftFwd_Fact3_32f
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}


