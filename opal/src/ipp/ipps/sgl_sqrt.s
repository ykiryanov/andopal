        .text
        .align  4
        .globl  X0s_table
        .globl  __intel_fsqrt
        .globl  sqrtf


X0s_table:
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
__intel_fsqrt:
sqrtf:
        sub     r12, pc, #0x62, 30
        stmdb   sp!, {r4 - r7}
        mov     r2, r0, lsr #23
        sub     r2, r2, #1
        cmp     r2, #0xFE
        bcs     LAFA_SPECIAL_SQRT
LAFA_RETURN_SQRT_MAIN:
        mov     r1, r0, lsl #8
        ldrb    r3, [r12, +r1, lsr #24]
        add     r12, r12, #1, 24
        ldrb    r12, [r12, +r1, lsr #25]
        mov     r0, r0, lsl #8
        orr     r0, r0, #2, 2
        mul     r1, r3, r3
        tst     r2, #1
        moveq   r0, r0, lsr #1
        sub     r6, r0, r1, lsl #16
        umull   r4, r5, r6, r12
        mov     r4, r4, lsr #12
        orr     r4, r4, r5, lsl #20
        add     r3, r4, r3, lsl #20
        umull   r4, r5, r3, r3
        rsbs    r1, r4, r0, lsl #24
        rsc     r6, r5, r0, lsr #8
        umull   r4, r5, r1, r12
        mul     r7, r6, r12
        add     r5, r5, r7
        add     r3, r3, r5, lsr #4
        umull   r4, r5, r3, r3
        rsbs    r1, r4, r0, lsl #24
        rsc     r6, r5, r0, lsr #8
        umull   r4, r5, r1, r12
        mul     r7, r6, r12
        add     r5, r5, r7
        add     r3, r3, r5, lsr #4
        umull   r4, r5, r3, r3
        rsbs    r1, r4, r0, lsl #24
        rsc     r6, r5, r0, lsr #8
        umull   r4, r5, r1, r12
        mul     r7, r6, r12
        add     r5, r5, r7
        add     r3, r3, r5, lsr #4
        umull   r4, r5, r3, r3
        rsbs    r1, r4, r0, lsl #24
        rsc     r6, r5, r0, lsr #8
        umull   r4, r5, r1, r12
        mul     r7, r6, r12
        add     r5, r5, r7
        add     r3, r3, r5, lsr #4
        bic     r3, r3, #7
        orr     r3, r3, #8
        umull   r4, r5, r3, r3
        rsbs    r5, r5, r0, lsr #8
        rsbeqs  r4, r4, r0, lsl #24
        add     r2, r2, #0x7E
        mov     r2, r2, lsr #1
        mov     r2, r2, lsl #23
        adc     r0, r2, r3, lsr #4
        ldmia   sp!, {r4 - r7}
        bx      lr
LAFA_SPECIAL_SQRT:
        add     r2, r2, #1
        cmp     r2, #0xFF
        bcs     LAFA_NAN_INF_NEG_SQRT
        cmp     r0, #0
        beq     LAFA_RETURN_SQRT
LAFA_norm_a:
        sub     r2, r2, #1
        mov     r0, r0, lsl #1
        cmp     r0, #2, 10
        bcc     LAFA_norm_a
        tst     r2, #1
        bicne   r0, r0, #2, 10
        b       LAFA_RETURN_SQRT_MAIN
LAFA_NAN_INF_NEG_SQRT:
        cmp     r0, #2, 2
        beq     LAFA_RETURN_SQRT
        mov     r1, #0xFF, 8
        mov     r2, #0xFF
        orr     r2, r2, #1, 24
        tst     r0, #2, 2
        cmpne   r2, r0, lsr #23
        orrne   r0, r1, #3, 10
        bne     LAFA_NEGATIVE_SQRT
        cmp     r1, r0, lsl #1
        tsteq   r0, #2, 2
        beq     LAFA_RETURN_SQRT
        cmp     r1, r0, lsl #1
        orreq   r0, r1, #3, 10
        beq     LAFA_NEGATIVE_SQRT
        orr     r0, r0, #1, 10
LAFA_RETURN_SQRT:
        ldmia   sp!, {r4 - r7}
        bx      lr
LAFA_NEGATIVE_SQRT:
        mov     r4, r0
        mov     r5, lr
        mov     r0, r4
        mov     lr, r5
        ldmia   sp!, {r4 - r7}
        bx      lr


