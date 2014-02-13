        .text
        .align  4
        .globl  __aeabi_d2lz
        .globl  __fixdfdi


__aeabi_d2lz:
__fixdfdi:
        mov     r12, r1, lsl #11
        mov     r1, r1, ror #31
        subs    r1, r1, #0x7F, 8
        subcss  r1, r1, #0xE, 12
        movcc   r1, #0
        movcc   r0, #0
        bxcc    lr
        mov     r2, r1, lsr #21
        rsbs    r2, r2, #0x3F
        bls     LAFZ_fixdfdi_LARGE_EXPONENT
        orr     r12, r12, r0, lsr #21
        mov     r0, r0, lsl #11
        orr     r12, r12, #2, 2
        subs    r3, r2, #0x20
        movcs   r0, r12, lsr r3
        movcs   r12, #0
        rsbcc   r3, r2, #0x20
        movcc   r0, r0, lsr r2
        orrcc   r0, r0, r12, lsl r3
        movcc   r12, r12, lsr r2
        rsbs    r3, r0, #0
        rsc     r2, r12, #0
        tst     r1, #1
        moveq   r0, r0
        moveq   r1, r12
        movne   r1, r2
        movne   r0, r3
        bx      lr
LAFZ_fixdfdi_LARGE_EXPONENT:
        bic     r12, r1, #1
        cmp     r12, #2, 2
        cmpeq   r0, #0
        movhi   r1, #0
        movhi   r0, #0
        bxhi    lr
        mov     r1, #2, 2
        mov     r0, #0
        bx      lr


