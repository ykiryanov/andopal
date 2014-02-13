        .text
        .align  4
        .globl  _ippsFIRLMSMRGetDlyLine32sc_16sc


_ippsFIRLMSMRGetDlyLine32sc_16sc:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LBWS0
        cmp     r1, #0
        beq     LBWS0
        cmp     r2, #0
        beq     LBWS0
        ldr     r12, [r0]
        ldr     r3, [pc, #0x30]
        cmp     r3, r12
        mvnne   r0, #0x10
        ldrne   pc, [sp], #4
        ldr     r3, [r0, #0x1C]
        str     r3, [r2]
        ldr     r2, [r0, #0x14]
        ldr     r3, [r0, #8]
        mov     r0, r3
        bl      _ippsCopy_16sc
        mov     r0, #0
        ldr     pc, [sp], #4
LBWS0:
        mvn     r0, #7
        ldr     pc, [sp], #4
        mcrrmi  p3, 4, r5, sp, c3


