        .text
        .align  4
        .globl  _ippsIIRGetDlyLine_32f


_ippsIIRGetDlyLine_32f:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LBQX1
        cmp     r1, #0
        beq     LBQX1
        ldr     r3, [pc, #0x38]
        ldr     r12, [r0]
        sub     r2, r3, #1
        cmp     r2, r12
        beq     LBQX0
        cmp     r3, r12
        mvnne   r0, #0x10
        ldrne   pc, [sp], #4
LBQX0:
        ldr     r2, [r0, #0xC]
        ldr     r3, [r0, #8]
        mov     r0, r3
        bl      _ippsCopy_32f
        mov     r0, #0
        ldr     pc, [sp], #4
LBQX1:
        mvn     r0, #7
        ldr     pc, [sp], #4
        stmmidb r9, {r1, r4, r5, r12, sp}^


