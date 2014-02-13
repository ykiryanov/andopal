        .text
        .align  4
        .globl  _ippsDotProd_16s32s


_ippsDotProd_16s32s:
        orr     r12, r0, r1
        tst     r12, #1
        bne     ownDotProd_16s32s_PX
        beq     ownDotProd_16s32s_PX


