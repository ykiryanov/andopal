        .text
        .align  4
        .globl  __aeabi_dcmpun
        .globl  __undf2


__aeabi_dcmpun:
__undf2:
        mov     r12, #0xFF, 8
        orr     r12, r12, #0xE, 12
        cmp     r12, r1, lsl #1
        cmphi   r12, r3, lsl #1
        beq     LAEQ_NAN_INF
        movhi   r0, #0
        movcc   r0, #1
        bx      lr
LAEQ_NAN_INF:
        cmp     r12, r1, lsl #1
        beq     LAEQ_NAN_INF_A
        cmp     r2, #0
        movhi   r0, #1
        moveq   r0, #0
        bx      lr
LAEQ_NAN_INF_A:
        cmp     r0, #0
        movhi   r0, #1
        bxhi    lr
        cmp     r12, r3, lsl #1
        cmpeq   r2, #0
        movhi   r0, #1
        movls   r0, #0
        bx      lr


