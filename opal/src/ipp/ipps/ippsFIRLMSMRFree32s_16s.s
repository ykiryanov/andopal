        .text
        .align  4
        .globl  _ippsFIRLMSMRFree32s_16s


_ippsFIRLMSMRFree32s_16s:
        stmdb   sp!, {r4, lr}
        mov     r4, r0
        cmp     r4, #0
        beq     LBWV2
        ldr     r0, [r4, #8]
        cmp     r0, #0
        beq     LBWV0
        bl      _ippsFree
LBWV0:
        ldr     r0, [r4, #4]
        cmp     r0, #0
        beq     LBWV1
        bl      _ippsFree
LBWV1:
        mov     r0, r4
        bl      _ippsFree
LBWV2:
        mov     r0, #0
        ldmia   sp!, {r4, pc}


