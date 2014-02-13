        .text
        .align  4
        .globl  _ippsNot_32u


_ippsNot_32u:
        mov     r3, r2
        mov     r2, r1
        mvn     r1, #0
        b       _ippsXorC_32u


