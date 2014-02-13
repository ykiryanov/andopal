        .text
        .align  4
        .globl  __aeabi_dmul
        .globl  __muldf3


__aeabi_dmul:
__muldf3:
        stmdb   sp!, {r4 - r8}
        mov     r8, #0x7F, 28
        orr     r8, r8, #0xF
        ands    r6, r8, r3, lsr #20
        teqne   r6, r8
        andnes  r5, r8, r1, lsr #20
        teqne   r5, r8
        beq     LAGE_DBL_MUL_SPECIAL
LAGE_RETURN_MAIN:
        teq     r1, r3
        umull   r12, r4, r0, r2
        bic     r3, r3, r8, lsl #21
        orr     r3, r3, #1, 12
        mov     r7, #0
        umlal   r4, r7, r0, r3
        bic     r1, r1, r8, lsl #21
        orr     r1, r1, #1, 12
        umlal   r4, r7, r2, r1
        add     r5, r5, r6
        mov     r6, #0
        umlal   r7, r6, r3, r1
        sub     r5, r5, #3, 24
        movmi   r2, #2, 2
        movpl   r2, #0
        cmp     r6, #2, 24
        movcc   r6, r6, lsl #1
        orrcc   r6, r6, r7, lsr #31
        movcc   r7, r7, lsl #1
        orrcc   r7, r7, r4, lsr #31
        movcc   r4, r4, lsl #1
        sbc     r5, r5, #0xFF
        orr     r1, r2, r6, lsl #11
        mov     r0, r7, lsl #11
        orr     r1, r1, r7, lsr #21
        orr     r0, r0, r4, lsr #21
        sub     r8, r8, #2
        cmp     r5, r8
        bcs     LAGE_SPECIAL_MUL_EXPONENT
        orrs    r12, r12, r4, lsl #12
        orr     r12, r12, r0, lsl #31
        subcss  r12, r12, #1
        adcs    r0, r0, #0
        adc     r1, r1, r5, lsl #20
        ldmia   sp!, {r4 - r8}
        bx      lr
LAGE_B_INF_NAN:
        cmp     r2, #0
        movne   r1, r3
        movne   r0, r2
        orrne   r1, r1, #2, 14
        bne     LAGE_RETURN
        cmp     r5, #0
        bne     LAGE_B_INF
        cmp     r0, #0
        moveq   r1, #0xFF, 8
        orreq   r1, r1, #0x3E, 14
        moveq   r0, #0
        beq     LAGE_RETURN
LAGE_B_INF:
        mov     r1, r4
        orr     r1, r1, r7
        mov     r0, #0
        ldmia   sp!, {r4 - r8}
        bx      lr
LAGE_A_INF_NAN:
        cmp     r0, #0
        orrne   r1, r1, #2, 14
        orreq   r1, r5, r4
LAGE_RETURN:
        ldmia   sp!, {r4 - r8}
        bx      lr
LAGE_CHECK_A_NAN:
        cmp     r0, #0
        orrne   r1, r1, #2, 14
        bne     LAGE_RETURN
        b       LAGE_RETURN_SPECIAL_B
LAGE_DBL_MUL_SPECIAL_B:
        cmp     r5, r7
        orrhi   r1, r1, #2, 14
        bhi     LAGE_RETURN
        beq     LAGE_CHECK_A_NAN
LAGE_RETURN_SPECIAL_B:
        cmp     r6, r7
        movhi   r1, r3
        movhi   r0, r2
        orrhi   r1, r1, #2, 14
        bhi     LAGE_RETURN
        beq     LAGE_B_INF_NAN
        mov     r12, #0
LAGE_norm_b:
        add     r12, r12, #1
        mov     r6, r6, lsl #1
        orr     r6, r6, r2, lsr #31
        mov     r2, r2, lsl #1
        cmp     r6, #1, 12
        bcc     LAGE_norm_b
        and     r3, r3, #2, 2
        orr     r3, r3, r6
        tst     r8, r5, lsr #20
        teqne   r8, r5, lsr #20
        beq     LAGE_DBL_MUL_SPECIAL_A
        mov     r5, r5, lsr #20
        mov     r6, r6, lsr #20
        sub     r5, r5, r12
        b       LAGE_RETURN_MAIN
LAGE_DBL_MUL_SPECIAL:
        orrs    r5, r0, r1, lsl #1
        beq     LAGE_DBL_A_ZERO_CHECK_B
        orrs    r6, r2, r3, lsl #1
        beq     LAGE_DBL_B_ZERO
        bic     r5, r1, #2, 2
        bic     r6, r3, #2, 2
        mov     r7, r8, lsl #20
        eor     r4, r1, r3
        and     r4, r4, #2, 2
        mov     r12, #0
        tst     r8, r6, lsr #20
        teqne   r8, r6, lsr #20
        beq     LAGE_DBL_MUL_SPECIAL_B
LAGE_DBL_MUL_SPECIAL_A:
        cmp     r5, r7
        orrhi   r1, r1, #2, 14
        bhi     LAGE_RETURN
        beq     LAGE_A_INF_NAN
LAGE_norm_a:
        add     r12, r12, #1
        mov     r5, r5, lsl #1
        orr     r5, r5, r0, lsr #31
        mov     r0, r0, lsl #1
        cmp     r5, #1, 12
        bcc     LAGE_norm_a
        and     r1, r1, #2, 2
        orr     r1, r1, r5
        mov     r5, r5, lsr #20
        mov     r6, r6, lsr #20
        sub     r5, r5, r12
        b       LAGE_RETURN_MAIN
LAGE_SPECIAL_MUL_EXPONENT:
        cmp     r5, r8
        bge     LAGE_DBL_OVERFLOW_MUL
        orr     r6, r12, r4, lsl #11
        and     r4, r1, #2, 2
        bic     r1, r1, #2, 2
        add     r3, r5, #0x1F
        mvn     r2, #0
        sub     r5, r2, r5
        cmp     r5, #0x36
        movhi   r1, #0
        cmp     r5, #0x20
        orrhi   r6, r6, r0
        addhi   r3, r3, #0x20
        orrhi   r6, r6, r1, lsl r3
        movhi   r0, r1
        movhi   r1, #0
        subhi   r5, r5, #0x20
        mov     r2, #1
        mov     r8, r2, lsl r5
        sub     r8, r8, r2
        and     r8, r0, r8
        mov     r0, r0, lsr r5
        mov     r12, #0x20
        sub     r12, r12, r5
        orr     r0, r0, r1, lsl r12
        mov     r1, r1, lsr r5
        orr     r6, r6, r8
        and     r7, r0, #1
        mov     r0, r0, lsr #1
        orr     r0, r0, r1, lsl #31
        mov     r1, r1, lsr #1
        and     r2, r0, #1
        orr     r2, r6, r2
        mov     r8, #0
        cmp     r2, #0
        movne   r8, #1
        and     r8, r8, r7
        adds    r0, r0, r8
        adc     r1, r1, #0
        orr     r1, r1, r4
        ldmia   sp!, {r4 - r8}
        bx      lr
LAGE_DBL_OVERFLOW_MUL:
        and     r2, r1, #2, 2
        bic     r1, r1, #2, 2
        orrs    r12, r12, r4, lsl #12
        orr     r12, r12, r0, lsl #31
        subcss  r12, r12, #1
        adcs    r0, r0, #0
        adc     r1, r1, #0
        cmp     r1, #2, 12
        movcs   r1, r1, lsr #1
        adc     r5, r5, #0
        add     r8, r8, #1
        cmp     r5, r8
        bcs     LAGE_DBL_OF_MUL
        add     r1, r1, r5, lsl #20
        orr     r1, r1, r2
        ldmia   sp!, {r4 - r8}
        bx      lr
LAGE_DBL_OF_MUL:
        orr     r1, r2, #0x7F, 8
        orr     r1, r1, #0xF, 12
        mov     r0, #0
        ldmia   sp!, {r4 - r8}
        bx      lr
LAGE_DBL_A_ZERO_CHECK_B:
        eor     r4, r1, r3
        mov     r1, #0xFF, 8
        orr     r1, r1, #0xE, 12
        cmp     r1, r3, lsl #1
        rsbeqs  r0, r2, #0
        movcc   r1, r3
        movcc   r0, r2
        moveq   r0, #0
        orrls   r1, r1, #6, 14
        andhi   r1, r4, #2, 2
        movhi   r0, #0
        ldmia   sp!, {r4 - r8}
        bx      lr
LAGE_DBL_B_ZERO:
        eor     r4, r1, r3
        mov     r3, #0xFF, 8
        orr     r3, r3, #0xE, 12
        cmp     r3, r1, lsl #1
        rsbeqs  r2, r0, #0
        moveq   r1, r3
        moveq   r0, #0
        orrls   r1, r1, #6, 14
        andhi   r1, r4, #2, 2
        movhi   r0, #0
        ldmia   sp!, {r4 - r8}
        bx      lr


