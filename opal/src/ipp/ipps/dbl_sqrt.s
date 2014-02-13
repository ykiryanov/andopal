        .text
        .align  4
        .globl  X0_table
        .globl  __intel_dsqrt
        .globl  sqrt


X0_table:
        .long   0xb7b6b5b5
        ldmltib r9!, {r0 - r2, r4, r5, r7, r11, r12, sp, pc}
        fldmiadlt r11!, {invalid list}
        swilt   12500413
        bicgt   r12, r1, r0, asr #1
        strgtb  r12, [r3], #0x3C2
        strgtb  r12, [r6, +r5, asr #11]
        stmgtib r9, {r0 - r2, r6, r7, r11, lr, pc}^
        fstmiadgt r11, {invalid list}
        cdpgt   p13, 12, c12, c14, c12, 6
        bicles  sp, r0, pc, asr #1
        bicles  sp, r3, #0xD1, 4
        .long   0xd6d5d4d4
        ldmleia r7, {r1, r2, r4, r6 - r10, r12, lr, pc}^
        ble     FF6B67A4
        flddle  d13, [r12,#+876]
        swile   14606045
        .long   0xe1e1e0e0
        .long   0xe3e3e2e2
        strbt   lr, [r5], +r4, ror #11
        stmia   r7!, {r1, r2, r5 - r10, sp, lr, pc}^
        b       FFABA7FC
        .long   0xececebeb
        .long   0xeeeeeded
        .long   0xf1f0f0ef
        .long   0xf3f2f2f1
        .long   0xf5f4f4f3
        .long   0xf7f6f6f5
        .long   0xf9f8f8f7
        .long   0xfbfafaf9
        .long   0xfdfcfcfb
        .long   0xfffefefd
        .long   0x81808080
        .long   0x83828281
        .long   0x85848483
        .long   0x87868685
        .long   0x89888887
        .long   0x8b8a8a89
        .long   0x8c8c8b8b
        .long   0x8e8e8d8d
        .long   0x90908f8f
        .long   0x92919190
        .long   0x93939392
        .long   0x95959494
        .long   0x97969696
        .long   0x99989897
        .long   0x9a9a9999
        .long   0x9c9b9b9b
        .long   0x9d9d9d9c
        .long   0x9f9f9e9e
        .long   0xa1a0a0a0
        .long   0xa2a2a1a1
        .long   0xa4a3a3a3
        .long   0xa5a5a5a4
        .long   0xa7a7a6a6
        .long   0xa8a8a8a7
        .long   0xaaaaa9a9
        .long   0xabababaa
        .long   0xadadacac
        .long   0xaeaeaead
        .long   0xb0b0afaf
        .long   0xb1b1b1b0
        .long   0xb3b2b2b2
        .long   0xb4b4b3b3
        .long   0xafb0b2b3
        .long   0xaaabadae
        .long   0xa6a7a8a9
        .long   0xa1a2a3a5
        .long   0x9e9e9fa0
        .long   0x9a9b9c9d
        .long   0x96979899
        .long   0x93949596
        .long   0x90919293
        .long   0x8e8e8f90
        .long   0x8b8b8c8d
        .long   0x88898a8a
        .long   0x86878788
        .long   0x84848585
        .long   0x82828383
        .long   0x80808181
        .long   0xf8fafcfe
        .long   0xf1f3f4f6
        .long   0xeaeceeef
        .long   0xe4e6e7e9
        .long   0xdfe0e2e3
        .long   0xdadbdcde
        .long   0xd5d6d7d9
        .long   0xd1d2d3d4
        .long   0xcccdcecf
        .long   0xc8c9cacb
        .long   0xc5c5c6c7
        .long   0xc1c2c3c4
        .long   0xbebebfc0
        .long   0xbabbbcbd
        .long   0xb7b8b9ba
        .long   0xb5b5b6b7
__intel_dsqrt:
sqrt:
        sub     r12, pc, #0x62, 30
        stmdb   sp!, {r4 - r11}
        mov     r3, #0xFE
        orr     r3, r3, #7, 24
        mov     r2, r1, lsr #20
        sub     r2, r2, #1
        cmp     r2, r3
        bcs     LAGB_SPECIAL_sqrt
LAGB_RETURN_sqrt_MAIN:
        mov     r4, r1, lsl #11
        ldrb    r3, [r12, +r4, lsr #24]
        add     r12, r12, #1, 24
        ldrb    r12, [r12, +r4, lsr #25]
        mov     r1, r1, lsl #11
        orr     r1, r1, #2, 2
        orr     r1, r1, r0, lsr #21
        mov     r0, r0, lsl #11
        mul     r4, r3, r3
        tst     r2, #1
        moveq   r0, r0, lsr #1
        orreq   r0, r0, r1, lsl #31
        moveq   r1, r1, lsr #1
        sub     r6, r1, r4, lsl #16
        mov     r6, r6, lsr #20
        mov     r12, r12, lsr #1
        mul     r4, r6, r12
        add     r3, r4, r3, lsl #11
        umull   r4, r5, r3, r3
        rsb     r6, r4, r1, lsl #6
        add     r6, r6, r0, lsr #26
        mov     r6, r6, lsr #20
        mul     r4, r6, r12
        add     r3, r4, r3, lsl #6
        umull   r4, r5, r3, r3
        mov     r7, r0, lsr #14
        orr     r7, r7, r1, lsl #18
        subs    r7, r7, r4
        rsc     r6, r5, r1, lsr #14
        mov     r7, r7, lsr #26
        orr     r6, r7, r6, lsl #6
        mul     r4, r6, r12
        add     r3, r4, r3, lsl #6
        umull   r4, r5, r3, r3
        subs    r7, r0, r4, lsl #2
        sbc     r6, r1, r4, lsr #30
        sub     r6, r6, r5, lsl #2
        mov     r5, r6, lsr #2
        mul     r4, r5, r12
        mov     r10, r3, lsr #26
        adds    r11, r4, r3, lsl #6
        adc     r10, r10, #0
        mul     r9, r4, r4
        umull   r8, r5, r3, r4
        mov     r3, r7, lsr #22
        rsbs    r7, r9, r7, lsl #10
        orr     r6, r3, r6, lsl #10
        sbc     r6, r6, r8, lsr #25
        subs    r7, r7, r8, lsl #7
        sbc     r6, r6, r5, lsl #7
        mov     r5, r6, lsr #6
        umull   r4, r8, r5, r12
        adds    r3, r4, r11, lsl #6
        add     r10, r8, r10, lsl #6
        adc     r10, r10, r11, lsr #26
        umull   r4, r5, r3, r3
        mul     r8, r3, r10
        rsbs    r7, r4, r0, lsl #22
        rsc     r6, r5, r1, lsl #22
        add     r6, r6, r0, lsr #10
        sub     r6, r6, r8, lsl #1
        mov     r5, r6, lsr #12
        umull   r4, r8, r5, r12
        adds    r11, r4, r3, lsl #6
        add     r10, r8, r10, lsl #6
        adc     r10, r10, r3, lsr #26
        umull   r4, r5, r11, r11
        mul     r8, r11, r10
        rsbs    r7, r4, #0
        rsc     r6, r5, r0, lsl #2
        sub     r6, r6, r8, lsl #1
        mov     r5, r6, lsr #18
        umull   r4, r8, r5, r12
        adds    r3, r4, r11, lsl #6
        add     r10, r8, r10, lsl #6
        adc     r10, r10, r11, lsr #26
        mov     r10, r10, lsl #1
        orr     r10, r10, r3, lsr #31
        mov     r3, r3, lsl #1
        umull   r4, r5, r3, r3
        mov     r6, r0, lsr #16
        orr     r6, r6, r1, lsl #16
        rsbs    r8, r4, #0
        rscs    r7, r5, r0, lsl #16
        mul     r9, r10, r10
        sbc     r6, r6, r9
        umull   r0, r1, r3, r10
        subs    r7, r7, r0, lsl #1
        sbc     r6, r6, r0, lsr #31
        sub     r6, r6, r1, lsl #1
        mov     r12, r12, lsl #1
        umull   r0, r1, r8, r12
        umull   r4, r5, r7, r12
        adds    r4, r4, r1
        adc     r5, r5, #0
        mla     r0, r6, r12, r5
        mul     r11, r0, r0
        umull   r5, r9, r3, r0
        subs    r8, r8, r11
        sbc     r7, r7, r5, lsr #31
        subs    r8, r8, r5, lsl #1
        sbc     r7, r7, r9, lsl #1
        mul     r4, r10, r0
        sub     r7, r7, r4, lsl #1
        adds    r0, r0, r3
        adc     r1, r10, #0
        umull   r4, r5, r8, r12
        umull   r6, r11, r7, r12
        adds    r5, r5, r6
        adc     r11, r11, #0
        mul     r4, r11, r11
        umull   r5, r9, r11, r0
        subs    r8, r8, r4
        sbc     r7, r7, r5, lsr #31
        subs    r8, r8, r5, lsl #1
        sbc     r7, r7, r9, lsl #1
        mul     r4, r1, r11
        sub     r7, r7, r4, lsl #1
        adds    r0, r0, r11
        adc     r1, r1, #0
        umull   r4, r5, r8, r12
        umull   r6, r11, r7, r12
        adds    r5, r5, r6
        adcs    r4, r0, r11
        adc     r3, r1, #0
        bic     r4, r4, #3
        orr     r4, r4, #4
        subs    r11, r4, r0
        bmi     LAGB_ROUND_UP
        mul     r5, r11, r11
        mov     r11, r11, lsl #1
        umull   r6, r9, r0, r11
        adds    r5, r5, r6
        mul     r10, r1, r11
        adc     r10, r10, r9
        cmp     r10, r7
        cmpeq   r5, r8
        movcs   r12, #0
LAGB_ROUND_UP:
        cmp     r12, #1
        add     r2, r2, #0xFE
        add     r2, r2, #3, 24
        mov     r2, r2, lsr #1
        mov     r2, r2, lsl #20
        mov     r0, r4, lsr #3
        adcs    r0, r0, r1, lsl #29
        adc     r1, r2, r1, lsr #3
        ldmia   sp!, {r4 - r11}
        bx      lr
LAGB_SPECIAL_sqrt:
        add     r2, r2, #1
        mov     r3, #0xFF
        orr     r3, r3, #7, 24
        cmp     r2, r3
        bcs     LAGB_NAN_INF_NEG_sqrt
        orrs    r3, r1, r0
        beq     LAGB_RETURN_sqrt
LAGB_norm_a:
        sub     r2, r2, #1
        mov     r1, r1, lsl #1
        orr     r1, r1, r0, lsr #31
        mov     r0, r0, lsl #1
        cmp     r1, #1, 12
        bcc     LAGB_norm_a
        tst     r2, #1
        bicne   r1, r1, #1, 12
        b       LAGB_RETURN_sqrt_MAIN
LAGB_NAN_INF_NEG_sqrt:
        orrs    r3, r0, r1, lsl #1
        beq     LAGB_RETURN_sqrt
        mov     r4, #0xFF, 8
        mov     r2, #0xFF
        orr     r2, r2, #0xF, 24
        tst     r1, #2, 2
        cmpne   r2, r1, lsr #20
        orrne   r4, r4, #0x3E, 14
        bne     LAGB_NEGATIVE_sqrt
        orr     r4, r4, #0xE, 12
        cmp     r4, r1, lsl #1
        tsteq   r1, #2, 2
        cmpeq   r0, #0
        beq     LAGB_RETURN_sqrt
        cmp     r4, r1, lsl #1
        cmpeq   r0, #0
        orreq   r4, r4, #0x3E, 14
        beq     LAGB_NEGATIVE_sqrt
        orr     r1, r1, #2, 14
LAGB_RETURN_sqrt:
        ldmia   sp!, {r4 - r11}
        bx      lr
LAGB_NEGATIVE_sqrt:
        mov     r5, lr
        mov     r1, r4
        mov     r0, #0
        mov     lr, r5
        ldmia   sp!, {r4 - r11}
        bx      lr


