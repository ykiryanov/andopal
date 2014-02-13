        .text
        .align  4
        .globl  _ippsFIRLMSMRGetTapsPointer32s_16s


_ippsFIRLMSMRGetTapsPointer32s_16s:
        cmp     r0, #0
        beq     LBWN0
        cmp     r1, #0
        beq     LBWN0
        ldr     r2, [r0, #4]
        mov     r0, #0
        str     r2, [r1]
        bx      lr
LBWN0:
        mvn     r0, #7
        bx      lr


