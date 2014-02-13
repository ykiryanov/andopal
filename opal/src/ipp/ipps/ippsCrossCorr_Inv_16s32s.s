        .text
        .align  4
        .globl  _ippsCrossCorr_Inv_16s32s


_ippsCrossCorr_Inv_16s32s:
        stmdb   sp!, {lr}
        sub     sp, sp, #8
        ldr     r12, [sp, #0xC]
        str     r12, [sp]
        bl      ownCrossCorr_Inv_16s32s
        add     sp, sp, #8
        ldr     pc, [sp], #4


