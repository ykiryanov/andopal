        .text
        .align  4
        .globl  _ippsSynthesisFilterInit_G728_16s


_ippsSynthesisFilterInit_G728_16s:
        stmdb   sp!, {r4, lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4, pc}
        mov     r1, #0x32
        add     r4, r0, #0x70
        bl      _ippsZero_16s
        mov     r1, r4
        mov     r0, #0x10
        mov     r2, #0xB
        bl      _ippsSet_16s
        mov     r0, #0
        ldmia   sp!, {r4, pc}


