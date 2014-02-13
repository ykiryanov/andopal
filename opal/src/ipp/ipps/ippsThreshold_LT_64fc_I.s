        .text
        .align  4
        .globl  _ippsThreshold_LT_64fc_I


_ippsThreshold_LT_64fc_I:
        stmdb   sp!, {lr}
        sub     sp, sp, #8
        mov     r12, #0
        str     r12, [sp]
        bl      _ippsThreshold_64fc_I
        add     sp, sp, #8
        ldr     pc, [sp], #4


