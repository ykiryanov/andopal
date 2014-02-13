        .text
        .align  4
        .globl  _ippsWinBlackmanStd_64fc


_ippsWinBlackmanStd_64fc:
        stmdb   sp!, {lr}
        sub     sp, sp, #8
        ldr     r12, [pc, #0x10]
        ldr     r3, [pc, #0x10]
        str     r12, [sp]
        bl      _ippsWinBlackman_64fc
        add     sp, sp, #8
        ldr     pc, [sp], #4
        swilt   12876513
        .long   0x47ae147b


