        .text
        .align  4
        .globl  __intel_ulmod
        .globl  __umoddi3


LAGO_inverse_b:
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
__intel_ulmod:
        sub     r12, pc, #0x88
__umoddi3:
        sub     r12, pc, #0x8C
        stmdb   sp!, {r4 - r10}
        rsbs    r4, r3, #1
        cmpls   r3, r1, lsr #7
        bhi     LAGO_SMALL_B_OR_Q
        clz     r4, r3
        rsb     r5, r4, #0x20
        mov     r6, r3, lsl r4
        orr     r6, r6, r2, lsr r5
        ldrb    r12, [r12, +r6, lsr #25]
        sub     r4, r4, #7
        mov     r12, r12, lsl r4
        umull   r9, r5, r12, r2
        mov     r4, #0
        mla     r10, r12, r3, r5
        umull   r7, r6, r12, r0
        mov     r8, #0
        umlal   r6, r8, r12, r1
        rsbs    r9, r9, #0
        rsc     r10, r10, #0
        umlal   r7, r4, r9, r8
        mov     r12, #0
        umlal   r6, r12, r10, r8
        adds    r6, r6, r4
        adc     r12, r12, #0
        add     r8, r12, r8
        mov     r4, #0
        umlal   r7, r4, r9, r12
        mov     r5, #0
        umlal   r6, r5, r10, r12
        adds    r6, r6, r4
        adc     r5, r5, #0
        add     r8, r5, r8
        mov     r4, #0
        umlal   r7, r4, r9, r5
        mov     r12, #0
        umlal   r6, r12, r10, r5
        adds    r6, r6, r4
        adc     r12, r12, #0
        add     r8, r12, r8
        mov     r4, #0
        umlal   r7, r4, r9, r12
        mov     r5, #0
        umlal   r6, r5, r10, r12
        adds    r6, r6, r4
        adc     r5, r5, #0
        add     r8, r5, r8
        mov     r4, #0
        umlal   r7, r4, r9, r5
        mov     r12, #0
        umlal   r6, r12, r10, r5
        adds    r6, r6, r4
        adc     r12, r12, #0
        add     r8, r12, r8
        mov     r4, #0
        umlal   r7, r4, r9, r12
        mov     r5, #0
        umlal   r6, r5, r10, r12
        adds    r6, r6, r4
        adc     r5, r5, #0
        adds    r7, r7, r9
        adcs    r6, r6, r10
        adc     r8, r5, r8
        umull   r4, r5, r2, r8
        subs    r0, r0, r4
        mla     r6, r3, r8, r5
        sbc     r1, r1, r6
        ldmia   sp!, {r4 - r10}
        bx      lr
LAGO_SMALL_B_OR_Q:
        cmp     r3, #0
        bne     LAGO_SMALL_Q_LARGE_B
        clz     r4, r2
        rsbs    r5, r2, #4
        cmpcc   r2, #2, 8
        rsbccs  r5, r1, #0
        bcs     LAGO_SMALL_MED_B_OR_SMALL_A
        mov     r3, r2, lsl r4
        ldrb    r12, [r12, +r3, lsr #25]
        sub     r4, r4, #7
        mov     r12, r12, lsl r4
        mul     r8, r12, r2
        mov     r3, #0
        umull   r4, r10, r12, r0
        umull   r5, r1, r12, r1
        adds    r10, r10, r5
        adc     r1, r1, #0
        rsb     r8, r8, #0
        umlal   r4, r3, r10, r8
        umull   r5, r6, r1, r8
        adds    r3, r3, r5
        adc     r6, r6, #0
        adds    r10, r3, r10
        mov     r12, #0
        umlal   r4, r12, r3, r8
        umull   r5, r6, r8, r6
        adds    r12, r12, r5
        adc     r6, r6, #0
        adds    r10, r12, r10
        mov     r3, #0
        umlal   r4, r3, r12, r8
        umull   r5, r6, r8, r6
        adds    r3, r3, r5
        adc     r6, r6, #0
        adds    r10, r3, r10
        mov     r12, #0
        umlal   r4, r12, r3, r8
        umull   r5, r6, r8, r6
        adds    r12, r12, r5
        adc     r6, r6, #0
        adds    r10, r12, r10
        mov     r3, #0
        umlal   r4, r3, r12, r8
        umull   r5, r6, r8, r6
        adds    r3, r3, r5
        adc     r6, r6, #0
        adds    r10, r3, r10
        mov     r12, #0
        umlal   r4, r12, r3, r8
        mov     r3, #0
        adds    r10, r12, r10
        umlal   r4, r3, r8, r12
        mov     r12, #0
        adds    r10, r3, r10
        umlal   r4, r12, r8, r3
        mov     r3, #0
        adds    r10, r12, r10
        umlal   r4, r3, r8, r12
        mov     r12, #0
        adds    r10, r3, r10
        umlal   r4, r12, r8, r3
        mov     r3, #0
        adds    r10, r12, r10
        umlal   r4, r3, r8, r12
        mov     r12, #0
        cmn     r8, r4
        adcs    r10, r3, r10
        mul     r4, r10, r2
        mov     r1, #0
        sub     r0, r0, r4
        ldmia   sp!, {r4 - r10}
        bx      lr
LAGO_SMALL_MED_B_OR_SMALL_A:
        cmp     r2, #5
        cmpcs   r1, #1
        bcc     LAGO_VERY_SMALL_B_OR_SMALL_A
        mov     r5, r2, lsl r4
        ldrb    r12, [r12, +r5, lsr #25]
        cmp     r2, r1, lsr #6
        subls   r1, r1, r2, lsl #6
        cmp     r2, r1, lsr #5
        subls   r1, r1, r2, lsl #5
        cmp     r2, r1, lsr #4
        subls   r1, r1, r2, lsl #4
        cmp     r2, r1, lsr #3
        subls   r1, r1, r2, lsl #3
        cmp     r2, r1, lsr #2
        subls   r1, r1, r2, lsl #2
        cmp     r2, r1, lsr #1
        subls   r1, r1, r2, lsl #1
        cmp     r2, r1
        subls   r1, r1, r2
        umull   r7, r3, r2, r12
        add     r4, r4, #0x19
        rsb     r5, r4, #0x20
        mov     r3, r3, lsl r4
        orr     r3, r3, r7, lsr r5
        mov     r8, r7, lsl r4
        rsbs    r8, r8, #0
        rsc     r3, r3, #0
        umull   r7, r5, r0, r12
        umull   r9, r10, r12, r1
        adds    r9, r9, r5
        adc     r10, r10, #0
        rsb     r5, r4, #0x20
        movs    r10, r10, lsl r4
        orr     r10, r10, r9, lsr r5
        mov     r9, r9, lsl r4
        orr     r9, r9, r7, lsr r5
        mov     r7, r7, lsl r4
        mov     r4, #0
        umlal   r7, r4, r8, r10
        mov     r12, #0
        umlal   r9, r12, r3, r10
        addcs   r12, r12, r3
        addcss  r9, r9, r8
        adc     r12, r12, #0
        adds    r5, r9, r4
        adc     r12, r12, #0
        add     r10, r12, r10
        mov     r4, #0
        umlal   r7, r4, r8, r12
        mov     r6, #0
        umlal   r5, r6, r3, r12
        adds    r5, r5, r4
        adc     r6, r6, #0
        add     r10, r6, r10
        mov     r4, #0
        umlal   r7, r4, r8, r6
        mov     r12, #0
        umlal   r5, r12, r3, r6
        adds    r5, r5, r4
        adc     r12, r12, #0
        add     r10, r12, r10
        mov     r4, #0
        umlal   r7, r4, r8, r12
        mov     r6, #0
        umlal   r5, r6, r3, r12
        adds    r5, r5, r4
        adc     r6, r6, #0
        add     r10, r6, r10
        mov     r4, #0
        umlal   r7, r4, r8, r6
        mov     r12, #0
        umlal   r5, r12, r3, r6
        adds    r5, r5, r4
        adc     r12, r12, #0
        add     r10, r12, r10
        mov     r4, #0
        umlal   r7, r4, r8, r12
        mov     r6, #0
        umlal   r5, r6, r3, r12
        adds    r5, r5, r4
        adc     r6, r6, #0
        adds    r7, r7, r8
        adcs    r5, r5, r3
        adc     r10, r6, r10
        mul     r4, r10, r2
        mov     r1, #0
        sub     r0, r0, r4
        ldmia   sp!, {r4 - r10}
        bx      lr
LAGO_SMALL_Q_LARGE_B:
        mov     r7, #0
        subs    r6, r0, r2, lsl #6
        sbcs    r4, r1, r2, lsr #26
        subcss  r4, r4, r3, lsl #6
        cmpcs   r7, r3, lsr #26
        movcs   r0, r6
        movcs   r1, r4
        subs    r6, r0, r2, lsl #5
        sbcs    r4, r1, r2, lsr #27
        subcss  r4, r4, r3, lsl #5
        cmpcs   r7, r3, lsr #27
        movcs   r0, r6
        movcs   r1, r4
        subs    r6, r0, r2, lsl #4
        sbcs    r4, r1, r2, lsr #28
        subcss  r4, r4, r3, lsl #4
        cmpcs   r7, r3, lsr #28
        movcs   r0, r6
        movcs   r1, r4
        subs    r6, r0, r2, lsl #3
        sbcs    r4, r1, r2, lsr #29
        subcss  r4, r4, r3, lsl #3
        cmpcs   r7, r3, lsr #29
        movcs   r0, r6
        movcs   r1, r4
        subs    r6, r0, r2, lsl #2
        sbcs    r4, r1, r2, lsr #30
        subcss  r4, r4, r3, lsl #2
        cmpcs   r7, r3, lsr #30
        movcs   r0, r6
        movcs   r1, r4
        subs    r6, r0, r2, lsl #1
        sbcs    r4, r1, r2, lsr #31
        subcss  r4, r4, r3, lsl #1
        cmpcs   r7, r3, lsr #31
        movcs   r0, r6
        movcs   r1, r4
        subs    r6, r0, r2
        sbcs    r4, r1, r3
        movcs   r1, r4
        movcs   r0, r6
        ldmia   sp!, {r4 - r10}
        bx      lr
LAGO_VERY_SMALL_B_OR_SMALL_A:
        cmp     r2, #5
        bcc     LAGO_VERY_SMALL_B
        cmp     r2, r0, lsr #16
        bhi     LAGO_SHORT_Q
        cmp     r2, r0, lsr #31
        subls   r0, r0, r2, lsl #31
        cmp     r2, r0, lsr #30
        subls   r0, r0, r2, lsl #30
        cmp     r2, r0, lsr #29
        subls   r0, r0, r2, lsl #29
        cmp     r2, r0, lsr #28
        subls   r0, r0, r2, lsl #28
        cmp     r2, r0, lsr #27
        subls   r0, r0, r2, lsl #27
        cmp     r2, r0, lsr #26
        subls   r0, r0, r2, lsl #26
        cmp     r2, r0, lsr #25
        subls   r0, r0, r2, lsl #25
        cmp     r2, r0, lsr #24
        subls   r0, r0, r2, lsl #24
        cmp     r2, r0, lsr #23
        subls   r0, r0, r2, lsl #23
        cmp     r2, r0, lsr #22
        subls   r0, r0, r2, lsl #22
        cmp     r2, r0, lsr #21
        subls   r0, r0, r2, lsl #21
        cmp     r2, r0, lsr #20
        subls   r0, r0, r2, lsl #20
        cmp     r2, r0, lsr #19
        subls   r0, r0, r2, lsl #19
        cmp     r2, r0, lsr #18
        subls   r0, r0, r2, lsl #18
        cmp     r2, r0, lsr #17
        subls   r0, r0, r2, lsl #17
        cmp     r2, r0, lsr #16
        subls   r0, r0, r2, lsl #16
LAGO_SHORT_Q:
        cmp     r2, r0, lsr #15
        subls   r0, r0, r2, lsl #15
        cmp     r2, r0, lsr #14
        subls   r0, r0, r2, lsl #14
        cmp     r2, r0, lsr #13
        subls   r0, r0, r2, lsl #13
        cmp     r2, r0, lsr #12
        subls   r0, r0, r2, lsl #12
        cmp     r2, r0, lsr #11
        subls   r0, r0, r2, lsl #11
        cmp     r2, r0, lsr #10
        subls   r0, r0, r2, lsl #10
        cmp     r2, r0, lsr #9
        subls   r0, r0, r2, lsl #9
        cmp     r2, r0, lsr #8
        subls   r0, r0, r2, lsl #8
        cmp     r2, r0, lsr #7
        subls   r0, r0, r2, lsl #7
        cmp     r2, r0, lsr #6
        subls   r0, r0, r2, lsl #6
        cmp     r2, r0, lsr #5
        subls   r0, r0, r2, lsl #5
        cmp     r2, r0, lsr #4
        subls   r0, r0, r2, lsl #4
        cmp     r2, r0, lsr #3
        subls   r0, r0, r2, lsl #3
        cmp     r2, r0, lsr #2
        subls   r0, r0, r2, lsl #2
        cmp     r2, r0, lsr #1
        subls   r0, r0, r2, lsl #1
        cmp     r2, r0
        subls   r0, r0, r2
        ldmia   sp!, {r4 - r10}
        bx      lr
LAGO_VERY_SMALL_B:
        ldmia   sp!, {r4 - r10}
        cmp     r2, #0
        beq     LAGO__mod0
        cmp     r2, #1
        moveq   r1, #0
        moveq   r0, #0
        bxeq    lr
        cmp     r2, #2
        andeq   r0, r0, #1
        moveq   r1, #0
        bxeq    lr
        rsbs    r3, r2, #4
        andeq   r0, r0, #3
        moveq   r1, #0
        bxeq    lr
        stmdb   sp!, {r4, r5}
        mov     r2, #0x55, 8
        orr     r2, r2, r2, lsr #8
        orr     r2, r2, r2, lsr #16
        umull   r3, r4, r2, r0
        umull   r12, r5, r2, r1
        adds    r4, r4, r12
        adc     r5, r5, #0
        adds    r3, r3, r4
        adc     r12, r5, #0
        cmp     r3, r3
        adcs    r3, r3, r12
        adc     r4, r4, r12
        mov     r1, #0
        sub     r0, r0, r4
        sub     r0, r0, r4, lsl #1
        ldmia   sp!, {r4, r5}
        bx      lr
LAGO__mod0:
        mov     r0, #0
        mov     r1, #0
        bx      lr


