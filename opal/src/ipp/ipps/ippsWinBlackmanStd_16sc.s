        .text
        .align  4
        .globl  _ippsWinBlackmanStd_16sc


_ippsWinBlackmanStd_16sc:
        ldr     r3, [pc, #4]
        ldr     r3, [r3]
        b       _ippsWinBlackman_16sc
        .long   LAMH__2il0floatpacket.1


        .data
        .align  4


LAMH__2il0floatpacket.1:
        .byte   0x0A,0xD7,0x23,0xBE


