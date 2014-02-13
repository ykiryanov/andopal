        .text
        .align  4
        .globl  _ippsNot_16u


_ippsNot_16u:
        mov     r3, r2
        mov     r2, r1
        mov     r12, #0xFF
        orr     r1, r12, #0xFF, 24
        b       _ippsXorC_16u


