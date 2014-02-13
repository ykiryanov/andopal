        .text
        .align  4
        .globl  __aeabi_cfrcmple
        .globl  __c_rlesf2


__aeabi_cfrcmple:
__c_rlesf2:
        mov     r12, #0xFF, 8
        cmp     r12, r1, lsl #1
        cmpcs   r12, r0, lsl #1
        bcc     LAES_UNORDERED
        teq     r1, r0
        bmi     LAES_DIFFERENT_SGN
        teq     r1, #0
        bmi     LAES_NEG_SGN
        cmp     r1, r0
        bx      lr
LAES_UNORDERED:
        mov     r12, #1
        cmp     r12, #0
        bx      lr
LAES_DIFFERENT_SGN:
        mov     r12, r0, lsl #1
        orrs    r12, r12, r1, lsl #1
        cmpeq   r12, r12
        bxeq    lr
LAES_NEG_SGN:
        cmp     r0, r1
        bx      lr


