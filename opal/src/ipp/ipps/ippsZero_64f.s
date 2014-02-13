        .text
        .align  4
        .globl  _ippsZero_64f


_ippsZero_64f:
        stmdb   sp!, {lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldreq   pc, [sp], #4
        cmp     r1, #0
        mvnle   r0, #5
        ldrle   pc, [sp], #4
        mov     r1, r1, lsl #3
        bl      ownsZero_8u
        mov     r0, #0
        ldr     pc, [sp], #4


