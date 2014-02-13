        .text
        .align  4
        .globl  _ippsNot_8u


_ippsNot_8u:
        mov     r3, r2
        mov     r2, r1
        mov     r1, #0xFF
        b       _ippsXorC_8u


