        .text
        .align  4
        .globl  __aeabi_f2iz
        .globl  __fixsfsi


__aeabi_f2iz:
__fixsfsi:
        mov     r12, r0, lsl #8
        mov     r0, r0, ror #31
        subs    r1, r0, #0x7F, 8
        movcc   r0, #0
        bxcc    lr
        mov     r1, r1, lsr #24
        rsbs    r1, r1, #0x1F
        bls     LAFW_fixsfsi_LARGE_EXPONENT
        orr     r12, r12, #2, 2
        tst     r0, #1
        mov     r0, r12, lsr r1
        rsbne   r0, r0, #0
        bx      lr
LAFW_fixsfsi_LARGE_EXPONENT:
        cmp     r0, #0xFF, 8
        cmphi   r0, #2, 2
        movhi   r0, #0
        bxhi    lr
        mov     r0, #2, 2
        bx      lr


