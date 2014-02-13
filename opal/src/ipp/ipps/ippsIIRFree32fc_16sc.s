        .text
        .align  4
        .globl  _ippsIIRFree32fc_16sc


_ippsIIRFree32fc_16sc:
        stmdb   sp!, {lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldreq   pc, [sp], #4
        ldr     r2, [pc, #0x30]
        ldr     r3, [r0]
        add     r1, r2, #1
        cmp     r1, r3
        beq     LBRV0
        cmp     r2, r3
        mvnne   r0, #0x10
        ldrne   pc, [sp], #4
LBRV0:
        ldr     r1, [r0, #0x30]
        cmp     r1, #0
        beq     LBRV1
        bl      _ippsFree
LBRV1:
        mov     r0, #0
        ldr     pc, [sp], #4
        stmmidb r9, {r0 - r2, r4, r5, r12, sp}^


