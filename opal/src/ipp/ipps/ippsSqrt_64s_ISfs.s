        .text
        .align  4
        .globl  _ippsSqrt_64s_ISfs


_ippsSqrt_64s_ISfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x3C
        mov     r5, r0
        cmp     r5, #0
        mov     r8, r1
        mov     r7, r2
        beq     LAVO44
        cmp     r8, #0
        ble     LAVO45
        cmp     r7, #0
        mov     r6, #0
        blt     LAVO10
        cmp     r7, #0
        bne     LAVO3
        cmp     r8, #0
        ble     LAVO32
        mov     r0, #0
        mov     r7, r5
        mov     r4, r0
        mov     r5, r0
LAVO0:
        ldr     r9, [r7, #4]
        ldr     r10, [r7]
        tst     r9, r9
        bmi     LAVO31
        mov     r0, r10
        mov     r1, r9
        bl      __floatdidf
        bl      sqrt
        bl      __fixunsdfdi
        umull   r2, r3, r0, r0
        mla     r3, r0, r1, r3
        adds    r2, r2, r0
        mla     r3, r1, r0, r3
        adc     r3, r3, r1
        cmp     r9, r3
        cmpeq   r10, r2
        bls     LAVO1
        adds    r0, r0, #1
        adc     r1, r1, #0
LAVO1:
        str     r0, [r7]
        str     r1, [r7, #4]
LAVO2:
        add     r4, r4, #1
        cmp     r4, r8
        add     r7, r7, #8
        blt     LAVO0
        mov     r0, r5
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LAVO3:
        cmp     r7, #0x20
        bgt     LAVO8
        mov     r3, r7, asr #31
        mvn     r0, #0
        mvn     r1, #2, 2
        mov     r2, r7
        bl      __ashldi3
        sub     r2, r7, #1
        mov     r10, r0
        mov     r3, r2, asr #31
        mov     r9, r1
        mov     r0, #1
        mov     r1, #0
        bl      __ashldi3
        cmp     r8, #0
        mov     r2, r0
        ble     LAVO34
        mov     r0, #0
        mov     r4, r0
        str     r0, [sp]
        str     r1, [sp, #8]
        str     r2, [sp, #0x1C]
        str     r9, [sp, #0x18]
        str     r10, [sp, #0x14]
        str     r7, [sp, #0xC]
        str     r8, [sp, #0x10]
LAVO4:
        ldr     r6, [r5, #4]
        ldr     r7, [r5]
        tst     r6, r6
        bmi     LAVO33
        mov     r0, r7
        mov     r1, r6
        bl      __floatdidf
        bl      sqrt
        bl      __fixunsdfdi
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp, #0x1C]
        and     r2, r0, r2
        adds    r8, r3, r2
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #8]
        and     r2, r1, r2
        adc     r9, r3, r2
        umull   r11, r2, r8, r8
        mla     r10, r8, r9, r2
        ldr     r2, [sp, #0xC]
        mov     r3, #0
        mla     r10, r9, r8, r10
        bl      __lshrdi3
        cmp     r10, r6
        cmpeq   r11, r7
        bcc     LAVO5
        cmp     r10, r6
        cmpeq   r11, r7
        bne     LAVO6
        and     r2, r0, #1
        orrs    r2, r2, #0
        beq     LAVO6
LAVO5:
        adds    r0, r0, #1
        adc     r1, r1, #0
LAVO6:
        str     r0, [r5]
        str     r1, [r5, #4]
LAVO7:
        ldr     r1, [sp, #0x10]
        add     r4, r4, #1
        add     r5, r5, #8
        cmp     r4, r1
        blt     LAVO4
        ldr     r0, [sp]
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LAVO8:
        cmp     r8, #0
        ble     LAVO35
        mov     r0, #0
        sub     r5, r5, #4
        mov     r3, r0
LAVO9:
        ldr     r2, [r5, #8]
        tst     r2, r2
        movmi   r0, #3
        add     r3, r3, #1
        str     r6, [r5, #4]
        str     r6, [r5, #8]!
        cmp     r3, r8
        blt     LAVO9
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LAVO10:
        rsb     r4, r7, #0
        cmp     r4, #0x3F
        mvn     r9, #0
        mvn     r7, #2, 2
        bge     LAVO28
        cmp     r4, #0x20
        bge     LAVO21
        cmp     r4, #0x15
        bgt     LAVO14
        mov     r7, r4, asr #31
        mov     r0, #1
        mov     r1, #0
        mov     r2, r4
        mov     r3, r7
        bl      __ashldi3
        bl      __floatdidf
        str     r1, [sp, #0x14]
        mov     r11, r0
        mvn     r0, #0
        mvn     r1, #2, 2
        mov     r2, r4
        mov     r3, r7
        bl      __ashldi3
        rsb     r6, r4, #0x20
        sub     r2, r6, #1
        mov     r10, r0
        mov     r3, r2, asr #31
        mov     r9, r1
        mov     r0, #1
        mov     r1, #0
        bl      __ashldi3
        cmp     r8, #0
        mov     r2, r0
        ble     LAVO37
        mov     r0, #0
        mov     r12, r0
        mov     lr, #0
        str     r0, [sp]
        str     r12, [sp, #0x2C]
        str     r1, [sp, #0x24]
        str     r2, [sp, #0x28]
        str     r9, [sp, #0x1C]
        str     r10, [sp, #0x20]
        str     r11, [sp, #0x18]
        str     r7, [sp, #8]
        str     r4, [sp, #0xC]
        str     r8, [sp, #0x10]
LAVO11:
        ldr     r8, [r5, #4]
        ldr     r9, [r5]
        tst     r8, r8
        bmi     LAVO36
        mov     r0, r9
        mov     r1, r8
        bl      __floatdidf
        bl      sqrt
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0x14]
        bl      __muldf3
        bl      __fixunsdfdi
        ldr     r3, [sp, #0x20]
        mov     r7, r0
        mov     r4, r1
        bic     r0, r7, r3
        ldr     r3, [sp, #0x1C]
        mov     r2, r6
        bic     r1, r4, r3
        mov     r3, r6, asr #31
        bl      __ashldi3
        ldr     r3, [sp, #0x28]
        ldr     r2, [sp, #0xC]
        ldr     lr, [sp, #0x24]
        adds    r11, r3, r0
        umull   r3, r12, r11, r11
        mov     r10, r1
        adc     r10, lr, r10
        mla     r12, r11, r10, r12
        mov     r0, r7
        str     r3, [sp, #0x30]
        ldr     r3, [sp, #8]
        mov     r1, r4
        str     r12, [sp, #0x34]
        bl      __lshrdi3
        umull   r3, r12, r0, r11
        ldr     r2, [sp, #0x30]
        str     r3, [sp, #0x38]
        mla     r3, r0, r10, r12
        ldr     r12, [sp, #0x34]
        mla     r10, r10, r11, r12
        umull   lr, r12, r0, r0
        mla     r3, r1, r11, r3
        mla     r12, r0, r1, r12
        mov     r11, r10, lsr #16
        mov     r10, r10, lsl #16
        orr     r10, r10, r2, lsr #16
        mov     r2, r11, lsl #15
        mla     r12, r1, r0, r12
        ldr     r0, [sp, #0x38]
        orr     r10, r2, r10, lsr #17
        adds    r10, r10, r0
        adc     r11, r3, r11, lsr #17
        mov     r3, r11, lsl #1
        orr     r10, r3, r10, lsr #31
        adds    r10, lr, r10
        adc     r11, r12, r11, lsr #31
        cmp     r11, r8
        cmpeq   r10, r9
        bcs     LAVO12
        adds    r7, r7, #1
        adc     r4, r4, #0
LAVO12:
        str     r7, [r5]
        str     r4, [r5, #4]
LAVO13:
        ldr     r1, [sp, #0x2C]
        ldr     r3, [sp, #0x10]
        add     r5, r5, #8
        add     r1, r1, #1
        str     r1, [sp, #0x2C]
        cmp     r1, r3
        blt     LAVO11
        ldr     r0, [sp]
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LAVO14:
        mov     r3, #2, 2
        cmp     r8, #0
        mov     r3, r3, lsr r4
        ble     LAVO39
        mov     r0, #0
        mov     r7, r0
        mov     r12, r7
        str     r0, [sp]
        str     r3, [sp, #0x14]
        str     r8, [sp, #0x10]
LAVO15:
        ldr     r9, [r5, #4]
        ldr     r10, [r5]
        tst     r9, r9
        bmi     LAVO38
        mov     r0, #0
        mov     r1, #2, 2
LAVO16:
        orr     lr, r0, r1
        umull   r12, r3, lr, lr
        cmp     r9, r3
        cmpeq   r10, r12
        movcs   r0, lr
        movs    r1, r1, lsr #1
        bne     LAVO16
        umull   r6, lr, r0, r0
        ldr     r1, [sp, #0x14]
        cmp     r1, #2, 2
        moveq   r8, #0
        moveq   r1, #2, 2
        beq     LAVO18
        str     r7, [sp, #8]
        ldr     r7, [sp, #0x14]
        mov     r8, #0
        mov     r1, #2, 2
        str     r5, [sp, #4]
        str     r4, [sp, #0xC]
LAVO17:
        orr     r5, r1, r8
        umull   r2, r11, r5, r5
        umull   r3, r12, r5, r0
        mov     r4, r11, lsr #16
        mov     r11, r11, lsl #16
        orr     r2, r11, r2, lsr #16
        mov     r11, r4, lsl #15
        orr     r2, r11, r2, lsr #17
        adds    r3, r2, r3
        adc     r4, r12, r4, lsr #17
        mov     r2, r4, lsl #1
        orr     r3, r2, r3, lsr #31
        adds    r2, r6, r3
        adc     r4, lr, r4, lsr #31
        cmp     r4, r9
        cmpeq   r2, r10
        movcc   r8, r5
        mov     r1, r1, lsr #1
        cmp     r1, r7
        bne     LAVO17
        ldr     r5, [sp, #4]
        ldr     r7, [sp, #8]
        ldr     r4, [sp, #0xC]
LAVO18:
        orr     r1, r1, r8
        umull   r2, r11, r1, r1
        umull   r3, r12, r1, r0
        mov     r1, r11, lsr #16
        mov     r11, r11, lsl #16
        orr     r11, r11, r2, lsr #16
        mov     r2, r1, lsl #15
        orr     r11, r2, r11, lsr #17
        adds    r3, r11, r3
        adc     r12, r12, r1, lsr #17
        mov     r11, r12, lsl #1
        orr     r11, r11, r3, lsr #31
        adds    r6, r6, r11
        adc     r11, lr, r12, lsr #31
        mov     r1, #0
        mov     r2, r4
        mov     r3, #0
        bl      __ashldi3
        cmp     r11, r9
        rsb     r3, r4, #0x20
        cmpeq   r6, r10
        orr     r3, r0, r8, lsr r3
        bcs     LAVO19
        adds    r3, r3, #1
        adc     r1, r1, #0
LAVO19:
        str     r3, [r5]
        str     r1, [r5, #4]
LAVO20:
        ldr     r1, [sp, #0x10]
        add     r7, r7, #1
        add     r5, r5, #8
        cmp     r7, r1
        blt     LAVO15
        ldr     r0, [sp]
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LAVO21:
        sub     r4, r4, #0x1F
        mvn     r0, #0
        mov     r10, r4, lsl #1
        sub     r2, r10, #1
        mvn     r1, #2, 2
        mov     r3, r2, asr #31
        bl      __ashrdi3
        cmp     r8, #0
        mov     r2, r0
        ble     LAVO41
        mov     r0, #0
        mov     r4, r0
        str     r0, [sp]
        str     r1, [sp, #0x18]
        str     r2, [sp, #0x14]
        str     r10, [sp, #0xC]
        str     r7, [sp, #8]
        str     r9, [sp, #0x20]
        str     r8, [sp, #0x10]
LAVO22:
        ldr     r1, [r5, #4]
        ldr     r0, [r5]
        tst     r1, r1
        bmi     LAVO40
        ldr     r2, [sp, #0x18]
        cmp     r1, r2
        ldreq   r2, [sp, #0x14]
        cmpeq   r0, r2
        bls     LAVO23
        ldr     r1, [sp, #0x20]
        str     r1, [r5]
        ldr     r1, [sp, #8]
        str     r1, [r5, #4]
        b       LAVO27
LAVO23:
        ldr     r2, [sp, #0xC]
        mov     r3, #0
        bl      __ashldi3
        mov     r2, #0
        mov     r3, #2, 2
LAVO24:
        orr     r6, r2, r3
        umull   lr, r12, r6, r6
        cmp     r1, r12
        cmpeq   r0, lr
        movcs   r2, r6
        movs    r3, r3, lsr #1
        bne     LAVO24
        umull   lr, r12, r2, r2
        mov     r3, #0
        mov     r6, #2, 2
        str     r4, [sp, #0x1C]
LAVO25:
        orr     r11, r6, r3
        umull   r4, r7, r11, r11
        umull   r8, r9, r11, r2
        mov     r10, r7, lsr #16
        mov     r7, r7, lsl #16
        orr     r4, r7, r4, lsr #16
        mov     r7, r10, lsl #15
        orr     r4, r7, r4, lsr #17
        adds    r8, r4, r8
        adc     r10, r9, r10, lsr #17
        mov     r4, r10, lsl #1
        orr     r8, r4, r8, lsr #31
        adds    r4, lr, r8
        adc     r10, r12, r10, lsr #31
        cmp     r10, r1
        cmpeq   r4, r0
        movcc   r3, r11
        mov     r6, r6, lsr #1
        cmp     r6, #1
        bne     LAVO25
        ldr     r4, [sp, #0x1C]
        orr     r6, r6, r3
        umull   r9, r11, r6, r6
        umull   r10, r8, r6, r2
        mov     r6, r11, lsr #16
        mov     r11, r11, lsl #16
        mov     r7, r6, lsl #15
        orr     r11, r11, r9, lsr #16
        mov     r9, r2, lsr #1
        mov     r3, r3, lsr #1
        orr     r11, r7, r11, lsr #17
        adds    r10, r11, r10
        adc     r6, r8, r6, lsr #17
        orr     r2, r3, r2, lsl #31
        mov     r3, r6, lsl #1
        orr     r10, r3, r10, lsr #31
        adds    r10, lr, r10
        adc     r6, r12, r6, lsr #31
        cmp     r6, r1
        cmpeq   r10, r0
        bcs     LAVO26
        adds    r2, r2, #1
        adc     r9, r9, #0
LAVO26:
        str     r2, [r5]
        str     r9, [r5, #4]
LAVO27:
        ldr     r1, [sp, #0x10]
        add     r4, r4, #1
        add     r5, r5, #8
        cmp     r4, r1
        blt     LAVO22
        ldr     r0, [sp]
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LAVO28:
        cmp     r8, #0
        ble     LAVO43
        mov     r0, #0
        mov     r3, r0
LAVO29:
        ldr     r12, [r5]
        ldr     r2, [r5, #4]
        orrs    r12, r12, r2, lsl #1
        tstcs   r12, #0
        strne   r9, [r5]
        strne   r7, [r5, #4]
        beq     LAVO42
LAVO30:
        add     r3, r3, #1
        cmp     r3, r8
        add     r5, r5, #8
        blt     LAVO29
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LAVO31:
        str     r6, [r7]
        str     r6, [r7, #4]
        mov     r5, #3
        b       LAVO2
LAVO32:
        mov     r0, #0
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LAVO33:
        mov     r1, #0
        str     r1, [r5]
        str     r1, [r5, #4]
        mov     r1, #3
        str     r1, [sp]
        b       LAVO7
LAVO34:
        mov     r0, #0
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LAVO35:
        mov     r0, #0
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LAVO36:
        mov     r1, #0
        str     r1, [r5]
        str     r1, [r5, #4]
        mov     r1, #3
        str     r1, [sp]
        b       LAVO13
LAVO37:
        mov     r0, #0
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LAVO38:
        mov     r1, #0
        str     r1, [r5]
        str     r1, [r5, #4]
        mov     r1, #3
        str     r1, [sp]
        b       LAVO20
LAVO39:
        mov     r0, #0
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LAVO40:
        mov     r1, #0
        str     r1, [r5]
        str     r1, [r5, #4]
        mov     r1, #3
        str     r1, [sp]
        b       LAVO27
LAVO41:
        mov     r0, #0
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LAVO42:
        tst     r2, r2
        movmi   r0, #3
        str     r6, [r5]
        str     r6, [r5, #4]
        b       LAVO30
LAVO43:
        mov     r0, #0
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LAVO44:
        mvn     r0, #7
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LAVO45:
        mvn     r0, #5
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}


