        .text
        .align  4
        .globl  _ippsShortTermPostFilter_G729A_16s


_ippsShortTermPostFilter_G729A_16s:
        mov     r3, r0
        mov     r0, r1
        mov     r1, r3
        b       _ippsSynthesisFilter_G729_16s


