        .text
        .align  4
        .globl  __aeabi_d2f
        .globl  __truncdfsf2


__aeabi_d2f:
__truncdfsf2:
        and     r12, r1, #2, 2
        bic     r1, r1, #2, 2
        subs    r1, r1, #0xE, 6
        cmpcs   r1, #1, 12
        bcc     LAEZ_tdfsf2_UNDERFLOW
        cmp     r1, #0xFF, 12
        bcs     LAEZ_tdfsf2_OVERFLOW_NAN
        orr     r1, r12, r1, lsl #3
        movs    r12, r0, ror #29
        bic     r12, r0, #0xD, 4
        cmpcs   r12, #1
        adc     r0, r1, r0, lsr #29
        bx      lr
LAEZ_tdfsf2_UNDERFLOW:
        mov     r2, r1, asr #20
        rsb     r2, r2, #9
        cmp     r2, #0x20
        movhi   r0, r12
        bxhi    lr
        mov     r1, r1, lsl #11
        orr     r1, r1, r0, lsr #21
        orr     r1, r1, #2, 2
        rsb     r3, r2, #0x21
        mov     r0, r0, lsl #11
        orr     r0, r0, r1, lsl r3
        movs    r1, r1, lsr r2
        orr     r0, r0, r1, lsl #31
        cmpcs   r0, #1
        adc     r0, r1, r12
        bx      lr
LAEZ_tdfsf2_OVERFLOW_NAN:
        subs    r2, r1, #0x47, 8
        subcss  r2, r2, #0xF, 12
        orr     r2, r12, #0x7F, 8
        orrcc   r0, r2, #2, 10
        bxcc    lr
        orrs    r0, r0, r1, lsl #12
        orreq   r0, r2, #2, 10
        orrne   r0, r2, #3, 10
        bx      lr


