        .text
        .align  4
        .globl  _ippsNot_32u_I


_ippsNot_32u_I:
        mov     r2, r1
        mov     r1, r0
        mvn     r0, #0
        b       _ippsXorC_32u_I


