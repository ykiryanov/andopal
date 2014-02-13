        .text
        .align  4
        .globl  _ippsFIRSetTaps32fc_16sc


_ippsFIRSetTaps32fc_16sc:
        stmdb   sp!, {lr}
        cmp     r1, #0
        beq     LBXB1
        cmp     r0, #0
        beq     LBXB1
        ldr     r3, [r1, #0x58]
        ldr     r2, [pc, #0x30]
        subs    r3, r3, r2
        beq     LBXB0
        adds    r2, r3, #2
        mvnne   r0, #0x10
        ldrne   pc, [sp], #4
        bl      ownsSRSetTaps32fc_16sc
        mov     r0, #0
        ldr     pc, [sp], #4
LBXB0:
        bl      ownsMRSetTaps32fc_16sc
        mov     r0, #0
        ldr     pc, [sp], #4
LBXB1:
        mvn     r0, #7
        ldr     pc, [sp], #4
        .long   0x46493038


