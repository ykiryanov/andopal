        .text
        .align  4
        .globl  __intel_uldiv
        .globl  __udivdi3


LAGP_inverse_b:
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
__intel_uldiv:
        sub     r12, pc, #0x88
__udivdi3:
        sub     r12, pc, #0x8C
        stmdb   sp!, {r4 - r7}
        rsbs    r4, r3, #1
        cmpls   r3, r1, lsr #7
        bhi     LAGP_SMALL_B_OR_Q
        clz     r4, r3
        rsb     r5, r4, #0x20
        mov     r6, r3, lsl r4
        orr     r6, r6, r2, lsr r5
        ldrb    r12, [r12, +r6, lsr #25]
        sub     r4, r4, #7
        mov     r12, r12, lsl r4
        umull   r2, r5, r12, r2
        mov     r4, #0
        mla     r3, r12, r3, r5
        umull   r7, r6, r12, r0
        mov     r0, #0
        umlal   r6, r0, r12, r1
        rsbs    r2, r2, #0
        rsc     r3, r3, #0
        umlal   r7, r4, r2, r0
        mov     r12, #0
        umlal   r6, r12, r3, r0
        adds    r6, r6, r4
        adc     r12, r12, #0
        add     r0, r12, r0
        mov     r4, #0
        umlal   r7, r4, r2, r12
        mov     r5, #0
        umlal   r6, r5, r3, r12
        adds    r6, r6, r4
        adc     r5, r5, #0
        add     r0, r5, r0
        mov     r4, #0
        umlal   r7, r4, r2, r5
        mov     r12, #0
        umlal   r6, r12, r3, r5
        adds    r6, r6, r4
        adc     r12, r12, #0
        add     r0, r12, r0
        mov     r4, #0
        umlal   r7, r4, r2, r12
        mov     r5, #0
        umlal   r6, r5, r3, r12
        adds    r6, r6, r4
        adc     r5, r5, #0
        add     r0, r5, r0
        mov     r4, #0
        umlal   r7, r4, r2, r5
        mov     r12, #0
        umlal   r6, r12, r3, r5
        adds    r6, r6, r4
        adc     r12, r12, #0
        add     r0, r12, r0
        mov     r4, #0
        umlal   r7, r4, r2, r12
        mov     r5, #0
        umlal   r6, r5, r3, r12
        adds    r6, r6, r4
        adc     r5, r5, #0
        adds    r7, r7, r2
        adcs    r6, r6, r3
        adc     r0, r5, r0
        mov     r1, #0
        ldmia   sp!, {r4 - r7}
        bx      lr
LAGP_SMALL_B_OR_Q:
        cmp     r3, #0
        bne     LAGP_SMALL_Q_LARGE_B
        clz     r4, r2
        rsbs    r5, r2, #4
        cmpcc   r2, #2, 8
        rsbccs  r5, r1, #0
        bcs     LAGP_SMALL_MED_B_OR_SMALL_A
        mov     r3, r2, lsl r4
        ldrb    r12, [r12, +r3, lsr #25]
        sub     r4, r4, #7
        mov     r12, r12, lsl r4
        mul     r2, r12, r2
        mov     r3, #0
        umull   r4, r0, r12, r0
        umull   r5, r1, r12, r1
        adds    r0, r0, r5
        adc     r1, r1, #0
        rsb     r2, r2, #0
        umlal   r4, r3, r0, r2
        umull   r5, r6, r1, r2
        adds    r3, r3, r5
        adc     r6, r6, #0
        adds    r0, r3, r0
        adc     r1, r6, r1
        mov     r12, #0
        umlal   r4, r12, r3, r2
        umull   r5, r6, r2, r6
        adds    r12, r12, r5
        adc     r6, r6, #0
        adds    r0, r12, r0
        adc     r1, r6, r1
        mov     r3, #0
        umlal   r4, r3, r12, r2
        umull   r5, r6, r2, r6
        adds    r3, r3, r5
        adc     r6, r6, #0
        adds    r0, r3, r0
        adc     r1, r6, r1
        mov     r12, #0
        umlal   r4, r12, r3, r2
        umull   r5, r6, r2, r6
        adds    r12, r12, r5
        adc     r6, r6, #0
        adds    r0, r12, r0
        adc     r1, r6, r1
        mov     r3, #0
        umlal   r4, r3, r12, r2
        umull   r5, r6, r2, r6
        adds    r3, r3, r5
        adc     r6, r6, #0
        adds    r0, r3, r0
        adc     r1, r6, r1
        mov     r12, #0
        umlal   r4, r12, r3, r2
        mov     r3, #0
        adds    r0, r12, r0
        adc     r1, r1, #0
        umlal   r4, r3, r2, r12
        mov     r12, #0
        adds    r0, r3, r0
        adc     r1, r1, #0
        umlal   r4, r12, r2, r3
        mov     r3, #0
        adds    r0, r12, r0
        adc     r1, r1, #0
        umlal   r4, r3, r2, r12
        mov     r12, #0
        adds    r0, r3, r0
        adc     r1, r1, #0
        umlal   r4, r12, r2, r3
        mov     r3, #0
        adds    r0, r12, r0
        adc     r1, r1, #0
        umlal   r4, r3, r2, r12
        mov     r12, #0
        cmn     r2, r4
        adcs    r0, r3, r0
        adc     r1, r1, #0
        ldmia   sp!, {r4 - r7}
        bx      lr
LAGP_SMALL_MED_B_OR_SMALL_A:
        cmp     r2, #5
        cmpcs   r1, #1
        bcc     LAGP_VERY_SMALL_B_OR_SMALL_A
        mov     r5, r2, lsl r4
        ldrb    r12, [r12, +r5, lsr #25]
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
        umull   r7, r3, r2, r12
        add     r4, r4, #0x19
        rsb     r5, r4, #0x20
        mov     r3, r3, lsl r4
        orr     r3, r3, r7, lsr r5
        mov     r2, r7, lsl r4
        rsbs    r2, r2, #0
        rsc     r3, r3, #0
        umull   r7, r5, r0, r12
        umull   r1, r0, r12, r1
        adds    r1, r1, r5
        adc     r0, r0, #0
        rsb     r5, r4, #0x20
        movs    r0, r0, lsl r4
        orr     r0, r0, r1, lsr r5
        mov     r1, r1, lsl r4
        orr     r1, r1, r7, lsr r5
        mov     r7, r7, lsl r4
        adc     r6, r6, #0
        mov     r4, #0
        umlal   r7, r4, r2, r0
        mov     r12, #0
        umlal   r1, r12, r3, r0
        addcs   r12, r12, r3
        addcss  r1, r1, r2
        adc     r12, r12, #0
        adds    r5, r1, r4
        adc     r12, r12, #0
        adds    r0, r12, r0
        adc     r1, r6, #0
        mov     r4, #0
        umlal   r7, r4, r2, r12
        mov     r6, #0
        umlal   r5, r6, r3, r12
        adds    r5, r5, r4
        adc     r6, r6, #0
        adds    r0, r6, r0
        adc     r1, r1, #0
        mov     r4, #0
        umlal   r7, r4, r2, r6
        mov     r12, #0
        umlal   r5, r12, r3, r6
        adds    r5, r5, r4
        adc     r12, r12, #0
        adds    r0, r12, r0
        adc     r1, r1, #0
        mov     r4, #0
        umlal   r7, r4, r2, r12
        mov     r6, #0
        umlal   r5, r6, r3, r12
        adds    r5, r5, r4
        adc     r6, r6, #0
        adds    r0, r6, r0
        adc     r1, r1, #0
        mov     r4, #0
        umlal   r7, r4, r2, r6
        mov     r12, #0
        umlal   r5, r12, r3, r6
        adds    r5, r5, r4
        adc     r12, r12, #0
        adds    r0, r12, r0
        adc     r1, r1, #0
        mov     r4, #0
        umlal   r7, r4, r2, r12
        mov     r6, #0
        umlal   r5, r6, r3, r12
        adds    r5, r5, r4
        adc     r6, r6, #0
        adds    r7, r7, r2
        adcs    r5, r5, r3
        adcs    r0, r6, r0
        adc     r1, r1, #0
        ldmia   sp!, {r4 - r7}
        bx      lr
LAGP_SMALL_Q_LARGE_B:
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
        mov     r1, #0
        mov     r0, r5
        ldmia   sp!, {r4 - r7}
        bx      lr
LAGP_VERY_SMALL_B_OR_SMALL_A:
        cmp     r2, #5
        bcc     LAGP_VERY_SMALL_B
        mov     r3, r2, lsl r4
        ldrb    r12, [r12, +r3, lsr #25]
        cmp     r2, r0, lsr #7
        bhi     LAGP_SHORT_Q
        sub     r4, r4, #7
        mov     r12, r12, lsl r4
        mul     r2, r12, r2
        mov     r3, #0
        umull   r5, r0, r12, r0
        rsb     r2, r2, #0
        umlal   r5, r3, r2, r0
        mov     r12, #0
        add     r0, r3, r0
        umlal   r5, r12, r2, r3
        mov     r3, #0
        add     r0, r12, r0
        umlal   r5, r3, r2, r12
        mov     r12, #0
        add     r0, r3, r0
        umlal   r5, r12, r2, r3
        mov     r3, #0
        add     r0, r12, r0
        umlal   r5, r3, r2, r12
        cmn     r5, r2
        adc     r0, r3, r0
        ldmia   sp!, {r4 - r7}
        bx      lr
LAGP_SHORT_Q:
        mov     r12, r0
        mov     r0, #0
        cmp     r2, r12, lsr #2
        bhi     LAGP_SHORT_QUOTIENT
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
LAGP_SHORT_QUOTIENT:
        cmp     r2, r12, lsr #1
        subls   r12, r12, r2, lsl #1
        orrls   r0, r0, #2
        cmp     r2, r12
        orrls   r0, r0, #1
        ldmia   sp!, {r4 - r7}
        bx      lr
LAGP_VERY_SMALL_B:
        ldmia   sp!, {r4 - r7}
        cmp     r2, #1
        bxeq    lr
        cmp     r2, #2
        moveq   r0, r0, lsr #1
        orreq   r0, r0, r1, lsl #31
        moveq   r1, r1, lsr #1
        bxeq    lr
        cmp     r2, #0
        beq     LAGP__div0
        rsbs    r3, r2, #4
        moveq   r0, r0, lsr #2
        orreq   r0, r0, r1, lsl #30
        moveq   r1, r1, lsr #2
        bxeq    lr
        mov     r2, #0x55, 8
        orr     r2, r2, r2, lsr #8
        orr     r2, r2, r2, lsr #16
        umull   r3, r0, r2, r0
        umull   r12, r1, r2, r1
        adds    r0, r0, r12
        adc     r1, r1, #0
        adds    r3, r3, r0
        adc     r12, r1, #0
        cmp     r3, r3
        adcs    r3, r3, r12
        adcs    r0, r0, r12
        adc     r1, r1, #0
        bx      lr
LAGP__div0:
        mov     r0, #0
        mov     r1, #0
        bx      lr


