        .text
        .align  4
        .globl  _ippsIIRInitAlloc_BiQuad_32f


_ippsIIRInitAlloc_BiQuad_32f:
        stmdb   sp!, {lr}
        sub     sp, sp, #8
        cmp     r1, #0
        beq     LBQP1
        cmp     r0, #0
        beq     LBQP1
        cmp     r2, #1
        bge     LBQP0
        mvn     r0, #0x18
        add     sp, sp, #8
        ldr     pc, [sp], #4
LBQP0:
        ldr     r12, [pc, #0x18]
        str     r12, [sp]
        bl      ownsIIRInitAlloc_BiQuad_32f
        add     sp, sp, #8
        ldr     pc, [sp], #4
LBQP1:
        mvn     r0, #7
        add     sp, sp, #8
        ldr     pc, [sp], #4
        stmmidb r9, {r1, r4, r5, r12, sp}^


