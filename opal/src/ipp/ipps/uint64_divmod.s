        .text
        .align  4
        .globl  __aeabi_uldivmod
        .globl  __uldivmod
        .globl  UDIVMOD64_rem


LAGK_inverse_b:
        .long   0xf0f4f8fc
        .long   0xe3e6eaed
        .long   0xd7dadde0
        .long   0xcccfd2d4
        .long   0xc3c5c7ca
        .long   0xbabcbec0
        .long   0xb2b4b6b8
        .long   0xaaacaeb0
        .long   0xa3a5a7a8
        .long   0x9d9fa0a2
        .long   0x97999a9c
        .long   0x92939496
        .long   0x8d8e8f90
        .long   0x88898a8c
        .long   0x84858687
        .long   0x80818283
__aeabi_uldivmod:
        sub     r12, pc, #0x88
__uldivmod:
        sub     r12, pc, #0x8C
        stmdb   sp!, {r4 - r10}
        rsbs    r4, r3, #1
        cmpls   r3, r1, lsr #7
        bhi     LAGK_SMALL_B_OR_Q
        clz     r4, r3
        rsb     r5, r4, #0x20
        mov     r6, r3, lsl r4
        orr     r6, r6, r2, lsr r5
        ldrb    r12, [r12, +r6, lsr #25]
        sub     r4, r4, #7
        mov     r12, r12, lsl r4
        umull   r8, r5, r12, r2
        mov     r4, #0
        mla     r9, r12, r3, r5
        umull   r7, r6, r12, r0
        mov     r10, #0
        umlal   r6, r10, r12, r1
        rsbs    r8, r8, #0
        rsc     r9, r9, #0
        umlal   r7, r4, r8, r10
        mov     r12, #0
        umlal   r6, r12, r9, r10
        adds    r6, r6, r4
        adc     r12, r12, #0
        add     r10, r12, r10
        mov     r4, #0
        umlal   r7, r4, r8, r12
        mov     r5, #0
        umlal   r6, r5, r9, r12
        adds    r6, r6, r4
        adc     r5, r5, #0
        add     r10, r5, r10
        mov     r4, #0
        umlal   r7, r4, r8, r5
        mov     r12, #0
        umlal   r6, r12, r9, r5
        adds    r6, r6, r4
        adc     r12, r12, #0
        add     r10, r12, r10
        mov     r4, #0
        umlal   r7, r4, r8, r12
        mov     r5, #0
        umlal   r6, r5, r9, r12
        adds    r6, r6, r4
        adc     r5, r5, #0
        add     r10, r5, r10
        mov     r4, #0
        umlal   r7, r4, r8, r5
        mov     r12, #0
        umlal   r6, r12, r9, r5
        adds    r6, r6, r4
        adc     r12, r12, #0
        add     r10, r12, r10
        mov     r4, #0
        umlal   r7, r4, r8, r12
        mov     r5, #0
        umlal   r6, r5, r9, r12
        rsbs    r2, r2, #0
        rsc     r3, r3, #0
        adds    r6, r6, r4
        adc     r5, r5, #0
        adds    r7, r7, r8
        adcs    r6, r6, r9
        adc     r10, r5, r10
        umlal   r0, r1, r2, r10
        mov     r2, r0
        mla     r3, r10, r3, r1
        mov     r1, #0
        mov     r0, r10
        ldmia   sp!, {r4 - r10}
        bx      lr
LAGK_SMALL_B_OR_Q:
        cmp     r3, #0
        bne     LAGK_SMALL_Q_LARGE_B
        clz     r4, r2
        rsbs    r5, r2, #4
        cmpcc   r2, #2, 8
        rsbccs  r5, r1, #0
        bcs     LAGK_SMALL_MED_B_OR_SMALL_A
        mov     r3, r2, lsl r4
        ldrb    r12, [r12, +r3, lsr #25]
        sub     r4, r4, #7
        mov     r12, r12, lsl r4
        mul     r10, r12, r2
        mov     r3, #0
        umull   r4, r8, r12, r0
        umull   r5, r9, r12, r1
        adds    r8, r8, r5
        adc     r9, r9, #0
        rsb     r10, r10, #0
        umlal   r4, r3, r8, r10
        umull   r5, r6, r9, r10
        adds    r3, r3, r5
        adc     r6, r6, #0
        adds    r8, r3, r8
        adc     r9, r6, r9
        mov     r12, #0
        umlal   r4, r12, r3, r10
        umull   r5, r6, r10, r6
        adds    r12, r12, r5
        adc     r6, r6, #0
        adds    r8, r12, r8
        adc     r9, r6, r9
        mov     r3, #0
        umlal   r4, r3, r12, r10
        umull   r5, r6, r10, r6
        rsb     r2, r2, #0
        adds    r3, r3, r5
        adc     r6, r6, #0
        adds    r8, r3, r8
        adc     r9, r6, r9
        mov     r12, #0
        umlal   r4, r12, r3, r10
        umull   r5, r6, r10, r6
        adds    r12, r12, r5
        adc     r6, r6, #0
        adds    r8, r12, r8
        adc     r9, r6, r9
        mov     r3, #0
        umlal   r4, r3, r12, r10
        umull   r5, r6, r10, r6
        adds    r3, r3, r5
        adc     r6, r6, #0
        adds    r8, r3, r8
        adc     r9, r6, r9
        mov     r12, #0
        umlal   r4, r12, r3, r10
        mov     r3, #0
        adds    r8, r12, r8
        adc     r9, r9, #0
        umlal   r4, r3, r10, r12
        mov     r12, #0
        adds    r8, r3, r8
        adc     r9, r9, #0
        umlal   r4, r12, r10, r3
        mov     r3, #0
        adds    r8, r12, r8
        adc     r9, r9, #0
        umlal   r4, r3, r10, r12
        mov     r12, #0
        adds    r8, r3, r8
        adc     r9, r9, #0
        umlal   r4, r12, r10, r3
        mov     r3, #0
        adds    r8, r12, r8
        adc     r9, r9, #0
        umlal   r4, r3, r10, r12
        mov     r12, #0
        cmn     r10, r4
        adcs    r8, r3, r8
        adc     r9, r9, #0
        mla     r2, r8, r2, r0
        mov     r3, #0
        mov     r1, r9
        mov     r0, r8
        ldmia   sp!, {r4 - r10}
        bx      lr
LAGK_SMALL_MED_B_OR_SMALL_A:
        cmp     r2, #5
        cmpcs   r1, #1
        bcc     LAGK_VERY_SMALL_B_OR_SMALL_A
        mov     r6, #0
        cmp     r2, r1, lsr #6
        subls   r1, r1, r2, lsl #6
        orrls   r6, r6, #0x40
        cmp     r2, r1, lsr #5
        subls   r1, r1, r2, lsl #5
        orrls   r6, r6, #0x20
        cmp     r2, r1, lsr #4
        subls   r1, r1, r2, lsl #4
        orrls   r6, r6, #0x10
        cmp     r2, r1, lsr #3
        subls   r1, r1, r2, lsl #3
        orrls   r6, r6, #8
        cmp     r2, r1, lsr #2
        subls   r1, r1, r2, lsl #2
        orrls   r6, r6, #4
        cmp     r2, r1, lsr #1
        subls   r1, r1, r2, lsl #1
        orrls   r6, r6, #2
        cmp     r2, r1
        subls   r1, r1, r2
        orrls   r6, r6, #1
        mov     r12, #0
        subs    r8, r0, r2, lsl #31
        sbcs    r9, r1, r2, lsr #1
        movcs   r0, r8
        movcs   r1, r9
        orrcs   r12, r12, #2, 2
        subs    r8, r0, r2, lsl #30
        sbcs    r9, r1, r2, lsr #2
        movcs   r0, r8
        movcs   r1, r9
        orrcs   r12, r12, #1, 2
        subs    r8, r0, r2, lsl #29
        sbcs    r9, r1, r2, lsr #3
        movcs   r0, r8
        movcs   r1, r9
        orrcs   r12, r12, #2, 4
        subs    r8, r0, r2, lsl #28
        sbcs    r9, r1, r2, lsr #4
        movcs   r0, r8
        movcs   r1, r9
        orrcs   r12, r12, #1, 4
        subs    r8, r0, r2, lsl #27
        sbcs    r9, r1, r2, lsr #5
        movcs   r0, r8
        movcs   r1, r9
        orrcs   r12, r12, #2, 6
        subs    r8, r0, r2, lsl #26
        sbcs    r9, r1, r2, lsr #6
        movcs   r0, r8
        movcs   r1, r9
        orrcs   r12, r12, #1, 6
        subs    r8, r0, r2, lsl #25
        sbcs    r9, r1, r2, lsr #7
        movcs   r0, r8
        movcs   r1, r9
        orrcs   r12, r12, #2, 8
        subs    r8, r0, r2, lsl #24
        sbcs    r9, r1, r2, lsr #8
        movcs   r0, r8
        movcs   r1, r9
        orrcs   r12, r12, #1, 8
        subs    r8, r0, r2, lsl #23
        sbcs    r9, r1, r2, lsr #9
        movcs   r0, r8
        movcs   r1, r9
        orrcs   r12, r12, #2, 10
        subs    r8, r0, r2, lsl #22
        sbcs    r9, r1, r2, lsr #10
        movcs   r0, r8
        movcs   r1, r9
        orrcs   r12, r12, #1, 10
        subs    r8, r0, r2, lsl #21
        sbcs    r9, r1, r2, lsr #11
        movcs   r0, r8
        movcs   r1, r9
        orrcs   r12, r12, #2, 12
        subs    r8, r0, r2, lsl #20
        sbcs    r9, r1, r2, lsr #12
        movcs   r0, r8
        movcs   r1, r9
        orrcs   r12, r12, #1, 12
        subs    r8, r0, r2, lsl #19
        sbcs    r9, r1, r2, lsr #13
        movcs   r0, r8
        movcs   r1, r9
        orrcs   r12, r12, #2, 14
        subs    r8, r0, r2, lsl #18
        sbcs    r9, r1, r2, lsr #14
        movcs   r0, r8
        movcs   r1, r9
        orrcs   r12, r12, #1, 14
        subs    r8, r0, r2, lsl #17
        sbcs    r9, r1, r2, lsr #15
        movcs   r0, r8
        movcs   r1, r9
        orrcs   r12, r12, #2, 16
        subs    r8, r0, r2, lsl #16
        sbcs    r9, r1, r2, lsr #16
        movcs   r0, r8
        movcs   r1, r9
        orrcs   r12, r12, #1, 16
        subs    r8, r0, r2, lsl #15
        sbcs    r9, r1, r2, lsr #17
        movcs   r0, r8
        movcs   r1, r9
        orrcs   r12, r12, #2, 18
        subs    r8, r0, r2, lsl #14
        sbcs    r9, r1, r2, lsr #18
        movcs   r0, r8
        movcs   r1, r9
        orrcs   r12, r12, #1, 18
        subs    r8, r0, r2, lsl #13
        sbcs    r9, r1, r2, lsr #19
        movcs   r0, r8
        movcs   r1, r9
        orrcs   r12, r12, #2, 20
        subs    r8, r0, r2, lsl #12
        sbcs    r9, r1, r2, lsr #20
        movcs   r0, r8
        movcs   r1, r9
        orrcs   r12, r12, #1, 20
        subs    r8, r0, r2, lsl #11
        sbcs    r9, r1, r2, lsr #21
        movcs   r0, r8
        movcs   r1, r9
        orrcs   r12, r12, #2, 22
        subs    r8, r0, r2, lsl #10
        sbcs    r9, r1, r2, lsr #22
        movcs   r0, r8
        movcs   r1, r9
        orrcs   r12, r12, #1, 22
        subs    r8, r0, r2, lsl #9
        sbcs    r9, r1, r2, lsr #23
        movcs   r0, r8
        movcs   r1, r9
        orrcs   r12, r12, #2, 24
        subs    r8, r0, r2, lsl #8
        sbcs    r9, r1, r2, lsr #24
        movcs   r0, r8
        movcs   r1, r9
        orrcs   r12, r12, #1, 24
        subs    r8, r0, r2, lsl #7
        sbcs    r9, r1, r2, lsr #25
        movcs   r0, r8
        movcs   r1, r9
        orrcs   r12, r12, #0x80
        subs    r8, r0, r2, lsl #6
        sbcs    r9, r1, r2, lsr #26
        movcs   r0, r8
        movcs   r1, r9
        orrcs   r12, r12, #0x40
        subs    r8, r0, r2, lsl #5
        sbcs    r9, r1, r2, lsr #27
        movcs   r0, r8
        movcs   r1, r9
        orrcs   r12, r12, #0x20
        subs    r8, r0, r2, lsl #4
        sbcs    r9, r1, r2, lsr #28
        movcs   r0, r8
        movcs   r1, r9
        orrcs   r12, r12, #0x10
        subs    r8, r0, r2, lsl #3
        sbcs    r9, r1, r2, lsr #29
        movcs   r0, r8
        movcs   r1, r9
        orrcs   r12, r12, #8
        subs    r8, r0, r2, lsl #2
        sbcs    r9, r1, r2, lsr #30
        movcs   r0, r8
        movcs   r1, r9
        orrcs   r12, r12, #4
        subs    r8, r0, r2, lsl #1
        sbcs    r9, r1, r2, lsr #31
        movcs   r0, r8
        movcs   r1, r9
        orrcs   r12, r12, #2
        subs    r8, r0, r2
        sbcs    r9, r1, #0
        movcs   r0, r8
        movcs   r1, r9
        orrcs   r12, r12, #1
        mov     r3, r1
        mov     r2, r0
        mov     r1, r6
        mov     r0, r12
        ldmia   sp!, {r4 - r10}
        bx      lr
LAGK_SMALL_Q_LARGE_B:
        mov     r5, #0
        mov     r7, #0
        subs    r6, r0, r2, lsl #6
        sbcs    r4, r1, r2, lsr #26
        subcss  r4, r4, r3, lsl #6
        cmpcs   r7, r3, lsr #26
        orrcs   r5, r5, #0x40
        movcs   r0, r6
        movcs   r1, r4
        subs    r6, r0, r2, lsl #5
        sbcs    r4, r1, r2, lsr #27
        subcss  r4, r4, r3, lsl #5
        cmpcs   r7, r3, lsr #27
        orrcs   r5, r5, #0x20
        movcs   r0, r6
        movcs   r1, r4
        subs    r6, r0, r2, lsl #4
        sbcs    r4, r1, r2, lsr #28
        subcss  r4, r4, r3, lsl #4
        cmpcs   r7, r3, lsr #28
        orrcs   r5, r5, #0x10
        movcs   r0, r6
        movcs   r1, r4
        subs    r6, r0, r2, lsl #3
        sbcs    r4, r1, r2, lsr #29
        subcss  r4, r4, r3, lsl #3
        cmpcs   r7, r3, lsr #29
        orrcs   r5, r5, #8
        movcs   r0, r6
        movcs   r1, r4
        subs    r6, r0, r2, lsl #2
        sbcs    r4, r1, r2, lsr #30
        subcss  r4, r4, r3, lsl #2
        cmpcs   r7, r3, lsr #30
        orrcs   r5, r5, #4
        movcs   r0, r6
        movcs   r1, r4
        subs    r6, r0, r2, lsl #1
        sbcs    r4, r1, r2, lsr #31
        subcss  r4, r4, r3, lsl #1
        cmpcs   r7, r3, lsr #31
        orrcs   r5, r5, #2
        movcs   r0, r6
        movcs   r1, r4
        subs    r6, r0, r2
        sbcs    r4, r1, r3
        orrcs   r5, r5, #1
        movcs   r0, r6
        movcs   r1, r4
        mov     r3, r1
        mov     r2, r0
        mov     r1, #0
        mov     r0, r5
        ldmia   sp!, {r4 - r10}
        bx      lr
LAGK_VERY_SMALL_B_OR_SMALL_A:
        cmp     r2, #5
        bcc     LAGK_VERY_SMALL_B
        mov     r7, r2, lsl r4
        ldrb    r12, [r12, +r7, lsr #25]
        cmp     r2, r0, lsr #7
        bhi     LAGK_SHORT_Q
        sub     r4, r4, #7
        mov     r12, r12, lsl r4
        mul     r9, r12, r2
        mov     r7, #0
        umull   r5, r8, r12, r0
        rsb     r9, r9, #0
        umlal   r5, r7, r9, r8
        mov     r12, #0
        add     r8, r7, r8
        umlal   r5, r12, r9, r7
        mov     r7, #0
        add     r8, r12, r8
        umlal   r5, r7, r9, r12
        mov     r12, #0
        add     r8, r7, r8
        umlal   r5, r12, r9, r7
        rsb     r2, r2, #0
        mov     r7, #0
        add     r8, r12, r8
        umlal   r5, r7, r9, r12
        cmn     r5, r9
        adc     r8, r7, r8
        mla     r2, r8, r2, r0
        mov     r0, r8
        ldmia   sp!, {r4 - r10}
        bx      lr
LAGK_SHORT_Q:
        mov     r12, r0
        mov     r0, #0
        cmp     r2, r12, lsr #2
        bhi     LAGK_SHORT_QUOTIENT
        cmp     r2, r12, lsr #6
        subls   r12, r12, r2, lsl #6
        orrls   r0, r0, #0x40
        cmp     r2, r12, lsr #5
        subls   r12, r12, r2, lsl #5
        orrls   r0, r0, #0x20
        cmp     r2, r12, lsr #4
        subls   r12, r12, r2, lsl #4
        orrls   r0, r0, #0x10
        cmp     r2, r12, lsr #3
        subls   r12, r12, r2, lsl #3
        orrls   r0, r0, #8
        cmp     r2, r12, lsr #2
        subls   r12, r12, r2, lsl #2
        orrls   r0, r0, #4
LAGK_SHORT_QUOTIENT:
        cmp     r2, r12, lsr #1
        subls   r12, r12, r2, lsl #1
        orrls   r0, r0, #2
        cmp     r2, r12
        subls   r12, r12, r2
        orrls   r0, r0, #1
        mov     r2, r12
        ldmia   sp!, {r4 - r10}
        bx      lr
LAGK_VERY_SMALL_B:
        cmp     r2, #2
        bhi     LAGK_B34
        ldmia   sp!, {r4 - r10}
        andeq   r2, r0, #1
        moveq   r0, r0, lsr #1
        orreq   r0, r0, r1, lsl #31
        moveq   r1, r1, lsr #1
        bxeq    lr
        cmp     r2, #1
        moveq   r2, #0
        bxeq    lr
        b       __aeabi_ldiv0
LAGK_B34:
        rsbs    r12, r2, #4
        andeq   r2, r0, #3
        moveq   r0, r0, lsr #2
        orreq   r0, r0, r1, lsl #30
        moveq   r1, r1, lsr #2
        beq     LAGK_B_RETURN
        mov     r2, #0x55, 8
        orr     r2, r2, r2, lsr #8
        orr     r2, r2, r2, lsr #16
        umull   r12, r4, r2, r0
        umull   r6, r5, r2, r1
        adds    r4, r4, r6
        adc     r5, r5, #0
        adds    r12, r12, r4
        adc     r6, r5, #0
        cmp     r12, r12
        adcs    r12, r12, r6
        adcs    r4, r4, r6
        adc     r5, r5, #0
        subs    r2, r0, r4
        subs    r2, r2, r4, lsl #1
        mov     r3, #0
        mov     r0, r4
        mov     r1, r5
LAGK_B_RETURN:
        ldmia   sp!, {r4 - r10}
        bx      lr
LAGK__div0:
        .long   0xe3a00000
        .long   0xe3a01000
        .long   0xe12fff1e
UDIVMOD64_rem:
        stmdb   sp!, {lr}
        bl      __aeabi_uldivmod
        mov     r0, r2
        mov     r1, r3
        ldmia   sp!, {pc}


