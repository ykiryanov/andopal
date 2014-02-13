        .text
        .align  4
        .globl  _ippsWinBlackmanStd_16sc_I


_ippsWinBlackmanStd_16sc_I:
        ldr     r2, [pc, #4]
        ldr     r2, [r2]
        b       _ippsWinBlackman_16sc_I
        .long   LAMG__2il0floatpacket.1


        .data
        .align  4


LAMG__2il0floatpacket.1:
        .byte   0x0A,0xD7,0x23,0xBE


