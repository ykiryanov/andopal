        .text
        .align  4
        .globl  __aeabi_cfcmple
        .globl  __c_lesf2


__aeabi_cfcmple:
__c_lesf2:
        mov     r12, #0xFF, 8
        cmp     r12, r0, lsl #1
        cmpcs   r12, r1, lsl #1
        bcc     LAEU_UNORDERED
        teq     r0, r1
        bmi     LAEU_DIFFERENT_SGN
        teq     r0, #0
        bmi     LAEU_NEG_SGN
        cmp     r0, r1
        bx      lr
LAEU_UNORDERED:
        mov     r12, #1
        cmp     r12, #0
        bx      lr
LAEU_DIFFERENT_SGN:
        mov     r12, r0, lsl #1
        orrs    r12, r12, r1, lsl #1
        cmpeq   r12, r12
        bxeq    lr
LAEU_NEG_SGN:
        cmp     r1, r0
        bx      lr


