        .text
        .align  4
        .globl  _ippsWinBlackmanStd_16s


_ippsWinBlackmanStd_16s:
        ldr     r3, [pc, #4]
        ldr     r3, [r3]
        b       _ippsWinBlackman_16s
        .long   LAMJ__2il0floatpacket.1


        .data
        .align  4


LAMJ__2il0floatpacket.1:
        .byte   0x0A,0xD7,0x23,0xBE


