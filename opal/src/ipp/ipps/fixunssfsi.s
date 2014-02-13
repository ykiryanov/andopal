        .text
        .align  4
        .globl  __aeabi_f2uiz
        .globl  __fixunssfsi


__aeabi_f2uiz:
__fixunssfsi:
        mov     r12, r0, lsl #8
        mov     r0, r0, ror #31
        subs    r1, r0, #0x7F, 8
        movcc   r0, #0
        bxcc    lr
        mov     r1, r1, lsr #24
        rsbs    r1, r1, #0x1F
        bcc     LAFS_fixsfsi_LARGE_EXPONENT
        orr     r12, r12, #2, 2
        tst     r0, #1
        mov     r0, r12, lsr r1
        rsbne   r0, r0, #0
        bx      lr
LAFS_fixsfsi_LARGE_EXPONENT:
        mov     r0, #0
        bx      lr


