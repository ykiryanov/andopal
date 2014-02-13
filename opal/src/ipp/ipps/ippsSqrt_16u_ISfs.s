        .text
        .align  4
        .globl  _ippsSqrt_16u_ISfs


_ippsSqrt_16u_ISfs:
        stmdb   sp!, {lr}
        cmp     r0, #0
        mov     r3, r2
        mvneq   r0, #7
        ldreq   pc, [sp], #4
        cmp     r1, #0
        mvnle   r0, #5
        ldrle   pc, [sp], #4
        mov     r2, r1
        mov     r1, r0
        bl      ownippsSqrt_16u
        mov     r0, #0
        ldr     pc, [sp], #4

