        .text
        .align  4
        .globl  _ippsFIRFree32sc_16sc


_ippsFIRFree32sc_16sc:
        stmdb   sp!, {lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldreq   pc, [sp], #4
        ldr     r2, [pc, #0x30]
        ldr     r3, [r0, #0x58]
        sub     r1, r2, #2
        cmp     r1, r3
        beq     LBUW0
        cmp     r2, r3
        mvnne   r0, #0x10
        ldrne   pc, [sp], #4
LBUW0:
        ldr     r1, [r0, #0x50]
        cmp     r1, #0
        beq     LBUW1
        bl      _ippsFree
LBUW1:
        mov     r0, #0
        ldr     pc, [sp], #4
        .long   0x46493132


