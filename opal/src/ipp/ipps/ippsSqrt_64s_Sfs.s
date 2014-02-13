        .text
        .align  4
        .globl  _ippsSqrt_64s_Sfs


_ippsSqrt_64s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x44
        mov     r5, r0
        cmp     r5, #0
        mov     r6, r1
        mov     r7, r2
        mov     r4, r3
        beq     LAVN44
        cmp     r6, #0
        beq     LAVN44
        cmp     r7, #0
        ble     LAVN45
        cmp     r4, #0
        mov     r8, #0
        blt     LAVN10
        cmp     r4, #0
        bne     LAVN3
        cmp     r7, #0
        ble     LAVN32
        mov     r9, r7
        mov     r7, r6
        mov     r0, #0
        mov     r6, r5
        mov     r4, r0
        mov     r5, r0
LAVN0:
        ldr     r10, [r6, #4]
        ldr     r11, [r6]
        tst     r10, r10
        bmi     LAVN31
        mov     r0, r11
        mov     r1, r10
        bl      __floatdidf
        bl      sqrt
        bl      __fixunsdfdi
        umull   r3, r12, r0, r0
        mla     r12, r0, r1, r12
        adds    r3, r3, r0
        mla     r12, r1, r0, r12
        adc     r12, r12, r1
        cmp     r10, r12
        cmpeq   r11, r3
        bls     LAVN1
        adds    r0, r0, #1
        adc     r1, r1, #0
LAVN1:
        str     r0, [r7]
        str     r1, [r7, #4]
LAVN2:
        add     r4, r4, #1
        cmp     r4, r9
        add     r7, r7, #8
        add     r6, r6, #8
        blt     LAVN0
        mov     r0, r5
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LAVN3:
        cmp     r4, #0x20
        bgt     LAVN8
        mov     r3, r4, asr #31
        mvn     r0, #0
        mvn     r1, #2, 2
        mov     r2, r4
        bl      __ashldi3
        sub     r2, r4, #1
        mov     r10, r0
        mov     r3, r2, asr #31
        mov     r9, r1
        mov     r0, #1
        mov     r1, #0
        bl      __ashldi3
        cmp     r7, #0
        mov     r2, r0
        ble     LAVN34
        mov     r0, #0
        mov     r11, r0
        str     r0, [sp]
        str     r1, [sp, #0xC]
        str     r2, [sp, #0x18]
        str     r9, [sp, #0x10]
        str     r10, [sp, #0x1C]
        str     r4, [sp, #0x20]
LAVN4:
        ldr     r4, [r5, #4]
        ldr     r8, [r5]
        tst     r4, r4
        bmi     LAVN33
        mov     r0, r8
        mov     r1, r4
        bl      __floatdidf
        bl      sqrt
        bl      __fixunsdfdi
        ldr     r3, [sp, #0x1C]
        ldr     r12, [sp, #0x18]
        and     r3, r0, r3
        ldr     r10, [sp, #0xC]
        adds    lr, r12, r3
        ldr     r12, [sp, #0x10]
        umull   r9, r3, lr, lr
        ldr     r2, [sp, #0x20]
        and     r12, r1, r12
        adc     r10, r10, r12
        mla     r12, lr, r10, r3
        mov     r3, #0
        mla     r10, r10, lr, r12
        bl      __lshrdi3
        cmp     r10, r4
        cmpeq   r9, r8
        bcc     LAVN5
        cmp     r10, r4
        cmpeq   r9, r8
        bne     LAVN6
        and     r3, r0, #1
        orrs    r3, r3, #0
        beq     LAVN6
LAVN5:
        adds    r0, r0, #1
        adc     r1, r1, #0
LAVN6:
        str     r0, [r6]
        str     r1, [r6, #4]
LAVN7:
        add     r11, r11, #1
        cmp     r11, r7
        add     r6, r6, #8
        add     r5, r5, #8
        blt     LAVN4
        ldr     r0, [sp]
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LAVN8:
        cmp     r7, #0
        ble     LAVN35
        mov     r0, #0
        sub     r6, r6, #4
        mov     r3, r0
LAVN9:
        ldr     r1, [r5, #4]
        tst     r1, r1
        movmi   r0, #3
        add     r3, r3, #1
        str     r8, [r6, #4]
        str     r8, [r6, #8]!
        cmp     r3, r7
        add     r5, r5, #8
        blt     LAVN9
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LAVN10:
        rsb     r4, r4, #0
        cmp     r4, #0x3F
        mvn     r11, #0
        mvn     r10, #2, 2
        bge     LAVN28
        cmp     r4, #0x20
        bge     LAVN21
        cmp     r4, #0x15
        bgt     LAVN14
        mov     r8, r4, asr #31
        mov     r0, #1
        mov     r1, #0
        mov     r2, r4
        mov     r3, r8
        bl      __ashldi3
        bl      __floatdidf
        mov     r10, r0
        mov     r9, r1
        mvn     r0, #0
        mvn     r1, #2, 2
        mov     r2, r4
        mov     r3, r8
        bl      __ashldi3
        rsb     r11, r4, #0x20
        sub     r2, r11, #1
        str     r0, [sp, #0x1C]
        str     r1, [sp, #0x18]
        mov     r3, r2, asr #31
        mov     r0, #1
        mov     r1, #0
        bl      __ashldi3
        cmp     r7, #0
        mov     r2, r0
        ble     LAVN37
        mov     r0, #0
        mov     r12, r0
        mov     lr, #0
        str     r0, [sp]
        str     r12, [sp, #0x30]
        str     r1, [sp, #0x28]
        str     r2, [sp, #0x2C]
        str     r11, [sp, #0x34]
        str     r9, [sp, #0x24]
        str     r10, [sp, #0x20]
        str     r8, [sp, #0xC]
        str     r4, [sp, #0x10]
        str     r7, [sp, #0x14]
LAVN11:
        ldr     r8, [r5, #4]
        ldr     r9, [r5]
        tst     r8, r8
        bmi     LAVN36
        mov     r0, r9
        mov     r1, r8
        bl      __floatdidf
        bl      sqrt
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x24]
        bl      __muldf3
        bl      __fixunsdfdi
        ldr     r2, [sp, #0x1C]
        mov     r7, r0
        mov     r4, r1
        bic     r0, r7, r2
        ldr     r2, [sp, #0x18]
        bic     r1, r4, r2
        ldr     r2, [sp, #0x34]
        mov     r3, r2, asr #31
        bl      __ashldi3
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0xC]
        adds    r11, r2, r0
        umull   r2, r12, r11, r11
        ldr     lr, [sp, #0x28]
        mov     r10, r1
        mov     r0, r7
        adc     r10, lr, r10
        mla     r12, r11, r10, r12
        str     r2, [sp, #0x38]
        ldr     r2, [sp, #0x10]
        mov     r1, r4
        str     r12, [sp, #0x3C]
        bl      __lshrdi3
        umull   r2, r3, r0, r11
        str     r2, [sp, #0x40]
        mla     r2, r0, r10, r3
        ldr     r3, [sp, #0x3C]
        mla     r10, r10, r11, r3
        umull   r12, r3, r0, r0
        mla     r2, r1, r11, r2
        mla     r3, r0, r1, r3
        ldr     r11, [sp, #0x38]
        mov     lr, r10, lsr #16
        mov     r10, r10, lsl #16
        orr     r10, r10, r11, lsr #16
        mla     r3, r1, r0, r3
        mov     r11, lr, lsl #15
        orr     r10, r11, r10, lsr #17
        ldr     r11, [sp, #0x40]
        adds    r10, r10, r11
        adc     lr, r2, lr, lsr #17
        mov     r2, lr, lsl #1
        orr     r10, r2, r10, lsr #31
        adds    r10, r12, r10
        adc     lr, r3, lr, lsr #31
        cmp     lr, r8
        cmpeq   r10, r9
        bcs     LAVN12
        adds    r7, r7, #1
        adc     r4, r4, #0
LAVN12:
        str     r7, [r6]
        str     r4, [r6, #4]
LAVN13:
        ldr     r2, [sp, #0x30]
        ldr     r3, [sp, #0x14]
        add     r6, r6, #8
        add     r2, r2, #1
        str     r2, [sp, #0x30]
        cmp     r2, r3
        add     r5, r5, #8
        blt     LAVN11
        ldr     r0, [sp]
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LAVN14:
        mov     r3, #2, 2
        cmp     r7, #0
        mov     r3, r3, lsr r4
        ble     LAVN39
        mov     r0, #0
        mov     r8, r0
        mov     r12, r8
        str     r0, [sp]
        str     r3, [sp, #0x1C]
        str     r7, [sp, #0x14]
LAVN15:
        ldr     r9, [r5, #4]
        ldr     r10, [r5]
        tst     r9, r9
        bmi     LAVN38
        mov     r0, #0
        mov     r3, #2, 2
LAVN16:
        orr     r11, r0, r3
        umull   lr, r12, r11, r11
        cmp     r9, r12
        cmpeq   r10, lr
        movcs   r0, r11
        movs    r3, r3, lsr #1
        bne     LAVN16
        umull   r12, r3, r0, r0
        str     r3, [sp, #0x18]
        ldr     r3, [sp, #0x1C]
        cmp     r3, #2, 2
        moveq   r7, #0
        moveq   r3, #2, 2
        beq     LAVN18
        str     r6, [sp, #8]
        str     r8, [sp, #0xC]
        ldr     r6, [sp, #0x18]
        ldr     r8, [sp, #0x1C]
        mov     r7, #0
        mov     r3, #2, 2
        str     r5, [sp, #4]
        str     r4, [sp, #0x10]
LAVN17:
        orr     r5, r3, r7
        umull   r1, r11, r5, r5
        umull   r2, lr, r5, r0
        mov     r4, r11, lsr #16
        mov     r11, r11, lsl #16
        orr     r1, r11, r1, lsr #16
        mov     r11, r4, lsl #15
        orr     r1, r11, r1, lsr #17
        adds    r2, r1, r2
        adc     r4, lr, r4, lsr #17
        mov     r1, r4, lsl #1
        orr     r2, r1, r2, lsr #31
        adds    r1, r12, r2
        adc     r4, r6, r4, lsr #31
        cmp     r4, r9
        cmpeq   r1, r10
        movcc   r7, r5
        mov     r3, r3, lsr #1
        cmp     r3, r8
        bne     LAVN17
        ldr     r5, [sp, #4]
        ldr     r6, [sp, #8]
        ldr     r8, [sp, #0xC]
        ldr     r4, [sp, #0x10]
LAVN18:
        orr     r3, r3, r7
        umull   r2, lr, r3, r3
        umull   r3, r11, r3, r0
        mov     r1, lr, lsr #16
        mov     lr, lr, lsl #16
        orr     lr, lr, r2, lsr #16
        mov     r2, r1, lsl #15
        orr     lr, r2, lr, lsr #17
        adds    r3, lr, r3
        adc     r11, r11, r1, lsr #17
        mov     lr, r11, lsl #1
        orr     lr, lr, r3, lsr #31
        adds    lr, r12, lr
        ldr     r12, [sp, #0x18]
        str     lr, [sp, #0x40]
        mov     r1, #0
        mov     r2, r4
        mov     r3, #0
        adc     r11, r12, r11, lsr #31
        bl      __ashldi3
        ldr     r12, [sp, #0x40]
        cmp     r11, r9
        rsb     r3, r4, #0x20
        cmpeq   r12, r10
        orr     r3, r0, r7, lsr r3
        bcs     LAVN19
        adds    r3, r3, #1
        adc     r1, r1, #0
LAVN19:
        str     r3, [r6]
        str     r1, [r6, #4]
LAVN20:
        ldr     r3, [sp, #0x14]
        add     r8, r8, #1
        add     r6, r6, #8
        cmp     r8, r3
        add     r5, r5, #8
        blt     LAVN15
        ldr     r0, [sp]
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LAVN21:
        sub     r4, r4, #0x1F
        mvn     r0, #0
        mov     r4, r4, lsl #1
        sub     r2, r4, #1
        mvn     r1, #2, 2
        mov     r3, r2, asr #31
        bl      __ashrdi3
        cmp     r7, #0
        mov     r2, r0
        mov     r3, r1
        ble     LAVN41
        mov     r0, #0
        mov     r1, r0
        str     r4, [sp, #0x10]
        str     r0, [sp]
        str     r3, [sp, #0x1C]
        str     r2, [sp, #0x18]
        str     r10, [sp, #0xC]
        str     r11, [sp, #0x24]
        str     r7, [sp, #0x14]
        mov     r4, r1
LAVN22:
        ldr     r1, [r5, #4]
        ldr     r0, [r5]
        tst     r1, r1
        bmi     LAVN40
        ldr     r2, [sp, #0x1C]
        cmp     r1, r2
        ldreq   r2, [sp, #0x18]
        cmpeq   r0, r2
        bls     LAVN23
        ldr     r2, [sp, #0x24]
        str     r2, [r6]
        ldr     r2, [sp, #0xC]
        str     r2, [r6, #4]
        b       LAVN27
LAVN23:
        ldr     r2, [sp, #0x10]
        mov     r3, #0
        bl      __ashldi3
        mov     r2, #0
        mov     r3, #2, 2
LAVN24:
        orr     r8, r2, r3
        umull   lr, r12, r8, r8
        cmp     r1, r12
        cmpeq   r0, lr
        movcs   r2, r8
        movs    r3, r3, lsr #1
        bne     LAVN24
        umull   lr, r12, r2, r2
        mov     r3, #0
        mov     r8, #2, 2
        str     r4, [sp, #0x20]
        str     r6, [sp, #8]
LAVN25:
        orr     r11, r8, r3
        umull   r4, r6, r11, r11
        umull   r7, r9, r11, r2
        mov     r10, r6, lsr #16
        mov     r6, r6, lsl #16
        orr     r4, r6, r4, lsr #16
        mov     r6, r10, lsl #15
        orr     r4, r6, r4, lsr #17
        adds    r7, r4, r7
        adc     r10, r9, r10, lsr #17
        mov     r4, r10, lsl #1
        orr     r7, r4, r7, lsr #31
        adds    r4, lr, r7
        adc     r10, r12, r10, lsr #31
        cmp     r10, r1
        cmpeq   r4, r0
        movcc   r3, r11
        mov     r8, r8, lsr #1
        cmp     r8, #1
        bne     LAVN25
        ldr     r4, [sp, #0x20]
        ldr     r6, [sp, #8]
        orr     r9, r8, r3
        umull   r11, r8, r9, r9
        umull   r10, r9, r9, r2
        str     r9, [sp, #0x40]
        mov     r9, r8, lsr #16
        mov     r8, r8, lsl #16
        orr     r11, r8, r11, lsr #16
        mov     r7, r9, lsl #15
        mov     r8, r2, lsr #1
        orr     r11, r7, r11, lsr #17
        adds    r10, r11, r10
        ldr     r11, [sp, #0x40]
        mov     r3, r3, lsr #1
        orr     r2, r3, r2, lsl #31
        adc     r9, r11, r9, lsr #17
        mov     r3, r9, lsl #1
        orr     r10, r3, r10, lsr #31
        adds    r10, lr, r10
        adc     r9, r12, r9, lsr #31
        cmp     r9, r1
        cmpeq   r10, r0
        bcs     LAVN26
        adds    r2, r2, #1
        adc     r8, r8, #0
LAVN26:
        str     r2, [r6]
        str     r8, [r6, #4]
LAVN27:
        ldr     r2, [sp, #0x14]
        add     r4, r4, #1
        add     r6, r6, #8
        cmp     r4, r2
        add     r5, r5, #8
        blt     LAVN22
        ldr     r0, [sp]
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LAVN28:
        cmp     r7, #0
        ble     LAVN43
        mov     r0, #0
        mov     r12, r0
LAVN29:
        ldr     lr, [r5]
        ldr     r3, [r5, #4]
        orrs    lr, lr, r3, lsl #1
        tstcs   lr, #0
        strne   r11, [r6]
        strne   r10, [r6, #4]
        beq     LAVN42
LAVN30:
        add     r12, r12, #1
        cmp     r12, r7
        add     r6, r6, #8
        add     r5, r5, #8
        blt     LAVN29
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LAVN31:
        str     r8, [r7]
        str     r8, [r7, #4]
        mov     r5, #3
        b       LAVN2
LAVN32:
        mov     r0, #0
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LAVN33:
        mov     r3, #0
        str     r3, [r6]
        str     r3, [r6, #4]
        mov     r3, #3
        str     r3, [sp]
        b       LAVN7
LAVN34:
        mov     r0, #0
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LAVN35:
        mov     r0, #0
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LAVN36:
        mov     r2, #0
        str     r2, [r6]
        str     r2, [r6, #4]
        mov     r2, #3
        str     r2, [sp]
        b       LAVN13
LAVN37:
        mov     r0, #0
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LAVN38:
        mov     r3, #0
        str     r3, [r6]
        str     r3, [r6, #4]
        mov     r3, #3
        str     r3, [sp]
        b       LAVN20
LAVN39:
        mov     r0, #0
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LAVN40:
        mov     r2, #0
        str     r2, [r6]
        str     r2, [r6, #4]
        mov     r2, #3
        str     r2, [sp]
        b       LAVN27
LAVN41:
        mov     r0, #0
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LAVN42:
        tst     r3, r3
        movmi   r0, #3
        str     r8, [r6]
        str     r8, [r6, #4]
        b       LAVN30
LAVN43:
        mov     r0, #0
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LAVN44:
        mvn     r0, #7
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LAVN45:
        mvn     r0, #5
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}


