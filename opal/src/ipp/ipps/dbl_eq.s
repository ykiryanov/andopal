        .text
        .align  4
        .globl  __aeabi_dcmpeq
        .globl  __eqdf2


__aeabi_dcmpeq:
__eqdf2:
        orrs    r12, r0, r1, lsl #1
        orreqs  r12, r2, r3, lsl #1
        moveq   r3, r1
        cmp     r1, r3
        cmpeq   r0, r2
        movne   r0, #1
        bxne    lr
        mov     r12, #0xFF, 8
        orr     r12, r12, #0xE, 12
        cmp     r12, r1, lsl #1
        rsbeqs  r12, r0, #0
        movcc   r0, #1
        movcs   r0, #0
        bx      lr


