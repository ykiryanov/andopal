        .text
        .align  4
        .globl  fma


fma:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        mov     r6, r0
        mov     r5, r2
        ldr     r7, [sp, #0x48]
        ldr     r4, [sp, #0x44]
        mov     lr, #0xFF
        orr     lr, lr, #3, 24
        mvn     r12, #2, 2
        add     lr, lr, #1, 22
        and     r10, r1, r12
        bic     r8, r1, r12
        str     r8, [sp, #8]
        cmp     lr, r10, lsr #20
        bic     lr, r3, r12
        str     lr, [sp, #0xC]
        bic     lr, r7, r12
        str     lr, [sp, #4]
        and     lr, r3, r12
        and     r12, r7, r12
        beq     LACT34
        mov     r8, #0xFF
        orr     r8, r8, #3, 24
        add     r8, r8, #1, 22
        cmp     r8, lr, lsr #20
        beq     LACT34
        mov     r8, #0xFF
        orr     r8, r8, #7, 24
        cmp     r8, r12, lsr #20
        beq     LACT33
LACT0:
        mvn     r8, #0xFF, 12
        bic     r11, r8, #0xF, 4
        and     r3, r3, r11
        and     r1, r1, r11
        and     r11, r7, r11
        orr     r9, r3, #1, 12
        orr     r3, r11, #1, 12
        mvn     r11, #0xFE
        bic     r11, r11, #3, 24
        rsb     r11, r11, #0
        mvn     r0, #0xFD, 30
        orr     r8, r1, #1, 12
        rsb     lr, r11, lr, lsr #20
        sub     r1, r0, #0xA
        rsb     r10, r11, r10, lsr #20
        mov     r0, r4, lsr #22
        str     lr, [sp, #0x18]
        mov     lr, r4, lsl #10
        orr     r3, r0, r3, lsl #10
        cmp     r1, r10
        rsb     r11, r11, r12, lsr #20
        str     lr, [sp, #0x10]
        str     r3, [sp, #0x14]
        beq     LACT28
        ldr     lr, [sp, #0x18]
        mvn     r3, #0xFD, 30
        sub     r3, r3, #0xA
        cmp     r3, lr
        beq     LACT23
        mvn     r3, #0xFD, 30
        sub     r3, r3, #0xA
        cmp     r3, r11
        beq     LACT18
LACT1:
        umull   r12, r3, r8, r9
        umull   r8, lr, r8, r5
        umull   r9, r0, r9, r6
        umull   r2, r5, r5, r6
        adds    lr, r12, lr
        adc     r3, r3, #0
        adds    r0, lr, r0
        adc     r3, r3, #0
        adds    r9, r8, r9
        mov     r12, #0
        adc     lr, r12, #0
        adds    r12, r9, r5
        adc     lr, lr, #0
        adds    r0, r0, lr
        adc     lr, r3, #0
        mov     r3, r12, lsr #10
        mov     r5, r0, lsr #10
        orr     r6, r5, lr, lsl #22
        orr     r5, r3, r0, lsl #22
        mov     r3, r2, lsr #10
        orrs    lr, r5, r6, lsl #1
        mov     r8, r2, lsl #22
        ldr     r2, [sp, #0x18]
        tstcs   lr, #0
        orr     r9, r3, r12, lsl #22
        add     r10, r10, r2
        beq     LACT17
LACT2:
        ldr     r3, [sp, #0xC]
        ldr     r2, [sp, #8]
        cmp     r11, #1, 22
        eor     r3, r2, r3
        str     r3, [sp, #0x18]
        beq     LACT43
        cmp     r10, r11
        mov     r3, #0x40
        ble     LACT3
        sub     r2, r10, r11
        ldr     r0, [sp, #0x10]
        ldr     r1, [sp, #0x14]
        cmp     r2, #0x40
        movgt   r2, r3
        mov     r3, r2, asr #31
        bl      __lshrdi3
        str     r0, [sp, #0x10]
        str     r1, [sp, #0x14]
        b       LACT4
LACT3:
        sub     r4, r11, r10
        cmp     r4, #0x40
        movgt   r4, r3
        mov     r0, r5
        mov     r7, r4, asr #31
        mov     r1, r6
        mov     r2, r4
        mov     r3, r7
        bl      __lshrdi3
        rsb     r2, r4, #0x40
        mov     r5, r0
        mov     r3, r2, asr #31
        mov     r6, r1
        bl      __ashldi3
        str     r0, [sp, #0xC]
        mov     r10, r11
        mov     r11, r1
        mov     r0, r8
        mov     r1, r9
        mov     r2, r4
        mov     r3, r7
        bl      __lshrdi3
        ldr     r2, [sp, #0xC]
        orr     r8, r2, r0
        orr     r9, r11, r1
LACT4:
        ldr     r3, [sp, #4]
        ldr     r2, [sp, #0x18]
        cmp     r2, r3
        bne     LACT5
        ldr     r2, [sp, #0x10]
        adds    r0, r5, r2
        ldr     r2, [sp, #0x14]
        adc     r1, r6, r2
        b       LACT9
LACT5:
        ldr     r2, [sp, #0x18]
        cmp     r2, #2, 2
        bne     LACT7
        orrs    r2, r8, r9
        beq     LACT6
        adds    r5, r5, #1
        adc     r6, r6, #0
LACT6:
        ldr     r2, [sp, #0x10]
        subs    r0, r2, r5
        ldr     r2, [sp, #0x14]
        sbc     r1, r2, r6
        rsbs    r8, r8, #0
        rsc     r9, r9, #0
        b       LACT8
LACT7:
        ldr     r2, [sp, #0x10]
        subs    r0, r5, r2
        ldr     r2, [sp, #0x14]
        sbc     r1, r6, r2
LACT8:
        tst     r1, r1
        movpl   r2, #0
        strpl   r2, [sp, #0x18]
        bmi     LACT15
LACT9:
        mov     r12, r1
        cmp     r12, #0
        mov     r5, #0
        bne     LACT10
        mov     r12, r0
        mov     r2, r9
        mov     r1, r0
        mov     r9, r8
        cmp     r12, #0
        mov     r0, r2
        mov     r8, #0
        mov     r5, #0x20
        bne     LACT10
        mov     r3, r9
        mov     r12, r2
        mov     r1, r0
        mov     r9, #0
        cmp     r12, #0
        mov     r0, r3
        mov     r8, r9
        mov     r5, #0x40
        bne     LACT10
        mov     r1, r0
        mov     r0, #0
        mov     r9, r0
        cmp     r3, #0
        mov     r12, r3
        mov     r8, r9
        mov     r5, #0x60
        bne     LACT10
        mov     r0, #0
        mov     r1, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LACT10:
        clz     r4, r12
        cmp     r4, #0
        bne     LACT11
        mov     r2, r1, lsl #31
        sub     r10, r10, r5
        orr     r0, r2, r0, lsr #1
        add     r2, r10, #1
        mov     r1, r1, lsr #1
        b       LACT12
LACT11:
        sub     r2, r4, #1
        mov     r3, #0
        bl      __ashldi3
        rsb     r2, r4, #0x41
        mov     r6, r0
        mov     r7, r1
        mov     r0, r8
        mov     r1, r9
        mov     r3, #0
        bl      __lshrdi3
        add     r5, r4, r5
        sub     r10, r10, r5
        orr     r0, r6, r0
        orr     r1, r7, r1
        add     r2, r10, #1
LACT12:
        mvn     r12, #0xFD, 30
        sub     r3, r12, #0xA
        cmp     r3, r2
        blt     LACT13
        rsb     r2, r2, r12
        mov     r3, r2, asr #31
        bl      __ashrdi3
        and     r2, r0, #1
        mov     r3, r1, lsl #31
        orr     r0, r3, r0, lsr #1
        adds    r0, r0, r2
        ldr     r2, [sp, #0x18]
        mov     r1, r1, asr #1
        adc     r1, r1, #0
        orr     r1, r2, r1
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LACT13:
        mov     r3, #0xFF
        orr     r3, r3, #3, 24
        cmp     r3, r2
        bge     LACT14
        ldr     r1, [sp, #0x18]
        mov     r0, #0xFF
        orr     r0, r0, #7, 24
        orr     r1, r1, r0, lsl #20
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LACT14:
        mov     r3, r1, lsl #23
        orr     r0, r3, r0, lsr #9
        mov     r3, r1, asr #9
        mov     r1, r1, asr #10
        mov     r3, r3, lsl #31
        orr     r3, r3, r0, lsr #1
        and     r0, r0, #1
        adds    r0, r3, r0
        mvn     r3, #0xFE
        bic     r3, r3, #3, 24
        mvn     r3, r3
        add     r3, r2, r3
        adc     r1, r1, #0
        adds    r3, r1, r3, lsl #20
        ldr     r1, [sp, #0x18]
        orr     r1, r1, r3
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LACT15:
        mov     r2, #2, 2
        orrs    r3, r8, r9
        str     r2, [sp, #0x18]
        beq     LACT16
        adds    r0, r0, #1
        adc     r1, r1, #0
LACT16:
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        rsbs    r8, r8, #0
        rsc     r9, r9, #0
        b       LACT9
LACT17:
        mov     r12, r6, lsl #31
        mov     r3, r5, lsl #31
        orr     r5, r12, r5, lsr #1
        mov     r2, r9, lsl #31
        mov     r6, r6, lsr #1
        orrs    r12, r5, r6
        add     r10, r10, #1
        orr     r8, r2, r8, lsr #1
        orr     r9, r3, r9, lsr #1
        bne     LACT2
        mov     r0, r4
        mov     r1, r7
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LACT18:
        mvn     r3, #0xFF, 12
        bic     r3, r3, #0xF, 4
        ands    r3, r12, r3
        str     r3, [sp]
        beq     LACT19
        ldr     r0, [sp]
        mov     r1, #0
        clz     r3, r0
        str     r3, [sp, #0x14]
        add     r2, r3, #0x1F
        mov     r3, #0
        bl      __ashldi3
        ldr     r3, [sp, #0x14]
        str     r0, [sp, #0x10]
        str     r1, [sp, #0x1C]
        sub     r2, r3, #1
        mov     r0, r4
        mov     r1, #0
        mov     r3, #0
        bl      __ashldi3
        ldr     r3, [sp, #0x14]
        sub     r11, r11, r3
        ldr     r3, [sp, #0x10]
        add     r11, r11, #0xC
        orr     r0, r3, r0
        ldr     r3, [sp, #0x1C]
        str     r0, [sp, #0x10]
        orr     r1, r3, r1
        str     r1, [sp, #0x14]
        b       LACT20
LACT19:
        clz     r3, r4
        str     r3, [sp, #0x1C]
        add     r2, r3, #0x1F
        mov     r0, r4
        mov     r1, #0
        mov     r3, #0
        bl      __ashldi3
        ldr     r3, [sp, #0x1C]
        sub     r11, r11, r3
        cmp     r4, #0
        str     r0, [sp, #0x10]
        str     r1, [sp, #0x14]
        sub     r11, r11, #0x14
        moveq   r3, #0
        subeq   r11, r3, #1, 20
LACT20:
        ldr     r3, [sp]
        orrs    r3, r3, r4
        bne     LACT1
        orrs    r3, r9, r5
        beq     LACT21
        orrs    r3, r8, r6
        bne     LACT1
LACT21:
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #0xC]
        eor     r2, r2, r3
        ldr     r3, [sp, #4]
        cmp     r3, r2
        bne     LACT22
        mov     r0, r4
        mov     r1, r7
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LACT22:
        mov     r0, #0
        mov     r1, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LACT23:
        mvn     r3, #0xFF, 12
        bic     r3, r3, #0xF, 4
        ands    r9, r9, r3
        bne     LACT26
        clz     r3, r5
        cmp     r3, #0xB
        bcc     LACT24
        sub     lr, r3, #0xB
        mov     r9, r5, lsl lr
        mov     r5, #0
        b       LACT25
LACT24:
        rsb     lr, r3, #0xB
        mov     r9, r5, lsr lr
        add     lr, r3, #0x15
        mov     r5, r5, lsl lr
LACT25:
        ldr     lr, [sp, #0x18]
        sub     lr, lr, r3
        sub     r3, lr, #0x14
        str     r3, [sp, #0x18]
        b       LACT27
LACT26:
        clz     lr, r9
        sub     r3, lr, #0xB
        rsb     r0, lr, #0x2B
        str     r3, [sp, #0x1C]
        mov     r3, r5, lsr r0
        ldr     r0, [sp, #0x18]
        sub     lr, r0, lr
        ldr     r0, [sp, #0x1C]
        add     lr, lr, #0xC
        str     lr, [sp, #0x18]
        orr     r9, r3, r9, lsl r0
        mov     r5, r5, lsl r0
LACT27:
        mvn     r3, #0xFD, 30
        sub     r3, r3, #0xA
        cmp     r3, r11
        beq     LACT18
        b       LACT1
LACT28:
        mvn     r3, #0xFF, 12
        bic     r3, r3, #0xF, 4
        ands    r8, r8, r3
        beq     LACT29
        clz     lr, r8
        sub     r3, lr, #0xB
        str     r3, [sp, #0x1C]
        rsb     r0, lr, #0x2B
        sub     r10, r10, lr
        ldr     lr, [sp, #0x1C]
        mov     r3, r6, lsr r0
        add     r10, r10, #0xC
        orr     r8, r3, r8, lsl lr
        ldr     r3, [sp, #0x18]
        mov     r6, r6, lsl lr
        b       LACT32
LACT29:
        clz     r3, r6
        cmp     r3, #0xB
        bcc     LACT30
        sub     lr, r3, #0xB
        mov     r8, r6, lsl lr
        mov     r6, #0
        b       LACT31
LACT30:
        rsb     lr, r3, #0xB
        mov     r8, r6, lsr lr
        add     lr, r3, #0x15
        mov     r6, r6, lsl lr
LACT31:
        sub     r10, r10, r3
        ldr     r3, [sp, #0x18]
        sub     r10, r10, #0x14
LACT32:
        mvn     lr, #0xFE
        bic     lr, lr, #3, 24
        cmp     lr, r3
        beq     LACT23
        b       LACT27
LACT33:
        mvn     r8, #0xFF, 12
        bic     r8, r8, #0xF, 4
        tst     r12, r8
        bne     LACT34
        cmp     r4, #0
        beq     LACT0
LACT34:
        mov     r1, #0xFF
        orr     r3, r1, #7, 24
        mov     r7, #0
        subs    r1, r6, r7
        sbcs    r8, r10, r3, lsl #20
        movlt   r1, #0
        movlt   r8, #0
        orrs    r8, r1, r8
        bne     LACT38
        subs    r1, r5, r7
        sbcs    r8, lr, r3, lsl #20
        movlt   r1, #0
        movlt   r8, #0
        orrs    r8, r1, r8
        bne     LACT38
        subs    r1, r4, r7
        sbcs    r8, r12, r3, lsl #20
        movlt   r1, #0
        movlt   r8, #0
        orrs    r8, r1, r8
        bne     LACT39
        cmp     r10, r3, lsl #20
        mov     r1, #0
        cmpeq   r6, r1
        beq     LACT42
        cmp     lr, r3, lsl #20
        cmpeq   r5, r1
        bne     LACT37
        orrs    r10, r6, r10
        ldr     r1, [sp, #8]
        ldr     r6, [sp, #0xC]
        eor     r8, r1, r6
        moveq   r5, #0
        subeq   r1, r5, #2, 14
        orrne   r1, lr, r8
LACT35:
        ldr     lr, [sp, #4]
        cmp     lr, r8
        beq     LACT36
        cmp     r12, r3, lsl #20
        cmpeq   r4, r7
        subeq   r1, r7, #2, 14
        moveq   r5, #0
LACT36:
        mov     r0, r5
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LACT37:
        ldr     r1, [sp, #4]
        mov     r0, r4
        orr     r1, r1, r12
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LACT38:
        subs    r1, r4, r7
        sbcs    r3, r12, r3, lsl #20
        movlt   r1, #0
        movlt   r3, #0
        orrs    r3, r1, r3
        beq     LACT40
LACT39:
        ldr     r1, [sp, #4]
        orr     r12, r12, #2, 14
        mov     r0, r4
        orr     r1, r1, r12
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LACT40:
        mvn     r1, #0xFD, 30
        sub     r1, r1, #0xA
        rsb     r1, r1, #0
        subs    r7, r5, r7
        add     r1, r1, #1, 22
        sbcs    r1, lr, r1, lsl #20
        movlt   r7, #0
        movlt   r1, #0
        orrs    r1, r7, r1
        beq     LACT41
        ldr     r1, [sp, #0xC]
        mov     r0, r5
        orr     lr, r1, lr
        orr     r1, lr, #2, 14
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LACT41:
        ldr     r1, [sp, #8]
        mov     r0, r6
        orr     r10, r1, r10
        orr     r1, r10, #2, 14
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LACT42:
        ldr     r1, [sp, #8]
        ldr     r2, [sp, #0xC]
        orrs    lr, r5, lr
        eor     r8, r1, r2
        moveq   r5, #0
        subeq   r1, r7, #2, 14
        movne   r5, r6
        orrne   r1, r10, r8
        b       LACT35
LACT43:
        mov     r0, r4
        mov     r1, r7
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}


