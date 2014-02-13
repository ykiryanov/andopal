        .text
        .align  4
        .globl  _ippiInterpolateChroma_H264_16u_C1R


_ippiInterpolateChroma_H264_16u_C1R:
        mov     r2, r0
        cmp     r2, #0
        beq     LLAO5
        ldr     r0, [r2]
        cmp     r0, #0
        beq     LLAO5
        ldr     r1, [r2, #8]
        cmp     r1, #0
        beq     LLAO5
        ldr     r1, [r2, #4]
        cmp     r1, #8
        blt     LLAO2
        ldr     r3, [r2, #0xC]
        cmp     r3, #8
        blt     LLAO2
        ldr     r3, [r2, #0x10]
        cmp     r3, #0
        blt     LLAO1
        cmp     r3, #7
        bgt     LLAO1
        ldr     r3, [r2, #0x14]
        cmp     r3, #0
        blt     LLAO1
        cmp     r3, #7
        bgt     LLAO1
        ldr     r3, [r2, #0x1C]
        cmp     r3, #2
        beq     LLAO3
        cmp     r3, #4
        beq     LLAO3
        cmp     r3, #8
        beq     LLAO3
        cmp     r3, #0x10
        beq     LLAO3
LLAO0:
        mvn     r0, #5
        bx      lr
LLAO1:
        mvn     r0, #4
        bx      lr
LLAO2:
        mvn     r0, #0xD
        bx      lr
LLAO3:
        ldr     r3, [r2, #0x18]
        cmp     r3, #2
        beq     LLAO4
        cmp     r3, #4
        beq     LLAO4
        cmp     r3, #8
        beq     LLAO4
        cmp     r3, #0x10
        bne     LLAO0
LLAO4:
        b       own_InterpolateChroma_H264_16u
LLAO5:
        mvn     r0, #7
        bx      lr


