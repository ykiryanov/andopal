        .text
        .align  4
        .globl  ippiFilterDeblocking8x8VerEdge_H263_8u_C1IR


ippiFilterDeblocking8x8VerEdge_H263_8u_C1IR:
        stmdb   sp!, {lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldreq   pc, [sp], #4
        cmp     r2, #0
        ble     LFGC0
        cmp     r2, #0x20
        blt     LFGC1
LFGC0:
        mvn     r0, #0xBF
        ldr     pc, [sp], #4
LFGC1:
        ldr     r3, [pc, #0xC]
        ldr     r2, [r3, +r2, lsl #2]
        bl      ownFilterDeblocking8x8_H263_V
        mov     r0, #0
        ldr     pc, [sp], #4
        .long   h263_Deblock_QPStrength


