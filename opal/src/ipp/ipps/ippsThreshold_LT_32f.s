        .text
        .align  4
        .globl  _ippsThreshold_LT_32f


_ippsThreshold_LT_32f:
        stmdb   sp!, {lr}
        sub     sp, sp, #8
        mov     r12, #0
        str     r12, [sp]
        bl      _ippsThreshold_32f
        add     sp, sp, #8
        ldr     pc, [sp], #4


