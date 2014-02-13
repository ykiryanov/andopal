        .text
        .align  4
        .globl  __aeabi_ddiv
        .globl  __divdf3


LAGU_dbl_recip_table:
        .long   0xfc0cfe00
        .long   0xf83cfa20
        .long   0xf488f660
        .long   0xf0f0f2b8
        .long   0xed70ef2c
        .long   0xea0cebbc
        .long   0xe6c0e864
        .long   0xe38ce524
        .long   0xe070e1fc
        .long   0xdd64dee8
        .long   0xda74dbe8
        .long   0xd794d900
        .long   0xd4c4d628
        .long   0xd20cd368
        .long   0xcf64d0b4
        .long   0xccccce14
        .long   0xca44cb84
        .long   0xc7ccc904
        .long   0xc564c698
        .long   0xc30cc434
        .long   0xc0c0c1e4
        .long   0xbe80bfa0
        .long   0xbc50bd68
        .long   0xba2cbb3c
        .long   0xb814b920
        .long   0xb608b70c
        .long   0xb408b508
        .long   0xb214b30c
        .long   0xb02cb11c
        .long   0xae4caf38
        .long   0xac74ad60
        .long   0xaaa8ab8c
        .long   0xa8e8a9c8
        .long   0xa72ca808
        .long   0xa57ca654
        .long   0xa3d4a4a8
        .long   0xa234a304
        .long   0xa0a0a168
        .long   0x9f109fd8
        .long   0x9d889e4c
        .long   0x9c089cc8
        .long   0x9a909b4c
        .long   0x991c99d4
        .long   0x97b49868
        .long   0x964c9700
        .long   0x94f095a0
        .long   0x93989444
        .long   0x924892f0
        .long   0x90fc91a0
        .long   0x8fb89058
        .long   0x8e788f14
        .long   0x8d3c8dd8
        .long   0x8c088ca0
        .long   0x8ad88b70
        .long   0x89ac8a40
        .long   0x88888918
        .long   0x876487f4
        .long   0x864886d8
        .long   0x853485bc
        .long   0x842084a8
        .long   0x83108398
        .long   0x8208828c
        .long   0x81008184
        .long   0x80008080
        .long   0xf0f4f8fc
        .long   0xe2e6e8ec
        .long   0xd4d8dcde
        .long   0xcaccd0d2
        .long   0xbec2c4c6
        .long   0xb4b6babc
        .long   0xacaeb0b2
        .long   0xa2a4a8aa
        .long   0x9a9c9ea0
        .long   0x9496989a
        .long   0x8c8e9092
        .long   0x86888a8c
        .long   0x80828484
        .long   0x7a7c7e80
        .long   0x7676787a
        .long   0x70727474
        .long   0x6c6e6e70
        .long   0x68686a6c
        .long   0x64646666
        .long   0x60606262
        .long   0x5c5e5e60
        .long   0x585a5a5c
        .long   0x56565858
        .long   0x52545454
        .long   0x50505252
        .long   0x4c4e4e4e
        .long   0x4a4a4c4c
        .long   0x48484a4a
        .long   0x46464648
        .long   0x44444444
        .long   0x42424242
        .long   0x40404040
__aeabi_ddiv:
        sub     r12, pc, #0xA2, 30
__divdf3:
        sub     r12, pc, #0xA3, 30
        stmdb   sp!, {r4 - r9, r11}
        mov     r8, #0x7F, 28
        orr     r8, r8, #0xF
        eor     r4, r1, r3
        ands    r6, r8, r3, lsr #20
        teqne   r6, r8
        andnes  r5, r8, r1, lsr #20
        teqne   r5, r8
        beq     LAGU_DBL_DIV_SPECIAL
LAGU_RETURN_MAIN:
        bic     r3, r3, r8, lsl #21
        orr     r3, r3, #1, 12
        add     r9, r12, #6, 26
        ldrb    r9, [r9, +r3, lsr #13]
        mvn     r7, #1
        and     r7, r7, r3, lsr #12
        ldrh    r7, [r12, +r7]
        and     r12, r3, #0x7F, 26
        mov     r12, r12, lsr #5
        rsb     r12, r12, #0xFE
        mov     r7, r7, lsl #7
        mla     r7, r9, r12, r7
        bic     r1, r1, r8, lsl #21
        umull   r9, r12, r2, r7
        sub     r5, r5, r6
        orr     r1, r1, #1, 12
        umull   r6, r2, r0, r7
        mov     r11, #0
        add     r5, r5, #3, 24
        umlal   r12, r11, r7, r3
        mov     r0, #0
        add     r5, r5, #0xFD
        umlal   r2, r0, r7, r1
        mov     r7, #0
        rsbs    r9, r9, #0
        rsc     r12, r12, #0
        mov     r8, r6, lsl #11
        umlal   r8, r7, r9, r0
        mov     r6, r6, lsr #21
        orr     r6, r6, r2, lsl #11
        adds    r6, r6, r7
        mov     r7, #0
        adc     r2, r7, r2, lsr #21
        umlal   r6, r2, r12, r0
        mov     r3, r8, lsl #11
        mov     r8, r8, lsr #21
        umlal   r3, r7, r9, r2
        orr     r8, r8, r6, lsl #11
        mov     r1, #0
        adds    r8, r8, r7
        adc     r6, r1, r6, lsr #21
        umlal   r8, r6, r12, r2
        add     r0, r2, r0, lsl #11
        mov     r2, r3, lsl #11
        umlal   r2, r1, r9, r6
        mov     r3, r3, lsr #21
        orr     r3, r3, r8, lsl #11
        adds    r3, r3, r1
        mov     r7, #0
        adc     r8, r7, r8, lsr #21
        umlal   r3, r8, r12, r6
        and     r4, r4, #2, 2
        mov     r1, r2, lsl #11
        umlal   r1, r7, r9, r8
        mov     r2, r2, lsr #21
        orr     r2, r2, r3, lsl #11
        adds    r2, r2, r7
        mov     r7, #0
        adc     r3, r7, r3, lsr #21
        umlal   r2, r3, r12, r8
        add     r6, r8, r6, lsl #11
        mov     r8, r1, lsl #11
        umlal   r8, r7, r9, r3
        mov     r1, r1, lsr #21
        orr     r1, r1, r2, lsl #11
        mov     r2, r2, lsr #21
        adds    r1, r1, r7
        adc     r2, r2, #0
        umlal   r1, r2, r12, r3
        mov     r7, #7, 24
        orr     r7, r7, #0xFC
        cmp     r5, r7
        bcs     LAGU_SPECIAL_EXPONENT
        adds    r9, r8, r9
        adcs    r12, r1, r12
        sbcs    r11, r2, r11
        mov     r7, r0, lsl #1
        adcs    r0, r3, r6, lsl #11
        adc     r3, r7, r6, lsr #21
        mov     r6, #2
        cmp     r3, #2, 10
        addcs   r6, r6, #1
        rsb     r9, r6, #0x20
        mov     r8, r0, lsl r9
        addcs   r5, r5, #1
LAGU_RETURN_MAIN_DIV:
        mov     r0, r0, lsr r6
        cmp     r8, #2, 2
        orr     r0, r0, r3, lsl r9
        orr     r1, r4, r5, lsl #20
        mov     r3, r3, lsr r6
        adcs    r0, r0, #0
        adc     r1, r1, r3
        ldmia   sp!, {r4 - r9, r11}
        bx      lr
LAGU_B_INF_NAN:
        cmp     r2, #0
        movne   r1, r3
        movne   r0, r2
        orrne   r1, r1, #2, 14
        bne     LAGU_RETURN
        cmp     r5, r7
        bne     LAGU_B_INF
        cmp     r0, #0
        moveq   r1, #0xFF, 8
        orreq   r1, r1, #0x3E, 14
        moveq   r0, #0
        beq     LAGU_RETURN
LAGU_B_INF:
        mov     r1, r4
        mov     r0, #0
        ldmia   sp!, {r4 - r9, r11}
        bx      lr
LAGU_B_ZERO:
        orr     r11, r5, r0
        cmp     r11, #0
        moveq   r1, #0xFF, 8
        orreq   r1, r1, #0x3E, 14
        moveq   r0, #0
        movne   r1, r7
        movne   r0, #0
        orrne   r1, r1, r4
        ldmia   sp!, {r4 - r9, r11}
        bx      lr
LAGU_A_INF_NAN:
        cmp     r0, #0
        orrne   r1, r1, #2, 14
        orreq   r1, r5, r4
LAGU_RETURN:
        ldmia   sp!, {r4 - r9, r11}
        bx      lr
LAGU_CHECK_A_NAN:
        cmp     r0, #0
        orrne   r1, r1, #2, 14
        bne     LAGU_RETURN
        b       LAGU_RETURN_SPECIAL_B
LAGU_DBL_DIV_SPECIAL_B:
        cmp     r5, r7
        orrhi   r1, r1, #2, 14
        bhi     LAGU_RETURN
        beq     LAGU_CHECK_A_NAN
LAGU_RETURN_SPECIAL_B:
        cmp     r6, r7
        movhi   r1, r3
        movhi   r0, r2
        orrhi   r1, r1, #2, 14
        bhi     LAGU_RETURN
        beq     LAGU_B_INF_NAN
        orrs    r11, r6, r2
        beq     LAGU_B_ZERO
LAGU_norm_b:
        sub     r9, r9, #1
        mov     r6, r6, lsl #1
        orr     r6, r6, r2, lsr #31
        mov     r2, r2, lsl #1
        cmp     r6, #1, 12
        bcc     LAGU_norm_b
        mov     r3, r6
        tst     r8, r5, lsr #20
        teqne   r8, r5, lsr #20
        beq     LAGU_DBL_DIV_SPECIAL_A
        mov     r5, r5, lsr #20
        mov     r6, r6, lsr #20
        sub     r5, r5, r9
        b       LAGU_RETURN_MAIN
LAGU_DBL_DIV_SPECIAL:
        bic     r5, r1, #2, 2
        bic     r6, r3, #2, 2
        mov     r7, r8, lsl #20
        and     r4, r4, #2, 2
        mov     r9, #0
        tst     r8, r6, lsr #20
        teqne   r8, r6, lsr #20
        beq     LAGU_DBL_DIV_SPECIAL_B
LAGU_DBL_DIV_SPECIAL_A:
        orrs    r11, r5, r0
        moveq   r1, r4
        beq     LAGU_RETURN
        cmp     r5, r7
        orrhi   r1, r1, #2, 14
        bhi     LAGU_RETURN
        beq     LAGU_A_INF_NAN
LAGU_norm_a:
        add     r9, r9, #1
        mov     r5, r5, lsl #1
        orr     r5, r5, r0, lsr #31
        mov     r0, r0, lsl #1
        cmp     r5, #1, 12
        bcc     LAGU_norm_a
        mov     r1, r5
        mov     r5, r5, lsr #20
        mov     r6, r6, lsr #20
        sub     r5, r5, r9
        b       LAGU_RETURN_MAIN
LAGU_SPECIAL_EXPONENT:
        adds    r9, r8, r9
        adcs    r12, r1, r12
        sbcs    r11, r2, r11
        movcs   r8, r9
        movcs   r1, r12
        movcs   r2, r11
        orr     r7, r8, r1
        orr     r7, r7, r2
        mov     r2, r0, lsl #1
        adcs    r0, r3, r6, lsl #11
        adc     r3, r2, r6, lsr #21
        mov     r6, #2
        cmp     r3, #2, 10
        addcs   r6, r6, #1
        rsb     r9, r6, #0x20
        mov     r8, r0, lsl r9
        addcs   r5, r5, #1
        cmp     r5, #0x7F, 28
        bge     LAGU_DBL_OVERFLOW_DIV
        cmp     r5, #0
        bge     LAGU_RETURN_MAIN_DIV
        mov     r0, r0, lsr r6
        orr     r0, r0, r3, lsl r9
        mov     r1, r3, lsr r6
        mvn     r2, #0
        sub     r5, r2, r5
        cmp     r5, #0x36
        movhi   r1, #0
        orr     r7, r7, r8
        cmp     r5, #0x20
        subhi   r5, r5, #0x20
        rsbhi   r3, r5, #0x20
        orrhi   r7, r7, r0
        orrhi   r7, r7, r1, lsl r3
        movhi   r0, r1
        movhi   r1, #0
        mov     r2, #1
        mov     r8, r2, lsl r5
        sub     r8, r8, r2
        and     r8, r0, r8
        mov     r0, r0, lsr r5
        mov     r9, #0x20
        sub     r9, r9, r5
        orr     r0, r0, r1, lsl r9
        mov     r1, r1, lsr r5
        orr     r7, r7, r8
        and     r6, r0, #1
        mov     r0, r0, lsr #1
        orr     r0, r0, r1, lsl #31
        mov     r1, r1, lsr #1
        and     r2, r0, #1
        orr     r2, r7, r2
        mov     r8, #0
        cmp     r2, #0
        movne   r8, #1
        and     r8, r8, r6
        adds    r0, r0, r8
        adc     r1, r1, #0
        orr     r1, r1, r4
        ldmia   sp!, {r4 - r9, r11}
        bx      lr
LAGU_DBL_OVERFLOW_DIV:
        mov     r0, r0, lsr r6
        cmp     r8, #2, 2
        orr     r0, r0, r3, lsl r9
        mov     r3, r3, lsr r6
        adcs    r0, r0, #0
        adc     r3, r3, #0
        cmp     r3, #2, 12
        addcs   r5, r5, #1
        movcs   r3, r3, lsr #1
        mov     r7, #0x7F, 28
        orr     r7, r7, #0xE
        cmp     r5, r7
        bcs     LAGU_DBL_OF_DIV
        orr     r1, r4, r5, lsl #20
        add     r1, r1, r3
        ldmia   sp!, {r4 - r9, r11}
        bx      lr
LAGU_DBL_OF_DIV:
        mov     r1, #0x7F, 8
        add     r1, r1, #0xF, 12
        orr     r1, r4, r1
        mov     r0, #0
        ldmia   sp!, {r4 - r9, r11}
        bx      lr


