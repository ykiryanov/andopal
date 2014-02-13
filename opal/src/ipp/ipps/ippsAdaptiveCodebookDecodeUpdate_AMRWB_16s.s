        .text
        .align  4
        .globl  _ippsAdaptiveCodebookDecodeUpdate_AMRWB_16s


_ippsAdaptiveCodebookDecodeUpdate_AMRWB_16s:
        stmdb   sp!, {r4 - r6, lr}
        mov     r4, r2
        cmp     r4, #0
        mov     r6, r0
        mov     r5, r1
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r6, pc}
        add     r0, r4, #2
        mov     r2, #4
        mov     r1, r4
        bl      _ippsMove_16s
        add     r0, r4, #0xC
        add     r1, r4, #0xE
        strh    r6, [r4, #8]
        mov     r2, #4
        bl      _ippsMove_16s
        mov     r0, #0
        strh    r5, [r4, #0xC]
        strh    r5, [r4, #0x16]
        ldmia   sp!, {r4 - r6, pc}


