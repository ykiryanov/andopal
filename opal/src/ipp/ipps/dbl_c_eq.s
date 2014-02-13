        .text
        .align  4
        .globl  __aeabi_cdcmpeq
        .globl  __c_eqsd2


__aeabi_cdcmpeq:
__c_eqsd2:
        cmp     r1, r3
        cmpeq   r0, r2
        bne     LAEV_NOT_EQ
        mov     r12, #0xFF, 8
        orr     r12, r12, #0xE, 12
        cmp     r12, r1, lsl #1
        bls     LAEV_NAN_INF
        cmp     r12, r12
        bx      lr
LAEV_NAN_INF:
        cmp     r0, #0
        bx      lr
LAEV_NOT_EQ:
        orr     r12, r1, r3
        cmp     r12, #2, 2
        cmpeq   r0, #0
        cmpeq   r2, #0
        bx      lr


