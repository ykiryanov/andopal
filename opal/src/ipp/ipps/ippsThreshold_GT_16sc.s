        .text
        .align  4
        .globl  _ippsThreshold_GT_16sc


_ippsThreshold_GT_16sc:
        stmdb   sp!, {lr}
        sub     sp, sp, #8
        mov     r12, #4
        str     r12, [sp]
        bl      _ippsThreshold_16sc
        add     sp, sp, #8
        ldr     pc, [sp], #4


