        .text
        .align  4
        .globl  _ippsWinBlackmanStd_64fc_I


_ippsWinBlackmanStd_64fc_I:
        ldr     r3, [pc, #4]
        ldr     r2, [pc, #4]
        b       _ippsWinBlackman_64fc_I
        .long   0xbfc47ae1
        .long   0x47ae147b


