        .text
        .align  4
        .globl  _ippsThreshold_LT_16sc


_ippsThreshold_LT_16sc:
        stmdb   sp!, {lr}
        sub     sp, sp, #8
        mov     r12, #0
        str     r12, [sp]
        bl      _ippsThreshold_16sc
        add     sp, sp, #8
        ldr     pc, [sp], #4


