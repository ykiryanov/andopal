        .text
        .align  4
        .globl  _ippsIIROne_Direct_16s


_ippsIIROne_Direct_16s:
        stmdb   sp!, {lr}
        sub     sp, sp, #8
        ldr     r12, [sp, #0xC]
        cmp     r3, #1
        blt     LCIR1
        cmp     r1, #0
        beq     LCIR2
        cmp     r2, #0
        beq     LCIR2
        cmp     r12, #0
        beq     LCIR2
        add     lr, r2, r3, lsl #1
        ldrsh   lr, [lr, #2]
        cmp     lr, #0
        blt     LCIR0
        str     r12, [sp]
        bl      ownsIIROne_Direct_16s
        add     sp, sp, #8
        ldr     pc, [sp], #4
LCIR0:
        mvn     r0, #0xC
        add     sp, sp, #8
        ldr     pc, [sp], #4
LCIR1:
        mvn     r0, #0x18
        add     sp, sp, #8
        ldr     pc, [sp], #4
LCIR2:
        mvn     r0, #7
        add     sp, sp, #8
        ldr     pc, [sp], #4


