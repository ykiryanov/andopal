        .text
        .align  4
        .globl  _ippsIIRSetDlyLine_32f


_ippsIIRSetDlyLine_32f:
        stmdb   sp!, {lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldreq   pc, [sp], #4
        ldr     r3, [pc, #0x64]
        ldr     r12, [r0]
        sub     r2, r3, #1
        cmp     r2, r12
        beq     LBQH0
        cmp     r3, r12
        mvnne   r0, #0x10
        ldrne   pc, [sp], #4
LBQH0:
        bl      LBQH_ownsIIRSetDlyLine_32f
        mov     r0, #0
        ldr     pc, [sp], #4
LBQH_ownsIIRSetDlyLine_32f:
        stmdb   sp!, {lr}
        mov     r2, r0
        mov     r0, r1
        ldr     r1, [r2, #0xC]
        ldr     r3, [r2, #8]
        cmp     r0, #0
        beq     LBQH1
        mov     r2, r1
        mov     r1, r3
        bl      _ippsCopy_32f
        mov     r0, #0
        ldr     pc, [sp], #4
LBQH1:
        mov     r0, r3
        bl      _ippsZero_32f
        mov     r0, #0
        ldr     pc, [sp], #4
        stmmidb r9, {r1, r4, r5, r12, sp}^


