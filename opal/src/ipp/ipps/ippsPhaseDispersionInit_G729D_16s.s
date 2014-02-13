        .text
        .align  4
        .globl  _ippsPhaseDispersionInit_G729D_16s


_ippsPhaseDispersionInit_G729D_16s:
        stmdb   sp!, {r4, lr}
        mov     r4, r0
        cmp     r4, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4, pc}
        mov     r0, r4
        mov     r1, #6
        bl      _ippsZero_16s
        mov     r1, #0
        mov     r0, #0
        strh    r1, [r4, #0xC]
        strh    r1, [r4, #0xE]
        strh    r1, [r4, #0x10]
        ldmia   sp!, {r4, pc}


