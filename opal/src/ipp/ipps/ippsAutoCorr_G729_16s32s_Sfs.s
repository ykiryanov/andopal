        .text
        .align  4
        .globl  _ippsAutoCorr_G729_16s32s_Sfs


_ippsAutoCorr_G729_16s32s_Sfs:
        stmdb   sp!, {lr}
        sub     sp, sp, #8
        ldr     r12, [sp, #0xC]
        ldr     lr, [sp, #0x10]
        str     r12, [sp]
        str     lr, [sp, #4]
        bl      ownAutoCorr_G729_16s32s_Sfs
        add     sp, sp, #8
        ldr     pc, [sp], #4


