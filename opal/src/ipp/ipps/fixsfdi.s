        .text
        .align  4
        .globl  __aeabi_f2lz
        .globl  __fixsfdi


__aeabi_f2lz:
__fixsfdi:
        mov     r12, r0, lsl #8
        mov     r0, r0, ror #31
        subs    r1, r0, #0x7F, 8
        movcc   r1, #0
        movcc   r0, #0
        bxcc    lr
        mov     r1, r1, lsr #24
        rsbs    r2, r1, #0x3F
        bls     LAFX_fixsfdi_LARGE_EXPONENT
        orr     r12, r12, #2, 2
        mov     r1, r12, lsr r2
        rsbs    r2, r2, #0x20
        movcs   r12, r12, lsl r2
        rsbcc   r2, r2, #0
        movcc   r12, r12, lsr r2
        tst     r0, #1
        moveq   r0, r12
        bxeq    lr
        rsbs    r0, r12, #0
        rsc     r1, r1, #0
        bx      lr
LAFX_fixsfdi_LARGE_EXPONENT:
        cmp     r0, #0xFF, 8
        cmphi   r0, #2, 2
        movhi   r1, #0
        movhi   r0, #0
        bxhi    lr
        mov     r1, #2, 2
        mov     r0, #0
        bx      lr


