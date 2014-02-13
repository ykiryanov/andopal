        .text
        .align  4
        .globl  _ippsThreshold_LT_32fc


_ippsThreshold_LT_32fc:
        stmdb   sp!, {lr}
        sub     sp, sp, #8
        mov     r12, #0
        str     r12, [sp]
        bl      _ippsThreshold_32fc
        add     sp, sp, #8
        ldr     pc, [sp], #4


