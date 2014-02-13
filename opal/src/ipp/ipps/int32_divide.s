        .text
        .align  4
        .globl  __intel_idiv
        .globl  __divsi3


LAGJ_inverse_b:
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
__intel_idiv:
        sub     r12, pc, #0x88
__divsi3:
        sub     r12, pc, #0x8C
        teq     r0, r1
        bmi     LAGJ_NEGATIVE_PATH
        cmp     r1, #0
        rsbmi   r1, r1, #0
        rsbmi   r0, r0, #0
        clz     r2, r1
        mov     r3, r1, lsl r2
        ldrb    r12, [r12, +r3, lsr #25]
        cmp     r1, r0, lsr #7
        rsblss  r3, r1, #5
        bhi     LAGJ_ALTERNATE_PATHS
        sub     r2, r2, #7
        mov     r12, r12, lsl r2
        mul     r1, r12, r1
        mov     r3, #0
        umull   r2, r0, r12, r0
        rsb     r1, r1, #0
        umlal   r2, r3, r1, r0
        mov     r12, #0
        add     r0, r3, r0
        umlal   r2, r12, r1, r3
        mov     r3, #0
        add     r0, r12, r0
        umlal   r2, r3, r1, r12
        mov     r12, #0
        add     r0, r3, r0
        umlal   r2, r12, r1, r3
        mov     r3, #0
        add     r0, r12, r0
        umlal   r2, r3, r1, r12
        cmn     r2, r1
        adc     r0, r3, r0
        bx      lr
LAGJ_ALTERNATE_PATHS:
        cmp     r1, #4
        bls     LAGJ_SMALL_B
        mov     r12, r0
        mov     r0, #0
        cmp     r1, r12, lsr #2
        bhi     LAGJ_SHORT_QUOTIENT
        cmp     r1, r12, lsr #7
        subls   r12, r12, r1, lsl #7
        orrls   r0, r0, #0x80
        cmp     r1, r12, lsr #6
        subls   r12, r12, r1, lsl #6
        orrls   r0, r0, #0x40
        cmp     r1, r12, lsr #5
        subls   r12, r12, r1, lsl #5
        orrls   r0, r0, #0x20
        cmp     r1, r12, lsr #4
        subls   r12, r12, r1, lsl #4
        orrls   r0, r0, #0x10
        cmp     r1, r12, lsr #3
        subls   r12, r12, r1, lsl #3
        orrls   r0, r0, #8
        cmp     r1, r12, lsr #2
        subls   r12, r12, r1, lsl #2
        orrls   r0, r0, #4
LAGJ_SHORT_QUOTIENT:
        cmp     r1, r12, lsr #1
        subls   r12, r12, r1, lsl #1
        orrls   r0, r0, #2
        cmp     r1, r12
        orrls   r0, r0, #1
        bx      lr
LAGJ_SMALL_B:
        cmp     r1, #1
        bxeq    lr
        cmp     r1, #2
        moveq   r0, r0, lsr #1
        bxeq    lr
        cmp     r1, #0
        mvneq   r0, #2, 2
        beq     __aeabi_idiv0
        rsbs    r2, r1, #4
        moveq   r0, r0, lsr #2
        bxeq    lr
        mov     r2, #0x55, 8
        orr     r2, r2, r2, lsr #8
        orr     r2, r2, r2, lsr #16
        umull   r3, r0, r2, r0
        adcs    r3, r3, r0
        adc     r0, r0, #0
        bx      lr
LAGJ_NEGATIVE_PATH:
        cmp     r1, #0
        rsbmi   r1, r1, #0
        rsbmi   r0, r0, #0
        clz     r2, r1
        mov     r3, r1, lsl r2
        ldrb    r12, [r12, +r3, lsr #25]
        cmn     r1, r0, asr #7
        rsblss  r3, r1, #5
        bhi     LAGJ_NEG_ALT_PATHS
        rsb     r0, r0, #0
        sub     r2, r2, #7
        mov     r12, r12, lsl r2
        mul     r1, r12, r1
        mov     r3, #0
        umull   r2, r0, r12, r0
        rsb     r1, r1, #0
        umlal   r2, r3, r1, r0
        mov     r12, #0
        add     r0, r3, r0
        umlal   r2, r12, r1, r3
        mov     r3, #0
        add     r0, r12, r0
        umlal   r2, r3, r1, r12
        mov     r12, #0
        add     r0, r3, r0
        umlal   r2, r12, r1, r3
        mov     r3, #0
        add     r0, r12, r0
        umlal   r2, r3, r1, r12
        cmn     r2, r1
        adc     r0, r3, r0
        rsb     r0, r0, #0
        bx      lr
LAGJ_NEG_ALT_PATHS:
        cmp     r1, #4
        bls     LAGJ_NEG_SMALL_B
        rsb     r12, r0, #0
        mov     r0, #0
        cmp     r1, r12, lsr #2
        bhi     LAGJ_NEG_SHORT_QUOTIENT
        cmp     r1, r12, lsr #7
        subls   r12, r12, r1, lsl #7
        subls   r0, r0, #0x80
        cmp     r1, r12, lsr #6
        subls   r12, r12, r1, lsl #6
        subls   r0, r0, #0x40
        cmp     r1, r12, lsr #5
        subls   r12, r12, r1, lsl #5
        subls   r0, r0, #0x20
        cmp     r1, r12, lsr #4
        subls   r12, r12, r1, lsl #4
        subls   r0, r0, #0x10
        cmp     r1, r12, lsr #3
        subls   r12, r12, r1, lsl #3
        subls   r0, r0, #8
        cmp     r1, r12, lsr #2
        subls   r12, r12, r1, lsl #2
        subls   r0, r0, #4
LAGJ_NEG_SHORT_QUOTIENT:
        cmp     r1, r12, lsr #1
        subls   r12, r12, r1, lsl #1
        subls   r0, r0, #2
        cmp     r1, r12
        subls   r0, r0, #1
        bx      lr
LAGJ_NEG_SMALL_B:
        cmp     r1, #1
        bxeq    lr
        cmp     r1, #2
        addeq   r0, r0, #1
        moveq   r0, r0, asr #1
        bxeq    lr
        cmp     r1, #0
        moveq   r0, #2, 2
        beq     __aeabi_idiv0
        rsbs    r2, r1, #4
        addeq   r0, r0, #3
        moveq   r0, r0, asr #2
        bxeq    lr
        mov     r2, #0x55, 8
        orr     r2, r2, r2, lsr #8
        orr     r2, r2, r2, lsr #16
        rsb     r0, r0, #0
        umull   r3, r0, r2, r0
        adcs    r3, r3, r0
        adc     r0, r0, #0
        rsb     r0, r0, #0
        bx      lr
LAGJ__div0:
        .long   0xe3a00000
        .long   0xe12fff1e


