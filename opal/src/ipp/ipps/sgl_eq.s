        .text
        .align  4
        .globl  __aeabi_fcmpeq
        .globl  __eqsf2


__aeabi_fcmpeq:
__eqsf2:
        mov     r12, r0, lsl #1
        orrs    r12, r12, r1, lsl #1
        moveq   r0, r1
        cmp     r0, r1
        movne   r0, #1
        bxne    lr
        mov     r12, #0xFF, 8
        cmp     r12, r0, lsl #1
        movcc   r0, #1
        movcs   r0, #0
        bx      lr


