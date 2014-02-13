        .text
        .align  4
        .globl  _ippsFIRFree32fc_16sc


_ippsFIRFree32fc_16sc:
        stmdb   sp!, {lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldreq   pc, [sp], #4
        ldr     r2, [pc, #0x30]
        ldr     r3, [r0, #0x58]
        sub     r1, r2, #2
        cmp     r1, r3
        beq     LBXX0
        cmp     r2, r3
        mvnne   r0, #0x10
        ldrne   pc, [sp], #4
LBXX0:
        ldr     r1, [r0, #0x50]
        cmp     r1, #0
        beq     LBXX1
        bl      _ippsFree
LBXX1:
        mov     r0, #0
        ldr     pc, [sp], #4
        .long   0x46493038


