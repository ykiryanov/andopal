        .text
        .align  4
        .globl  _ippsIIRInit_32fc


_ippsIIRInit_32fc:
        stmdb   sp!, {lr}
        sub     sp, sp, #8
        ldr     r12, [sp, #0xC]
        cmp     r1, #0
        beq     LBQM1
        cmp     r0, #0
        beq     LBQM1
        cmp     r12, #0
        beq     LBQM1
        cmp     r2, #0
        bgt     LBQM0
        mvn     r0, #0x18
        add     sp, sp, #8
        ldr     pc, [sp], #4
LBQM0:
        str     r12, [sp]
        ldr     r12, [pc, #0x18]
        str     r12, [sp, #4]
        bl      ownsIIRInit_32fc
        add     sp, sp, #8
        ldr     pc, [sp], #4
LBQM1:
        mvn     r0, #7
        add     sp, sp, #8
        ldr     pc, [sp], #4
        stmmidb r9, {r0, r1, r4, r5, r12, sp}^


