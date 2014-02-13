        .text
        .align  4
        .globl  ippiUpsampleFour8x8_H263_16s_C1R


ippiUpsampleFour8x8_H263_16s_C1R:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LFFH0
        cmp     r2, #0
        beq     LFFH0
        bl      ownUpsampleFour8x8_H263_16s_C1R
        mov     r0, #0
        ldr     pc, [sp], #4
LFFH0:
        mvn     r0, #7
        ldr     pc, [sp], #4


