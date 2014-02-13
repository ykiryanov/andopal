        .text
        .align  4
        .globl  __aeabi_d2uiz
        .globl  __fixunsdfsi


__aeabi_d2uiz:
__fixunsdfsi:
        mov     r12, r1, lsl #11
        mov     r1, r1, ror #31
        subs    r1, r1, #0x7F, 8
        subcss  r1, r1, #0xE, 12
        movcc   r0, #0
        bxcc    lr
        mov     r2, r1, lsr #21
        rsbs    r2, r2, #0x1F
        bcc     LAFU_fixdfsi_LARGE_EXPONENT
        orr     r12, r12, r0, lsr #21
        orr     r12, r12, #2, 2
        tst     r1, #1
        mov     r0, r12, lsr r2
        rsbne   r0, r0, #0
        bx      lr
LAFU_fixdfsi_LARGE_EXPONENT:
        mov     r0, #0
        bx      lr


