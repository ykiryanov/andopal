        .text
        .align  4
        .globl  __aeabi_uidivmod
        .globl  __uidivmod


LAGM_inverse_b:
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
__aeabi_uidivmod:
__uidivmod:
        cmp     r1, #5
        bcc     LAGM_SMALL_B
        clz     r2, r0
        clz     r3, r1
        subs    r2, r3, r2
        mov     r3, #0
        rsbcss  r2, r2, #0xF
        bcc     LAGM_FAST_DIV32_OR_RETURN
        add     r2, r2, r2, lsl #1
        mov     r2, r2, lsl #2
        add     pc, pc, r2
        mov     r0, r0
LAGM_DIVMOD32_ITER_15:
        cmp     r1, r0, lsr #15
        subls   r0, r0, r1, lsl #15
        addls   r3, r3, #2, 18
LAGM_DIVMOD32_ITER_14:
        cmp     r1, r0, lsr #14
        subls   r0, r0, r1, lsl #14
        addls   r3, r3, #1, 18
LAGM_DIVMOD32_ITER_13:
        cmp     r1, r0, lsr #13
        subls   r0, r0, r1, lsl #13
        addls   r3, r3, #2, 20
LAGM_DIVMOD32_ITER_12:
        cmp     r1, r0, lsr #12
        subls   r0, r0, r1, lsl #12
        addls   r3, r3, #1, 20
LAGM_DIVMOD32_ITER_11:
        cmp     r1, r0, lsr #11
        subls   r0, r0, r1, lsl #11
        addls   r3, r3, #2, 22
LAGM_DIVMOD32_ITER_10:
        cmp     r1, r0, lsr #10
        subls   r0, r0, r1, lsl #10
        addls   r3, r3, #1, 22
LAGM_DIVMOD32_ITER_9:
        cmp     r1, r0, lsr #9
        subls   r0, r0, r1, lsl #9
        addls   r3, r3, #2, 24
LAGM_DIVMOD32_ITER_8:
        cmp     r1, r0, lsr #8
        subls   r0, r0, r1, lsl #8
        addls   r3, r3, #1, 24
LAGM_DIVMOD32_ITER_7:
        cmp     r1, r0, lsr #7
        subls   r0, r0, r1, lsl #7
        addls   r3, r3, #0x80
LAGM_DIVMOD32_ITER_6:
        cmp     r1, r0, lsr #6
        subls   r0, r0, r1, lsl #6
        addls   r3, r3, #0x40
LAGM_DIVMOD32_ITER_5:
        cmp     r1, r0, lsr #5
        subls   r0, r0, r1, lsl #5
        addls   r3, r3, #0x20
LAGM_DIVMOD32_ITER_4:
        cmp     r1, r0, lsr #4
        subls   r0, r0, r1, lsl #4
        addls   r3, r3, #0x10
LAGM_DIVMOD32_ITER_3:
        cmp     r1, r0, lsr #3
        subls   r0, r0, r1, lsl #3
        addls   r3, r3, #8
LAGM_DIVMOD32_ITER_2:
        cmp     r1, r0, lsr #2
        subls   r0, r0, r1, lsl #2
        addls   r3, r3, #4
LAGM_DIVMOD32_ITER_1:
        cmp     r1, r0, lsr #1
        subls   r0, r0, r1, lsl #1
        addls   r3, r3, #2
LAGM_DIVMOD32_ITER_0:
        cmp     r1, r0
        subls   r0, r0, r1
        addls   r3, r3, #1
LAGM_DIVMOD32_RETURN:
        mov     r1, r0
        mov     r0, r3
        bx      lr
LAGM_FAST_DIV32_OR_RETURN:
        rsbs    r2, r2, #0xF
        bmi     LAGM_DIVMOD32_RETURN
LAGM_FAST_DIV32:
        sub     r12, pc, #0x63, 30
        clz     r2, r1
        mov     r3, r1, lsl r2
        ldrb    r12, [r12, +r3, lsr #25]
        stmdb   sp!, {r4, r5}
        sub     r2, r2, #7
        mov     r12, r12, lsl r2
        mul     r5, r12, r1
        mov     r3, #0
        umull   r2, r4, r12, r0
        rsb     r5, r5, #0
        umlal   r2, r3, r5, r4
        mov     r12, #0
        add     r4, r3, r4
        umlal   r2, r12, r5, r3
        mov     r3, #0
        add     r4, r12, r4
        umlal   r2, r3, r5, r12
        mov     r12, #0
        add     r4, r3, r4
        umlal   r2, r12, r5, r3
        mov     r3, #0
        add     r4, r12, r4
        umlal   r2, r3, r5, r12
        rsb     r12, r1, #0
        cmn     r2, r5
        adc     r3, r3, r4
        ldmia   sp!, {r4, r5}
        mla     r1, r3, r12, r0
        mov     r0, r3
        bx      lr
LAGM_SMALL_B:
        cmp     r1, #3
        bcs     LAGM_B34
        cmp     r1, #1
        andhi   r1, r0, #1
        movhi   r0, r0, lsr #1
        moveq   r1, #0
        bxcs    lr
        b       __aeabi_idiv0
LAGM__div0:
LAGM__mod0:
        .long   0xe3a00000
        .long   0xe12fff1e
LAGM_B34:
        andhi   r1, r0, #3
        movhi   r0, r0, lsr #2
        bxhi    lr
        mov     r2, #0x55, 8
        orr     r2, r2, r2, lsr #8
        orr     r2, r2, r2, lsr #16
        umull   r3, r12, r2, r0
        adcs    r3, r3, r12
        adc     r12, r12, #0
        sub     r1, r0, r12, lsl #1
        sub     r1, r1, r12
        mov     r0, r12
        bx      lr


