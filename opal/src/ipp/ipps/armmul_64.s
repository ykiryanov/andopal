        .text
        .align  4
        .globl  __armmul_64


__armmul_64:
        stmdb   sp!, {r4}
        mov     r4, r3
        umull   r3, r12, r0, r2
        mla     r12, r0, r4, r12
        mov     r0, r3
        mla     r1, r1, r2, r12
        ldr     r4, [sp], #4
        bx      lr


