        .text
        .align  4
        .globl  ippiFilterDeblocking16x16VerEdge_H263_8u_C1IR


ippiFilterDeblocking16x16VerEdge_H263_8u_C1IR:
        stmdb   sp!, {lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldreq   pc, [sp], #4
        bl      ownFilterDeblocking16x16_H263_V
        mov     r0, #0
        ldr     pc, [sp], #4


