        .text
        .align  4
        .globl  ippiFilterBlockBoundaryVerEdge_H263_8u_C1IR


ippiFilterBlockBoundaryVerEdge_H263_8u_C1IR:
        stmdb   sp!, {lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldreq   pc, [sp], #4
        bl      ownFilterBB16x16_H263_V
        mov     r0, #0
        ldr     pc, [sp], #4


