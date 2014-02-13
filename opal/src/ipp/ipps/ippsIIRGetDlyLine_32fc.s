        .text
        .align  4
        .globl  _ippsIIRGetDlyLine_32fc


_ippsIIRGetDlyLine_32fc:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LBQW1
        cmp     r1, #0
        beq     LBQW1
        ldr     r3, [pc, #0x38]
        ldr     r12, [r0]
        sub     r2, r3, #1
        cmp     r2, r12
        beq     LBQW0
        cmp     r3, r12
        mvnne   r0, #0x10
        ldrne   pc, [sp], #4
LBQW0:
        ldr     r2, [r0, #0xC]
        ldr     r3, [r0, #8]
        mov     r0, r3
        bl      _ippsCopy_32fc
        mov     r0, #0
        ldr     pc, [sp], #4
LBQW1:
        mvn     r0, #7
        ldr     pc, [sp], #4
        stmmidb r9, {r2, r4, r5, r12, sp}^


