        .text
        .align  4
        .globl  __aeabi_idivmod
        .globl  __idivmod


LAGN_inverse_b:
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
__aeabi_idivmod:
__idivmod:
        eor     r12, r0, r1
        teq     r1, #0
        rsbmi   r1, r1, #0
        cmp     r1, #5
        bcc     LAGN_SMALL_B
        teq     r0, #0
        rsbmi   r0, r0, #0
        mov     r2, r12, lsr #31
        orrmi   r2, r2, #2
        clz     r12, r0
        clz     r3, r1
        subs    r12, r3, r12
        rsbcss  r12, r12, #0xF
        mov     r3, #0
        bcc     LAGN_FAST_DIV32
        add     r12, r12, r12, lsl #1
        mov     r12, r12, lsl #2
        add     pc, pc, r12
        mov     r0, r0
LAGN_DIVMOD32_ITER_15:
        cmp     r1, r0, lsr #15
        subls   r0, r0, r1, lsl #15
        addls   r3, r3, #2, 18
LAGN_DIVMOD32_ITER_14:
        cmp     r1, r0, lsr #14
        subls   r0, r0, r1, lsl #14
        addls   r3, r3, #1, 18
LAGN_DIVMOD32_ITER_13:
        cmp     r1, r0, lsr #13
        subls   r0, r0, r1, lsl #13
        addls   r3, r3, #2, 20
LAGN_DIVMOD32_ITER_12:
        cmp     r1, r0, lsr #12
        subls   r0, r0, r1, lsl #12
        addls   r3, r3, #1, 20
LAGN_DIVMOD32_ITER_11:
        cmp     r1, r0, lsr #11
        subls   r0, r0, r1, lsl #11
        addls   r3, r3, #2, 22
LAGN_DIVMOD32_ITER_10:
        cmp     r1, r0, lsr #10
        subls   r0, r0, r1, lsl #10
        addls   r3, r3, #1, 22
LAGN_DIVMOD32_ITER_9:
        cmp     r1, r0, lsr #9
        subls   r0, r0, r1, lsl #9
        addls   r3, r3, #2, 24
LAGN_DIVMOD32_ITER_8:
        cmp     r1, r0, lsr #8
        subls   r0, r0, r1, lsl #8
        addls   r3, r3, #1, 24
LAGN_DIVMOD32_ITER_7:
        cmp     r1, r0, lsr #7
        subls   r0, r0, r1, lsl #7
        addls   r3, r3, #0x80
LAGN_DIVMOD32_ITER_6:
        cmp     r1, r0, lsr #6
        subls   r0, r0, r1, lsl #6
        addls   r3, r3, #0x40
LAGN_DIVMOD32_ITER_5:
        cmp     r1, r0, lsr #5
        subls   r0, r0, r1, lsl #5
        addls   r3, r3, #0x20
LAGN_DIVMOD32_ITER_4:
        cmp     r1, r0, lsr #4
        subls   r0, r0, r1, lsl #4
        addls   r3, r3, #0x10
LAGN_DIVMOD32_ITER_3:
        cmp     r1, r0, lsr #3
        subls   r0, r0, r1, lsl #3
        addls   r3, r3, #8
LAGN_DIVMOD32_ITER_2:
        cmp     r1, r0, lsr #2
        subls   r0, r0, r1, lsl #2
        addls   r3, r3, #4
LAGN_DIVMOD32_ITER_1:
        cmp     r1, r0, lsr #1
        subls   r0, r0, r1, lsl #1
        addls   r3, r3, #2
LAGN_DIVMOD32_ITER_0:
        cmp     r1, r0
        subls   r0, r0, r1
        addls   r3, r3, #1
LAGN_DIVMOD32_RETURN:
        mov     r1, r0
        mov     r0, r3
        tst     r2, #2
        rsbne   r1, r1, #0
        tst     r2, #1
        rsbne   r0, r0, #0
        bx      lr
LAGN_FAST_DIV32:
        rsbs    r12, r12, #0xF
        bmi     LAGN_DIVMOD32_RETURN
LAGN_FAST_DIV32_START:
        sub     r12, pc, #0x6E, 30
        stmdb   sp!, {r4 - r6}
        clz     r6, r1
        mov     r3, r1, lsl r6
        ldrb    r12, [r12, +r3, lsr #25]
        sub     r6, r6, #7
        mov     r12, r12, lsl r6
        mul     r5, r12, r1
        mov     r3, #0
        umull   r6, r4, r12, r0
        rsb     r5, r5, #0
        umlal   r6, r3, r5, r4
        mov     r12, #0
        add     r4, r3, r4
        umlal   r6, r12, r5, r3
        mov     r3, #0
        add     r4, r12, r4
        umlal   r6, r3, r5, r12
        mov     r12, #0
        add     r4, r3, r4
        umlal   r6, r12, r5, r3
        mov     r3, #0
        add     r4, r12, r4
        umlal   r6, r3, r5, r12
        rsb     r12, r1, #0
        cmn     r6, r5
        adc     r3, r3, r4
        ldmia   sp!, {r4 - r6}
        mla     r1, r3, r12, r0
        mov     r0, r3
        tst     r2, #2
        rsbne   r1, r1, #0
        tst     r2, #1
        rsbne   r0, r0, #0
        bx      lr
LAGN_SMALL_B:
        eors    r2, r0, #0
        rsbmi   r0, r0, #0
        cmp     r1, #3
        bcs     LAGN_B34
        cmp     r1, #1
        andhi   r1, r0, #1
        movhi   r0, r0, lsr #1
        moveq   r1, #0
        bcc     __aeabi_idiv0
        teq     r12, #0
        rsbmi   r0, r0, #0
        teq     r2, #0
        rsbmi   r1, r1, #0
        bx      lr
LAGN__div0:
LAGN__mod0:
        .long   0xe3a00000
        .long   0xe12fff1e
LAGN_B34:
        andhi   r1, r0, #3
        movhi   r0, r0, lsr #2
        bhi     LAGN_B34_RETURN
        stmdb   sp!, {r4, r5}
        mov     r4, #0x55, 8
        orr     r4, r4, r4, lsr #8
        orr     r4, r4, r4, lsr #16
        umull   r3, r5, r4, r0
        adcs    r3, r3, r5
        adc     r5, r5, #0
        sub     r1, r0, r5, lsl #1
        sub     r1, r1, r5
        mov     r0, r5
        ldmia   sp!, {r4, r5}
LAGN_B34_RETURN:
        teq     r12, #0
        rsbmi   r0, r0, #0
        teq     r2, #0
        rsbmi   r1, r1, #0
        bx      lr


