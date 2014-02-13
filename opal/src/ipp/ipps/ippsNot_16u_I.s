        .text
        .align  4
        .globl  _ippsNot_16u_I


_ippsNot_16u_I:
        mov     r2, r1
        mov     r1, r0
        mov     r3, #0xFF
        orr     r0, r3, #0xFF, 24
        b       _ippsXorC_16u_I


