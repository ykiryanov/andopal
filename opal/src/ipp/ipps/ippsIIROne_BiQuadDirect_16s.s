        .text
        .align  4
        .globl  _ippsIIROne_BiQuadDirect_16s


_ippsIIROne_BiQuadDirect_16s:
        stmdb   sp!, {lr}
        sub     sp, sp, #8
        ldr     r12, [sp, #0xC]
        cmp     r3, #1
        blt     LCIT0
        cmp     r1, #0
        beq     LCIT1
        cmp     r2, #0
        beq     LCIT1
        cmp     r12, #0
        beq     LCIT1
        str     r12, [sp]
        bl      ownsIIROne_BiQuadDirect_16s
        add     sp, sp, #8
        ldr     pc, [sp], #4
LCIT0:
        mvn     r0, #0x18
        add     sp, sp, #8
        ldr     pc, [sp], #4
LCIT1:
        mvn     r0, #7
        add     sp, sp, #8
        ldr     pc, [sp], #4


