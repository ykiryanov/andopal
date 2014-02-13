        .text
        .align  4
        .globl  _ippsAdaptiveCodebookDecodeInit_AMRWB_16s


_ippsAdaptiveCodebookDecodeInit_AMRWB_16s:
        stmdb   sp!, {r4, lr}
        mov     r4, r0
        cmp     r4, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4, pc}
        mov     r1, #0x55
        orr     r1, r1, #0x55, 24
        strh    r1, [r4, #0xA]
        mov     r0, r4
        mov     r1, #5
        bl      _ippsZero_16s
        add     r1, r4, #0xC
        mov     r0, #0x40
        mov     r2, #5
        bl      _ippsSet_16s
        mov     r1, #0x40
        mov     r0, #0
        strh    r1, [r4, #0x16]
        ldmia   sp!, {r4, pc}


