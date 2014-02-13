        .text
        .align  4
        .globl  _ipps_rDftInv_PrimeFact_32f


_ipps_rDftInv_PrimeFact_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x34
        mov     r5, r0
        ldr     r11, [r5, #0x58]
        ldr     r7, [r5, #0x5C]
        ldr     r8, [r5, #0x60]
        mov     r0, r1
        mov     r9, r2
        mul     lr, r11, r7
        mov     r4, r3
        mov     r6, #0
        cmp     lr, #0x7D, 28
        add     r10, r4, lr, lsl #2
        bgt     LCJA7
        ldr     r12, [r5, #0x50]
        cmp     r12, #0
        beq     LCJA7
        tst     r12, #1
        moveq   r8, r9
        beq     LCJA0
        cmp     r0, r9
        mov     r8, r4
        moveq   r4, r10
        addeq   r10, r10, lr, lsl #2
        movne   r4, r9
LCJA0:
        cmp     r12, #0
        blt     LCJA6
        mov     r7, r5
        str     r10, [sp, #0x30]
        str     r9, [sp, #0x10]
LCJA1:
        ldr     r10, [r7, #0x58]
        ldr     r9, [r7, #0x5C]
        ldr     r11, [r7, #0x64]
        ldr     r1, [r7, #0x6C]
        cmp     r10, #3
        beq     LCJA15
        cmp     r10, #5
        beq     LCJA14
        mul     r2, r10, r9
        ldr     lr, [r7, #0x68]
        cmp     r11, #0
        ble     LCJA3
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
LCJA2:
        str     r11, [sp, #8]
        str     r8, [sp, #4]
        ldr     lr, [sp, #0x2C]
        add     r1, r4, r7, lsl #2
        add     r0, r5, r7, lsl #2
        str     lr, [sp]
        mov     r3, r9
        mov     r2, r10
        bl      _ipps_rDftInv_Fact_32f
        ldr     lr, [sp, #0x28]
        subs    r6, r6, #1
        add     r7, r7, lr
        bne     LCJA2
        ldr     r5, [sp, #0x14]
        ldr     r11, [sp, #0x24]
        ldr     r7, [sp, #0x20]
        ldr     r8, [sp, #0x1C]
        ldr     r6, [sp, #0x18]
        ldr     r12, [r5, #0x50]
LCJA3:
        cmp     r6, r12
        bne     LCJA5
        rsb     lr, r12, r12, lsl #2
        ldr     r0, [r5, #0x54]
        add     r1, r5, lr, lsl #3
        ldr     r1, [r1, #0x60]
        cmp     r9, #3
        beq     LCJA13
        cmp     r9, #5
        beq     LCJA12
        mul     r2, r10, r9
        add     lr, r5, lr, lsl #3
        ldr     lr, [lr, #0x80]
        cmp     r11, #0
        ble     LCJA5
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
LCJA4:
        ldr     r12, [sp, #0x30]
        add     r0, r4, r7, lsl #2
        mov     r3, r9
        str     r12, [sp, #8]
        ldr     r12, [sp, #0x2C]
        str     r10, [sp]
        mov     r1, r5
        str     r12, [sp, #4]
        ldr     lr, [r6], #4
        ldr     r12, [sp, #0x10]
        add     r2, r12, lr, lsl #2
        bl      _ipps_rDftInv_Prime_32f
        subs    r11, r11, #1
        add     r7, r7, r8
        bne     LCJA4
        ldr     r5, [sp, #0x14]
        ldr     r7, [sp, #0x20]
        ldr     r8, [sp, #0x1C]
        ldr     r6, [sp, #0x18]
        ldr     r12, [r5, #0x50]
LCJA5:
        mov     r0, r4
        add     r6, r6, #1
        mov     r4, r8
        cmp     r6, r12
        add     r7, r7, #0x18
        mov     r8, r0
        ble     LCJA1
LCJA6:
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LCJA7:
        ldr     lr, [r5, #0x6C]
        cmp     r11, #3
        beq     LCJA19
        cmp     r11, #5
        beq     LCJA18
        ldr     r12, [r5, #0x68]
        str     lr, [sp, #4]
        str     r10, [sp, #8]
        str     r12, [sp]
        mov     r3, r7
        mov     r2, r11
        mov     r1, r4
        bl      _ipps_rDftInv_Fact_32f
LCJA8:
        ldr     r12, [r5, #0x50]
        cmp     r12, #0
        bne     LCJA9
        ldr     r12, [r5, #0x54]
        cmp     r7, #3
        mov     lr, #1
        beq     LCJA17
        cmp     r7, #5
        beq     LCJA16
        ldr     r5, [r5, #0x80]
        str     r10, [sp, #8]
        str     r11, [sp]
        str     r5, [sp, #4]
        mov     r3, r7
        mov     r2, r9
        mov     r1, r8
        mov     r0, r4
        bl      _ipps_rDftInv_Prime_32f
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LCJA9:
        cmp     r11, #0
        ble     LCJA11
        mov     r0, r6
        str     r9, [sp, #0x10]
        mov     r1, r0
        str     r5, [sp, #0x14]
        mov     r9, r6
        mov     r6, r0
        mov     r5, r1
LCJA10:
        str     r10, [sp]
        ldr     r12, [sp, #0x10]
        ldr     r0, [sp, #0x14]
        add     r1, r4, r9, lsl #2
        add     r2, r12, r5, lsl #2
        mov     r3, #1
        bl      LCJA_rDftInv_StepPrimeFact
        add     r6, r6, #1
        cmp     r6, r11
        add     r5, r5, r8
        add     r9, r9, r7
        blt     LCJA10
LCJA11:
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LCJA12:
        str     r0, [sp, #4]
        str     r11, [sp]
        ldr     r2, [sp, #0x10]
        mov     r3, r10
        mov     r0, r4
        bl      _ipps_rDftInv_Prime5_32f
        ldr     r12, [r5, #0x50]
        b       LCJA5
LCJA13:
        str     r0, [sp, #4]
        str     r11, [sp]
        ldr     r2, [sp, #0x10]
        mov     r3, r10
        mov     r0, r4
        bl      _ipps_rDftInv_Prime3_32f
        ldr     r12, [r5, #0x50]
        b       LCJA5
LCJA14:
        str     r1, [sp]
        mov     r3, r11
        mov     r2, r9
        mov     r1, r4
        bl      _ipps_rDftInv_Fact5_32f
        ldr     r12, [r5, #0x50]
        b       LCJA3
LCJA15:
        str     r1, [sp]
        mov     r3, r11
        mov     r2, r9
        mov     r1, r4
        bl      _ipps_rDftInv_Fact3_32f
        ldr     r12, [r5, #0x50]
        b       LCJA3
LCJA16:
        str     r12, [sp, #4]
        str     lr, [sp]
        mov     r3, r11
        mov     r2, r9
        mov     r1, r8
        mov     r0, r4
        bl      _ipps_rDftInv_Prime5_32f
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LCJA17:
        str     r12, [sp, #4]
        str     lr, [sp]
        mov     r3, r11
        mov     r2, r9
        mov     r1, r8
        mov     r0, r4
        bl      _ipps_rDftInv_Prime3_32f
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LCJA18:
        str     lr, [sp]
        mov     r3, #1
        mov     r2, r7
        mov     r1, r4
        bl      _ipps_rDftInv_Fact5_32f
        b       LCJA8
LCJA19:
        str     lr, [sp]
        mov     r3, #1
        mov     r2, r7
        mov     r1, r4
        bl      _ipps_rDftInv_Fact3_32f
        b       LCJA8
LCJA_rDftInv_StepPrimeFact:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x38
        mov     r7, r3
        mov     r8, r0
        ldr     r4, [sp, #0x5C]
        rsb     r11, r7, r7, lsl #2
        mov     r0, r1
        mov     r5, r2
        add     r12, r8, r11, lsl #3
        ldr     r10, [r12, #0x58]
        ldr     r9, [r12, #0x5C]
        ldr     r12, [r12, #0x60]
        str     r12, [sp, #0x1C]
        mul     r12, r10, r9
        cmp     r12, #0x7D, 28
        add     r6, r4, r12, lsl #2
        bgt     LCJA26
        ldr     r12, [r8, #0x50]
        cmp     r7, r12
        beq     LCJA26
        cmp     r7, r12
        mov     r10, r0
        bgt     LCJA25
        rsb     lr, r7, r7, lsl #2
        str     r6, [sp, #0x34]
        add     r9, r8, lr, lsl #3
        str     r5, [sp, #0x14]
LCJA20:
        ldr     r6, [r9, #0x58]
        ldr     r5, [r9, #0x5C]
        ldr     r11, [r9, #0x64]
        ldr     r1, [r9, #0x6C]
        cmp     r6, #3
        beq     LCJA34
        cmp     r6, #5
        beq     LCJA33
        mul     r2, r6, r5
        ldr     lr, [r9, #0x68]
        cmp     r11, #0
        ble     LCJA22
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
LCJA21:
        str     r11, [sp, #8]
        str     r10, [sp, #4]
        ldr     lr, [sp, #0x30]
        add     r1, r4, r9, lsl #2
        add     r0, r7, r9, lsl #2
        str     lr, [sp]
        mov     r3, r5
        mov     r2, r6
        bl      _ipps_rDftInv_Fact_32f
        ldr     lr, [sp, #0x2C]
        subs    r8, r8, #1
        add     r9, r9, lr
        bne     LCJA21
        ldr     r8, [sp, #0x18]
        ldr     r11, [sp, #0x28]
        ldr     r9, [sp, #0x24]
        ldr     r10, [sp, #0x1C]
        ldr     r7, [sp, #0x20]
        ldr     r12, [r8, #0x50]
LCJA22:
        cmp     r7, r12
        bne     LCJA24
        rsb     lr, r12, r12, lsl #2
        ldr     r0, [r8, #0x54]
        add     r1, r8, lr, lsl #3
        ldr     r1, [r1, #0x60]
        cmp     r5, #3
        beq     LCJA32
        cmp     r5, #5
        beq     LCJA31
        mul     r2, r6, r5
        add     lr, r8, lr, lsl #3
        ldr     lr, [lr, #0x80]
        cmp     r11, #0
        ble     LCJA24
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
LCJA23:
        ldr     r12, [sp, #0x34]
        add     r0, r4, r9, lsl #2
        mov     r3, r5
        str     r12, [sp, #8]
        ldr     r12, [sp, #0x30]
        str     r7, [sp]
        mov     r1, r6
        str     r12, [sp, #4]
        ldr     lr, [r8], #4
        ldr     r12, [sp, #0x14]
        add     r2, r12, lr, lsl #2
        bl      _ipps_rDftInv_Prime_32f
        subs    r11, r11, #1
        add     r9, r9, r10
        bne     LCJA23
        ldr     r8, [sp, #0x18]
        ldr     r9, [sp, #0x24]
        ldr     r10, [sp, #0x1C]
        ldr     r7, [sp, #0x20]
        ldr     r12, [r8, #0x50]
LCJA24:
        mov     r0, r4
        add     r7, r7, #1
        mov     r4, r10
        cmp     r7, r12
        add     r9, r9, #0x18
        mov     r10, r0
        ble     LCJA20
LCJA25:
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCJA26:
        add     r12, r8, r11, lsl #3
        ldr     r12, [r12, #0x6C]
        cmp     r10, #3
        beq     LCJA38
        cmp     r10, #5
        beq     LCJA37
        add     lr, r8, r11, lsl #3
        ldr     lr, [lr, #0x68]
        str     r12, [sp, #4]
        str     r6, [sp, #8]
        str     lr, [sp]
        mov     r3, r9
        mov     r2, r10
        mov     r1, r4
        bl      _ipps_rDftInv_Fact_32f
LCJA27:
        ldr     r12, [r8, #0x50]
        cmp     r7, r12
        bne     LCJA28
        ldr     r12, [r8, #0x54]
        cmp     r9, #3
        mov     lr, #1
        beq     LCJA36
        cmp     r9, #5
        beq     LCJA35
        add     r11, r8, r11, lsl #3
        ldr     r12, [r11, #0x80]
        str     r6, [sp, #8]
        str     r10, [sp]
        str     r12, [sp, #4]
        ldr     r1, [sp, #0x1C]
        mov     r3, r9
        mov     r2, r5
        mov     r0, r4
        bl      _ipps_rDftInv_Prime_32f
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCJA28:
        cmp     r10, #0
        ble     LCJA30
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
LCJA29:
        str     r6, [sp]
        ldr     r1, [sp, #0x14]
        ldr     r0, [sp, #0x18]
        mov     r3, r4
        add     r2, r1, r7, lsl #2
        ldr     r1, [sp, #0x10]
        add     r1, r1, r5, lsl #2
        bl      LCJA_rDftInv_StepPrimeFact
        add     r11, r11, #1
        cmp     r11, r10
        add     r7, r7, r8
        add     r5, r5, r9
        blt     LCJA29
LCJA30:
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCJA31:
        str     r0, [sp, #4]
        str     r11, [sp]
        ldr     r2, [sp, #0x14]
        mov     r3, r6
        mov     r0, r4
        bl      _ipps_rDftInv_Prime5_32f
        ldr     r12, [r8, #0x50]
        b       LCJA24
LCJA32:
        str     r0, [sp, #4]
        str     r11, [sp]
        ldr     r2, [sp, #0x14]
        mov     r3, r6
        mov     r0, r4
        bl      _ipps_rDftInv_Prime3_32f
        ldr     r12, [r8, #0x50]
        b       LCJA24
LCJA33:
        str     r1, [sp]
        mov     r3, r11
        mov     r2, r5
        mov     r1, r4
        bl      _ipps_rDftInv_Fact5_32f
        ldr     r12, [r8, #0x50]
        b       LCJA22
LCJA34:
        str     r1, [sp]
        mov     r3, r11
        mov     r2, r5
        mov     r1, r4
        bl      _ipps_rDftInv_Fact3_32f
        ldr     r12, [r8, #0x50]
        b       LCJA22
LCJA35:
        str     r12, [sp, #4]
        str     lr, [sp]
        ldr     r1, [sp, #0x1C]
        mov     r3, r10
        mov     r2, r5
        mov     r0, r4
        bl      _ipps_rDftInv_Prime5_32f
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCJA36:
        str     r12, [sp, #4]
        str     lr, [sp]
        ldr     r1, [sp, #0x1C]
        mov     r3, r10
        mov     r2, r5
        mov     r0, r4
        bl      _ipps_rDftInv_Prime3_32f
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCJA37:
        str     r12, [sp]
        mov     r3, #1
        mov     r2, r9
        mov     r1, r4
        bl      _ipps_rDftInv_Fact5_32f
        b       LCJA27
LCJA38:
        str     r12, [sp]
        mov     r3, #1
        mov     r2, r9
        mov     r1, r4
        bl      _ipps_rDftInv_Fact3_32f
        b       LCJA27


