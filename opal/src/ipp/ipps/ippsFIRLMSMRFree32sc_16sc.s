        .text
        .align  4
        .globl  _ippsFIRLMSMRFree32sc_16sc


_ippsFIRLMSMRFree32sc_16sc:
        stmdb   sp!, {r4, lr}
        mov     r4, r0
        cmp     r4, #0
        beq     LBWU2
        ldr     r0, [r4, #8]
        cmp     r0, #0
        beq     LBWU0
        bl      _ippsFree
LBWU0:
        ldr     r0, [r4, #4]
        cmp     r0, #0
        beq     LBWU1
        bl      _ippsFree
LBWU1:
        mov     r0, r4
        bl      _ippsFree
LBWU2:
        mov     r0, #0
        ldmia   sp!, {r4, pc}


