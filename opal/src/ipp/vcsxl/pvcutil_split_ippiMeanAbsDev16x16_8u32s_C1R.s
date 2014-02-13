        .text
        .align  4
        .globl  _ippiMeanAbsDev16x16_8u32s_C1R


_ippiMeanAbsDev16x16_8u32s_C1R:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LEFT0
        cmp     r2, #0
        beq     LEFT0
        bl      ownvc_MeanAbsDev16x16_8u32s_C1R
        mov     r0, #0
        ldr     pc, [sp], #4
LEFT0:
        mvn     r0, #7
        ldr     pc, [sp], #4


