        .text
        .align  4
        .globl  _ippsSynthesisFilter_G723_16s32s


_ippsSynthesisFilter_G723_16s32s:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LDUK0
        cmp     r1, #0
        beq     LDUK0
        cmp     r2, #0
        beq     LDUK0
        cmp     r3, #0
        beq     LDUK0
        bl      ownSynthesisFilter_G723_16s32s
        mov     r0, #0
        ldr     pc, [sp], #4
LDUK0:
        mvn     r0, #7
        ldr     pc, [sp], #4


