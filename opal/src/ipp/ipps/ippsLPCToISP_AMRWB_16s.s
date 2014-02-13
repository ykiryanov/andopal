        .text
        .align  4
        .globl  _ippsLPCToISP_AMRWB_16s


_ippsLPCToISP_AMRWB_16s:
        mov     r3, r2
        mov     r2, r1
        mov     r1, r3
        mov     r3, #0x10
        b       _ippsLPCToISP_AMRWBE_16s


