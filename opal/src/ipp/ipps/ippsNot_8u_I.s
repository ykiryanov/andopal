        .text
        .align  4
        .globl  _ippsNot_8u_I


_ippsNot_8u_I:
        mov     r2, r1
        mov     r1, r0
        mov     r0, #0xFF
        b       _ippsXorC_8u_I


