        .text
        .align  4
        .globl  ippiDownsampleFour16x16_H263_16s_C1R


ippiDownsampleFour16x16_H263_16s_C1R:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LFFK0
        cmp     r2, #0
        beq     LFFK0
        bl      ownDownampleFour16x16_H263_16s_C1R
        mov     r0, #0
        ldr     pc, [sp], #4
LFFK0:
        mvn     r0, #7
        ldr     pc, [sp], #4


