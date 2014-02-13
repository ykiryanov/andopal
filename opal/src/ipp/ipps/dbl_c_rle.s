        .text
        .align  4
        .globl  __aeabi_cdrcmple
        .globl  __c_rlesd2


__aeabi_cdrcmple:
__c_rlesd2:
        mov     r12, #0xFF, 8
        orr     r12, r12, #0xE, 12
        cmp     r12, r1, lsl #1
        cmphi   r12, r3, lsl #1
        bls     LAER_NAN_INF
LAER_BACK_CMP:
        teq     r1, r3
        bmi     LAER_DIFFERENT_SGN
        teq     r1, #0
        bmi     LAER_NEG_SGN
        cmp     r3, r1
        cmpeq   r2, r0
        bx      lr
LAER_DIFFERENT_SGN:
        orr     r12, r1, r3
        cmp     r12, #2, 2
        cmpeq   r0, #0
        cmpeq   r2, #0
        bxeq    lr
        cmp     r1, r3
        bx      lr
LAER_NEG_SGN:
        cmp     r1, r3
        cmpeq   r0, r2
        bx      lr
LAER_NAN_INF:
        bcc     LAER_NAN
        cmp     r12, r1, lsl #1
        bls     LAER_NAN_INF_A
        cmp     r12, r3, lsl #1
LAER_NAN_INF_B:
        rsbeqs  r12, r2, #0
        bcs     LAER_BACK_CMP
        cmp     r3, #0
        bx      lr
LAER_NAN_INF_A:
        cmp     r0, #0
        bxhi    lr
        cmp     r12, r3, lsl #1
        bcc     LAER_NAN
        beq     LAER_NAN_INF_B
        b       LAER_BACK_CMP
LAER_NAN:
        cmp     r12, #0
        bx      lr


