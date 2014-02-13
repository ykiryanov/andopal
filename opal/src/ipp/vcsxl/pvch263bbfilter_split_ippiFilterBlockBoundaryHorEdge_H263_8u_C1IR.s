        .text
        .align  4
        .globl  ippiFilterBlockBoundaryHorEdge_H263_8u_C1IR


ippiFilterBlockBoundaryHorEdge_H263_8u_C1IR:
        stmdb   sp!, {lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldreq   pc, [sp], #4
        bl      ownFilterBB16x16_H263_H
        mov     r0, #0
        ldr     pc, [sp], #4


