        .text
        .align  4
        .globl  _ippsFIRLMSMRGetTapsPointer32sc_16sc


_ippsFIRLMSMRGetTapsPointer32sc_16sc:
        cmp     r0, #0
        beq     LBWM0
        cmp     r1, #0
        beq     LBWM0
        ldr     r2, [r0, #4]
        mov     r0, #0
        str     r2, [r1]
        bx      lr
LBWM0:
        mvn     r0, #7
        bx      lr


