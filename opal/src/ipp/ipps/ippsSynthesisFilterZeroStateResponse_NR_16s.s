        .text
        .align  4
        .globl  _ippsSynthesisFilterZeroStateResponse_NR_16s


_ippsSynthesisFilterZeroStateResponse_NR_16s:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LDTX1
        cmp     r1, #0
        beq     LDTX1
        cmp     r2, #0
        mvnle   r0, #5
        ldrle   pc, [sp], #4
        cmp     r3, #0xC
        blt     LDTX0
        cmp     r3, #0xD
        bgt     LDTX0
        bl      ownSynthesisFilterZeroStateResponse_NR_16s
        mov     r0, #0
        ldr     pc, [sp], #4
LDTX0:
        mvn     r0, #0xC
        ldr     pc, [sp], #4
LDTX1:
        mvn     r0, #7
        ldr     pc, [sp], #4


