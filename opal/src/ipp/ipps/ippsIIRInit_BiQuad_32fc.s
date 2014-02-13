        .text
        .align  4
        .globl  _ippsIIRInit_BiQuad_32fc


_ippsIIRInit_BiQuad_32fc:
        stmdb   sp!, {lr}
        sub     sp, sp, #8
        ldr     r12, [sp, #0xC]
        cmp     r1, #0
        beq     LBQK1
        cmp     r0, #0
        beq     LBQK1
        cmp     r12, #0
        beq     LBQK1
        cmp     r2, #1
        bge     LBQK0
        mvn     r0, #0x18
        add     sp, sp, #8
        ldr     pc, [sp], #4
LBQK0:
        str     r12, [sp]
        ldr     r12, [pc, #0x18]
        str     r12, [sp, #4]
        bl      ownsIIRInit_BiQuad_32fc
        add     sp, sp, #8
        ldr     pc, [sp], #4
LBQK1:
        mvn     r0, #7
        add     sp, sp, #8
        ldr     pc, [sp], #4
        stmmidb r9, {r2, r4, r5, r12, sp}^


