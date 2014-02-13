        .text
        .align  4
        .globl  _ippsIIRInit_BiQuad_32f


_ippsIIRInit_BiQuad_32f:
        stmdb   sp!, {lr}
        sub     sp, sp, #8
        ldr     r12, [sp, #0xC]
        cmp     r1, #0
        beq     LBQL1
        cmp     r0, #0
        beq     LBQL1
        cmp     r12, #0
        beq     LBQL1
        cmp     r2, #1
        bge     LBQL0
        mvn     r0, #0x18
        add     sp, sp, #8
        ldr     pc, [sp], #4
LBQL0:
        str     r12, [sp]
        ldr     r12, [pc, #0x18]
        str     r12, [sp, #4]
        bl      ownsIIRInit_BiQuad_32f
        add     sp, sp, #8
        ldr     pc, [sp], #4
LBQL1:
        mvn     r0, #7
        add     sp, sp, #8
        ldr     pc, [sp], #4
        stmmidb r9, {r1, r4, r5, r12, sp}^


