        .text
        .align  4
        .globl  __aeabi_cfcmpeq
        .globl  __c_eqsf2


__aeabi_cfcmpeq:
__c_eqsf2:
        orr     r12, r0, r1
        cmp     r0, r1
        cmpne   r12, #2, 2
        bxne    lr
        mov     r12, #0xFF, 8
        cmp     r12, r0, lsl #1
        cmpcs   r12, r1, lsl #1
        cmpcc   r12, #1
        cmpcs   r0, r0
        bx      lr


