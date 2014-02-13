        .text
        .align  4
        .globl  _ippsFIRLMSMRSetMu32sc_16sc


_ippsFIRLMSMRSetMu32sc_16sc:
        cmp     r0, #0
        mvneq   r0, #7
        bxeq    lr
        ldr     r3, [r0]
        ldr     r2, [pc, #0x14]
        cmp     r2, r3
        mvnne   r0, #0x10
        bxne    lr
        str     r1, [r0, #0x20]
        mov     r0, #0
        bx      lr
        .long   0x4c4d5343


