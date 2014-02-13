        .text
        .align  4
        .globl  __aeabi_cdcmple
        .globl  __c_lesd2


__aeabi_cdcmple:
__c_lesd2:
        mov     r12, #0xFF, 8
        orr     r12, r12, #0xE, 12
        cmp     r12, r1, lsl #1
        cmphi   r12, r3, lsl #1
        bls     LAET_NAN_INF
LAET_BACK_CMP:
        teq     r1, r3
        bmi     LAET_DIFFERENT_SGN
        teq     r1, #0
        bmi     LAET_NEG_SGN
        cmp     r1, r3
        cmpeq   r0, r2
        bx      lr
LAET_DIFFERENT_SGN:
        orr     r12, r1, r3
        cmp     r12, #2, 2
        cmpeq   r0, #0
        cmpeq   r2, #0
        bxeq    lr
        cmp     r3, r1
        bx      lr
LAET_NEG_SGN:
        cmp     r3, r1
        cmpeq   r2, r0
        bx      lr
LAET_NAN_INF:
        bcc     LAET_NAN
        cmp     r12, r1, lsl #1
        bls     LAET_NAN_INF_A
        cmp     r12, r3, lsl #1
LAET_NAN_INF_B:
        rsbeqs  r12, r2, #0
        bcs     LAET_BACK_CMP
        cmp     r3, #0
        bx      lr
LAET_NAN_INF_A:
        cmp     r0, #0
        bxhi    lr
        cmp     r12, r3, lsl #1
        bcc     LAET_NAN
        beq     LAET_NAN_INF_B
        b       LAET_BACK_CMP
LAET_NAN:
        cmp     r12, #0
        bx      lr


