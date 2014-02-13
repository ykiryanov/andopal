        .text
        .align  4
        .globl  _ippsIIRInitAlloc32sc_BiQuad_16sc32fc


_ippsIIRInitAlloc32sc_BiQuad_16sc32fc:
        stmdb   sp!, {r4, lr}
        cmp     r1, #0
        mov     r4, r0
        beq     LBOB0
        cmp     r4, #0
        beq     LBOB0
        cmp     r2, #1
        mvnlt   r0, #0x18
        ldmltia sp!, {r4, pc}
        mov     r0, r4
        bl      _ippsIIRInitAlloc32fc_BiQuad_16sc
        cmp     r0, #0
        ldmneia sp!, {r4, pc}
        ldr     r4, [r4]
        ldr     r1, [pc, #0x10]
        mov     r0, #0
        str     r1, [r4]
        ldmia   sp!, {r4, pc}
LBOB0:
        mvn     r0, #7
        ldmia   sp!, {r4, pc}
        .long   0x49493132


