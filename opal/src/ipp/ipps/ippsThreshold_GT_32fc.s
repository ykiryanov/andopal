        .text
        .align  4
        .globl  _ippsThreshold_GT_32fc


_ippsThreshold_GT_32fc:
        stmdb   sp!, {lr}
        sub     sp, sp, #8
        mov     r12, #4
        str     r12, [sp]
        bl      _ippsThreshold_32fc
        add     sp, sp, #8
        ldr     pc, [sp], #4


