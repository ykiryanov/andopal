        .text
        .align  4
        .globl  __aeabi_fcmple
        .globl  __lesf2
        .globl  __aeabi_fcmplt
        .globl  __ltsf2


__ltsf2:
__aeabi_fcmplt:
__aeabi_fcmple:
__lesf2:
        mov     r12, r0, lsl #1
        orrs    r12, r12, r1, lsl #1
        moveq   r0, r1
        mov     r12, #0xFF, 8
        cmp     r12, r0, lsl #1
        cmphi   r12, r1, lsl #1
        bls     LAFE_SGLCMP_NAN_INF
LAFE_SGLCMP_BACK_MAIN:
        cmp     r0, r1
        moveq   r0, #0
        bxeq    lr
        teq     r0, r1
        movmi   r0, r0, asr #31
        orrmi   r0, r0, #1
        bxmi    lr
        cmp     r0, r1
        movcs   r0, #1
        mvncc   r0, #0
        cmp     r1, #0
        rsbmi   r0, r0, #0
        bx      lr
LAFE_SGLCMP_NAN_INF:
        cmp     r12, r0, lsl #1
        movcc   r0, #1
        bxcc    lr
        cmp     r12, r1, lsl #1
        movcc   r0, #1
        bxcc    lr
        b       LAFE_SGLCMP_BACK_MAIN


