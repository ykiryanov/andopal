        .text
        .align  4
        .globl  _ippsFIRLMSMRSetDlyLine32sc_16sc


_ippsFIRLMSMRSetDlyLine32sc_16sc:
        stmdb   sp!, {r4, r5, lr}
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        mvneq   r0, #7
        ldmeqia sp!, {r4, r5, pc}
        ldr     r12, [r5]
        ldr     r3, [pc, #0x54]
        cmp     r3, r12
        mvnne   r0, #0x10
        ldmneia sp!, {r4, r5, pc}
        str     r2, [r5, #0x1C]
        ldr     r2, [r5, #0x14]
        ldr     r0, [r5, #8]
        cmp     r4, #0
        beq     LBWC0
        mov     r1, r0
        mov     r0, r4
        bl      _ippsCopy_16sc
        ldr     r2, [r5, #0x14]
        ldr     r5, [r5, #8]
        mov     r0, r4
        add     r1, r5, r2, lsl #2
        bl      _ippsCopy_16sc
        mov     r0, #0
        ldmia   sp!, {r4, r5, pc}
LBWC0:
        mov     r1, r2, lsl #1
        bl      _ippsZero_16sc
        mov     r0, #0
        ldmia   sp!, {r4, r5, pc}
        .long   0x4c4d5343


