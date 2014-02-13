        .text
        .align  4
        .globl  _ippsVADInit_AMRWB_16s


_ippsVADInit_AMRWB_16s:
        stmdb   sp!, {r4, r5, lr}
        mov     r4, r0
        cmp     r4, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4, r5, pc}
        mov     r5, #0
        strh    r5, [r4, #0x86]
        strh    r5, [r4, #0x80]
        strh    r5, [r4, #0x82]
        add     r3, r4, #0x5E
        mov     r2, #5
LDGS0:
        strh    r5, [r3, #2]
        strh    r5, [r3, #4]!
        subs    r2, r2, #1
        bne     LDGS0
        add     r0, r4, #0x74
        mov     r1, #6
        bl      _ippsZero_16s
        mov     r0, #0x96
        mov     r1, r4
        mov     r2, #0xC
        bl      _ippsSet_16s
        add     r1, r4, #0x30
        mov     r0, #0x96
        mov     r2, #0xC
        bl      _ippsSet_16s
        add     r1, r4, #0x18
        mov     r0, #0x96
        mov     r2, #0xC
        bl      _ippsSet_16s
        add     r0, r4, #0x48
        mov     r1, #0xC
        bl      _ippsZero_16s
        add     r0, r4, #0x94
        mov     r1, #0xC
        bl      _ippsZero_16s
        mov     r2, #2
        orr     r2, r2, #2, 22
        mov     r0, #0
        strh    r5, [r4, #0x88]
        strh    r5, [r4, #0x8A]
        strh    r5, [r4, #0x8C]
        str     r5, [r4, #0x90]
        strh    r2, [r4, #0x8E]
        ldmia   sp!, {r4, r5, pc}


