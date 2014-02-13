        .text
        .align  4
        .globl  _ippsIIRInitAlloc_BiQuad_32fc


_ippsIIRInitAlloc_BiQuad_32fc:
        stmdb   sp!, {lr}
        sub     sp, sp, #8
        cmp     r1, #0
        beq     LBQO1
        cmp     r0, #0
        beq     LBQO1
        cmp     r2, #1
        bge     LBQO0
        mvn     r0, #0x18
        add     sp, sp, #8
        ldr     pc, [sp], #4
LBQO0:
        ldr     r12, [pc, #0x18]
        str     r12, [sp]
        bl      ownsIIRInitAlloc_BiQuad_32fc
        add     sp, sp, #8
        ldr     pc, [sp], #4
LBQO1:
        mvn     r0, #7
        add     sp, sp, #8
        ldr     pc, [sp], #4
        stmmidb r9, {r2, r4, r5, r12, sp}^


