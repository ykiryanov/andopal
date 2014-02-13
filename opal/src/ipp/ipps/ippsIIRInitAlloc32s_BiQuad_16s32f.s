        .text
        .align  4
        .globl  _ippsIIRInitAlloc32s_BiQuad_16s32f


_ippsIIRInitAlloc32s_BiQuad_16s32f:
        stmdb   sp!, {r4, lr}
        cmp     r1, #0
        mov     r4, r0
        beq     LBOF0
        cmp     r4, #0
        beq     LBOF0
        cmp     r2, #1
        mvnlt   r0, #0x18
        ldmltia sp!, {r4, pc}
        mov     r0, r4
        bl      _ippsIIRInitAlloc32f_BiQuad_16s
        cmp     r0, #0
        ldmneia sp!, {r4, pc}
        ldr     r4, [r4]
        ldr     r1, [pc, #0x10]
        mov     r0, #0
        str     r1, [r4]
        ldmia   sp!, {r4, pc}
LBOF0:
        mvn     r0, #7
        ldmia   sp!, {r4, pc}
        .long   0x49493130


